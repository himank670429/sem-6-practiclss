power(N, 0, 1).
power(N, 1, N).
power(N, P, A) :- A is N**P.