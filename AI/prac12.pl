sumlist([], 0).
sumlist([Head | Tail], Sum) :- 
sumlist(Tail, TailSum),
Sum is Head + TailSum.