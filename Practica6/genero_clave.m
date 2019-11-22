%Generar el n primeros números primos
prompt = 'Introduzca el número de primos que desea ver: ';

n_primos = input(prompt);

i = 2;
contador = 0;
while contador ~= n_primos
    
    if isprime(i)
        fprintf('%d ', i); 
        contador = contador + 1;
    end
    
    i = i + 1;
end

fprintf('\n');


prompt = 'Introduzca el valor del primo p: ';

p = input(prompt);

%Comprobar si el número introducido es un número primo

if ~isprime(p)
    disp('Error, el valor introducido no es un número primo');
    return;
end

prompt = 'Introduzca el valor del primo q: ';

q = input(prompt);

%Comprobar si el número introducido es un número primo

if ~isprime(q)
    disp('Error, el valor introducido no es un número primo');
    return;
end


n = p*q;

fprintf('n, que formará parte de las claves es: %d\n', n);

fiden = (p -1)*(q -1);


%Primero se comprueba si se puede utilizar el primo de Fermat
if 65537 < fiden
   e = 65537;
   [~,d,~] = gcd(e,fiden);
   d = mod(d,fiden);
   %Si no se puede utilizar se busca un valor valido para e
else
    for i=2:(fiden-1)
        
        [G, d, ~]= gcd(i, fiden);
        %Ya que la identidad de Bezout puede dar valores negativos
        d = mod(d,fiden);
       
       if  G == 1
           e = i;    
           break;
       end
        
    end
    
end

fprintf('Se busca un e, que formará parte de la clave privada y que debe cumplir gcd(e,fiden)=gcd(e,p*q)=gcd(e,%d)=1\n', fiden);

fprintf('Se ha seleccionado %d\n',e);

fprintf('Se busca d de forma que d sea el inverso de e = %d modulo fiden = %d\n',e,fiden);

fprintf('Se ha seleccionado %d\n', d);

fprintf('La clave privada es (n,d) = (%d,%d)\n',n,d);

fprintf('La clave pública es (n,e) = (%d,%d)\n',n,e);

