clc
%% Integración Matlab 9
% Ejercio 24.49
clear
disp('Ejercicio 24.49')
x = 0:6;
y = 12 * [5,5,4.62,4.01,3.42,1.69,0];

TRAPZ = trapz(x,y)
Trapecio = (x(length(x))-x(1)) * (y(length(y))+y(1)+2*sum(y(2:length(y)-1))) / (2*(length(x)-1))
Simpson = (x(length(x))-x(1)) * (y(length(y))+y(1)+4*sum(y(2:2:length(y)-1))+2*sum(y(3:2:length(y)-1))) / (3*(length(x)-1))

% Ejercicio 24.45
clear
disp('Ejercicio 24.45')
x = 0:30;
for c = 0:10
    y(c+1) = v1(c);
end
for c = 10:20
    y(c+1) = v1(c);
end
for c = 20:30
    y(c+1) = v1(c);
end

TRAPZ = trapz(x,y)
Trapecio = (x(length(x))-x(1)) * (y(length(y))+y(1)+2*sum(y(2:length(y)-1))) / (2*(length(x)-1))
Simpson = (x(length(x))-x(1)) * (y(length(y))+y(1)+4*sum(y(2:2:length(y)-1))+2*sum(y(3:2:length(y)-1))) / (3*(length(x)-1))

% Ejercio 24.32
clear
disp('Ejercicio 24.32') % V = I*R
x = 0:60;
for c = 0:60
    y(c+1) = corr(c)*resi(corr(c));
end

TRAPZ = trapz(x,y)
Trapecio = (x(length(x))-x(1)) * (y(length(y))+y(1)+2*sum(y(2:length(y)-1))) / (2*(length(x)-1))
Simpson = (x(length(x))-x(1)) * (y(length(y))+y(1)+4*sum(y(2:2:length(y)-1))+2*sum(y(3:2:length(y)-1))) / (3*(length(x)-1))

%% Euler, Heun y Runge-Kutta EDO Primer Orden Matlab 10
%%% Ejercicio 25.1
clear
disp('Ejercicio 25.1')
h = 0.2;
x = 0;
xf = 2;
y = 1;
% Euler
for cont = 1:xf/h
    k = f(x(cont),y(cont));
    x(cont+1) = x(cont) + h;
    y(cont+1) = y(cont) + k*h;
end
figure(Name='Ejercicio 25.1', NumberTitle='off')
plot(x,y)
hold on
% Heun
for cont = 1:xf/h
    k1 = f(x(cont),y(cont));
    k2 = f(x(cont) + h, y(cont) + h*k1);
    y(cont+1) = y(cont) + (k1+k2)*h/2;
end
plot(x,y)
% RungeKutta
for cont = 1:xf/h
    k1 = f(x(cont),y(cont));
    k2 = f(x(cont) + h/2, y(cont) + h*k1/2);
    k3 = f(x(cont) + h/2, y(cont) + h*k2/2);
    k4 = f(x(cont) + h, y(cont) + h*k3);
    y(cont+1) = y(cont)+(k1+2*k2+2*k3+k4)*h/6;
end
plot(x,y)
% ODE54
[x,y]=ode45(@(x,y) y*x^2-1.1*y,[0,xf],y(1));
plot(x,y)
legend("Euler", "Heun", "Rungekutta", "ODE45")
hold off

%%% Ejercicio 25.10
clear
disp('Ejercicio 25.10')
h = 0.5;
x = 0;
xf = 3;
y = 1;
% Euler
for cont = 1:xf/h
    k = g(x(cont),y(cont));
    x(cont+1) = x(cont) + h;
    y(cont+1) = y(cont) + k*h;
end
figure(Name='Ejercicio 25.10', NumberTitle='off')
plot(x,y)
hold on
% Heun
for cont = 1:xf/h
    k1 = g(x(cont),y(cont));
    k2 = g(x(cont) + h, y(cont) + h*k1);
    y(cont+1) = y(cont) + (k1+k2)*h/2;
end
plot(x,y)
% RungeKutta
for cont = 1:xf/h
    k1 = g(x(cont),y(cont));
    k2 = g(x(cont) + h/2, y(cont) + h*k1/2);
    k3 = g(x(cont) + h/2, y(cont) + h*k2/2);
    k4 = g(x(cont) + h, y(cont) + h*k3);
    y(cont+1) = y(cont)+(k1+2*k2+2*k3+k4)*h/6;
