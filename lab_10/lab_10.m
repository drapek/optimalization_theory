%% Lab08 - optimalization exercises, Pawel Drapiewski 18.04.2018 r.
%% Solution of 4.4 excercise from bv_cvxbook_extra_exercises.pdf book

clear all; 
close all;

% sensors values
sensors_coords_x = [1.8 2.0 1.5 1.5 2.5];
sensors_coords_y = [2.5 1.7 1.5 2.0 1.5];
sensors_coords_vect = [[1.8; 2.5] [2.0; 1.7] [1.5; 1.5] [1.5; 2.0] [2.5; 1.5]];
signal_strength = [2 1.24 0.59 1.31 1.44];

% cost function values for the countur function
[X, Y] = meshgrid(linspace(0, 3), linspace(0, 3));
Z = zeros(100, 100);
for i = 1:size(X)
    for j = 1:size(X)
        Z(i, j) = cost_func(X(i, j), Y(i, j), sensors_coords_vect, signal_strength);
    end
end

% show the problem on the plot
figure (1)
hold on;
xlim([0 3])
ylim([0 3])
contour(X, Y, Z, 20)
plot(sensors_coords_x, sensors_coords_y,'o')
hold off;

function res = cost_func(x, y, S_COORDS, D_k)
    sum = 0;
    for k = 1:size(D_k)
        sum = sum + (norm([x; y] - S_COORDS(k))^2 - D_k(k)^2)^2;
    end
    res = sum;
end