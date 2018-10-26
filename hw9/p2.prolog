% takes a very long time to run, but seems to work.
%bo
available(bo, monday, one).
available(bo, monday, two).
available(bo, monday, three).
available(bo, wednesday, one).
available(bo, wednesday, two).
available(bo, wednesday, three).
available(bo, thursday, one).
available(bo, thursday, two).
available(bo, thursday, three).
available(bo, friday, one).
available(bo, friday, two).
available(bo, friday, three).
available(bo, saturday, one).
available(bo, saturday, two).
available(bo, saturday, three).

%esmeralda
available(esmeralda, monday, one).
available(esmeralda, monday, two).
available(esmeralda, tuesday, one).
available(esmeralda, tuesday, two).
available(esmeralda, wednesday, one).
available(esmeralda, wednesday, two).
available(esmeralda, thursday, one).
available(esmeralda, thursday, two).
available(esmeralda, friday, one).
available(esmeralda, friday, two).
available(esmeralda, saturday, one).
available(esmeralda, saturday, two).

%alexis
available(alexis, monday, one).
available(alexis, monday, two).
available(alexis, monday, three).
available(alexis, tuesday, one).
available(alexis, tuesday, two).
available(alexis, tuesday, three).
available(alexis, wednesday, one).
available(alexis, wednesday, two).
available(alexis, wednesday, three).
available(alexis, thursday, one).
available(alexis, thursday, two).
available(alexis, thursday, three).
available(alexis, friday, one).
available(alexis, friday, two).
available(alexis, friday, three).
available(alexis, saturday, one).
available(alexis, saturday, two).
available(alexis, saturday, three).

%chloe
available(chloe, monday, one).
available(chloe, monday, two).
available(chloe, monday, three).
available(chloe, tuesday, one).
available(chloe, tuesday, two).
available(chloe, tuesday, three).
available(chloe, wednesday, one).
available(chloe, wednesday, two).
available(chloe, wednesday, three).
available(chloe, thursday, one).
available(chloe, thursday, two).
available(chloe, thursday, three).
available(chloe, friday, one).
available(chloe, friday, two).
available(chloe, friday, three).
available(chloe, saturday, one).
available(chloe, saturday, two).
available(chloe, saturday, three).

%drake
available(drake, monday, one).
available(drake, monday, two).
available(drake, monday, three).
available(drake, tuesday, one).
available(drake, tuesday, two).
available(drake, tuesday, three).
available(drake, wednesday, one).
available(drake, wednesday, two).
available(drake, wednesday, three).
available(drake, thursday, one).
available(drake, thursday, two).
available(drake, thursday, three).
available(drake, friday, one).
available(drake, friday, two).
available(drake, friday, three).
available(drake, saturday, one).
available(drake, saturday, two).
available(drake, saturday, three).

%flint
available(flint, monday, one).
available(flint, monday, two).
available(flint, monday, three).
available(flint, tuesday, one).
available(flint, tuesday, two).
available(flint, tuesday, three).
available(flint, wednesday, one).
available(flint, wednesday, two).
available(flint, wednesday, three).
available(flint, thursday, one).
available(flint, thursday, two).
available(flint, thursday, three).
available(flint, friday, one).
available(flint, saturday, one).
available(flint, saturday, two).
available(flint, saturday, three).

%gemma
available(gemma, monday, one).
available(gemma, monday, two).
available(gemma, monday, three).
available(gemma, tuesday, one).
available(gemma, tuesday, two).
available(gemma, tuesday, three).
available(gemma, wednesday, one).
available(gemma, wednesday, two).
available(gemma, wednesday, three).
available(gemma, thursday, one).
available(gemma, thursday, two).
available(gemma, thursday, three).
available(gemma, friday, one).
available(gemma, saturday, one).
available(gemma, saturday, two).
available(gemma, saturday, three).

%hans
available(hans, monday, one).
available(hans, monday, two).
available(hans, monday, three).
available(hans, tuesday, one).
available(hans, tuesday, two).
available(hans, tuesday, three).
available(hans, wednesday, one).
available(hans, wednesday, two).
available(hans, wednesday, three).
available(hans, thursday, one).
available(hans, thursday, two).
available(hans, thursday, three).
available(hans, friday, one).
available(hans, friday, two).
available(hans, friday, three).
available(hans, saturday, one).
available(hans, saturday, two).
available(hans, saturday, three).

