function v=letranumero(texto)
alfabeto='abcdefghijklmnnopqrstuvwxyz'; %Definimos el alfabeto
texto=lower(texto); %No se diferencia entre mayúsculas y minúsculas     
alfabeto(15)=char(241); %Evitamos problemas con el carácter ñ
        
posv = 1;
for i=1:length(texto)
    for j=1:27
        switch texto(i)
            case alfabeto(j)
                v(posv) = j-1;
                posv = posv+1;
                break
            case 'á'
                v(posv) = 0;
                posv = posv+1;
                break
            case 'é'
                v(posv) = 4;
                posv = posv+1;
                break
            case 'í'
                v(posv) = 8;
                posv = posv+1;
                break;
            case 'ó'
                v(posv) = 16;
                posv = posv+1;
                break;
            case 'ú'
                v(posv) = 22;
                posv = posv+1;
                break;
        end   
    end
end
            
