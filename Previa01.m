clc
x=5:5:25;
Tabla = 1;
for cont = 1:5
    Tabla(cont,1)= x(cont);
    Tabla(cont,2)=caida(x(cont));
end

Tabla

function caida=caida(c)
caida = (9.81*86/c)*(1-exp(-11*c/86))-46;
end