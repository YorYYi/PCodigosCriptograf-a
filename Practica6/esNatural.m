%Función para comprobar si un determinado número es un número natural
%Entrada:
%   n: número a comprobar
%Salida:
    %Boolean que indica si el número es natural o no
function salida=esNatural(n)

    if ischar(n)
       salida = false;
       return;
       
    else
        if mod(n,1) ~= 0 || n <= 0 
            salida = false;
            return;
        end

        salida = true;
        
    end

    

end