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
% uk³adu wspó³rzêdnych (punkt O(0, 0, 0, 0)). We wszystkich przyk³adach
% bêdzie sprawdzana ta zale¿noœc przy u¿yciu napisanej funkcji is_lienar.
% Funkcja ta sprawdza 2 za³o¿enia liniowoœci:
%   za³1. f(ax) = a * f(x)
%   za³2. f(x+y) = f(x) + f(y)

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

%% 2nd excercise from zadanieLP1.pdf

% An optimal breakfest
%
% x1 - corn
% x2 - milk
% x3 - bread
%


% SprawdŸ liniowoœæ funkcji celu oraz ograniczeñ
fprintf('#### Check linearity ###########\n');
fprintf('f. celu jest liniowa? - %d \n', is_linear(@(x1, x2, x3, x4)(0.15 * x1 + 0.25 * x2 + 0.05 * x3)));
fprintf('ogranicznie  70 * x1 + 121 * x2 + 65 * x3 jest liniowe? - %d \n', is_linear(@(x1, x2, x3, x4)( 70 * x1 + 121 * x2 + 65 * x3)));
fprintf('ogranicznie 107 * x1 + 500 * x2 jest liniowe?  - %d  \n', is_linear(@(x1, x2, x3, x4)(107 * x1 + 500 * x2)));
fprintf('ogranicznie 45 * x1 + 40 * x2 + 60 * x3 jest liniowe? - %d \n', is_linear(@(x1, x2, x3, x4)(45 * x1 + 40 * x2 + 60 * x3)));
fprintf('\n\n');


cvx_begin
variables x1 x2 x3
minimize 0.15 * x1 + 0.25 * x2 + 0.05 * x3 % minimize the cost of the complete set
subject to
    % calories level
    2000 <= 70 * x1 + 121 * x2 + 65 * x3 <= 2250
    % vitamin level
    5000 <= 107 * x1 + 500 * x2 <= 10000
    % sugar level
    0 <= 45 * x1 + 40 * x2 + 60 * x3 <= 1000
    
    % not more than 10 portion of each meal
    0 <= x1 <= 10
    0 <= x2 <= 10
    0 <= x3 <= 10
cvx_end

fprintf('Optimal values is: corn = %2.10f, milk = %2.4f, bread = %2.4f \n', x1, x2, x3)

%% 3rd excercise from zadanieLP1.pdf

% SprawdŸ liniowoœæ funkcji celu oraz ograniczeñ
fprintf('#### Check linearity ###########\n');
fprintf('f. celu jest liniowa? - %d \n', is_linear(@(x1, x2, x3, x4)(1000 * x1 + 199.9 * x2 - 5800 * x3 - 6300 * x4)));
fprintf('ogranicznie  x1 + x2 jest liniowe? - %d \n', is_linear(@(x1, x2, x3, x4)(x1 + x2)));
fprintf('ogranicznie 90 * x3 + 100 * x4 jest liniowe?  - %d  \n', is_linear(@(x1, x2, x3, x4)(90 * x3 + 100 * x4)));
fprintf('ogranicznie 40 * x3 + 50 * x4 jest liniowe? - %d \n  ', is_linear(@(x1, x2, x3, x4)(40 * x3 + 50 * x4)));
fprintf('ogranicznie 100 * x1 + 199.9 * x2 + 700 * x3 + 800 * x4 jest liniowe? - %d \n', is_linear(@(x1, x2, x3, x4)(100 * x1 + 199.9 * x2 + 700 * x3 + 800 * x4)));
fprintf('\n\n');


cvx_begin
variables drug_1 drug_2 raw_mat_1 raw_mat_2
minimize 1000 * raw_mat_1 + 199.9 * raw_mat_2 - 5800 * drug_1 - 6300 * drug_2 % costs - income after transformation
subject to:
    % active ingredient of the drug constrains
    0.01 * raw_mat_1 + 0.02 * raw_mat_2 - 0.5 * drug_1 - 0.6 * drug_2 >= 0
    % warehouse storage constrians
    raw_mat_1 + raw_mat_2 <= 1000
    % human resources constrains
    90 * drug_1 + 100 * drug_2 <= 2000
    % machines resources constrains 
    40 * drug_1 + 50 * drug_2 <= 800
    % budget constrains
    100 * raw_mat_1 + 199.9 * raw_mat_2 + 700 * drug_1 + 800 * drug_2 <= 100000
    
    % non negative values
    drug_1 >= 0 
    drug_2 >= 0
    raw_mat_1 >= 0
    raw_mat_2 >= 0
cvx_end

fprintf('Optimal values is: material 1 = %2.10f, material 2 = %2.4f, drug 1 = %2.4f, drug 2 = %2.4f \n', raw_mat_1, raw_mat_2, drug_1, drug_2)

%% Funkcja is_linear
%%
fprintf('/n');
function y = is_linear(f)
    % Aby funkcja by³a linowa to musi spe³aniaæ 2 za³o¿enia
    % za³1. f(ax) = a * f(x)
    % za³2. f(x+y) = f(x) + f(y)
    
    x1 = rand(1);
    x2 =  rand(1);
    x3 =  rand(1);
    x4 =  rand(1);
    a =  rand(1);
    
    % SprawdŸ za³o¿enie 1
    f_ax = f(a * x1, a * x2, a * x3, a * x4);
    af_x = a * f(x1, x2, x3, x4);
    % Poniewa¿ mamy doczynienia z obliczeniami komputerowymi, to musimy
    % za³o¿yæ za jak¹ dok³adnoœci¹ porównujemy liczby. Poni¿sza instrukcja
    % zostanie uruchomiona gdy f_ax i af_x bêd¹ od siebie ró¿ne. 
    if ~(abs(f_ax - af_x) < 1e4*eps(min(abs(f_ax),abs(af_x))))
        fprintf('Zal1. is not fullfilled. \n')
        y = 0;
        return;
    end
    
    % SprawdŸ za³o¿enie 2
    f_x_plus_y  =  f(x1 + 2, x2 + 3, x3 + 4, x4 + 5);
    fx_plus_fy =  f(x1, x2, x3, x4) + f(2, 3, 4, 5);
     if ~(abs(f_x_plus_y - fx_plus_fy) < 1e4*eps(min(abs(f_x_plus_y),abs(fx_plus_fy))))
        fprintf('Zal2. is not fullfilled. \n')
        y = 0;
        return;
    end
  
    y = 1;
end