%Función que usa el algoritmo de potenciación rápida para calcular las
%potencias modulares.
%Entradas:
%   c: base de la potencia. Un número natural
%   d: exponente de la potencia. Un número natural
%   n: módulo. Un número natural
%Salida: 
%   Potencia c^d módulo n
function pote=potencia(c,d,n)

    %COMPROBAR LOS ARGUMENTOS DE ENTRADA
    c=uint64(c);
    d=uint64(d);
    n=uint64(n);
    if ~esNatural(c) || ~esNatural(d) || ~esNatural(n)
       disp('Error, algunos de los argumentos de entrada no es un número natural'); 
       pote = [];
       return;
    end
    
    %Calculo de las potencias de 2 del exponente. Ese necesario revertir
    %los elementos del vector
    v = flip(abs(dec2bin(d)) - 48);
    
    %Vector en el se va a almacenar el calculo de las distintas potencias
    potencias = uint64(zeros(1,length(v)));
    
    %Calculo de la primera potencia
    potencias(1) = uint64(mod(c,n));
    
    %Calculo del resto de potencias
    for i=2:length(potencias)
       potencias(i) =  uint64(mod(uint64(potencias(i-1))*uint64(potencias(i-1)),n));
    end
    
    pote = 1;
    
    for i=1:length(v)
       if(v(i) == 1)
           %Hay que realizar las operaciones modulares una a una ya que
           %sino se sobrepasasan los enteros
          pote =  uint64(mod(pote * potencias(i),n));
       end
    end
    
    
end