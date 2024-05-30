# Simulation of a roulette method on MATLAB 
During Covid I found this method on YouTube: https://www.youtube.com/watch?v=TiYGSuyGSNc. I got curious and I decided to test it, to evaluate if it is profitable in the long run. 

I used the **rand** function to simulate a random draw.

## Method description
You start with an initial bet with an 80% chance of winning:

- In case of a win, you continue with the same bet.
- In case of a loss, you place a 50% (winning prob) bet, where you bet the amount lost.
  - In case of a win, you would have regained everything and restart with the 80% bets.
  - In case of a loss, you continue with the 50% bet, always **doubling** the amount wagered.

## Example
1. Bet $5 at 80% -> lose
2. Bet $5 at 50% -> lose
3. Bet $10 at 50% -> lose
4. Bet $20 at 50% -> win -> I have won $40, which is 20 + 10 + 5 + 5, I have broken even!
5. Bet $5 at 80% ..

## Spoiler
```
Assuming my simulation is correct, you will always lose all your money! 
```
Sooner or later you will encounter a losing streak at 50% bets that will lead you to spend all your money. For instance, after 20k bets you may lose 25 bets at 50% in a row. 

Unfortunately I have to continue studying engineering :rofl:
