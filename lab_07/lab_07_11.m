%% Lab07 - optimalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 
% 11th excercise from Optimalization_problems.pdf

% River - the fastest way to reach point on the opposite bank

% Solution
clear, close all;

cvx_begin 
variables x 
minimize (norm([x 9]) / 6 - x/8)
subject to
    - x <= 0
cvx_end

fprintf('x=%2.4f \n', x)