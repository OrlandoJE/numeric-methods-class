clear
clc

xi = 0.5;

for cont = 1:5
    xi1 = xi - f(xi) / df(xi);
    tabla(cont, 1) = xi;
    tabla(cont, 2) = f(xi);
    tabla(cont, 3) = df(xi);
    tabla(cont, 4) = xi1;
    tabla(cont, 5) = abs(xi1-xi)/xi1*100;

    xi =xi1;
end

tabla = array2table(tabla,"VariableNames", {'xi', 'f(xi)', 'df(xi)', 'x{i+1}', '% error'})

function f = f(x)
f = 4-20*(exp(-0.25*x)-exp(-0.5*x));
end
function df = df(x)
df = 5*exp(-0.25*x)-10*exp(-0.5*x);
end