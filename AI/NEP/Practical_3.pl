best_first_search(Start, Goal, Solution) :-
    max_depth(MaxDepth),
    between(1, MaxDepth, Depth),
    iddfs(Start, Goal, Depth, Solution).

iddfs(Start, Goal, Depth, Solution) :-
    iddfs_search(Start, Goal, [Start], Depth, Solution).

iddfs_search(Goal, Goal, _, _, []).

iddfs_search(Current, Goal, Visited, Depth, [Current|Path]) :-
    Depth > 0,
    Depth1 is Depth - 1,
    move(Current, Next),
    \+ member(Next, Visited),
    iddfs_search(Next, Goal, [Next|Visited], Depth1, Path).

max_depth(10). % Set the maximum depth for IDDFS

move(a, b).
move(b, c).
move(c, d).
move(d, e).