end
plot(x,y)
% ODE54
[x,y]=ode45(@(x,y) (-y+x^2),[0,xf],y(1));
plot(x,y)
legend("Euler", "Heun", "Rungekutta", "ODE45")
hold off

%%% Ejercicio 25.11
clear
disp('Ejercicio 25.11')
h = 0.2;
x = 0;
xf = 1;
y = 2;
z = 4;
% Euler
for cont = 1:xf/h
    x(cont+1) = x(cont) + h;
    ky = fy(x(cont),y(cont));
    y(cont+1) = y(cont) + ky*h;
    kz = fz(x(cont),z(cont));
    z(cont+1) = z(cont) + kz*h;
end
figure(Name='Ejercicio 25.11', NumberTitle='off')
plot(x,y)
hold on
plot(x,z)
% Heun
for cont = 1:xf/h
    ky1 = fy(x(cont),y(cont));
    ky2 = fy(x(cont) + h, y(cont) + h*ky1);
    y(cont+1) = y(cont) + (ky1+ky2)*h/2;
    kz1 = fz(x(cont),z(cont));
    kz2 = fz(x(cont) + h, z(cont) + h*kz1);
    z(cont+1) = z(cont) + (kz1+kz2)*h/2;
end
plot(x,y)
plot(x,z)
% RungeKutta
for cont = 1:xf/h
    k1 = fy(x(cont),y(cont));
    k2 = fy(x(cont) + h/2, y(cont) + h*k1/2);
    k3 = fy(x(cont) + h/2, y(cont) + h*k2/2);
    k4 = fy(x(cont) + h, y(cont) + h*k3);
    y(cont+1) = y(cont)+(k1+2*k2+2*k3+k4)*h/6;
    kz1 = fz(x(cont),z(cont));
    kz2 = fz(x(cont) + h/2, z(cont) + h*kz1/2);
    kz3 = fz(x(cont) + h/2, z(cont) + h*kz2/2);
    kz4 = fz(x(cont) + h, z(cont) + h*kz3);
    z(cont+1) = z(cont)+(kz1+2*kz2+2*kz3+kz4)*h/6;
end
plot(x,y)
plot(x,z)
% ODE54
[x,y]=ode45(@(x,y) (-2*y+4*exp(-x)),[0,xf],y(1));
plot(x,y)
[x,y]=ode45(@(x,y) (-y*(x^2)/3),[0,xf],z(1));
plot(x,y)
legend("Euler y", "Euler z", "Heun y", "Heun z", "Rungekutta y", "Rungekutta z", "ODE45 y", "ODE45 z")
hold off

%% Euler, Heun y RungeKutta EDO Segundo Orden Matlab 11
%%% Ejercicio 25.20
clear
disp('Ejercio 25.20')
t = 0;
tf = 15;
x = 1;
l = 0;
h= 0.5;
figure('Name', 'Ejercicio 25.20', 'NumberTitle', 'off');
% Euler
for c = 1:(tf/h)
    kx = dx(l(c));
    kl = dl(x(c),l(c));
    t(c+1) = t(c) + h;
    x(c+1) = x(c) + kx*h;
    l(c+1) = l(c) + kl*h;
end
plot(t,x)
hold on
plot(t,l)
% Heun
for c = 1:(tf/h)
    kx1 = dx(l(c));
    kl1 = dl(x(c),l(c));
    kx2 = dx(l(c)+kx1*h);
    kl2 = dl(x(c)+kx1*h,l(c)+kl1*h);
    x(c+1) = x(c) + (kx1+kx2)*h/2;
    l(c+1) = l(c) + (kl1+kl2)*h/2;
end
plot(t,x)
plot(t,l)
%Runge-Kutta
for c = 1:(tf/h)
    kx1 = dx(l(c));
    kl1 = dl(x(c),l(c));
    kx2 = dx(l(c)+kx1*h/2);
    kl2 = dl(x(c)+kx1*h/2,l(c)+kl1*h/2);
    kx3 = dx(l(c)+kx2*h/2);
    kl3 = dl(x(c)+kx2*h/2,l(c)+kl2*h/2);
    kx4 = dx(l(c)+kx3*h);
    kl4 = dl(x(c)+kx3*h,l(c)+kl3*h);
    x(c+1) = x(c) + (kx1+2*kx2+2*kx3+kx4)*h/6;
    l(c+1) = l(c) + (kl1+2*kl2+2*kl3+kl4)*h/6;
