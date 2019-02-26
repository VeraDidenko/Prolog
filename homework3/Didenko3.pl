:-initialization(test).

fill(-1):-!.
fill(X):-asserta(d(X)), X1 is X-1, fill(X1).

q1(ResNum):- d(A), A>0, d(B), d(C), 1 is mod(A,2), 1 is mod(B,2), 1 is mod(C,2) , X is A*100 +B*10 +C, Y is A*10+C, 0 is mod(X,Y), ResNum is X,!.

q2(ResNum) :- d(A), A>0, d(B), d(C), d(D), A == B, C == D, Num is A*1000 +B*100 +C*10 +D,SqrRes is sqrt(Num), FractPart is  float_fractional_part(SqrRes), FractPart == 0.0, ResNum is Num, !.

q3(X) :- t3(X,1999,1,0),!.
t3(X,1999,1999,X).
t3(X,1999,N,C) :- (N mod 6) > 0, (N mod 10) > 0, (N mod 15) > 0, NN is N+1, XX is C+1, t3(X,1999,NN,XX).
t3(X,1999,N,C) :- NN is N+1, t3(X,1999,NN,C).

pow2(X,Z) :- Z is X*X.

q4(X) :- t4(X,1,506).
t4(X,X,S) :- T1 is sqrt(S), T2 is (truncate(sqrt(S))+0.0), T1 = T2,!.
t4(X,Z,S) :- Z1 is Z+1, pow2(Z,T1), pow2(Z+11,T2), S1 is (S - T1 + T2), t4(X,Z1,S1).

q5(X):- t5(1,9,9,8,X,0).
t5(1,9,9,8,X,X):- X \= 0,!.
t5(A,B,C,D,X,I):- E is ((A+B+C+D) mod 10), A1 is B, B1 is C, C1 is D, D1 is E, I1 is I+1, t5(A1,B1,C1,D1,X,I1).

test:-fill(9),
q1(Answer1),write(query1),tab(1), write(Answer1),nl,
q2(Answer2),write(query2),tab(1), write(Answer2),nl,
q3(Answer3),write(query3),tab(1), write(Answer3),nl,
q4(Answer4),write(query4),tab(1), write(Answer4),nl,
q5(Answer5),write(query5),tab(1), write(Answer5),nl.
