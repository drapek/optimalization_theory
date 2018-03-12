%% Lab03 - River 2, Pawel Drapiewski, 11.03.2018 r.

%% Searching for optimal bridge place - RIVER 2
% In this problem we will be searching for the most optimal place for the
% bridge between city A and city B. And the river is desricbed by circle
% Author: Pawe³ Drapiewski

clear all;
close all;

plot_bound_x_low = 0;
plot_bound_x_high = 5;

%% Define initial variables
O = [1, 5]; % the center of the river curve
r1 = 2;
r2 = 3;

% define the cities
a_point = [2, 5];
b_point = [3, 1];

% optimal_th = 0;
% p1 = get_point_on_circle_based_on_angle(O, r1, optimal_th);
% p2 = get_point_on_circle_based_on_angle(O, r2, optimal_th);
%% CVX - find the optimal place for a bridge
cvx_solver('sdpt3')
cvx_begin
    variable optimal_th
    variable p1(2)
    variable p2(2)
    minimize norm(a_point' - p1) + norm(b_point' - p2);
        subject to
           p1 = get_point_on_circle_based_on_angle(O, r1, optimal_th);
           p2 = get_point_on_circle_based_on_angle(O, r2, optimal_th);
           optimal_th > 0;
           optimal_th < 2 * pi;
cvx_end

%% Prepare data to be visulased on the plot
% Circle 1
th = 0:pi/50:2*pi;
x_circle1 = r1 * cos(th) + O(1);
y_circle1 = r1 * sin(th) + O(2);
% Circle 2
th = 0:pi/50:2*pi;
x_circle2 = r2 * cos(th) + O(1);
y_circle2 = r2 * sin(th) + O(2);
% find cooridnates for ploting the dashed line (f)
m = (p2(2)-p2(2))/(p2(1)-p1(1));
n = p1(2)- p1(1)*m;
f_y1 = m*plot_bound_x_low + n;
f_y2 = m*plot_bound_x_high + n;

% draw the plot
hold on;
title("River 2");
daspect([1 1 1]);
xlim([plot_bound_x_low plot_bound_x_high]);
ylim([0 6]);
grid on;

plot(O(1), O(2), '*');
plot(x_circle1, y_circle1, 'blue');
plot(x_circle2, y_circle2, 'blue');
plot([plot_bound_x_low plot_bound_x_high], [f_y1, f_y2], 'r--');
plot(p1(1), p1(2), 'black*');
plot(p2(1), p2(2), 'black*');
plot([p1(1) p2(1)], [p1(2), p2(2)], 'black', 'LineWidth', 2);
plot([a_point(1), p1(1)], [a_point(2), p1(2)], 'black')
plot([b_point(1), p2(1)], [b_point(2), p2(2)], 'black')
plot(a_point(1), a_point(2) ,'ro'); 
plot(b_point(1), b_point(2) ,'ro'); 

hold off;

function result = get_point_on_circle_based_on_angle(O, r, th)
    x = r * cos(th) + O(1);
    y = r * sin(th) + O(2);
    result = [x, y];
end

