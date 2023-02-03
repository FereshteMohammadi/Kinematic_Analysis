%% CMiM_11_assignment
% kinematic analysis
% Fereshte Mohammadi Khoshoue

close all;
clear;
clc;

%% Initial value
% i_v = initial_value();
i_v = [0.1; 0.2; -1; pi/6; 0; 20; 101];
time = linspace(i_v(5), i_v(6), i_v(7));
error = 1e-9;

%% Find initial theta and d
syms theta d

F1 = i_v(1) * cos(i_v(4)) + i_v(2) * cos(theta) - d;
F2 = i_v(1) * sin(i_v(4)) - i_v(2) * sin(theta);

[theta, d] = solve(F1, F2, [theta, d]);

theta_0 = double(theta(2));

%% Generalized coordinate
v_phi = variable_phi(-1,time);
q = [0.05; 0.025; v_phi(1); 0.0968; 0.025; theta_0; 0.2803; 0; 0];     %q = [x1;y1;theta1;x2;y2;theta2;x3;y3;theta3];
dq = zeros(9,1);                                                       %dq = [dx1;dy1;dtheta1;dx2;dy2;dtheta2;dx3;dy3;dtheta3];
ddq = zeros(9,1);                                                      %ddq = [ddx1;ddy1;ddtheta1;ddx2;ddy2;ddtheta2;ddx3;ddy3;ddtheta3];

%% Position analysis using Newton-Raphson's method
Q = zeros(length(q), i_v(7));
i = 1;
for t = linspace(0, 1, 101)
        [qn, iteration_counter] = NewtonRaphson_method(@(q) constraint(q, i_v, v_phi(i)), @(q) constraint_dq(q, i_v, v_phi(i)), q, error);
        Q(:,i) = qn;
        i = i + 1;
end        
         
%% Velocity analysis
dQ = zeros(length(q), i_v(7));
for i = 1:length(time)
    Cq = constraint_dq(Q(:,i), i_v, v_phi(i));
    Ct = constraint_dt(i_v, v_phi(i));
    dQ(:,i) = -Ct \ Cq;
end

%% Acceleration analysis
ddQ = zeros(length(q), i_v(7));
for i = 1:length(time)
    Cq = constraint_dq(Q(:,i), i_v, v_phi(i));
    Cqdq = constraint_dqq(Q(6,i), dQ(3,i), i_v, v_phi(i)) * dQ(:,i); 
    Ctt = constraint_ddt(i_v, v_phi(i));
    ddQ(:,i) = -(Ctt + Cqdq) \ Cq;
end

%% Plot

subplot(3,1,1);
plot(time, Q(7,:), 'LineWidth', 2); % x of slider
ylabel("Position of slider")
subplot(3,1,2);
plot(time, dQ(7,:), 'LineWidth', 2); % velocity of slider
ylabel("Velocity of slider")
subplot(3,1,3);
plot(time, ddQ(7,:), 'LineWidth', 2); % acceleration of slider
ylabel("Acceleration of slider")
xlabel("Time")






