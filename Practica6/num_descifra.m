%Función que transforma un vector numérico en letras (dos dígitos por
%letra).
%Entradas: 
%   n: número que va a determinar el tamaño de los bloques.
%   bloque_numero: vector numérico
%Salida:
%   desci: cadena alfabética con el texto asociado a los bloques de
%   números
function desci=num_descifra(n,bloque_numero)

    %Comprobar si el primer argumento es valido
    if ~esNatural(n)
       disp('Error, el primer argumento introducido no es un número natural'); 
       desci = [];
       return;
    end
    
    %Comprobar si el segundo parámetro es un vector numérico de números
    %naturales
    for i=1:length(bloque_numero)
        if ~esNatural(bloque_numero(i))
           disp('Error, el segundo parámetro no es un vector numérico'); 
           desci = [];
           return;
        end
    end
    
    %Se crea un diccionario para el alfabeto
    abecedario = containers.Map({'00','01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26'}, {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','ñ','o','p','q','r','s','t','u','v','w','x','y','z'});
    
    desci = '';

    tama = length(int2str(n)) - 1;

    cadena = '';
    
    %Obtener la cadena donde van a estar todos los bloques con su tamaño
    %corregido
    for i=1:length(bloque_numero)
        
        subcadena = int2str(bloque_numero(i));
        
        tama_subcadena = length(subcadena);
        
        restante = tama - tama_subcadena;
        
        %Si el tamaño de la subcadena es distinto del tamaño del bloque hay
        %que añadirle ceros delante
        if  restante ~= 0
            
            ceros = '';
            %Se crea una cadena con 'restante' ceros y se concatena con la
            %subcadena
            for j=1:restante
                ceros = strcat(ceros,'0');
            end
            
            subcadena = strcat(ceros,subcadena);
            
        end
        
        %Se van concatenando cada una de las subcadenas en la cadena
        %principal
        cadena = strcat(cadena,subcadena);
        
    end
    
    
    %Agrupar los bloques de 2 en 2
    n_agrupaciones = floor(length(cadena) / 2);
    
    %Puntero de la cadena principal
    j = 1;
    
    %Se van agrupando los elementos de la cadena principal de 2 en dos y se
    %calcula la letra asociada a cada par de valores
    for i=1:n_agrupaciones
        agrupacion = '';
        
        while length(agrupacion) ~= 2
           agrupacion = strcat(agrupacion,cadena(j));
           j = j + 1;
        end
        %Si la agrupación es igual a 30 quiere decir que hemos llegado al
        %final
        if ~strcmp(agrupacion,'30')
            desci = strcat(desci,abecedario(agrupacion));
        else
             break;
        end
        
    end
    
end