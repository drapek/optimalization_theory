%% Lab09 - optimalization exercises, Pawel Drapiewski 25.04.2018 r.
% Difference convex programing - excercise 10 from
% Optimization_Problems.pdf

eps = 10e-5;  % this algorithm will iterate over cvx to gain good result
x_k = 10; % init values (arbitraly choosen)

iter_index = 1;
found_x = [];

while (1)
    a = [0; 2]; % this is fixed point
    cvx_begin
    variables b(2) % we search this point. it should be the closest point thath lay on the y = x^2 + 1
    minimize norm(a - b) 
    subject to 
         %b(2) - b(1) * b(1) - 1 <= 0 % this should be changed to non quadratic problem using linear aproximation (on sheet)
         b(2) - x_k * x_k - 1 - 2 * x_k * (b(1) - x_k) == 0 % aproximated y - x^2 - 1 == 0
    cvx_end

    if (abs(x_k - b(1)) < eps)
        break;
    end
    %save the results
    x_k = b(1);
    
    fprintf('##################################################\n');
    fprintf('#### Best result in %d interation: %d ####\n', iter_index, x_k)
    fprintf('##################################################\n');
    found_x = [found_x, x_k];
    
    iter_index = iter_index + 1;
end

found_x

% Good result is found in 11 iteration. Of course this may vary depends on init value of x_k. 
% As we can see, very close result is already obtained in 5th iteration, so
% we can say that this algorithm works very efficiently.

