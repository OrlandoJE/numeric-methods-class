clc
clear

X = [2;2];

for cont = 1:6
    x = X(1,cont);
    y = X(2,cont);
    X (1:2, cont+1) = X(1:2, cont) - inv(j(x,y)) * f(x,y);
end

X = array2table(X, "RowNames", {'x', 'y'})



function f = f(x,y)
a = 6;
b = 4;
c = 11;
f = [x^2+x*y-a; y+b*x*y^2-c];
end
function j = j(x,y)
b = 4;
j = [2*x+y, x; b*y^2, 1+2*b*x*y];
end