move(0,_,_,_).
move(1,A,_,C):- inform(A,C),!. % base condition
move(N,A,B,C):- M is N-1,
move(M,A,C,B),
inform(A,C),
move(M,B,A,C).
inform(A,B):- write('Move one disk from tower '),
write(A), write(' to tower '), write(B), nl.