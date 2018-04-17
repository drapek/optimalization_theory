%% Lab07 - optimalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 
% 4th excercise from Optimalization_problems.pdf
%    .-------.
%   /|      /|
%  / |     / | h
% .--|----.  |
% |  .----|--.
% | /     | / w
% .-------.
%   l = w
%
% We have only 10 m^2 of material

% Solution
clear, close all

cvx_begin gp
variables w h
maximize w * w * h  % what is V = lwh
subject to
    2 * w * w + 4 * w * h <= 10
cvx_end


h = (5 - w * w) / (2 * w);
l = w;

fprintf('w = %4.2f, h = %4.2f, l = %4.2f \n', w, h, l)
fprintf('Box volume %4.2f \n', l * h * w)