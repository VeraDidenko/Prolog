:-initialization(test).

shows(cinema('cinema city', 'Green Str, 50', 0987666544, 500), film('Wonderful Life', '1946', 'Frank Capra', 1), '12.02.19', '12:00', 100).
shows(cinema('cinema city', 'Green Str, 50', 0987666544, 500), film('Mrs. Doubtfire', '1993', 'Chris Columbus', 1), '12.02.19', '12:00', 100).
shows(cinema('cinema world', 'Maple Str, 320', 0564445343, 400), film('White Collar', '2009-2014', 'Jeff Eastin', 81), '12.02.19', '10:00', 100).
shows(cinema('cinema world', 'Maple Str, 320', 0564445343, 400), film('Wonderful Life', '1946', 'Frank Capra', 1), '12.02.19', '23:00', 100).
shows(cinema('movie goodie', 'Oak Valley Str, 67', 0445666372, 1000), film('Scarlet Pimpernel', '1982', 'David Cornoy', 1), '12.02.19', '20:00', 100).
shows(cinema('movie goodie', 'Oak Valley Str, 67', 0445666372, 1000), film('Les Miserables', '2012', 'Tim Bevan', 1), '12.02.19', '20:00', 100).
shows(cinema('watch top', 'Ocean Str 5', 0654333452, 100), film('Scarlet Pimpernel', '1982', 'David Cornoy', 1), '12.02.19', '18:00', 100).
shows(cinema('watch top', 'Ocean Str 5', 0654333452, 100), film('White Collar', '2009-2014', 'Jeff Eastin', 81), '12.02.19', '18:00', 100).
shows(cinema('eye spy', 'Happy Str, 7', 0934222321, 200), film('White Collar', '2009-2014', 'Jeff Eastin', 81), '12.02.19', '12:00', 100).
shows(cinema('eye spy', 'Happy Str, 7', 0934222321, 200), film('Wonderful Life', '1946', 'Frank Capra', 1), '12.02.19', '12:00', 100).

q1(Film,Phone,Cinema):-shows(cinema(Cinema, _, Phone, _), film(Film, _, _, _), _, _, _).
q2(Film,Cinema,Address,Date,Time):-shows(cinema(Cinema, Address, _, _), film(Film, _, _, _), Date, Time, _).
q3(Cinema,Phone):-shows(cinema(_, Cinema, _, Phone, _),_,_,_,_).
q4(Cinema,Film,Producer):-shows(cinema(Cinema, _, _, _), film(Film, _, Producer, _), _, _, _). 
q5(Cinema,Address):-shows(cinema(_, Cinema, Address, _, _),_,_,_,_). 
q6(Film,Episodes):-shows(_,film(_, Film, _, _, Episodes),_,_,_).

test:-q1('Wonderful Life',Phone1,Cinema1),write(query1),tab(1), write(Cinema1,Phone1),nl,
    q2(F,'cinema city',A,D,T),write(query2),tab(1), write(F,A,D,T),nl,
    q3(Cinema3, Phone3),write(query3),tab(1), write(Cinema3, Phone3),nl,
    q4(Cinema4, Film4, 'Jeff Eastin'),write(query4),tab(1), write(Cinema4, Film4),nl,
    q5('cinema city',Address5),write(query5),tab(1), write(Address5),nl,
    q6('White Collar',Episodes6),write(query6),tab(1), write(Episodes6),nl.