end
plot(t,x)
plot(t,l)
% ODE45
x0=[1,0];
fg=@(t,x) [x(2); (-20*x(1)-5*x(2))/20]; 
[t,x]=ode45(fg,[0,tf],x0); 
plot(t,x)
legend("Euler 1", "Euler 2", "Heun 1", "Heun 2", "Rungekutta 1", "Rungekutta 2", "ODE45 1", "ODE45 2")
hold off

%%% Ejercicio 25.22
clear
disp('Ejercio 25.22')
t = 0;
tf = 15;
x = 6;
l = 1.5;
h= 0.5;
figure('Name', 'Ejercicio 25.22', 'NumberTitle', 'off');
% Euler
for c = 1:(tf/h)
    kx = dx1(l(c));
    kl = dl1(x(c),l(c),t(c));
    t(c+1) = t(c) + h;
    x(c+1) = x(c) + kx*h;
    l(c+1) = l(c) + kl*h;
end
plot(t,x)
hold on
plot(t,l)
% Heun
for c = 1:(tf/h)
    kx1 = dx1(l(c));
    kl1 = dl1(x(c),l(c),t(c));
    kx2 = dx1(l(c)+kx1*h);
    kl2 = dl1(x(c)+kx1*h,l(c)+kl1*h,t(c));
    x(c+1) = x(c) + (kx1+kx2)*h/2;
    l(c+1) = l(c) + (kl1+kl2)*h/2;
end
plot(t,x)
plot(t,l)

%Runge-Kutta
for c = 1:(tf/h)
    kx1 = dx1(l(c));
    kl1 = dl1(x(c),l(c),t(c));
    kx2 = dx1(l(c)+kx1*h/2);
    kl2 = dl1(x(c)+kx1*h/2,l(c)+kl1*h/2,t(c));
    kx3 = dx1(l(c)+kx2*h/2);
    kl3 = dl1(x(c)+kx2*h/2,l(c)+kl2*h/2,t(c));
    kx4 = dx1(l(c)+kx3*h);
    kl4 = dl1(x(c)+kx3*h,l(c)+kl3*h,t(c));
    x(c+1) = x(c) + (kx1+2*kx2+2*kx3+kx4)*h/6;
    l(c+1) = l(c) + (kl1+2*kl2+2*kl3+kl4)*h/6;
end
plot(t,x)
plot(t,l)
% ODE45
x0=[6,1.5];
fg=@(t,x) [x(2); -5*x(1)*x(2)+(x(1)+7)*sin(t)]; 
[t,x]=ode45(fg,[0,tf],x0); 
plot(t,x)
legend("Euler 1", "Euler 2", "Heun 1", "Heun 2", "Rungekutta 1", "Rungekutta 2", "ODE45 1", "ODE45 2")
hold off

%% Funciones Integración
%%% Funciones Integración
% Ejercicio 24.45
function v1 = v1(t)
v1 = 11*t^2-5*t;
end
function v2 = v2(t)
v2 = 1100-5*t;
end
function v3 = v3(t)
v3 = 50*t + 2*(t-20)^2;
end

% Ejercio 24.32
function corr = corr (t)
corr = (60-t)^2 + (60-t)*sin(sqrt(t));
end
function resi = resi(i)
resi = 12*i + 2*i^(2/3);
end

%%% Funciones Euler, Heun y Runge-Kutta
% Ejercicio 25.1
function f = f(x,y)
f = y*x^2-1.1*y;
end

% Ejercicio 25.10
function g = g(t,y)
g = -y + t^2;
end

% Ejercicio 25.11
function fy = fy(x,y)
fy = -2*y + 4*exp(-x);
end
function fz = fz(z,y)
fz = -y*(z^2)/3;
end

% Ejercicio 25.20
function dl = dl(x,l)
m = 20;
k = 20;
c = 5;
dl = (-k*x-c*l)/m;
end
function dx = dx(l)
dx = l;
end

% Ejercicio 25.22
function dl1 = dl1(x,l,t)
dl1 = -5*x*l+(x+7)*sin(t);
end
function dx1 = dx1(l)
dx1 = l;
end