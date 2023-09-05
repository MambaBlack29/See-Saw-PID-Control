clear, clc, close all

% initialize paramter values

params;

% create time-span vector

tspan = 0:.1:10;

% initial state [pos, vel, theta, omega]

yi = [-4; 0; 0; 0];

% final state [pos, vel, theta, omega]

yf = [4; 0; 0; 0];

% solve equations of motion

[t,y] = ode45(@(t,y)physics(y,params,control(y,yf,params)),tspan,yi);

% graphical simulation

for k=1:length(t)
    draw(y(k,:),params); % y(...) = state @ kth time interval
end

fprintf("Final error in states:\n");
disp(yf' - y(k,:)); % monitoring final errors in states
