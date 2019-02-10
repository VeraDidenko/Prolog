:-discontiguous(q5).

lector(1, l1, docent, schhevchenka).
lector(2, l2, teacher, kpi).
lector(3, l3, docent, naukma).
lector(4, l4, teacher, schhevchenka).
lector(5, l5, docent, naukma).

subject(1, 'logic programming', 120).
subject(2, 'java ee' , 135).
subject(3, 'machine learning', 130).
subject(4, 'functional programming', 120).
subject(5, 'computional geometry', 120).

group(1, multimtech).
group(2, informatic).
group(3, networktech).
group(4, informatic).
group(5, multimtech).

schedule(1,1,1,1 ,330).
schedule(2,2,3,2 ,223).
schedule(4,3,2,8 ,132).
schedule(3,5,4,4 ,430).
schedule(5,4,5,8 ,410).

q5(X, Name):-schedule(Lc,Sb,_,8,_), subject(Sb, Name, _), lector(Lc, X,_,_).