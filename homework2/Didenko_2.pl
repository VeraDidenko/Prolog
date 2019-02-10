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




