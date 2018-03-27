%% Lab05 - Rocket fuel optymalization, Pawel Drapiewski 11.03.2018 r.
%% 
% In this problem we will be searching for the most optimal rocket trace,
% where there will be the smallest fuel amount burned and the rocket reach
% all points. 
clear all;
close all;

% import data for the excersice from outter file
run thrusters_data.m

%% Part 1: No trust constrains
cvx_solver('sdpt3');
cvx_begin
variables engine1_power(K-1) engine2_power(K-1) force_vector_x(K) force_vector_y(K) velocity_x(K) velocity_y(K) points_x(K) points_y(K)
minimize (sum(engine1_power)+sum(engine2_power))
subject to
    % where rocket starts
    points_x(1) == 0;
    points_y(1) == 0;
    % rocket wasn't moving on the start
    velocity_x(1) == 0;
    velocity_y(1) == 0;
    
    points_x(k1) == w1(1);
    points_y(k1) == w1(2);
    
    points_x(k2) == w2(1);
    points_y(k2) == w2(2);
    
    points_x(k3) == w3(1);
    points_y(k3) == w3(2);
    
    points_x(k4) == w4(1);
    points_y(k4) == w4(2);
    
    % engine power must be grather than 0!
    engine1_power >= 0; engine2_power >= 0;
    % bounds of the trajecory
    abs(points_x) <= pmax; abs(points_y) <= pmax;
    
    for k=1:K-1
     % Rocket model
     force_vector_x(k)== cos(theta1)*engine1_power(k) + cos(theta2)*engine2_power(k) + 0;
     force_vector_y(k)== sin(theta1)*engine1_power(k) + sin(theta2)*engine2_power(k) - m*g;
     
     velocity_x(k+1)==(1-alpha)*velocity_x(k) + (h/m)*force_vector_x(k);
     velocity_y(k+1)==(1-alpha)*velocity_y(k) + (h/m)*force_vector_y(k);
     
     points_x(k+1) == points_x(k) + h*velocity_x(k);
     points_y(k+1) == points_y(k) + h*velocity_y(k);
    end
cvx_end

total_fuel_consumption = (sum(engine1_power)+sum(engine2_power));
disp('Found minimal fuel consumption: ')
disp(total_fuel_consumption)


% draw the waypoints and rocket trajectory
figure(1);
hold on;
axis equal;
grid on;
title("Rocket trajectory");
xlim([-pmax-1 pmax+1]);
ylim([-pmax-1 pmax+1]);
xlabel("x coordinate");
ylabel("z coordinate");

point1 = plot(w1(1), w1(2) ,'ro');
point2 = plot(w2(1), w2(2) ,'r*');
point3 = plot(w3(1), w3(2) ,'rs');
point4 = plot(w4(1), w4(2) ,'rd');
point_start = plot(points_x(1), points_y(1), 'black*');
rocket_trajectory = plot(points_x, points_y, '-black');
legend([point1 point2 point3 point4 point_start rocket_trajectory],'waypoint 1','waypoint 2','waypoint 3','waypoint 4', 'starting point', 'rocket trajecotry','Location','southwest');
hold off;

% draw plot of enigines trust over the time
figure(2);
hold on; grid on;
title('Rocket engines forces');
engine1 = plot(engine1_power, 'black-');
engine2 = plot(engine2_power, 'red-');
legend([engine1 engine2],'engine 1','engine 2','Location','Northwest');
hold off

% Draw plot of  the X and Y position 
figure(3);
hold on; grid on;
title('X and Y changes over time');
points_x = plot (points_x, 'black-');
points_y = plot(points_y, 'red-');
legend([points_x points_y],'X axis displacement','Y axis displacement','Location','Southwest');
hold off

%% Part 2: Trust less than 20 for each engine

