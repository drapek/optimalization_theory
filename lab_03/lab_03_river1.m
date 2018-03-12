%% Lab03 - River 1, Pawel Drapiewski, 11.03.2018 r.

%% Searching for place to build bridge - RIVER 1
% In this problem we will be searching for the most optimal place for the
% bridge between city A and city B.
clear all;
close all;

%% Define initial variables
plot_bound_x_low = 0;
plot_bound_x_high = 5;
% Define the normal vectors of the river bounds (r1 and r1)
A = [-2 1; -2 1];
b = [-1 -3]';
% define the cities
a_point = [1.5, 4.5];
b_point = [3.5, 0.5];
% find the f line (perpendicular to the river) 
f_normal_vec = [A(1, 2), -1 * A(1, 1)];

%% Find the points where the bridge should be builded.
% Find the points for the bridge, where the cost will be the smallest.
% To gain it, we should minimize the total length of the route. And we know
% that building the  bridge is very  expesive, so the best scenarios is
% when bridge is perpendicular to river (f line). Because of that fact that
% bridge lenght is constans we can ommit the bridge length in minimalizing.
% So overall we need to find only optimal b value of the f line.
cvx_begin
    variable f_b(1)
    variable p1(2)
    variable p2(2)
    minimize norm(a_point' - p1) + norm(b_point' - p2);
        subject to
            % find points where straight f is crossing with r1 (upper river bound) and r2 (bottom river bound)
            p1 == find_intersection([A(1, 1) A(1, 2) b(1)], [f_normal_vec(1), f_normal_vec(2), f_b(1)])' % crossing of the r1 and f function
            p2 == find_intersection([A(2, 1) A(2, 2) b(2)], [f_normal_vec(1), f_normal_vec(2), f_b(1)])' % crossing of the r2 and f function
cvx_end

disp('Found route has the length: ')
disp(norm(a_point' - p1) + norm(b_point' - p1) + norm(p2 - p1))
disp('Bridge points are: ');
disp(p1);
disp(p2);

%% Prepare data to be visulased on the plot
% find river coordinates, so it could be drawn on the plot
x_low = plot_bound_x_low; x_high = plot_bound_x_high;
y_low = (b - A(:,1)*x_low)./A(:,2);
y_high = (b - A(:,1)*x_high)./A(:,2);
matrix_A_size = size(A, 1);
X = [x_low; x_high]*ones(1, matrix_A_size);
Y = [y_low' ; y_high'];
% find cooridnates for the plotting the f line (red dashed)
% find f (red dashed line) coordinates, so it could be drawn on the plot
x_low_f = plot_bound_x_low; x_high_f = plot_bound_x_high;
y_low_f = (f_b - f_normal_vec(:,1)*x_low_f)./f_normal_vec(:,2);
y_high_f = (f_b - f_normal_vec(:,1)*x_high_f)./f_normal_vec(:,2);
matrix_A_size = size(f_normal_vec, 1);
f_X = [x_low_f; x_high_f]*ones(1, matrix_A_size);
f_Y = [y_low_f' ; y_high_f'];

% draw the plot
hold on;
title("River 1");
daspect([1 1 1]);
xlim([plot_bound_x_low plot_bound_x_high]);
ylim([0 6]);
grid on;

plot(a_point(1), a_point(2) ,'r*'); 
plot(b_point(1), b_point(2) ,'ro'); 
plot([x_low(1), x_high(1)], [y_low(1), y_high(1)], 'blue')
plot([x_low(1), x_high(1)], [y_low(2), y_high(2)], 'blue')
plot([p1(1), p2(1)], [p1(2), p2(2)], 'black', 'LineWidth', 2)
plot([a_point(1), p1(1)], [a_point(2), p1(2)], 'black')
plot([b_point(1), p2(1)], [b_point(2), p2(2)], 'black')
plot([x_low_f(1), x_high_f(1)], [y_low_f(1), y_high_f(1)], 'red--')
hold off;

%% Solve the problem using fmincon function
d = norm(p2 - p1);
fmin_A = [ A(1, 1) A(1, 2) 0 0;
           0 0 A(1, 1) A(1, 2);
           A(2, 1) A(2, 2) 0 0;
           0 0 A(2, 1) A(2, 2)];
b = [-1; -3; d; d];
f_descriptor = @(x) double(min_route(x));
x0 = [0, 0, 0 ,0];
X = fmincon(f_descriptor, x0, [], [], fmin_A, b);

disp("Solution using fmincon: ");
disp("p1: ");
disp(X(1:2));
disp("p2: ");
disp(X(3:4));

% As we can see, this result is only aproximation of the proper value and 
% the cvx was better in that case.

% function to find the intersection point of two lines
function result = find_intersection(line_1, line_2)
    y = (line_2(3) - line_2(1) * line_1(3) / line_1(1)) / (line_2(2) - line_2(1) * line_1(2) / line_1(1));
    x = line_1(3) / line_1(1) - line_1(2) / line_1(1) * y;
    result = [x, y];
end

% This is hardcoded problem of the upper example. This function exist for
% fmincon calculation only.
function res = min_route(x)
    a_point = [1.5, 4.5];
    b_point = [3.5, 0.5];
    res = norm([a_point(1)-x(1), a_point(2)-x(2)]) + norm([b_point(1)-x(3) b_point(2)-x(4)]) + norm([x(1)-x(3), x(2)-x(4)]);
end
