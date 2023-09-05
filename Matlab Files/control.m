function u = control(X,X_desired,params)

error = (X_desired - X);

k = [0.32, 0.81, -5.6, -3.3]; % proportional constant array for errors of [x, v, theta, omega]
% k = [Kp_X, Kd_X, Kp_Theta, Kd_Theta]
PID = k*error; % k = 1x4, error = 4x1, PID is linear combo of error and constants

I = params.M*params.L*params.L/3 + params.m*(2*params.r*params.r/3 + X(1)^2); % moment of inertia
tauExternal = params.m*params.g*X(1); % used as jugaad integrator term = min torque needed at rest

u =  tauExternal - I*PID; % final controlled torque is [MOI]x[PID control value]
% hence, taking PID control value as Angular acceleration of seesaw+ball

% u indicates torque provided by the motor at the center of the seesaw
% Anticlockwise direction is taken to be positive.

end