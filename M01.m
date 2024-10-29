clear
clc

x = 0.651;
s = 0;
tabla = 1;

for cont = 0:5
    s = s + serie(cont);
    er = (cos(x) - s)*100/ cos(x);
    tabla(cont+1, 1) = cont;
    tabla(cont+1, 2) = serie(cont);
    tabla(cont+1, 3) = s;
    tabla(cont+1, 4) = er;
end

tabla = array2table(tabla, "VariableNames",{'i', 'eva', 'suma', 'error'})

function serie = serie(i)
x = 0.651;
serie = (-1)^i*x^(2*i)/factorial(2*i);
end