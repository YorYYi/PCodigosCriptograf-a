%Generación de las claves públicas y privadas para A



disp('GENERACIÓN CLAVES DE A');

genero_clave

nA = n;

longitud_nA = length(int2str(nA));

eA = e;

dA = d;




disp('GENERACIÓN CLAVES DE B');

genero_clave

nB = n;

longitud_nB = length(int2str(nB));

eB = e;

dB = d;


clc



fprintf('La clave pública de A es (na,ea)=(%d , %d)\n',nA,eA);
fprintf('La clave privada de A es (na,da)=(%d , %d)\n\n',nA,dA);

fprintf('La clave pública de B es (nb,eb)=(%d , %d)\n',nB,eB);
fprintf('La clave privada de B es (nb,db)=(%d , %d)\n\n',nB,dB);



mensaje = input('Introduzca el mensaje que va a enviar A: ','s');

firma = input('Introduzca la firma para el mensaje: ', 's');



fprintf('\nEl mensaje que A quiere enviar, junto con su firma es:\n\n');

fprintf('mensaje = %s %s\n', mensaje,firma);

%Se concatena el mensaje con la firma ya que se van a cifrar juntos
mensaje = strcat(mensaje,firma);


%Se cifra el mensaje con la clave pública de B
cifr_mensajefirma_eB = cifro_rsa(eB,nB,mensaje);

%Se cifra la firma con la clave privada de A
cif_firma = cifro_rsa(dA,nA,firma);


%Completar el tamaño de los grupos obtenidos para que tengan un longitud nA
cadena = '';

for i=1:length(cif_firma)
   
    subcadena = int2str(cif_firma(i));
    
    %Numero de ceros delante necesarios para que la subcadena tenga tamaño
    %nA
    restantes = longitud_nA - length(subcadena);
    
    if restantes ~= 0
    
        ceros = '';
        %Se crea una cadena con 'restante' ceros y se concatena con la
        %subcadena
        for j=1:restantes
            ceros = strcat(ceros,'0');
        end

        subcadena = strcat(ceros,subcadena);
        
    end
    
    cadena = strcat(cadena,subcadena);
    
       
end


%Ahora se cifra con la clave pública de B
cif_firma_da_eb = cifro_rsa_num(eB,nB,prepa_num_cifrar(longitud_nB-1,cadena));


fprintf('\nLos dos criptogramas que envia A a B son: \n\n')

fprintf('cif_mens = ');

disp(cifr_mensajefirma_eB);

fprintf('cif_firma_da_eb = ');

disp(cif_firma_da_eb);





fprintf('\nB comienza el descifrado\n\n');

mensajefirma = descifro_rsa(dB,nB,cifr_mensajefirma_eB);

fprintf('El mensaje con la firma que recibe es: \n\n');

fprintf('mensaje = ');

disp(mensajefirma);


%Descifrado de la firma
cifr_firma_dA = descifro_rsa_num(dB,nB,cif_firma_da_eb);


%Completar el tamaño de los grupos obtenidos para que tengan un longitud 
%nB-1
cadena = '';

for i=1:length(cifr_firma_dA)
   
    subcadena = int2str(cifr_firma_dA(i));
    
    %Numero de ceros delante necesarios para que la subcadena tenga tamaño
    %nA
    restantes = (longitud_nB-1) - length(subcadena);
    
    if restantes ~= 0
    
        ceros = '';
        %Se crea una cadena con 'restante' ceros y se concatena con la
        %subcadena
        for j=1:restantes
            ceros = strcat(ceros,'0');
        end

        subcadena = strcat(ceros,subcadena);
        
    end
    
    cadena = strcat(cadena,subcadena);
    
       
end

%De esta cadena resultante hay que eliminar en caso de que fuera necesario
%los 30 y 0 que se encuentran al final (ya que fueron añadidos para poder
%cifrar).

longitud_cadena = length(cadena);

while cadena(longitud_cadena) == '0' || cadena(longitud_cadena) == '3'
   
    longitud_cadena = longitud_cadena - 1;
    
end

cadena = cadena(1:longitud_cadena);


%Se rompe el ultimo cifrado de la firma utilizando la clave pública de A
firma = descifro_rsa(eA,nA,prepa_num_cifrar(longitud_nA,cadena));


fprintf('\nB obtiene la firma y comprueba su autentificación:\n');

fprintf('\nfirma = %s\n', firma);






