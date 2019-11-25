%Funci�n de descifrado seg�n el m�todo RSA.
%Entradas:
%   (d, n): clave privada
%   cifrado_numero: vector n�merico obtenido de un cifrado con la clave
%   p�blica.
%Salida:
%   descifrado: texto claro
function descifrado=descifro_rsa(d,n,cifrado_numero)

    %Aplicaci�n de la funci�n de descifrado del m�todo RSA
    descifro_num = descifro_rsa_num(d,n,cifrado_numero);
    %Transformaci�n del vector num�rico obtenido al texto claro
    descifrado = num_descifra(n,descifro_num);

end