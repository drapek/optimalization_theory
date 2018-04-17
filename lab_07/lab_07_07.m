%% Lab07 - optimalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 
% 7th excercise from Optimalization_problems.pdf
% 
% Print sheet:
% .---------.
% | 2 inch  |  - outter rectangle is template
% | |-----| |  - inner rectangle is print area
% |1|     |1|
% | |_____| |
% |1.5 inch |
% .---------.
%
% Maximize the printed area
% Whole template have 200 in^2 area.

% Solution
clear, close all;

cvx_begin 
variables log_with_w log_with_h
maximize log_with_w + log_with_h % orginal: (w - 2) * (h - 3.5)
subject to
   log((exp(log_with_w) + 2)  * (exp(log_with_h) + 3.5)) <= log(200);
cvx_end

w = exp(log_with_w) + 2;
h = exp(log_with_h) + 3.5;

fprintf('w=%2.4f, h=%2.4f \n', w, h)
fprintf('Maximized printed area: %2.4f \n',(w - 2) * (h - 3.5))
fprintf('Template area %2.4f \n', w * h);
