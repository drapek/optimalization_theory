%% Lab05 - optimalization exercises, Pawel Drapiewski 4.04.2018 r.
%% 
% 9th excercise from Optimalization_problems.pdf

% The biggest possible rectangle drawn into circle of radius 4
% x, y - sides of the rectangle

% Solution
clear, close all;

cvx_begin 
variables v 
maximize 256 * v - 16 * v * v
subject to
    - v <= 0
cvx_end

u = 16 - v;
x = sqrt(u);
y = sqrt(v);

fprintf('x=%2.4f, y=%2.4f \n', x, y)
fprintf('Rectnalge area: %2.4f \n', 2 * x + 2 * y)