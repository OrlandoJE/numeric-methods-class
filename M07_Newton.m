clear
clc

x = 2.8; % Valor a interpolar

T = [1.6;2;2.5;3.2;4;4.5]; % Valores x del problema separados por ;
P = [2;8;14;15;8;2]; % Valores y del problema separados por ;


% Newton para interpolación
b0 = P(1,1);
b1 = (P(2,1)-P(1,1))/(T(2,1)-T(1,1));
b2 = ((P(3,1)-P(2,1))/(T(3,1)-T(2,1))-b1)/(T(3,1)-T(1,1));
b3 = (((P(4,1)-P(3,1))/(T(4,1)-T(3,1))-(P(3,1)-P(2,1))/(T(3,1)-T(2,1)))/(T(4,1)-T(2,1))-b2)/(T(4,1)-T(1,1));

Newton1 = b0+b1*(x-T(1,1))
Newton2 = Newton1 + b2*(x-T(1,1))*(x-T(2,1))
Newton3 = Newton2 + b3*(x-T(1,1))*(x-T(2,1))*(x-T(3,1))