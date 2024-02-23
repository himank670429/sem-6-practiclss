insert_nth(Element, 1, List, [Element | List]).
insert_nth(Element, N, [Head|Tail], [Head|Result]) :-
    N > 1,
    NextN is N-1,
    insert_nth(Element, NextN, Tail, Result).
    