fib(0, 0).
fib(1, 1).
fib(N, T) :- 
N > 1, 
PrevA is N-1,
PrevB is N-2,
fib(PrevA, ResultA),
fib(PrevB, ResultB),
T is ResultA+ResultB.