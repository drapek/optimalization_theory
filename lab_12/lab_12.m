%% Lab23 - optimalization labolatory, Pawel Drapiewski 29.05.2018 r.
%% Solve matura excercise of maximal tapeze area describe under y=2-1/2*x^2 function
% Solution made using KKT

clear all, close all;

% Solution is written on the paper. Attatched below.

B = [0.82842712 1.5857865]; 
x = -2.1:0.1:2.1;
y = 2 - 1/2 * x.^2;

figure (1)
hold on;
ylim([-0.5 2.5])
plot(x, y);
% draw trapeze bounds lines
plot([-B(1) B(1)], [B(2) B(2)], 'r')
plot([-2 -B(1)], [0 B(2)], 'r')
plot([2 B(1)], [0 B(2)], 'r')
plot([-2 2], [0 0], 'r')
%plot()
hold off;
fprintf("Coords of found B points are: x=%d y=%d\n", B(1), B(2));
