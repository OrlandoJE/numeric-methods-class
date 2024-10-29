clear
clc

i1 = 17;
i2 = 18;

for cont = 1:8
    i3 = i2-((i2-i1)*f(i2))/(f(i2)-f(i1));
    
    tabla(cont,1) = i1;
    tabla(cont, 2) = i2;
    tabla(cont, 3) = f(i1);
    tabla(cont, 4) = f(i2);
    tabla(cont, 5) = i3;
    tabla(cont, 6) = abs((i3-i2)/i3)*100;

    if (i3-i1)>(i3-i2)
        i1 = i3;
    else
        i2 = i3;
    end
end

tabla = array2table(tabla, "VariableNames",{'x_i-1', 'x_i', 'f(x_i-1)', 'f(x_i)','x_i+1','error'})

function f = f(x)
k = 0.022;
ca = 47;
cb = 29;
cc = 4;

f = k*(ca-2*x)^2*(cb-x)-(cc+x);
end