clear all 
close all

%simulazione metodo roulette per valutare se sono vincenti nel lungo
%periodo. Il metodo andrebbe usato su roulette unbiased (non truccate).
%Usando la funzione rand, simulo un'estrazione casuale. 
%Il metodo simulato è quello presentato in questo video https://www.youtube.com/watch?v=TiYGSuyGSNc
%Sostanzialemente si effettua una prima puntata che ha la prob di vittoria
%del 80%:
%in caso di vincita si prosegue.
%in caso di perdita si effettua una puntata al 50%, in cui si scommette
%l'ammontate perso.
    %in caso di vincita, avrei riguadagnato tutto e riparto con le
    %scommesse all'80%.
    %in caso di perdita continuo con la puntata al 50%, raddioppiando
    %sempre l'importo scommesso. Esempio: punto 5$ al 80% -> perdo -> punto 5$ al 50% -> perdo -> punto
    %10$ al 50% -> perdo -> punto 20$ al 50% -> vinco -> ho guadagnato 40$
    %ossia 20 + 10 + 5 + 5, sono tornato in pari!



p_win1 = 0.8;
p_win2 = 0.5;

n_prova = 5000; 
n_win_metodo1 = 0;
saldo = zeros(10000,1);
n_giocate =1;
budget = 150; %budget partenza
saldo(1,1) = budget;
soglia_deposito = 200; 
deposito_banca = 0;
bancarotte = 0;

for i=1:n_prova
%     if saldo(n_giocate) <0 
%         break
%     end
    giocata = rand(1);
    n_giocate = n_giocate+1;
    bet = 5;
    saldo(n_giocate) = saldo(n_giocate-1)-bet;
%     
%     if saldo(n_giocate) >= soglia_deposito
%         deposito_banca = deposito_banca+(soglia_deposito-budget);
%         saldo(n_giocate) = saldo(n_giocate)-(soglia_deposito-budget);
%     end
    %METODO 1
    if giocata < p_win1
        n_win_metodo1 = n_win_metodo1+1;
        saldo(n_giocate) = saldo(n_giocate)+6;
    else 
       %METODO ASSICURAZIONE 
       giocata2 = rand(1);
       n_giocate = n_giocate+1;
       saldo(n_giocate) = saldo(n_giocate-1)-bet;  %scommetto 5$
       if giocata2 < p_win2 
           saldo(n_giocate) = saldo(n_giocate)+(2*bet);
       else 
%            if saldo(n_giocate)<0 
%              bancarotte = bancarotte +1;
%                     if deposito_banca >=budget
%                         deposito_banca = deposito_banca - (soglia_deposito-budget);
%                         saldo(n_giocate)= budget;
%                         continue
%                     else
%                         break
%                     end 
%             end
           giocata = rand(1);
           n_giocate = n_giocate+1;
           bet = 2*bet; %10
           saldo(n_giocate) = saldo(n_giocate-1)-bet;
           if giocata < p_win2
                saldo(n_giocate) = saldo(n_giocate)+(2*bet);
           else
%                if saldo(n_giocate)<0 
%                  bancarotte = bancarotte +1;
%                         if deposito_banca >=budget
%                             deposito_banca = deposito_banca - (soglia_deposito-budget);
%                             saldo(n_giocate)=budget;
%                             continue
%                         else
%                             break
%                         end 
%                 end
                giocata = rand(1);
                n_giocate = n_giocate+1;
                bet = 2*bet; %20
                saldo(n_giocate) = saldo(n_giocate-1)-bet;
                if giocata < p_win2
                saldo(n_giocate) = saldo(n_giocate)+(2*bet);
                else
%                     if saldo(n_giocate)<0 
%                      bancarotte = bancarotte +1;
%                             if deposito_banca >=budget
%                                 deposito_banca = deposito_banca - (soglia_deposito-budget);
%                                 saldo(n_giocate)= budget;
%                                 continue
%                             else
%                                 break
%                             end 
%                      end

                    giocata = rand(1);
                    n_giocate = n_giocate+1;
                    bet = 2*bet; %40
                    saldo(n_giocate) = saldo(n_giocate-1)-bet;
                    if giocata < p_win2
                        saldo(n_giocate) = saldo(n_giocate)+(2*bet);
                    else
                        if saldo(n_giocate)<0
                            bancarotte = bancarotte +1;
                            if deposito_banca >=budget
                                deposito_banca = deposito_banca - (soglia_deposito-budget);
                                saldo(n_giocate)= budget;
                                continue
                            else
                                break
                            end 
                        end
                    end
                end
           end
       end
    end
end

%                         giocata = rand(1);
%                         n_giocate = n_giocate+1;
%                         bet = 2*bet; %80
%                         saldo(n_giocate) = saldo(n_giocate-1)-bet;
%                         if giocata < p_win2
%                         saldo(n_giocate) = saldo(n_giocate)+(2*bet);
%                         else
%                             giocata = rand(1);
%                             n_giocate = n_giocate+1;
%                             bet = 2*bet; %160
%                             saldo(n_giocate) = saldo(n_giocate-1)-bet;
%                             if giocata < p_win2
%                             saldo(n_giocate) = saldo(n_giocate)+(2*bet);
%                             else
%                                 giocata = rand(1);
%                                 n_giocate = n_giocate+1;
%                                 bet = 2*bet; %320
%                                 saldo(n_giocate) = saldo(n_giocate-1)-bet;
%                                 if giocata < p_win2
%                                 saldo(n_giocate) = saldo(n_giocate)+(2*bet);
%                                 else
%                                     giocata = rand(1);
%                                     n_giocate = n_giocate+1;
%                                     bet = 2*bet; %640
%                                     saldo(n_giocate) = saldo(n_giocate-1)-bet;
%                                     if giocata < p_win2
%                                     saldo(n_giocate) = saldo(n_giocate)+(2*bet);
%                                     else
%                                         giocata = rand(1);
%                                         n_giocate = n_giocate+1;
%                                         bet = 2*bet; %1280
%                                         saldo(n_giocate) = saldo(n_giocate-1)-bet;
%                                         if giocata < p_win2
%                                         saldo(n_giocate) = saldo(n_giocate)+(2*bet);
%                                         else
%                                             giocata = rand(1);
%                                             n_giocate = n_giocate+1;
%                                             bet = 2*bet; %2560
%                                             saldo(n_giocate) = saldo(n_giocate-1)-bet;
%                                             if giocata < p_win2
%                                             saldo(n_giocate) = saldo(n_giocate)+(2*bet);
%                                             else
%                                                 giocata = rand(1);
%                                                 n_giocate = n_giocate+1;
%                                                 bet = 2*bet; %5120
%                                                 saldo(n_giocate) = saldo(n_giocate-1)-bet;
%                                                 if giocata < p_win2
%                                                 saldo(n_giocate) = saldo(n_giocate)+(2*bet);
%                                                 else
%                                                     giocata = rand(1);
%                                                     n_giocate = n_giocate+1;
%                                                     bet = 2*bet; %10240
%                                                     saldo(n_giocate) = saldo(n_giocate-1)-bet;
%                                                     if giocata < p_win2
%                                                     saldo(n_giocate) = saldo(n_giocate)+(2*bet);
%                                                     else
%                                                        break;
%                                                     end
%                                                 end    
%                                             end
%                                         end
%                                     end
%                                 end
%                             end
%                         end
%                     end
%                 end
%            end
%        end
%     end
% end

x = 1:1:10000;
plot(x,saldo)
       