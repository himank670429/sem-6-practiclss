state(a).
state(b).
state(c).
state(d).

goal(d).

move(a, b).
move(b, a).
move(b, c).
move(c, b).
move(c, d).
move(d, c).

heuristic(a, 10).
heuristic(b, 5).
heuristic(c, 2).
heuristic(d, 0).

hill_climbing(State, Goal) :-
    move(State, NewState),
    (   Goal = NewState
    ;   heuristic(NewState, H),
        hill_climbing(NewState, Goal, H)
    ).

hill_climbing(_, Goal, _) :-
    goal(Goal).

hill_climbing(State, Goal, CurrentH) :-
    move(State, NewState),
    heuristic(NewState, NewH),
    NewH < CurrentH,
    hill_climbing(NewState, Goal, NewH).

% Example query
% ?- hill_climbing(a, Goal).
% Goal = d.