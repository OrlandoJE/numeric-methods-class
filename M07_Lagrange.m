clear
clc

x = 4; % Valor a interpolar

T = [1;2;3;5;7;8]; % Valores x del problema separados por ;
P = [3;6;19;99;291;444]; % Valores y del problema separados por ;

% LaGrange para interpolación
for i = 1:4
    for j = 1:4
        if i ~= j
            a(i,j) = (x-T(j,1))/(T(i,1)-T(j));
        end
    end
end

for cont = 2:4
    P(1:cont,1);
    a(1:cont, 1:cont);
end

LG1 = P(1,1)*a(1,2)+P(2,1)*a(2,1)
LG2 = P(1,1)*a(1,2)*a(1,3)+P(2,1)*a(2,1)*a(2,3)+P(3,1)*a(3,1)*a(3,2)
LG3 = P(1,1)*a(1,2)*a(1,3)*a(1,4)+P(2,1)*a(2,1)*a(2,3)*a(2,4)+P(3,1)*a(3,1)*a(3,2)*a(3,4)+P(4,1)*a(4,1)*a(4,2)*a(4,3)