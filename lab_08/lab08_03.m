%% Lab08 - optimalization exercises, Pawel Drapiewski 18.04.2018 r.
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