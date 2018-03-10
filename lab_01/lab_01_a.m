% Author: Pawel Drapiewski - 271050, WUT EE 
% Teoria optymalizacji - LAB_01
% A) Find convex hull desribed by 5 linear equations
% B) Test 5 points if they are inside the convex hull
clear all;
close all;
cvx_solver sedumi;
% set of inequalities A*x-b <= 0
A = [-2 1; 0.05 0.9; 3.4 1; -1.5 -1.2; 1 -2];
b = [-1 3 14 -5 0]';
x_low = 0; x_high = 5;
y_low = (b - A(:,1)*x_low)./A(:,2);
y_high = (b - A(:,1)*x_high)./A(:,2);
matrix_A_size = size(A, 1);
X = [x_low; x_high]*ones(1, matrix_A_size);
Y = [y_low' ; y_high'];
% 2D plot - domain only
figure(1), line(X,Y), grid;
axis([x_low x_high 0 5]);

% Find the intersetion points
X_found_intersec = [];
for i = 1:matrix_A_size
    for j = (i+1):matrix_A_size
        Ax = [A(i,:); A(j,:)];
        bx = [b(i); b(j)];
        x_intersec = Ax\bx; 
        x_resid = A*x_intersec-b; 
        k = find(x_resid < -1e-10);
        % select unique vertices
        if(length(k) == matrix_A_size-2)
            X_found_intersec = [X_found_intersec x_intersec];
        end
    end
end
disp('Intersections found:');
disp(X_found_intersec);
% Find out the convex hull points of the intersection points
convex_hull = convhull(X_found_intersec(1,:),X_found_intersec(2,:));
hold on,
% fill convex using green color
patch(X_found_intersec(1,convex_hull), X_found_intersec(2,convex_hull),'g')
hold off

% Test some points if they are inside the convex hull
points_x = [2.5, 2.5, 3.2, 1.5, 3.5];
points_y = [2.5, 3.0, 1.7, 1.5, 3.0];

is_point_in = inpolygon(points_x, points_y, ...
    X_found_intersec(1,convex_hull), X_found_intersec(2,convex_hull));
disp("== Check if point is inside the convex hull==");

% print info to the output and draw it on exisitng figure
hold on,
for n = 1:size(points_x, 2)
    disp(['Point ', num2str(n)]);
    disp([points_x(1),points_y(1)]);
    if(is_point_in(n))
        disp('This point is inside the convex hull.');
        plot(points_x(n),points_y(n),'r*'); 
    else
        disp('This point is NOT inside the convex hull.');
        plot(points_x(n),points_y(n),'ro');
    end
end
hold off



