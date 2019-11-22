%Función de descifrado según el método RSA.
%Entradas:
%   (d, n): clave privada
%   cifrado_numero: vector númerico obtenido de un cifrado con la clave
%   pública.
%Salida:
%   descifrado: texto claro
function descifrado=descifro_rsa(d,n,cifrado_numero)

    %Aplicación de la función de descifrado del método RSA
    descifro_num = descifro_rsa_num(d,n,cifrado_numero);
    %Transformación del vector numérico obtenido al texto claro
    descifrado = num_descifra(n,descifro_num);

end