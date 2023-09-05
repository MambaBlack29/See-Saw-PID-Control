function draw(state,params)

% initialize variables

x = state(1);
theta = state(3);
r = params.r;
L = params.L;

% position of ball

y = x*sin(theta) + r*cos(theta);
x = x*cos(theta) - r*sin(theta);

% ends of seesaw

a = [-L*cos(theta) -L*sin(theta)];
b = [ L*cos(theta)  L*sin(theta)];

plank = [a;b];

% draw simulation

plot(plank(:,1),plank(:,2),'Color','#CAAD8A','LineWidth',3);
hold on;
rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',1,'FaceColor',[1 0 0],'LineWidth',1.5);
rectangle('Position',[-0.15,-0.10,0.3,0.2],'Curvature',0.2,'FaceColor',[0 0 0]);
rectangle('Position',[-0.05,-0.05,0.1,0.1],'Curvature',1,'FaceColor',[1 1 1],'LineWidth',1.5);

axis([-6 6 -3 3]); axis normal
set(gcf,'Position',[200 180 1000 500])
drawnow, hold off