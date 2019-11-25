%Funci�n que convierte una cadena num�rica en bloques de un tama�o dado,
%despu�s convierte dichos bloques en n�meros y los almacena en un vector.
%Entradas:
%   tama: tama�o de los bloques
%   bloque: cadena num�rica
%Salidas:
%   blo: vector formado por los n�meros que se corresponden con cada uno de
%   los bloques
function blo = prepa_num_cifrar(tama,bloque)
    
    n_elementosBloque = length(bloque);
    
    %Comprobar si el primer argumento es valido
    if ~esNatural(tama)
       disp('Error, el primer argumento introducido no es un tama�o valido'); 
       blo = [];
       return;
    end
    
    %Se comprueba si el segundo par�metro es una cadena
    if ischar(bloque) == 0
       disp('Error, el segundo par�metro no es una cadena');
       blo = [];
       return;
    end
    
    
    %El n�mero de bloques ser� la parte entera del cociente
    numeroBloques = floor(n_elementosBloque/tama);
    
    %N�mero de elementos que habr� en el ultimo bloque
    resto = mod(n_elementosBloque,tama);
    
    if resto ~= 0
        %Si ah� parte sobrante habr� un bloque m�s
        numeroBloques = numeroBloques + 1;
        
    end
    
    %Declaraci�n de memoria para el vector con los bloques n�mericos
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
        
        
        %Si el n�mero de elementos restantes es par se a�aden 30s al
        %final de la cadena
        if mod(restantes,2) == 0

            while length(cadena) ~= tama 

                cadena = strcat(cadena,'30');

            end
        %Si el n�mero de elementos restantes es impar se a�aden 30s
        %hasta la posici�n tama�o menos 1 y en la ultima posici�n se
        %a�ade un 0
        else
 
            while length(cadena) ~= (tama - 1)

                cadena = strcat(cadena,'30');

            end
               %En la ultima posici�n se a�adiria el 0
               cadena = strcat(cadena,'0');

        end
        
        
    end    
    
    %Se a�ade el ultimo bloque
    blo(numeroBloques) = str2num(cadena);
     
end