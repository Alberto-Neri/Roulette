# Roulette
Simulazione metodo roulette (MATLAB) per valutare se è vincente nel lungo periodo. Il metodo andrebbe usato su roulette unbiased (non truccate).
Usando la funzione rand posso simulare un'estrazione casuale. 
Il metodo simulato è quello presentato in questo video https://www.youtube.com/watch?v=TiYGSuyGSNc .
Sostanzialemente si effettua una prima puntata che ha la prob di vittoria del 80%:
-in caso di vincita si prosegue.
-in caso di perdita si effettua una puntata al 50%, in cui si scommette l'ammontate perso.
    --in caso di vincita, avrei riguadagnato tutto e riparto con le scommesse all'80%.
    --in caso di perdita continuo con la puntata al 50%, raddioppiando sempre l'importo scommesso. 

Esempio: punto 5$ al 80% -> perdo -> punto 5$ al 50% -> perdo -> punto 10$ al 50% -> perdo -> punto 20$ al 50% -> vinco -> ho guadagnato 40$ ossia 20 + 10 + 5 + 5, sono tornato in pari!
