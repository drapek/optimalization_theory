%% Lab07 - optymalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 
% 1st excercise from Optimalization_problems.pdf

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
fprintf('Logarithm solution %4.2f \n', x * y)


% this problem using logaritms
clear all;
close all;

cvx_begin gp
variables  a b
maximize log(a) + log(b)
subject to
    log(2 * exp(a)) + log(exp(b)) <= log(2400)

cvx_end

x = exp(a);
y = exp(b);

fprintf('x = %4.2f, y = %4.2f \n', x, y)
fprintf('Logarithm solution %4.2f \n', x * y)

