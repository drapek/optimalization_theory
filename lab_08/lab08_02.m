%% Lab08 - optimalization exercises, Pawel Drapiewski 18.04.2018 r.
%% 2nd excercise from zadanieLP1.pdf

% An optimal breakfest
%
% x1 - corn
% x2 - milk
% x3 - bread
%

% TODO describe why this is linear problem (you can say about destination
% function and the subjects
cvx_begin
variables x1 x2 x3
minimize 0.15 * x1 + 0.25 * x2 + 0.05 * x3 % minimize the cost of the complete set
subject to
    % calories level
    2000 <= 70 * x1 + 121 * x2 + 65 * x3 <= 250
    % vitamin level
    5000 <= 107 * x1 + 500 * x2 <= 10000
    % sugar level
    0 <= 45 * x1 + 40 * x2 + 60 * x3 <= 1000
    
    % not more than 10 portion of each meal
    0 <= x1 <= 10
    0 <= x2 <= 10
    0 <= x3 <= 10
cvx_end