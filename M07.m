clear
clc

x = 27;

T = [20; 30; 40; 50; 60; 70];
P = [17; 32; 40; 55; 93; 149];

% Algebraico
for cont = 2:4
    if cont == 4
        m(1:cont, cont-3) = T(1:cont).^3;
        m(1:cont, cont-2) = T(1:cont).^2;
    end
    if cont == 3
        m(1:cont, cont-2) = T(1:cont).^2;
    end
    m(1:cont, cont-1) = T(1:cont).^1;
    m(1:cont, cont) = T(1:cont).^0;

    b(1:cont, 1) = P(1:cont);

    res = inv(m)*b;

    if cont == 2
        aP1 = res(1,1)*x^(cont-1) + res(2,1)*x^(cont-2)
    end
    if cont == 3
        aP2 = res(1,1)*x^(cont-1) + res(2,1)*x^(cont-2)+ res(3,1)*x^(cont-3)
    end
    if cont == 4
        aP3 = res(1,1)*x^(cont-1) + res(2,1)*x^(cont-2) + res(3,1)*x^(cont-3) + res(4,1)*x^(cont-4)
    end
end

% LaGrange
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

% Newton
b0 = P(1,1);
b1 = (P(2,1)-P(1,1))/(T(2,1)-T(1,1));
b2 = ((P(3,1)-P(2,1))/(T(3,1)-T(2,1))-b1)/(T(3,1)-T(1,1));
b3 = (((P(4,1)-P(3,1))/(T(4,1)-T(3,1))-(P(3,1)-P(2,1))/(T(3,1)-T(2,1)))/(T(4,1)-T(2,1))-b2)/(T(4,1)-T(1,1));

Newton1 = b0+b1*(x-T(1,1))
Newton2 = Newton1 + b2*(x-T(1,1))*(x-T(2,1))
Newton3 = Newton2 + b3*(x-T(1,1))*(x-T(2,1))*(x-T(3,1))