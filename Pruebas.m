clear
clc

x = 3:21;
for cont = 1:length(x)
    y(cont) = f(x(cont));
end

TRAPZ = trapz(x,y)

Trapecio = (x(length(x))-x(1)) * (y(length(y))+y(1)+2*sum(y(2:length(y)-1))) / (2*(length(x)-1))
Simpson = (x(length(x))-x(1)) * (y(length(y))+y(1)+4*sum(y(2:2:length(y)-1))+2*sum(y(3:2:length(y)-1))) / (3*(length(x)-1))

function f = f(t)
    f = cos(exp(0.7*t));
end