%% Lab07 - optymalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 
% 3rd excercise from Optimalization_problems.pdf
%    .-------.
%   /|      /|
%  / |     / | h
% .--|----.  |
% |  .----|--.
% | /     | / w
% .-------.
%   l = 3w
%
% top and bottom material cost = $10 per ft^2
% sides material cost = $6 per ft^2

% GP solution
clear, close all

cvx_begin gp
variables w
minimize 60 * w * w  + 800 / w
subject to 
    w <= 1 % because lhw <= 50 we can write as 50w^4 < 50, so w <= 1
cvx_end

h = 50 / 3 * w * w;
l = 3 * w;

fprintf('w = %4.2f, h = %4.2f, l = %4.2f \n', w, h, l)
fprintf('GP solution %4.2f \n', 60 * w^2 + 48 * w * h)
fprintf('Box volume %4.2f \n', l * h * w)

% Logarithm solution
clear, close all

cvx_begin
variables log_w
minimize 60 * exp(log_w) * exp(log_w)  + 800 / exp(log_w)
subject to 
    exp(log_w) <= log(1)
cvx_end

w = exp(log_w);
h = 50 / ( 3 * w * w);
l = 3 * w;

fprintf('w = %4.2f, h = %4.2f, l = %4.2f \n', w, h, l)
fprintf('Logarithm solution %4.2f \n', 60 * w^2 + 48 * w * h)
fprintf('Box volume %4.2f \n', l * h * w)

%% Results
% The Logarithm optimalization found good value and GP not, not even close
% enough
