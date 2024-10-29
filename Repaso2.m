% Newton Raphson para sistemas no lineales
clear
clc

% 7.13

X = [300; 300]; % Cambiar por los valores iniciales del problema

for cont = 1:500
    x = X(1,cont);
    y = X(2,cont);
    X (1:2, cont+1) = X(1:2, cont) - inv(j(x,y)) * f(x,y);
end

Tabla = array2table(X, "RowNames", {'x', 'y'})


function f = f(x,y)
f = [(10^(-9))*((500+273)^4-(x+273)^4)-4*(x-y); 4*(x-y)-1.3*(y-25)^(4/3)]; % Cambiar po las funciones del problema
end

function j = j(x,y)
j = [(10^(-9))*(-4*(x^3)-3276*(x^2)-894348*x-4081385668), 4; 4, -1.7333*(y-25)^(1/3)-4]; % Cambiar por el Jacobiano del problema
end