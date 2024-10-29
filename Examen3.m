clc
clear
%% Ecuacion Segundo Orden

%% Integración Trapecio
x = 3:21;
for y0 = 1:length(x)
y(y0) = fx(x(y0));
end
TRAPZ = trapz(x,y)
Trapecio = (x(length(x))-x(1)) * (y(length(y))+y(1)+2*sum(y(2:length(y)-1))) / (2*(length(x)-1))
Simpson = (x(length(x))-x(1)) * (y(length(y))+y(1)+4*sum(y(2:2:length(y)-1))+2*sum(y(3:2:length(y)-1))) / (3*(length(x)-1))

%% Ecuacion Primer Orden Heun
clear
y0 = 12;
h = 0.02;
x = 0;
xf = 1;
y= y0;

% Euler
for cont = 1:(xf/h)
    k = f(x(cont),y(cont));
    x(cont+1) = x(cont) + h;
    y(cont+1) = y(cont) + k*h;
end
y (length(y))
plot(x,y)
hold on
% ODE54
[x,y]=ode45(@(x,y) x*log(y+3),[0,xf],y0);
plot(x,y)
legend("Euler", "ODE45")
hold off
y (length(y))
%% Funciones
function fx = fx(t)
fx = cos(exp(0.7*t));
end

function f = f(x,y)
f = x*log(y+3);
end