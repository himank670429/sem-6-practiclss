max(A, B, Max) :- A > B -> Max is A ; Max is B.

maxlist([Head], Head).

maxlist([Head|Tail], Max) :-
    maxlist(Tail, TailMax),
    max(Head, TailMax, Max).