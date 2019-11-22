%Función que convierte una cadena numérica en bloques de un tamaño dado,
%después convierte dichos bloques en números y los almacena en un vector.
%Entradas:
%   tama: tamaño de los bloques
%   bloque: cadena numérica
%Salidas:
%   blo: vector formado por los números que se corresponden con cada uno de
%   los bloques
function blo = prepa_num_cifrar(tama,bloque)
    
    n_elementosBloque = length(bloque);
    
    %Comprobar si el primer argumento es valido
    if ~esNatural(tama)
       disp('Error, el primer argumento introducido no es un tamaño valido'); 
       blo = [];
       return;
    end
    
    %Se comprueba si el segundo parámetro es una cadena
    if ischar(bloque) == 0
       disp('Error, el segundo parámetro no es una cadena');
       blo = [];
       return;
    end
    
    
    %El número de bloques será la parte entera del cociente
    numeroBloques = floor(n_elementosBloque/tama);
    
    %Número de elementos que habrá en el ultimo bloque
    resto = mod(n_elementosBloque,tama);
    
    if resto ~= 0
        %Si ahí parte sobrante habrá un bloque más
        numeroBloques = numeroBloques + 1;
        
    end
    
    %Declaración de memoria para el vector con los bloques númericos
    blo = zeros(1,numeroBloques);
    
    j = 1;
    %Se obtienen todos los bloques menos el ultimo
    for i=1:numeroBloques-1
      
        cadena = '';
        
        %Cuando se rellena un bloque se termina el while
        while length(cadena) ~= tama
            cadena = strcat(cadena,bloque(j));
            j = j + 1;
        end
        %Se almacena el bloque en el vector blo
        blo(i) = str2num(cadena);
        
    end
    
    
    %El ultimo bloque se trata aparte
    
    cadena = '';
        
    while length(cadena) ~= tama && j <= n_elementosBloque
        cadena = strcat(cadena,bloque(j));
        j = j + 1;
    end
    

    if resto ~= 0
        
        restantes = tama - resto;
        
        
        %Si el número de elementos restantes es par se añaden 30s al
        %final de la cadena
        if mod(restantes,2) == 0

            while length(cadena) ~= tama 

                cadena = strcat(cadena,'30');

            end
        %Si el número de elementos restantes es impar se añaden 30s
        %hasta la posición tamaño menos 1 y en la ultima posición se
        %añade un 0
        else
 
            while length(cadena) ~= (tama - 1)

                cadena = strcat(cadena,'30');

            end
               %En la ultima posición se añadiria el 0
               cadena = strcat(cadena,'0');

        end
        
        
    end    
    
    %Se añade el ultimo bloque
    blo(numeroBloques) = str2num(cadena);
     
end