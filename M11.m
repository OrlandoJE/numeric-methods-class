clear
clc

h = 0.1; % Valor de h a modificar

%% Sistema presa-depredador %%
x0 = 4;
y0 = 5;

t = 0;
x = x0;
y = y0;

figSPD = figure('Name', 'Sistema Presa-Depredador', 'NumberTitle', 'off');
tab = uitabgroup(figSPD);

% Euler
tab1 = uitab(tab,'Title','Euler');
axes('Parent', tab1);
for c = 1:(1/h)
    kx = dx(x(c),y(c));
    ky = dy(x(c),y(c));
    t(c+1) = t(c) + h;
    x(c+1) = x(c) + kx*h;
    y(c+1) = y(c) + ky*h;
end
plot(t,x)
hold on
plot(t,y)
hold off

% Heun
tab2 = uitab(tab,'Title','Heun');
axes('Parent', tab2);
for c = 1:(1/h);
    kx1 = dx(x(c),y(c));
    ky1 = dy(x(c),y(c));
    kx2 = dx(x(c)+kx1*h,y(c)+ky1*h);
    ky2 = dy(x(c)+kx1*h,y(c)+ky1*h);
    x(c+1) = x(c) + (kx1+kx2)*h/2;
    y(c+1) = y(c) + (ky1+ky2)*h/2;
end
plot(t,x)
hold on
plot(t,y)
hold off

%Runge-Kutta
tab3 = uitab(tab,'Title','Runge-Kutta');
axes('Parent', tab3);
for c = 1:(1/h);
    kx1 = dx(x(c),y(c));
    ky1 = dy(x(c),y(c));
    kx2 = dx(x(c)+kx1*h/2,y(c)+ky1*h/2);
    ky2 = dy(x(c)+kx1*h/2,y(c)+ky1*h/2);
    kx3 = dx(x(c)+kx2*h/2,y(c)+ky2*h/2);
    ky3 = dy(x(c)+kx2*h/2,y(c)+ky2*h/2);
    kx4 = dx(x(c)+kx3*h,y(c)+ky3*h);
    ky4 = dy(x(c)+kx3*h,y(c)+ky3*h);
    t(c+1) = t(c) + h;
    x(c+1) = x(c) + (kx1+2*kx2+2*kx3+kx4)*h/6;
    y(c+1) = y(c) + (ky1+2*ky2+2*ky3+ky4)*h/6;
end
plot(t,x)
hold on
plot(t,y)
hold off

% ODE45
tab4 = uitab(tab,'Title','ODE45');
axes('Parent', tab4);

x0=[4,5];
tf=1;
fg=@(t,x) [0.8*x(1)-0.24*x(1)*x(2); -0.3*x(2)+0.6*x(1)*x(2)]; 
[t,x]=ode45(fg,[0,tf],x0); 
plot(t,x)

%% EDO de Segundo Orden %%
x0 = 1;
l0 = 8;

t = 0;
x = x0;
l = l0;

figEDOSO = figure('Name', 'EDO de Segundo Orden', 'NumberTitle', 'off');
tab = uitabgroup(figEDOSO);

% Euler
tab1 = uitab(tab,'Title','Euler');
axes('Parent', tab1);
for c = 1:(1/h)
    kx = dx1(l(c));
    kl = dl(x(c),l(c));
    t(c+1) = t(c) + h;
    x(c+1) = x(c) + kx*h;
    l(c+1) = l(c) + kl*h;
end
plot(t,x)
hold on
plot(t,l)
hold off

% Heun
tab2 = uitab(tab,'Title','Heun');
axes('Parent', tab2);
for c = 1:(1/h)
    kx1 = dx1(l(c));
    kl1 = dl(x(c),l(c));
    kx2 = dx1(l(c)+kx1*h);
    kl2 = dl(x(c)+kx1*h,l(c)+kl1*h);
    t(c+1) = t(c) + h;
    x(c+1) = x(c) + (kx1+kx2)*h/2;
    l(c+1) = l(c) + (kl1+kl2)*h/2;
end
plot(t,x)
hold on
plot(t,l)
hold off

%Runge-Kutta
tab3 = uitab(tab,'Title','Runge-Kutta');
axes('Parent', tab3);
for c = 1:(1/h)
    kx1 = dx1(l(c));
    kl1 = dl(x(c),l(c));
    kx2 = dx1(l(c)+kx1*h/2);
    kl2 = dl(x(c)+kx1*h/2,l(c)+kl1*h/2);
    kx3 = dx1(l(c)+kx2*h/2);
    kl3 = dl(x(c)+kx2*h/2,l(c)+kl2*h/2);
    kx4 = dx1(l(c)+kx3*h);
    kl4 = dl(x(c)+kx3*h,l(c)+kl3*h);
    t(c+1) = t(c) + h;
    x(c+1) = x(c) + (kx1+2*kx2+2*kx3+kx4)*h/6;
    l(c+1) = l(c) + (kl1+2*kl2+2*kl3+kl4)*h/6;
end
plot(t,x)
hold on
plot(t,l)
hold off

% ODE45
tab4 = uitab(tab,'Title','ODE45');
axes('Parent', tab4);

x0=[1,8];
tf=1;
fgg=@(t,x) [x(2); (-0.7*x(2)-36*x(1))/4]; 
[t,x]=ode45(fgg,[0,tf],x0); 
plot(t,x)

%% Funciones Sistema Presa-Depredador
function dx = dx(x,y)
a = 0.8;
b = -0.24;
dx = a*x + b*x*y;
end

function dy = dy(x,y)
a = -0.3;
b = 0.6;
dy = a*y + b*x*y;
end