clear
clc
%% Valores para modificar
psi = [80, 120];
h = 0.1;
t0 = 238;
t5 = 88;

%% Problema
k = 0.013;
ta = 33;
x = 0;
t = t0;
% Tabla 1
ky = k*(t0-ta);
for c = 1:(5/h)
    x(c+1) = x(c) + h;
    t(c+1) = t(c) + psi(c,1)*h;
    ky(c+1) = k*(t(c+1)-ta);
    psi(c+1,1) = psi(c,1)+ky(c)*h;
    temp = t(c+1);
end
% Siguientes tablas
n = 2;
rep = 0;
while rep == 0
    ky = k*(t0-ta);
    t(n,1) = t0;
    for c = 1:(5/h)
        t(n,c+1) = t(n,c) + psi(c,n)*h;
        ky(c+1) = k*(t(n,c+1)-ta);
        psi(c+1,n) = psi(c,n)+ky(c)*h;
        temp(n) = t(n,c+1);
    end
    psi(1,n+1) = psi(1,n) + (psi(1,n) - psi(1,n-1)) * (t5 - temp(n)) / (temp(n) - temp(n-1));
    if isnan(psi(1,n+1))
        rep = rep + 1;
        break
    end
    n = n + 1;
end
plot(x, t(n,1:(5/h + 1)))