clear
clc

T = [700; 720; 740; 760; 780]; % Valores x del problema separados por ;
P = [0.0977; 0.12184; 0.1406; 0.15509; 0.16643]; % Valores y del problema separados por ;

% Grado del polinomio
grado = input('Ingrese el grado del polinomio: ');

% Valor a interpolar
valor = input('Ingrese el valor a interpolar: ');

% Calcular el polinomio de LaGrange
resultado = laGrange(T(1:grado+1), P(1:grado+1), valor)

function resultado = laGrange(x, y, value)
    n = length(x);
    resultado = 0;
    
    for i = 1:n
        productoria = y(i);
        
        for j = 1:n
            if j ~= i
                productoria = productoria * (value - x(j)) / (x(i) - x(j));
            end
        end
        
        resultado = resultado + productoria;
    end
end