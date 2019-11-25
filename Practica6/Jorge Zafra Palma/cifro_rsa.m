%Funci�n que debe hacer los siguientes pasos: pasar texto a una cadena
%num�rica usando 2 d�gitos por letra, calcular el tama�o de los bloques
%como digitos(n) - 1, dividir la cadena n�merica en bloques de tama�o
%digitos(n) - 1 y cifrarlos seg�n el sistema RSA usando la clave p�blica
%(n,e).
%Entradas:
%   e y n: clave p�blica para el cifrado RSA
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
    
    %Convertir el texto a cadena n�merica usando 2 d�gitos por letra
    doble = letra2numeros(texto);
    
    %El tama�o de los grupos ser� el n�mero de d�gitos de n menos 1
    tama = length(int2str(n)) - 1;
      
    blo = prepa_num_cifrar(tama,doble);
    
    desci = zeros(1,length(blo));
    
    %Se calculan los grupos cifrados
    for i=1:length(blo)
        desci(i) = potencia(blo(i),e,n);    
    end
    

end