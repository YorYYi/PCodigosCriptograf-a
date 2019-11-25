%Funci�n que transforma un vector num�rico en letras (dos d�gitos por
%letra).
%Entradas: 
%   n: n�mero que va a determinar el tama�o de los bloques.
%   bloque_numero: vector num�rico
%Salida:
%   desci: cadena alfab�tica con el texto asociado a los bloques de
%   n�meros
function desci=num_descifra(n,bloque_numero)

    %Comprobar si el primer argumento es valido
    if ~esNatural(n)
       disp('Error, el primer argumento introducido no es un n�mero natural'); 
       desci = [];
       return;
    end
    
    %Comprobar si el segundo par�metro es un vector num�rico de n�meros
    %naturales
    for i=1:length(bloque_numero)
        if ~esNatural(bloque_numero(i))
           disp('Error, el segundo par�metro no es un vector num�rico'); 
           desci = [];
           return;
        end
    end
    
    %Se crea un diccionario para el alfabeto
    abecedario = containers.Map({'00','01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26'}, {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','�','o','p','q','r','s','t','u','v','w','x','y','z'});
    
    desci = '';

    tama = length(int2str(n)) - 1;

    cadena = '';
    
    %Obtener la cadena donde van a estar todos los bloques con su tama�o
    %corregido
    for i=1:length(bloque_numero)
        
        subcadena = int2str(bloque_numero(i));
        
        tama_subcadena = length(subcadena);
        
        restante = tama - tama_subcadena;
        
        %Si el tama�o de la subcadena es distinto del tama�o del bloque hay
        %que a�adirle ceros delante
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
        %Si la agrupaci�n es igual a 30 quiere decir que hemos llegado al
        %final
        if ~strcmp(agrupacion,'30')
            desci = strcat(desci,abecedario(agrupacion));
        else
             break;
        end
        
    end
    
end