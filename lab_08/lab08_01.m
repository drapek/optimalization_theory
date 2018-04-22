%% Lab08 - optimalization exercises, Pawel Drapiewski 18.04.2018 r.
%% 1st excercise from zadanieLP1.pdf

% How to mix wheat, soy and fishmeal to gain 
% forage with minimal sufficent composition
%  x1 - wheat 
%  x2 - soy
%  x3 - fishmeal


% [PL] Mamy doczynienienia z optymalizacj¹ liniow¹ poniewa¿ funkcja celu
% jak i funcke ograniczeñ s¹ liniowe, czyli innymi s³owy zmienne
% optymalizacyjne wystêpuj¹ jedynie pierwszej potêdze, a zadane
% wspó³czynniki przy tych zmiennych mog¹ jedynie regulowaæ pochylenie tej¿e
% p³aszczyzny nie zaburzaj¹c jej liniowoœci. Dodtakowo jest to problem
% liniowy, a nie affiniczny poniewa¿ uk³ady te przechodz¹ przez œrodek
% uk³adu wspó³rzêdnych (punkt O(0, 0, 0, 0)). 

% SprawdŸ liniowoœæ funkcji celu oraz ograniczeñ
fprintf('#### Check linearity ###########\n');
fprintf('f. celu jest liniowa? - %d \n', is_linear(@(x1, x2, x3, x4)(300 * x1 + 500 * x2 + 800 * x3)));
fprintf('ogranicznie 0.8 * x1 + 0.3 * x2 + 0.1 * x3 jest liniowe? - %d \n', is_linear(@(x1, x2, x3, x4)(0.8 * x1 + 0.3 * x2 + 0.1 * x3)));
fprintf('ogranicznie 00.1 * x1 + 0.4 * x2 + 0.7 * x3 jest liniowe?  - %d  \n', is_linear(@(x1, x2, x3, x4)(00.1 * x1 + 0.4 * x2 + 0.7 * x3)));
fprintf('ogranicznie 0.15 * x1 + 0.1 * x2 + 0.2 * x3 jest liniowe? - %d \n  ', is_linear(@(x1, x2, x3, x4)(0.15 * x1 + 0.1 * x2 + 0.2 * x3)));
fprintf('\n\n');

% Rozwi¹¿ równanie
cvx_begin
variables x1 x2 x3
minimize 300 * x1 + 500 * x2 + 800 * x3
subject to
    0.8 * x1 + 0.3 * x2 + 0.1 * x3 >= 0.3
    00.1 * x1 + 0.4 * x2 + 0.7 * x3 >= 0.7
    0.15 * x1 + 0.1 * x2 + 0.2 * x3 >= 0.1
    % the igredients quantity can't be negative
    x1 >= 0
    x2 >= 0
    x3 >= 0
cvx_end
fprintf('Optimal values is: wheat = %2.10f, soy = %2.4f, fishmeal = %2.4f \n', x1, x2, x3)