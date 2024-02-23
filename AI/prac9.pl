conc([], L, L).
conc(L, [], L).
conc([H | T1], L2, [H | Result]) :- conc(T1, L2, Result).