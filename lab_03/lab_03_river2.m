%% Searching for optimal bridge place - RIVER_2
% In this problem we will be searching for the most optimal place for the
% bridge between city A and city B. And the river is desricbed by circle
% Author: Pawe³ Drapiewski

clear all;
close all;

plot_bound_x_low = 0;
plot_bound_x_high = 5;

% Define the paramters for the river
O = [1, 5]; % the center of the river curve
r1 = 2;
r2 = 3;

% define the cities
a_point = [2, 5];
b_point = [3, 1];

optimal_th = 0;

p1 = get_circle_value_pair(O, r1, optimal_th);
p2 = get_circle_value_pair(O, r2, optimal_th);

% find cooridnates for the plotting the river
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

function result = get_circle_value_pair(O, r, th)
    x = r * cos(th) + O(1);
    y = r * sin(th) + O(2);
    result = [x, y];
end
