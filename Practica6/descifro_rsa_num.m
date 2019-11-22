%Funci�n que aplica la funci�n de descifrado del m�todo RSA a un vector
%num�rico, previamente cifrado con una clave p�blica utilizando la clave
%privada proporcionada.
%Entradas
%   (d,n): clave privada
%   cifrado_numero: vector num�rico cifrado con la clave p�blica con RSA
%Salida:
%   descifro_num: vector num�rico obtenido de aplicar la funci�n de
%   descifrado con RSA.
function descifro_num=descifro_rsa_num(d,n,cifrado_numero)

    longitud_cifrado = length(cifrado_numero);

    %Comprobar si el tercer par�metro es un vector num�rico de n�meros
    %naturales
    for i=1:longitud_cifrado
        if ~esNatural(cifrado_numero(i))
           disp('Error, el tercer par�metro no es un vector num�rico'); 
           descifro_num = [];
           return;
        end
    end
    
    descifro_num = zeros(1,longitud_cifrado);
    
    %Obtenci�n del vector num�rico tras aplicar la funci�n de descifrado de
    %RSA
    for i=1:longitud_cifrado
        descifro_num(i) = potencia(cifrado_numero(i),d,n);
    end


end