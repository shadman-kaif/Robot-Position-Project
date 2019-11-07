%Loading robpos file
robpos 
%Naming the given robpos data
time_pts = robpos(1:61,1)
x_pts = robpos(1:61,2)
y_pts = robpos(1:61,3)
%Creating the plots
grid on
hold on
plot(time_pts,x_pts)
plot(time_pts,y_pts)
legend ('x vs t','y vs t')
title ('Position of the Robot through the 2D space')
xlabel ('Time')
ylabel ('Position')
hold off
figure
hold on 
grid on
plot(x_pts,y_pts)
xlabel('X Position')
ylabel('Y Position')
title('X Position vs Y Position')
%Plotting Velocity Function
hold off
figure
hold on
grid on
time_pts = robpos(1:60,1);
x_pts = robpos(1:60,2);
x_pts2 = robpos(2:61,2);
y_pts = robpos(1:60,3);
y_pts2 = robpos(2:61,3);
v=sqrt((((x_pts2)-(x_pts)).^2)+(((y_pts2)-(y_pts)).^2))
plot(time_pts,v)
title('Velocity Function')
ylabel('Velocity')
xlabel('Time')
%Plotting Acceleration
hold off
figure
hold on 
grid on
time_pts = robpos(2:60,1);
x_pts = robpos(2:60,2);
x_pts2 = robpos(3:61,2);
y_pts = robpos(2:60,3);
y_pts2 = robpos(3:61,3);
x_pts3 = robpos(1:59,2);
y_pts3 = robpos(1:59,3);
v=sqrt((((x_pts2)-(x_pts)).^2)+(((y_pts2)-(y_pts)).^2));
v2=sqrt((((x_pts)-(x_pts3)).^2)+(((y_pts)-(y_pts3)).^2));
a=v-v2
plot(time_pts,a)
title('Acceleration Function')
ylabel('Acceleration')
xlabel('Time')
%Polyfit for Velocity
hold off
figure
hold all
grid on
x=linspace(0,60,101)
time_pts = robpos(2:60,1);
v=sqrt((((x_pts2)-(x_pts)).^2)+(((y_pts2)-(y_pts)).^2));
plot(time_pts,v,'r')
ylabel('Velocity')
xlabel('Time')
title('Velocity Function')
coefs=polyfit(time_pts,v,9)
y=polyval(coefs,x)
plot(x,y)
legend('Velocity Function','9-th Order Fit')
%Polyfit for Acceleration
hold off
figure
hold all
grid on
x=linspace(0,60,101)
time_pts = robpos(2:60,1);
x_pts = robpos(2:60,2);
x_pts2 = robpos(3:61,2);
y_pts = robpos(2:60,3);
y_pts2 = robpos(3:61,3);
x_pts3 = robpos(1:59,2);
y_pts3 = robpos(1:59,3);
v=sqrt((((x_pts2)-(x_pts)).^2)+(((y_pts2)-(y_pts)).^2));
v2=sqrt((((x_pts)-(x_pts3)).^2)+(((y_pts)-(y_pts3)).^2));
a=v-v2
plot(time_pts,a,'r')
ylabel('Acceleration')
xlabel('Time')
title('Acceleration Function')
coefs=polyfit(time_pts,a,11)
y=polyval(coefs,x)
plot(x,y)
legend('Acceleration Function','11-th Order Fit')
%Plotting the circle
figure
hold on
grid on
%A for loop can be used here instead of doing this; explanantion of this
%can be found in my description of ways I had to adjust the script
k=0:60;
x_circ=(1.2*cos(k*(pi/30)));
y_circ=1.2*sin(k*(pi/30))+1.2;
plot(x_circ,y_circ);
xlabel('X Position');
ylabel('Y Position');
title('Circular Path');
%Plotting Velocity for X
hold off
figure
hold on
grid on
dy=diff(x_circ)
dx=diff(k)
dydx=dy./dx
xd=k(2:end)
plot(xd,dydx,'b')
xlabel('Time for X')
ylabel('Velocity')
title('Velocity vs Time for X')
%Plotting Velocity for Y
hold off
figure
hold on
grid on
dq=diff(y_circ);
da=diff(k)
dqda=dq./da
ad=k(2:end)
plot(ad,dqda,'b')
xlabel('Time for Y')
ylabel('Velocity')
title('Velocity vs Time for Y')
%Plotting Acceleration for X
hold off
figure
hold on
grid on
dz=diff(diff(x_circ));
l=2:60;
plot(l,dz,'r')
xlabel('Time for X')
ylabel('Acceleration')
title('Acceleration for X')
%Plotting Acceleration for Y
hold off
figure
hold on
grid on
dm=diff(diff(y_circ));
l=2:60;
plot(l,dm,'r')
xlabel('Time for Y')
ylabel('Acceleration')
title('Acceleration for Y')
