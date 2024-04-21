parent(john, mary).
parent(john, jim).
parent(mary, ann).
parent(mary, beth).

male(john).
male(jim).
female(mary).
female(ann).
female(beth).

age(john, 50).
age(mary, 45).
age(jim, 30).
age(ann, 25).
age(beth, 20).

spouse(X, Y) :-
    parent(X, C1),
    parent(Y, C2),
    C1 \= C2.

child(X, Y) :-
    parent(Y, X).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

brother(X, Y) :-
    sibling(X, Y),
    male(X).

sister(X, Y) :-
    sibling(X, Y),
    female(X).

aunt(X, Y) :-
    sister(X, Z),
    parent(Z, Y).

uncle(X, Y) :-
    brother(X, Z),
    parent(Z, Y).

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Example queries
% ?- spouse(john, X).
% X = mary.

% ?- child(ann, X).
% X = mary.

% ?- sibling(jim, X).
% X = ann.

% ?- brother(jim, X).
% false.

% ?- sister(ann, X).
% X = beth.

% ?- aunt(ann, X).
% X = beth.

% ?- uncle(john, X).
% X = jim.

% ?- grandparent(john, X).
% X = ann.