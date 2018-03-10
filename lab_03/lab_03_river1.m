% Author: Pawe³ Drapiewski

clear all;
close all;

% to s¹ wektory normalne prostych okreœlaj¹cych rzêkê
A = [-2 1; -2 1];
b = [-1 -3]';
x_low = 0; x_high = 5;
y_low = (b - A(:,1)*x_low)./A(:,2);
y_high = (b - A(:,1)*x_high)./A(:,2);
matrix_A_size = size(A, 1);
X = [x_low; x_high]*ones(1, matrix_A_size);
Y = [y_low' ; y_high'];

% define the cities
a_point = [1.5, 4.5];
b_point = [3.5, 0.5];



% find the f line (perpendicular to the river)
f_normal_vec = [1, 1];
% a1 * a2 = -1 skorzysj z tego
f_b_val = [5]';

cvx_begin
    variable A_f(2)
    variable b_f
   
    % ax * apx + ay * apy = 0, oraz apx = ay i apy = -ax
    
cvx_end

% find cooridnates for f_line
x_low_f = 0; x_high_f = 5;
y_low_f = (f_b_val - f_normal_vec(:,1)*x_low_f)./f_normal_vec(:,2);
y_high_f = (f_b_val - f_normal_vec(:,1)*x_high_f)./f_normal_vec(:,2);
matrix_A_size = size(f_normal_vec, 1);
f_X = [x_low_f; x_high_f]*ones(1, matrix_A_size);
f_Y = [y_low_f' ; y_high_f'];


% draw the plot
hold on;
title("River 1");
grid;
axis equal;

plot(a_point(1), a_point(2) ,'r*'); 
plot(b_point(1), b_point(2) ,'ro'); 
plot([x_low(1), x_high(1)], [y_low(1), y_high(1)], 'blue')
plot([x_low(1), x_high(1)], [y_low(2), y_high(2)], 'blue')

plot([x_low_f(1), x_high_f(1)], [y_low_f(1), y_high_f(1)], 'red--')
hold off;

