reverse([], []).

reverse([H|T], R) :-
    reverse(T, RevT),
    append(RevT, [H], R).

% Example query
% ?- reverse([1, 2, 3, 4], R).
% R = [4, 3, 2, 1].