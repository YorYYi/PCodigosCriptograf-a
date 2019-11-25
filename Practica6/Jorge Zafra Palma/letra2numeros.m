%Función que asocia a cada letra del texto su correspondiente valor de Z27
%con dos dígitos.
%Entradas:
%   texto: el texto llano
%Salida:
%   doble: cadena numérica formada por los números asociados a cada letra
%   del texto.
function doble = letra2numeros(texto)

    %Se comprueba si parametro es un texto
    if ischar(texto) == 0
       disp('Error, el argumento introducido no es un texto');
       doble = [];
       return;
    end

    v = letranumero(texto);
    
    j=1;
    
    doble = '';
    
    for i=1:length(v)
        if v(i) < 10
            doble(j) = '0';
            j = j + 1;
            doble(j) = int2str(v(i));
            j = j + 1;
        else
            doble = strcat(doble,int2str(v(i)));
            j = j + 2;
        end
    end

end