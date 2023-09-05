function dx = physics(X,params,u)

% initialize variables

x = X(1);
S = sin(X(3)); % sin(theta)
C = cos(X(3)); % cos(theta)
I = params.M*params.L*params.L/3 + params.m*(2*params.r*params.r/3 + x^2); % hollow ball

% equations of motion (differentials)

if (X(1)<params.L && X(1)>-params.L && X(3)<pi/2 && X(3)>-pi/2)
    dx(1,1) = X(2); % velocity
    dx(2,1) = -3*params.g*S/5; % acceleration
    dx(3,1) = X(4); % angular velocity
    dx(4,1) = -params.m*params.g*x*C/I + u/I; % angular acceleration
else
    dx(1,1) = X(2);
    dx(2,1) = sign(X(1))*params.g;
    dx(3,1) = X(4);
    dx(4,1) = - 3*u/(params.M*params.L*params.L);
end