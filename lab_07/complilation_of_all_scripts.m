%% Lab07 - optimalization exercises, Pawel Drapiewski 17.04.2018 r.
%% 1st excercise from Optimalization_problems.pdf

%          y
%   .---------------.
% x |               |
%  /\/\/\/\/\/\\/\/\/\
%  /\/\ River /\/\/\/\
% 
% Fence length = 2400

% solving the problem using gp option
clear all;
close all;

cvx_begin gp
variables  x y
maximize x * y
subject to
    2 * x + y <= 2400
cvx_end

fprintf('x = %4.2f, y = %4.2f \n', x, y)
fprintf('GP solution %4.2f \n', x * y)


% this problem using logaritms
clear all;
close all;

cvx_begin
variables  a b
maximize a + b
subject to
    log(2 * exp(a) + exp(b)) <= log(2400)

cvx_end

x = exp(a);
y = exp(b);

fprintf('x = %4.2f, y = %4.2f \n', x, y)
fprintf('Logarithm solution %4.2f \n', x * y)

% Result
% In both cases the results are good


%% 2nd excercise from Optimalization_problems.pdf

% ################
% ################ - building
% |              |  
% |              | y
%  --------------  - fence
%         x
%
% Fence is 500 feet long
% Problem: Find the largest area

% Solution using gp
clear, close all

cvx_begin gp
variables x y
maximize x * y
subject to 
    2 * y + x <= 500
cvx_end

fprintf('x = %4.2f, y = %4.2f \n', x, y)
fprintf('GP solution %4.2f \n', x * y)

% Solution using Logarithms
clear, close all

cvx_begin
variables log_x log_y
maximize log_x + log_y 
subject to
    log(exp(log_x) + 2*exp(log_y)) <= log(500)
cvx_end

x = exp(log_x);
y = exp(log_y);

fprintf('x = %4.2f, y = %4.2f \n', x, y)
fprintf('Logarithm solution %4.2f \n', x * y)

% Results
% In both cases the result is the good optimal result

%% 3rd excercise from Optimalization_problems.pdf
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

% Results
% The Logarithm optimalization found good value and GP not, not even close
% enough

 
%% 4th excercise from Optimalization_problems.pdf
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

%% 5th excercise from Optimalization_problems.pdf
%
% Make cylider that hold 1.5 liters of liquid.
% Minimize the dimenstions

% Solution
clear, close all

cvx_begin gp
variables h r
minimize 2 * pi * r * r + 2 * pi * r * h
subject to
   pi * r * r * h == 1500
cvx_end

fprintf('h = %4.2f, r = %4.2f \n', h, r)
fprintf('Needed material [m^2]: %4.2f \n', 2 * pi * r * r + 2 * pi * r * h)
fprintf('Valume of the cylider needed: %4.2f \n',  pi * r * r * h)

%% 6th excercise from Optimalization_problems.pdf

clear, close all;

cvx_begin gp
variables x y h
maximize x * y * h
subject to
    x + 2 * h <= 14
    y + 2 * h <= 10
cvx_end
    
fprintf('x=%2.4f, y=%2.4f, h=%2.4f \n', x, y, h)
fprintf('Result: %2.4f \n', x * y * h)

%% 7th excercise from Optimalization_problems.pdf
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

%% 8th excercise from Optimalization_problems.pdf

clear, close all;

cvx_begin
variables r h
maximize 12 * r - (2 + pi/2) * r^2
subject to
   2*h + 2*r + pi*r == 12;
cvx_end

fprintf('r=%2.4f, h=%2.4f \n', r, h)
fprintf('Window surface: %2.4f \n', 12 * r - (2 + pi/2) * r^2)

%% 9th excercise from Optimalization_problems.pdf

% The biggest possible rectangle drawn into circle of radius 4
% x, y - sides of the rectangle

% Solution
clear, close all;

cvx_begin 
variables v 
maximize 256 * v - 16 * v * v
subject to
    - v <= 0
cvx_end

u = 16 - v;
x = sqrt(u);
y = sqrt(v);

fprintf('x=%2.4f, y=%2.4f \n', x, y)
fprintf('Rectnalge area: %2.4f \n', 2 * x + 2 * y)

%% 10th excercise from Optimalization_problems.pdf

% Solution
clear, close all;

cvx_solver sdpt3
cvx_begin 
variables y
minimize y * y - 3 * y + 3
subject to
    - y <= 0
cvx_end

x_p2 = y - 1;
x = sqrt(x_p2);
fprintf('x=%2.4f \n', x)


%% 11th excercise from Optimalization_problems.pdf

% River - the fastest way to reach point on the opposite bank

% Solution
clear, close all;

cvx_begin 
variables x 
minimize (norm([x 9]) / 6 - x/8)
subject to
    - x <= 0
cvx_end

fprintf('x=%2.4f \n', x)