%% Lab07 - optimalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 
% 8th excercise from Optimalization_problems.pdf

clear
close all;

cvx_begin
variables r h
maximize (12*r - (2 + pi/2)*r^2)
subject to
   2*h + 2*r + pi*r == 12;
cvx_end