%% Lab07 - optimalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 
% 1st excercise from Optimalization_problems.pdf

%          y
%   .---------------.
% x |               |
%  /\/\/\/\/\/\\/\/\/\
%  /\/\ River /\/\/\/\
% 
% Fence length = 2400

% solving the problem using gp option
clear all;
close all;

cvx_begin gp
variables  x y
maximize x * y
subject to
    2 * x + y <= 2400
cvx_end

fprintf('x = %4.2f, y = %4.2f \n', x, y)
fprintf('GP solution %4.2f \n', x * y)


% this problem using logaritms
clear all;
close all;

cvx_begin
variables  a b
maximize a + b
subject to
    log(2 * exp(a) + exp(b)) <= log(2400)

cvx_end

x = exp(a);
y = exp(b);

fprintf('x = %4.2f, y = %4.2f \n', x, y)
fprintf('Logarithm solution %4.2f \n', x * y)

%% Result
% In both cases the results are good

