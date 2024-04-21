rev([], []).
rev([Head | Tail], L) :- 
    rev(Tail,  RevT),
    append(RevT, [Head], L).


is_pallindrome(List) :-
    rev(List, Reversed),
    List = Reversed.
