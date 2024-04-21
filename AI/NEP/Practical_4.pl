% heuristic values
% h(n)
h(s, 5).
h(a, 3).
h(b, 4).
h(c, 2).
h(d, 6).
h(g, 0).

% nodes
start(s).
goal(g).

% g(n)
g(s, a, 1).
g(s, g, 10).
g(a, c, 1).
g(a, b, 2).
g(b, d, 5).
g(c, d, 3).
g(d, g, 2).
g(c, g, 4).

% connected nodes
edge(s, a).
edge(s, g).
edge(a, c).
edge(a, b).
edge(b, d).
edge(c, d).
edge(d, b).
edge(c, g).

connected(X, Y) :- edge(X, Y);edge(Y, X).

% f(n)
f(X, Y, Value) :-
g(X, Y, GN),
h(Y, HUE),
Value is GN+HUE.

calculate_path_cost(Current, Goal, TotalCost, Path) :-
  connected(Current, Goal),
  !,  
  Path = [Current | []],
  TotalCost is f(Current, Goal, _).

calculate_path_cost(Current, Goal, TotalCost, Path) :-
  connected(Current, Neighbour),
  \+ member(Neighbour, Path), 
  f(Current, Neighbour, HCost),
  NewTotalCost is TotalCost + HCost,
  calculate_path_cost(Neighbour, Goal, NeighbourCost, NeighbourPath),
  TotalCost is NewTotalCost + NeighbourCost,
  Path = [Current | NeighbourPath].

a_star_search(s, g, Cost, Path).