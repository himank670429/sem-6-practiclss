conc(L1, L2, L3) :-
    append(L1, L2, L3).

% Example query
% ?- conc([1, 2], [3, 4], L3).
% L3 = [1, 2, 3, 4].