cvx_solver('sdpt3');
cvx_begin
variables engine1_power(K-1) engine2_power(K-1) force_vector_x(K) force_vector_y(K) velocity_x(K) velocity_y(K) points_x(K) points_y(K)
minimize (sum(engine1_power)+sum(engine2_power))
subject to
    % where rocket starts
    points_x(1) == 0;
    points_y(1) == 0;
    % rocket wasn't moving on the start
    velocity_x(1) == 0;
    velocity_y(1) == 0;
    
    points_x(k1) == w1(1);
    points_y(k1) == w1(2);
    
    points_x(k2) == w2(1);
    points_y(k2) == w2(2);
    
    points_x(k3) == w3(1);
    points_y(k3) == w3(2);
    
    points_x(k4) == w4(1);
    points_y(k4) == w4(2);
    
    % engine power must be grather than 0!
    engine1_power >= 0; engine2_power >= 0;
    engine1_power < 20; engine2_power < 20;
    % bounds of the trajecory
    abs(points_x) <= pmax; abs(points_y) <= pmax;
    
    for k=1:K-1
     % Rocket model
     force_vector_x(k)== cos(theta1)*engine1_power(k) + cos(theta2)*engine2_power(k) + 0;
     force_vector_y(k)== sin(theta1)*engine1_power(k) + sin(theta2)*engine2_power(k) - m*g;
     
     velocity_x(k+1)==(1-alpha)*velocity_x(k) + (h/m)*force_vector_x(k);
     velocity_y(k+1)==(1-alpha)*velocity_y(k) + (h/m)*force_vector_y(k);
     
     points_x(k+1) == points_x(k) + h*velocity_x(k);
     points_y(k+1) == points_y(k) + h*velocity_y(k);
    end
cvx_end

total_fuel_consumption = (sum(engine1_power)+sum(engine2_power));
disp('Found minimal fuel consumption: ')
disp(total_fuel_consumption)


% draw the waypoints and rocket trajectory
figure(4);
hold on;
axis equal;
grid on;
title("Rocket trajectory");
xlim([-pmax-1 pmax+1]);
ylim([-pmax-1 pmax+1]);
xlabel("x coordinate");
ylabel("z coordinate");

point1 = plot(w1(1), w1(2) ,'ro');
point2 = plot(w2(1), w2(2) ,'r*');
point3 = plot(w3(1), w3(2) ,'rs');
point4 = plot(w4(1), w4(2) ,'rd');
point_start = plot(points_x(1), points_y(1), 'black*');
rocket_trajectory = plot(points_x, points_y, '-black');
legend([point1 point2 point3 point4 point_start rocket_trajectory],'waypoint 1','waypoint 2','waypoint 3','waypoint 4', 'starting point', 'rocket trajecotry','Location','southwest');
hold off;

% draw plot of enigines trust over the time
figure(5);
hold on; grid on;
title('Rocket engines forces');
engine1 = plot(engine1_power, 'black-');
engine2 = plot(engine2_power, 'red-');
legend([engine1 engine2],'engine 1','engine 2','Location','Northwest');
hold off

% Draw plot of  the X and Y position 
figure(6);
hold on; grid on;
title('X and Y changes over time');
points_x = plot (points_x, 'black-');
points_y = plot(points_y, 'red-');
legend([points_x points_y],'X axis displacement','Y axis displacement','Location','Southwest');
hold off

%% Part 3: Trust less than 15

cvx_solver('sdpt3');
cvx_begin
variables engine1_power(K-1) engine2_power(K-1) force_vector_x(K) force_vector_y(K) velocity_x(K) velocity_y(K) points_x(K) points_y(K)
minimize (sum(engine1_power)+sum(engine2_power))
subject to
    % where rocket starts
    points_x(1) == 0;
    points_y(1) == 0;
    % rocket wasn't moving on the start
    velocity_x(1) == 0;
    velocity_y(1) == 0;
    
    points_x(k1) == w1(1);
    points_y(k1) == w1(2);
    
    points_x(k2) == w2(1);
    points_y(k2) == w2(2);
    
    points_x(k3) == w3(1);
    points_y(k3) == w3(2);
    
    points_x(k4) == w4(1);
    points_y(k4) == w4(2);
    
    % engine power must be grather than 0!
    engine1_power >= 0; engine2_power >= 0;
    engine1_power < 15; engine2_power < 15;
    % bounds of the trajecory
    abs(points_x) <= pmax; abs(points_y) <= pmax;
    
    for k=1:K-1
     % Rocket model
     force_vector_x(k)== cos(theta1)*engine1_power(k) + cos(theta2)*engine2_power(k) + 0;
     force_vector_y(k)== sin(theta1)*engine1_power(k) + sin(theta2)*engine2_power(k) - m*g;
     
     velocity_x(k+1)==(1-alpha)*velocity_x(k) + (h/m)*force_vector_x(k);
     velocity_y(k+1)==(1-alpha)*velocity_y(k) + (h/m)*force_vector_y(k);
     
     points_x(k+1) == points_x(k) + h*velocity_x(k);
     points_y(k+1) == points_y(k) + h*velocity_y(k);
    end
cvx_end

total_fuel_consumption = (sum(engine1_power)+sum(engine2_power));
disp('Found minimal fuel consumption: ')
disp(total_fuel_consumption)

% In that case, the result should be false because we can't find it for
% this constrains (less than 15)