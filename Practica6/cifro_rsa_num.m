%Funci�n que calcula el cifrado mediante RSA a partir de los bloques
%n�mericos obtenidos del texto claro a cifrar.
%Entrada:
%   e y n: clave p�blica para el cifrado RSA
%   blo: vector de n�meros
%Salidas:
%   cifrado: vector formado por los bloques introducidos ya cifrados
function cifrado=cifro_rsa_num(e,n,blo)

    %Comprobar si el tercer par�metro es un vector num�rico de n�meros
    %naturales
    for i=1:length(blo)
        if ~esNatural(blo(i))
           disp('Error, el tercer par�metro no es un vector num�rico'); 
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