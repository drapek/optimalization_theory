%% Lab07 - optimalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 
% 6th excercise from Optimalization_problems.pdf

clear, close all;

cvx_begin gp
variables x y h
maximize x * y * h
subject to
    x + 2 * h <= 14
    y + 2 * h <= 10
cvx_end
    
fprintf('x=%2.4f, y=%2.4f, h=%2.4f \n', x, y, h)
fprintf('Result: %2.4f \n', x * y * h)