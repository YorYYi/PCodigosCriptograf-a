%Función que calcula el cifrado mediante RSA a partir de los bloques
%númericos obtenidos del texto claro a cifrar.
%Entrada:
%   e y n: clave pública para el cifrado RSA
%   blo: vector de números
%Salidas:
%   cifrado: vector formado por los bloques introducidos ya cifrados
function cifrado=cifro_rsa_num(e,n,blo)

    %Comprobar si el tercer parámetro es un vector numérico de números
    %naturales
    for i=1:length(blo)
        if ~esNatural(blo(i))
           disp('Error, el tercer parámetro no es un vector numérico'); 
           cifrado = [];
           return;
        end
    end

    
    cifrado = zeros(1,length(blo));
    
    %Se calculan los grupos cifrados
    for i=1:length(blo)
       cifrado(i) = potencia(blo(i),e,n); 
    end
    
end