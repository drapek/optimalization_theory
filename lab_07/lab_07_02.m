%% Lab07 - optimalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 
% 2nd excercise from Optimalization_problems.pdf

% ################
% ################ - building
% |              |  
% |              | y
%  --------------  - fence
%         x
%
% Fence is 500 feet long
% Problem: Find the largest area

% Solution using gp
clear, close all

cvx_begin gp
variables x y
maximize x * y
subject to 
    2 * y + x <= 500
cvx_end

fprintf('x = %4.2f, y = %4.2f \n', x, y)
fprintf('GP solution %4.2f \n', x * y)

% Solution using Logarithms
clear, close all

cvx_begin
variables log_x log_y
maximize log_x + log_y 
subject to
    log(exp(log_x) + 2*exp(log_y)) <= log(500)
cvx_end

x = exp(log_x);
y = exp(log_y);

fprintf('x = %4.2f, y = %4.2f \n', x, y)
fprintf('Logarithm solution %4.2f \n', x * y)

%% Results
% In both cases the result is the good optimal result