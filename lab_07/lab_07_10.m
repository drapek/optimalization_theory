%% Lab07 - optimalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 
% 10th excercise from Optimalization_problems.pdf

% Solution
clear, close all;

cvx_solver sdpt3
cvx_begin 
variables y
minimize y * y - 3 * y + 3
subject to
    - y <= 0
cvx_end

x_p2 = y - 1;
x = sqrt(x_p2);
fprintf('x=%2.4f \n', x)