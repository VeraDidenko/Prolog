q1(Dividend, Divisor, Quotient, Remainder) :- divide(Dividend, Divisor, 0, Quotient, Remainder).
divide(Dividend, Divisor, Q, Quotient, Remainder) :- X is Dividend - Divisor, X < 0, Remainder is Dividend, Quotient is Q, !.
divide(Dividend, Divisor, Q, Quotient, Remainder) :- NewDividend is Dividend - Divisor, NewDividend == 0, NewQuotient is Q + 1, divide(NewDividend, Divisor, NewQuotient, Quotient, Remainder).
divide(Dividend, Divisor, Q, Quotient, Remainder) :- NewDividend is Dividend - Divisor, NewQuotient is Q + 1, divide(NewDividend, Divisor, NewQuotient, Quotient, Remainder).

q2(Num, Power, Result) :- powerLog(Num, Power, 1, Result).
powerLog(_, Power, TempResult, Result) :- Power == 0, Result is TempResult, !.
powerLog(Num, Power, TempResult, Result) :- Remainder == 0, q1(Power, 2, _, Remainder), NewNum is Num * Num, NewPower is Quotient, q1(Power, 2, Quotient, _), powerLog(NewNum, NewPower, TempResult, Result).
powerLog(Num, Power, TempResult, Result) :- NewResult is TempResult * Num, NewPower is Power-1, powerLog(Num, NewPower, NewResult, Result).

q3(Num, Power, Result) :- powerLinear(Num, Power, 1, Result).
powerLinear(_, Power, TempResult, Result) :- Power == 0, Result is TempResult, !.
powerLinear(Num, Power, TempResult, Result) :- NewPower is Power - 1, NewResult is TempResult * Num, powerLinear(Num, NewPower, NewResult, Result).

q4(N, Result) :- fibbonachi(N, 0, 1, Result).
fibbonachi(N, F1, _, Result) :- N == 0, write(F1) ,Result is F1, !.
fibbonachi(N, F1, F2, Result) :- N == 1, write(F1), write(" "), write(F2), Result is F2, !.
fibbonachi(N, F1, F2, Result) :- NewN is N - 1, NewF1 is F2, NewF2 is F1 + F2, write(F1), write(" "), fibbonachi(NewN, NewF1, NewF2, Result).

q5(Num) :- primes(Num).
primes(Num) :- Num == 1, !.
primes(Num) :- 0 is mod(Num,2), write(2), write(" "), NewNum is Num / 2, primes(NewNum).
primes(Num) :- X is mod(Num,2), X > 0, J is sqrt(Num), cycle(3, J, Num, NewNum), primes(NewNum), !.

cycle(I, Till, Num, Res) :- I > Till, Num > 2, write(Num), Res is Num / Num, !.
cycle(I, Till, Num, Res) :- I > Till, Res is Num / Num, Res is Num, !.
cycle(I, Till, Num, Res) :- 0 is mod(Num,I), write(I), write(" "), NewNum is Num / I, cycle(I, Till, NewNum, Res).
cycle(I, Till, Num, Res) :- NewI is I + 2, cycle(NewI, Till, Num, Res).
    
q6(N, Result) :- sum(N, 1, 1, 1, Result).
sum(N, X, _, TempResult, Result) :- X == N, Result is TempResult, !.
sum(N, X, Calc, TempResult, Result) :- NewX is X + 1, NewCalc is Calc * NewX, NewComp is 1 / NewCalc, NewTempResult is TempResult + NewComp, sum(N, NewX, NewCalc, NewTempResult, Result).
