%% Lab08 - optimalization exercises, Pawel Drapiewski 18.04.2018 r.
%% 1st excercise from zadanieLP1.pdf

% How to mix wheat, soy and fishmeal to gain 
% forage with minimal sufficent composition
%  x1 - wheat 
%  x2 - soy
%  x3 - fishmeal

cvx_begin
variables x1 x2 x3
minimize 300 * x1 + 500 * x2 + 800 * x3 
% This problem is linear programing because ... <#TODO END IT#>
subject to
    % this meal must have enought
    0.8 * x1 + 0.3 * x2 + 0.1 * x3 >= 0.3
    00.1 * x1 + 0.4 * x2 + 0.7 * x3 >= 0.7
    0.15 * x1 + 0.1 * x2 + 0.2 * x3 >= 0.1
    
    % the igredients quantity can't be negative
    x1 >= 0
    x2 >= 0
    x3 >= 0
cvx_end

fprintf('Optimal values is: wheat = %2.10f, soy = %2.4f, fishmeal = %2.4f \n', x1, x2, x3)