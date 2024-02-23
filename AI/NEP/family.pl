% Facts
parent(john, tom).
parent(john, marry).
parent(tom, elbert).
parent(tom, james).
parent(james, jim).

male(john).
male(tom).
male(jim).
male(elbert).
male(james).

female(marry).

% Rule
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
offsping(X, Y) :- parent(Y, X).

son(X, Y) :- offsping(X, Y), male(X).
daughter(X, Y) :- offsping(X, Y), female(X).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X\=Y.

brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).