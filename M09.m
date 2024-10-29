clear
clc
c = 0.09;
syms t
g = t*exp(c*t);
valorReal = int(g,0,24)

x = 0:2:24;
for cont = 1:length(x)
    y(cont) = f(x(cont));
end

TRAPZ = trapz(x,y)
QUAD = quad(@f,0,24)

Trapecio = (x(length(x))-x(1)) * (y(length(y))+y(1)+2*sum(y(2:length(y)-1))) / (2*(length(x)-1))
Simpson = (x(length(x))-x(1)) * (y(length(y))+y(1)+4*sum(y(2:2:length(y)-1))+2*sum(y(3:2:length(y)-1))) / (3*(length(x)-1))

function f = f(t)
    c = 0.09;
    f = t.*exp(c.*t);
end