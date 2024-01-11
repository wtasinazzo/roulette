function [vincita,esito,idx_vincente] = partita(set,puntata,modalita,scommessa)

numeri = set.numeri;
n = length(numeri);

%% Numero uscito
idx_vincente = randi(n);
esito = numeri(idx_vincente);
%% Calcolo Vincita
switch modalita
    case "Pari/Dispari"
        if scommessa=="pari" && mod(esito,2)==0 & esito~=0
            vincita = puntata*2;
        elseif scommessa=="dispari" && mod(esito,2)==1
            vincita = puntata*2;
        else
            vincita = 0;
        end
    case "Rosso/Nero"
        if esito==0
            vincita=0;
        elseif scommessa=="rosso" && ismember(esito,[32,19,21,25,34,27,36,30,23,5,16,1,14,9,18,7,12,3])
            vincita=puntata*2;
        elseif scommessa=="nero" && ismember(esito,[15,4,2,17,6,13,11,8,10,24,33,20,31,22,29,28,35,26])
            vincita=puntata*2;
        else
            vincita=0;
        end
    case "Numero esatto"
        if esito==scommessa
            vincita=puntata*35;
        else
            vincita=0;
        end
end
%% plot
if set.withUI
    roulette_plot(vincita,n,idx_vincente)
end
