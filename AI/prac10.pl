rev([], []).
rev([Head | Tail], L) :- 
    rev(Tail,  RevT),
    append(RevT, [Head], L).

