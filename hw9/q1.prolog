% Q1 a)
loves(kate, jack).
loves(sawyer, kate).
jealous(X,Y):-loves(X,Z), loves(Z,Y).

% Q1 b)
parent(james_i, charles_i).
parent(charles_i, catherine).
parent(charles_i, charles_ii).
parent(charles_i, james_ii).
parent(james_i, elizabeth).
parent(elizabeth, sophia).
parent(sophia, george_i).
grandparentOf(X,Z):-parent(X,Y),parent(Y,Z).
grandchild(Z,X):-parent(X,Y),parent(Y,Z).

% Q1 c)
myLast(X,[X|[]]).
myLast(X,[_|T]) :- myLast(X,T).
