%% Lab07 - optimalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 
% 5th excercise from Optimalization_problems.pdf
%
% Make cylider that hold 1.5 liters of liquid.
% Minimize the dimenstions

% Solution
clear, close all

cvx_begin gp
variables h r
minimize 2 * pi * r * r + 2 * pi * r * h
subject to
   pi * r * r * h == 1500
cvx_end

fprintf('h = %4.2f, r = %4.2f \n', h, r)
fprintf('Needed material [m^2]: %4.2f \n', 2 * pi * r * r + 2 * pi * r * h)
fprintf('Valume of the cylider needed: %4.2f \n',  pi * r * r * h)
