:-initialization(test).

q1(Arr, NegArr):- findNegList(Arr, [], NegArr, 0),!.

findNegList([],NegArrTmp, NegArrTmp, _):-!.
findNegList([A|Tail], NegArrTmp, NegArrRes, Count):- A<0 , append(NegArrTmp, [Count], ResArr) , CountNew is Count+1,  findNegList(Tail,ResArr,NegArrRes, CountNew ).
findNegList([A|Tail], NegArrTmp, NegArrRes, Count):- A>=0 ,CountNew is Count+1,  findNegList(Tail,NegArrTmp,NegArrRes, CountNew ).

q2(Arr, El, ResArr):- change(Arr, [], ResArr, El),!.

change([], TmpArr, TmpArr, _):-!.
change([A|Tail], TmpArr, ResArr, El):- A == El ,  append(TmpArr, [change_done], ResTmpArr), change(Tail, ResTmpArr, ResArr, El).
change([A|Tail], TmpArr, ResArr, El):-   append(TmpArr, [A], ResTmpArr), change(Tail, ResTmpArr, ResArr, El).



q3(ArabNum, RomanNum):- formatToRoman(ArabNum, [], RomanNum),!.

formatToRoman([], RomanNum, RomanNum):-!.
formatToRoman([Num|Tail], RomanTmpNum, RomanResNum):- toroman(Num, [] ,RomanNum), name(ResRomanNum, RomanNum),append(RomanTmpNum, [ResRomanNum], ResTmpArr), formatToRoman(Tail, ResTmpArr, RomanResNum).

toroman(0,RomanNum,RomanNum ):-!.
toroman(N,RomanTmpNum,RomanNum) :- N < 4,append(RomanTmpNum, "I", ResTmpArr), M is N - 1, toroman(M, ResTmpArr,RomanNum).
toroman(N,RomanTmpNum, RomanNum) :- N = 4,append(RomanTmpNum, "IV", ResTmpArr) , RomanNum = ResTmpArr.
toroman(N,RomanTmpNum, RomanNum) :- N = 5,append(RomanTmpNum,  "V", ResTmpArr), RomanNum = ResTmpArr.
toroman(N,RomanTmpNum, RomanNum) :- N < 9, append(RomanTmpNum, "V", ResTmpArr), M is N - 5, toroman(M,ResTmpArr,RomanNum).
toroman(N, RomanTmpNum, RomanNum) :- N = 9,append(RomanTmpNum, "IX", ResTmpArr), RomanNum = ResTmpArr.
toroman(N,RomanTmpNum,RomanNum) :- N < 40, append(RomanTmpNum, "X", ResTmpArr), M is N - 10, toroman(M,ResTmpArr,RomanNum).
toroman(N, RomanTmpNum,RomanNum) :- N < 50,append(RomanTmpNum, "XL", ResTmpArr), M is N - 40, toroman(M,ResTmpArr,RomanNum).
toroman(N,RomanTmpNum,  RomanNum) :- N = 50, append(RomanTmpNum, "L", ResTmpArr), RomanNum = ResTmpArr.

q4(InputArr, OutputArr):- reverse(InputArr,[A|Tail]), reverse(Tail,NArr), append([A],NArr,OutputArr),!.

q5(Matrix, Vector, Result):- multiplyMV(Matrix, Vector, [], Result),!. 
multiplyMV([], _, TmpRes, TmpRes):-!.
multiplyMV([A|Tail], Vector, TmpRes, Result):-multiplyRow(A,Vector,[],NewA), sumRow(NewA, 0, SumA), append(TmpRes,[SumA],NewTmpRes), multiplyMV(Tail, Vector, NewTmpRes, Result).

multiplyRow([],[],TmpA,TmpA):-!.
multiplyRow([A|TailM],[B|TailV],TmpA,NewA):- C is A * B, append(TmpA, [C], NewTmpA), multiplyRow(TailM,TailV,NewTmpA,NewA).

sumRow([],Prev,Prev):-!.
sumRow([A|Tail], Prev, SumA):-NewSum is A + Prev, sumRow(Tail, NewSum, SumA).

test:-q1([-1,2,3,-5,2,3],Answer1),write(query1),tab(1),write(input),tab(1),write([-1,2,3,-5,2,3]),tab(1),write(output),tab(1), write(Answer1),nl,
q2([1,2,3,1,2,3,1,2,3], 1, Answer2),write(query2),tab(1),write(input),tab(1),write([1,2,3,1,2,3,1,2,3]),tab(1),write(element),tab(1),write(1),tab(1),write(output),tab(1), write(Answer2),nl,
q3([1,3,4,5,8,10,15,20,45,49,50],Answer3),write(query3),tab(1),write(input),tab(1),write([1,3,4,5,8,10,15,20,45,49,50]),tab(1),write(output),tab(1), write(Answer3),nl,
q4([1,2,3,4,5],Answer4),write(query4),tab(1),write(input),tab(1),write([1,2,3,4,5]),tab(1),write(output),tab(1), write(Answer4),nl,
q5([[1,2,3],[1,2,3],[1,2,3]],[1,2,3],Answer5),write(query5),tab(1),write(inputArray),tab(1),write([[1,2,3],[1,2,3],[1,2,3]]),tab(1),write(inputVector),tab(1),write([1,2,3]),tab(1),write(output),tab(1), write(Answer5),nl.