%idris
available(idris, monday, one).
available(idris, monday, two).
available(idris, monday, three).
available(idris, tuesday, one).
available(idris, tuesday, two).
available(idris, tuesday, three).
available(idris, wednesday, one).
available(idris, wednesday, two).
available(idris, wednesday, three).
available(idris, thursday, one).
available(idris, thursday, two).
available(idris, thursday, three).
available(idris, friday, one).
available(idris, friday, two).
available(idris, friday, three).
available(idris, saturday, one).
available(idris, saturday, two).
available(idris, saturday, three).

notSameTime(D1,T1,D2,T2,D3,T3,D4,T4,D5,T5,D6,T6,D7,T7,D8,T8,D9,T9) :- 
    not(member([D1, T1], [[D2,T2], [D3,T3], [D4,T4], [D5,T5], [D6,T6], [D7,T7], [D8,T8], [D9,T9]])),
    not(member([D2, T2], [[D1,T1], [D3,T3], [D4,T4], [D5,T5], [D6,T6], [D7,T7], [D8,T8], [D9,T9]])),
    not(member([D3, T3], [[D2,T2], [D1,T1], [D4,T4], [D5,T5], [D6,T6], [D7,T7], [D8,T8], [D9,T9]])),
    not(member([D4, T4], [[D2,T2], [D3,T3], [D1,T1], [D5,T5], [D6,T6], [D7,T7], [D8,T8], [D9,T9]])),
    not(member([D5, T5], [[D2,T2], [D3,T3], [D4,T4], [D1,T1], [D6,T6], [D7,T7], [D8,T8], [D9,T9]])),
    not(member([D6, T6], [[D2,T2], [D3,T3], [D4,T4], [D1,T1], [D1,T1], [D7,T7], [D8,T8], [D9,T9]])),
    not(member([D7, T7], [[D2,T2], [D3,T3], [D4,T4], [D1,T1], [D6,T6], [D1,T1], [D8,T8], [D9,T9]])),
    not(member([D8, T8], [[D2,T2], [D3,T3], [D4,T4], [D1,T1], [D6,T6], [D7,T7], [D1,T1], [D9,T9]])),
    not(member([D9, T9], [[D2,T2], [D3,T3], [D4,T4], [D1,T1], [D6,T6], [D7,T7], [D8,T8], [D1,T1]])).
    
allDaysCovered(D1, D2, D3, D4, D5, D6, D7, D8, D9) :-  
    member(monday, [D1, D2, D3, D4, D5,D6,D7,D8,D9]),
    member(tuesday, [D1, D2, D3, D4,D5,D6,D7,D8,D9]),
    member(wednesday, [D1,D2,D3,D4,D5,D6,D7,D8,D9]), 
    member(thursday, [D1,D2,D3,D4,D5,D6,D7,D8,D9]),
    member(friday, [D1,D2,D3,D4,D5,D6,D7,D8,D9]),
    member(saturday, [D1,D2,D3,D4,D5,D6,D7,D8,D9]).

noConflict(P1,D1,T1,P2,D2,T2,P3,D3,T3,P4,D4,T4,P5,D5,T5,P6,D6,T6,P7,D7,T7,P8,D8,T8,P9,D9,T9) :- available(P1, D1, T1),
    available(P2, D2, T2), available(P3,D3,T3), available(P4,D4,T4), available(P5,D5,T5), available(P6,D6,T6),
    available(P7,D7,T7), available(P8,D8,T8), available(P9,D9,T9).

schedule(P1,D1,T1,P2,D2,T2,P3,D3,T3,P4,D4,T4,P5,D5,T5,P6,D6,T6,P7,D7,T7,P8,D8,T8,P9,D9,T9) :- 
    noConflict(P1,D1,T1,P2,D2,T2,P3,D3,T3,P4,D4,T4,P5,D5,T5,P6,D6,T6,P7,D7,T7,P8,D8,T8,P9,D9,T9),
    notSameTime(D1,T1,D2,T2,D3,T3,D4,T4,D5,T5,D6,T6,D7,T7,D8,T8,D9,T9), allDaysCovered(D1,D2,D3,D4,D5,D6,D7,D8,D9).


