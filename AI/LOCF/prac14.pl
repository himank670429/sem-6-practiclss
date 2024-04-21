nth_element(0, [Head|_], Head).
nth_element(N, [_|Tail], Element) :- 
N > 0,
NextN is N-1,
nth_element(NextN, Tail, Element).

