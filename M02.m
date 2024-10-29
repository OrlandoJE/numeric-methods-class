clear
clc

x = 0: 0.26: 1.56;

for cont = 1:7
    tabla(cont, 1) = x(cont);
    tabla(cont, 2) = tanque(x(cont));
end

x1 = 0.26;
x2 = 0.26;
x3 = 0.26;

for cont = 1:5
    s1 = x1;
    x1 = t1(x1);
    er1 = ((abs(x1)-abs(s1))/abs(x1))*100;

    tabla1(cont, 1) = s1;
    tabla1(cont, 2) = x1;
    tabla1(cont, 3) = er1;


    s2 = x2;
    x2 = t2(x2);
    er2 = ((abs(x2)-abs(s2))/abs(x2))*100;

    tabla2(cont, 1) = s2;
    tabla2(cont, 2) = x2;
    tabla2(cont, 3) = er2;


    s3 = x3;
    x3 = t3(x3);
    er3 = ((abs(x3)-abs(s3))/abs(x3))*100;

    tabla3(cont, 1) = s3;
    tabla3(cont, 2) = x3;
    tabla3(cont, 3) = er3;
    
end

a = 0.26;
b = 0.52;

for cont = 0:4
    c = (a+b)/2;

    tablaBis(cont+1, 1) = a;
    tablaBis(cont+1, 2) = b;
    tablaBis(cont+1, 3) = tanque(a);
    tablaBis(cont+1, 4) = tanque(b);
    tablaBis(cont+1, 5) = c;
    tablaBis(cont+1, 6) = tanque(c);
    tablaBis(cont+1, 7) = tanque(a)*tanque(c);
    tablaBis(cont+1, 8) = abs((c-a)/c)*100;

    if tanque(a)*tanque(c)>0
        a = c;
    else
        b = c;
    end
    
end

tablaLiquido = array2table(tabla, "VariableNames",{'i', 'eva'})

tablaBis = array2table(tablaBis, "VariableNames", {'a', 'b', 'f(a)', 'f(b)', 'c', 'f(c)', 'f(a)*f(c)', '% error'})

tabla1PuntoFijo = array2table(tabla1, "VariableNames",{'xi', 'g(xi)', '% error'})
tabla2PuntoFijo = array2table(tabla2, "VariableNames",{'xi', 'g(xi)', '% error'})
tabla3PuntoFijo = array2table(tabla3, "VariableNames",{'xi', 'g(xi)', '% error'})


function tanque = tanque(h)
r = 1.3;
v = 0.67;
tanque = ((pi)*h^2*(3*r-h))/3 - v;
%tanque = (pi)*h^2*(3*r-h)-3*v;
end
function t1 = t1(h)
r = 1.3;
v = 0.67;
t1 = ((pi)*h^2*(3*r-h))/3 -v + h;
end
function t2 = t2(h)
r = 1.3;
v = 0.67;
t2 = 3*r - (3*v)/((pi)*h^2);
end
function t3 = t3(h)
r = 1.3;
v = 0.67;
t3 = sqrt((3*v)/((3*r - h)*(pi)));
end