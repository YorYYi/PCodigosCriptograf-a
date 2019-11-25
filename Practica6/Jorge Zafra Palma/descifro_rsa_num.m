%Función que aplica la función de descifrado del método RSA a un vector
%numérico, previamente cifrado con una clave pública utilizando la clave
%privada proporcionada.
%Entradas
%   (d,n): clave privada
%   cifrado_numero: vector numérico cifrado con la clave pública con RSA
%Salida:
%   descifro_num: vector numérico obtenido de aplicar la función de
%   descifrado con RSA.
function descifro_num=descifro_rsa_num(d,n,cifrado_numero)

    longitud_cifrado = length(cifrado_numero);

    %Comprobar si el tercer parámetro es un vector numérico de números
    %naturales
    for i=1:longitud_cifrado
        if ~esNatural(cifrado_numero(i))
           disp('Error, el tercer parámetro no es un vector numérico'); 
           descifro_num = [];
           return;
        end
    end
    
    descifro_num = zeros(1,longitud_cifrado);
    
    %Obtención del vector numérico tras aplicar la función de descifrado de
    %RSA
    for i=1:longitud_cifrado
        descifro_num(i) = potencia(cifrado_numero(i),d,n);
    end


end