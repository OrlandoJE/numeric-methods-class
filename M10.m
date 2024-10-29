clear
clc

a = 7;
b = 7;
c = 3.7;
h = 0.1;

x = 0;
y= c;

% Euler
for cont = 1:11
    k = f(x(cont),y(cont));
    x(cont+1) = x(cont) + h;
    y(cont+1) = y(cont) + k*h;
end
plot(x,y)
hold on

% Heun
for cont = 1:11
    k1 = f(x(cont),y(cont));
    k2 = f(x(cont) + h, y(cont) + h*k1);
    x(cont+1) = x(cont) + h;
    y(cont+1) = y(cont) + (k1+k2)*h/2;
end
plot(x,y)

% RungeKutta
for cont = 1:11
    k1 = f(x(cont),y(cont));
    k2 = f(x(cont) + h/2, y(cont) + h*k1/2);
    k3 = f(x(cont) + h/2, y(cont) + h*k2/2);
    k4 = f(x(cont) + h, y(cont) + h*k3);
    x(cont+1) = x(cont) + h;
    y(cont+1) = y(cont)+(k1+2*k2+2*k3+k4)*h/6;
end
plot(x,y)

% ODE54
[x,y]=ode45(@(x,y) a*y*x^3-b*y,[0,1],c);
plot(x,y)

legend("Euler", "Heun", "Rungekutta", "ODE45")
hold off

function f = f(x,y)
a = 7;
b = 7;
f = a*y*x^3-b*y;
end