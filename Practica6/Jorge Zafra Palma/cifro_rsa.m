%Función que debe hacer los siguientes pasos: pasar texto a una cadena
%numérica usando 2 dígitos por letra, calcular el tamaño de los bloques
%como digitos(n) - 1, dividir la cadena númerica en bloques de tamaño
%digitos(n) - 1 y cifrarlos según el sistema RSA usando la clave pública
%(n,e).
%Entradas:
%   e y n: clave pública para el cifrado RSA
%   texto: texto que queremos cifrar
%Salidas:
%   cifrado: vector formado por los bloques ya cifrados
function desci=cifro_rsa(e,n,texto)

    %Comprobar si el primer argumento es valido
    if ~esNatural(n)
        disp('Error, el segundo argumento introducido no es un n valido'); 
        desci = [];
        return;
    end
    
    %Convertir el texto a cadena númerica usando 2 dígitos por letra
    doble = letra2numeros(texto);
    
    %El tamaño de los grupos será el número de dígitos de n menos 1
    tama = length(int2str(n)) - 1;
      
    blo = prepa_num_cifrar(tama,doble);
    
    desci = zeros(1,length(blo));
    
    %Se calculan los grupos cifrados
    for i=1:length(blo)
        desci(i) = potencia(blo(i),e,n);    
    end
    

end