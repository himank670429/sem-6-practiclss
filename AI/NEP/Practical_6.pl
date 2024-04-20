% Define the initial state and the goal state
initial_state((0, 0)).
goal_state((4, _)).

% Define the actions possible in the problem
action((Jug1, Jug2), fill_jug1, (5, Jug2)) :-
    Jug1 < 5.
action((Jug1, Jug2), fill_jug2, (Jug1, 3)) :-
    Jug2 < 3.
action((Jug1, Jug2), empty_jug1, (0, Jug2)) :-
    Jug1 > 0.
action((Jug1, Jug2), empty_jug2, (Jug1, 0)) :-
    Jug2 > 0.
action((Jug1, Jug2), pour_jug1_to_jug2, (NewJug1, NewJug2)) :-
    Jug1 > 0,
    Total is Jug1 + Jug2,
    NewJug2 is min(Total, 3),
    NewJug1 is Jug1 - (NewJug2 - Jug2).
action((Jug1, Jug2), pour_jug2_to_jug1, (NewJug1, NewJug2)) :-
    Jug2 > 0,
    Total is Jug1 + Jug2,
    NewJug1 is min(Total, 5),
    NewJug2 is Jug2 - (NewJug1 - Jug1).

% Define the predicate to solve the problem using depth-first search
solve(State, _, []) :- goal_state(State).
solve(State, Visited, [Action|Rest]) :-
    action(State, Action, NextState),
    \+ member(NextState, Visited),
    solve(NextState, [NextState|Visited], Rest).

% Example usage:
% ?- initial_state(InitialState), solve(InitialState, [InitialState], Actions).
% Actions will contain a sequence of actions to reach the goal state.

% Example output for initial state (0, 0):
% Actions = [fill_jug1, pour_jug1_to_jug2, empty_jug2, pour_jug1_to_jug2, fill_jug1, pour_jug1_to_jug2].
