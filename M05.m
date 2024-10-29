clear
clc

jacobi = ones(4);
gaussSeidel = ones(4);
for cont = 1:4
    edJacobi (1, cont) = 300;
    edGaussSeidel (1, cont) = 300;
end

% Ciclo para Jacobi
for cont = 1:12
    jacobi (cont+1, 1) = x(jacobi (cont, 2), jacobi (cont, 3), jacobi (cont, 4));
    jacobi (cont+1, 2) = y(jacobi (cont, 1), jacobi (cont, 3), jacobi (cont, 4));
    jacobi (cont+1, 3) = z(jacobi (cont, 1), jacobi (cont, 2), jacobi (cont, 4));
    jacobi (cont+1, 4) = w(jacobi (cont, 1), jacobi (cont, 2), jacobi (cont, 3));
end
jacobi = array2table(jacobi, "VariableNames", {'x', 'y', 'z', 'w'})

% Ciclo para Gauss - Seidel
for cont = 1:6
    gaussSeidel (cont+1, 1) = x(gaussSeidel (cont, 2), gaussSeidel (cont, 3), gaussSeidel (cont, 4));
    gaussSeidel (cont+1, 2) = y(gaussSeidel (cont+1, 1), gaussSeidel (cont, 3), gaussSeidel (cont, 4));
    gaussSeidel (cont+1, 3) = z(gaussSeidel (cont+1, 1), gaussSeidel (cont+1, 2), gaussSeidel (cont, 4));
    gaussSeidel (cont+1, 4) = w(gaussSeidel (cont+1, 1), gaussSeidel (cont+1, 2), gaussSeidel (cont+1, 3));
end
gaussSeidel = array2table(gaussSeidel, "VariableNames", {'x', 'y', 'z', 'w'})

%Jacobi para Sistema de ED
for cont = 1:20
    edJacobi (cont+1, 1) = t1(edJacobi(cont, 2));
    edJacobi (cont+1, 2) = t2(edJacobi(cont, 1), edJacobi(cont, 3));
    edJacobi (cont+1, 3) = t3(edJacobi(cont, 2), edJacobi(cont, 4));
    edJacobi (cont+1, 4) = t4(edJacobi(cont, 3));
end
edJacobi = array2table(edJacobi, "VariableNames", {'T1', 'T2', 'T3', 'T4'})

%Gauss-Seidel para Sistema de ED
for cont = 1:15
    edGaussSeidel (cont+1, 1) = t1(edGaussSeidel(cont, 2));
    edGaussSeidel (cont+1, 2) = t2(edGaussSeidel(cont+1, 1), edGaussSeidel(cont, 3));
    edGaussSeidel (cont+1, 3) = t3(edGaussSeidel(cont+1, 2), edGaussSeidel(cont, 4));
    edGaussSeidel (cont+1, 4) = t4(edGaussSeidel(cont+1, 3));
end
edGaussSeidel = array2table(edGaussSeidel, "VariableNames", {'T1', 'T2', 'T3', 'T4'})

function x = x(y, z, w)
x = (-167-3*y-2*z-2*w)/35;
end
function y = y(x, z, w)
y = (-70-4*x-5*z-4*w)/24;
end
function z = z(x, y, w)
z = (150-2*x-2*y-6*w)/24;
end
function w = w(x, y, z)
w = (80-6*x-5*y-3*z)/28;
end

function t1 = t1(t2)
t0 = 238;
ta = 33;
k = 0.013;
t1 = (t2+k*ta+t0)/(2+k);
end
function t2 = t2(t1, t3)
ta = 33;
k = 0.013;
t2 = (t3+k*ta+t1)/(2+k);
end
function t3 = t3(t2, t4)
ta = 33;
k = 0.013;
t3 = (t4+k*ta+t2)/(2+k);
end
function t4 = t4(t3)
t5 = 88;
ta = 33;
k = 0.013;
t4 = (t5+k*ta+t3)/(2+k);
end