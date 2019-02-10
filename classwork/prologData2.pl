:-initialization(test).

schedule( lector(l1, docent, schhevchenka), subject('logic programming', 120), group( multimtech ), 1 ,330).
schedule( lector(l2, teacher, kpi), subject('java ee' , 135), group(networktech), 2 ,223).
schedule( lector(l4, teacher, schhevchenka), subject('machine learning', 130), group(informatic ) , 8 ,132).
schedule( lector(l3, docent, naukma), subject('computional geometry', 120), group(informatic ) , 4 ,430).
schedule( lector(l5, docent, naukma), subject('computional geometry', 120), group(multimtech ) , 8 ,410).

q1(Name):-schedule( lector(Name,_,naukma),_,_,_,_).
q2(Hours):-schedule(_,subject('computional geometry', Hours),_,_,_).
q3(Group):-schedule(_,subject('computional geometry', _),group(Group),_,_).
q4(Aud):-schedule(_,subject('computional geometry', _),_,_,Aud).
q5(X,Name):- schedule(lector(X, _, _),subject(Name, _),_,8,_).


test:-q1(Name),write(query1),tab(1), write(Name),nl,q2(Hours),write(query2),tab(1), write(Hours),nl,
q3(Group),write(query3),tab(1), write(Group),nl,
q4(Aud),write(query4),tab(1), write(Aud),nl,
q5(l4,X),write(query5),tab(1), write(X),nl.