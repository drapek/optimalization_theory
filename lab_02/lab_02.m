% Kod przedstawiony na laboratorium
clear all;
close all;
cvx_solver('sdpt3')

%data
a = 1.02;
b = -1.0;
n = 10;
x0 = 10000;
x_des = 2000;
vacation_months = [3, 4];

loop_iter = 0;

cvx_begin
    variable iter;
    variable u(n);
    variable X(n+1);
    minimize sum(u);
        subject to
            loop_iter = loop_iter + 1;
            X(2:n+1) == a * X(1:n) + b * u;
            X(1) == x0;
            X(n+1) == x_des;
            X(2:n+1) <= X(1:n);
            u >= 0;
            u <= 1100;
            u(3) == 500;
            u(4) == 500;
%            
%             if (ismember(loop_iter, vacation_months))
%                 u == 500; % make the repayment to be equal 500PLN for vacation
%             else
%                  u <= 1100;
%             end
           
cvx_end

format bank
[u X(2:n+1)]
sum(u)
format