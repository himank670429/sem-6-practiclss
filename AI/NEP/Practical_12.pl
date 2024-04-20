s(s(NP, VP)) --> np(NP), vp(VP).
np(np(Det, N)) --> det(Det), n(N).
vp(vp(V, NP)) --> v(V), np(NP).
vp(vp(V)) --> v(V).

det(the) --> [the].
det(a) --> [a].
n(cat) --> [cat].
n(dog) --> [dog].
v(chases) --> [chases].
v(sleeps) --> [sleeps].

parse(Tree, Sentence) :-
    phrase(s(Tree), Sentence).

% Example query
% ?- parse(Tree, [the, cat, chases, a, dog]).