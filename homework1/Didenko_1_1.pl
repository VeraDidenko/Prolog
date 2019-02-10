:-initialization(test).

cinema(c1, 'cinema city', 'Green Str, 50', 0987666544, 500). 
cinema(c2, 'cinema world', 'Maple Str, 320', 0564445343, 400). 
cinema(c3, 'movie goodie', 'Oak Valley Str, 67', 0445666372, 1000). 
cinema(c4, 'watch top', 'Ocean Str 5', 0654333452, 100). 
cinema(c5, 'eye spy', 'Happy Str, 7', 0934222321, 200). 

film(f1, 'Wonderful Life', '1946', 'Frank Capra', 1). 
film(f2, 'Scarlet Pimpernel', '1982', 'David Cornoy', 1). 
film(f3, 'White Collar', '2009-2014', 'Jeff Eastin', 81). 
film(f4, 'Les Miserables', '2012', 'Tim Bevan', 1). 
film(f5, 'Mrs. Doubtfire', '1993', 'Chris Columbus', 1).

shows(c1, f1, '12.02.19', '12:00', 100).
shows(c1, f3, '12.02.19', '10:00', 100).
shows(c2, f1, '12.02.19', '23:00', 100).
shows(c3, f2, '12.02.19', '20:00', 100).
shows(c4, f2, '12.02.19', '18:00', 100).
shows(c5, f3, '12.02.19', '12:00', 100).

q1(Film,Phone,Cinema):-shows(Cc, Fc, _, _, _),film(Fc, Film, _, _, _),cinema(Cc, Cinema, _, Phone, _).
q2(Film,Cinema,Address,Date,Time):-shows(Cc, Fc, Date, Time, _),film(Fc, Film, _, _, _),cinema(Cc, Cinema, Address, _, _).
q3(Cinema,Phone):-cinema(_, Cinema, _, Phone, _).
q4(Cinema,Film,Producer):-shows(Cc, Fc, _, _, _),film(Fc, Film, _, Producer, _),cinema(Cc, Cinema, _, _, _). 
q5(Cinema,Address):-cinema(_, Cinema, Address, _, _). 
q6(Film,Episodes):-film(_, Film, _, _, Episodes).

test:-q1('Wonderful Life',Phone1,Cinema1),write(query1),tab(1), write(Cinema1,Phone1),nl,
    q2(F,'cinema city',A,D,T),write(query2),tab(1), write(F,A,D,T),nl,
    q3(Cinema3, Phone3),write(query3),tab(1), write(Cinema3, Phone3),nl,
    q4(Cinema4, Film4, 'Jeff Eastin'),write(query4),tab(1), write(Cinema4, Film4),nl,
    q5('cinema city',Address5),write(query5),tab(1), write(Address5),nl,
    q6('White Collar',Episodes6),write(query6),tab(1), write(Episodes6),nl.
