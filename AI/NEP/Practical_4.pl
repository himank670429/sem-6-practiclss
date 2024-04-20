:- use_module(library(clpfd)).

% Define the search problem as a predicate with a start state and a goal state
search(Start, Goal, Path) :-
    astar(Start, Goal, Path, _).

% Define the A* search algorithm
astar(Start, Goal, Path, Cost) :-
    heuristic(Start, H),
    astar_search(Start, Goal, [Start], H, Path, Cost).

astar_search(Goal, Goal, _, _, [], 0).

astar_search(Current, Goal, Visited, H, [Current|Path], Cost) :-
    \+ member(Current, Visited),
    findall(Next, successor(Current, Next), Nexts),
    Nexts \= [],
    maplist(heuristic, Nexts, Hs),
    minimum(Hs, Hmin),
    select(Hmin, Hs, Hrest),
    select(Next, Nexts, Nrest),
    Cost1 is Cost + Hmin,
    astar_search(Next, Goal, [Next|Visited], Hrest, Path, Cost1).

% Define the successor function for the search problem
successor(State, Next) :-
    append([State, [X]], Next),
    X in 1..9,
    all_distinct(Next).

% Define the heuristic function for the A* search algorithm
heuristic(State, H) :-
    H is sum(State) - 3 * sum(State, X is X mod 3 = 0) - sum(State, X is X mod 3 = 1) - sum(State, X is X mod 3 = 2).

% Example query
?- search([1,2,3,4,5,6,7,8,9], [4,5,6,7,8,9,1,2,3], Path).