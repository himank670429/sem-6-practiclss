fact(0, 1).
fact(N, F) :- N > 0, PrevN is N-1, fact(PrevN, PrevF), F is N * PrevF.