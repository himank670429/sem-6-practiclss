frame(john, [
    [name, 'John Doe'],
    [age, 30],
    [gender, male],
    [occupation, engineer]
]).

frame(jane, [
    [name, 'Jane Smith'],
    [age, 28],
    [gender, female],
    [occupation, doctor]
]).

frame(car1, [
    [make, toyota],
    [model, 'Corolla'],
    [year, 2018],
    [color, blue]
]).

frame(car2, [
    [make, honda],
    [model, 'Civic'],
    [year, 2020],
    [color, red]
]).

get_frame_property(Frame, Property, Value) :-
    frame(Frame, Properties),
    member([Property, Value], Properties).

% Example queries:
% Get the name of John
% ?- get_frame_property(john, name, Name).
%
% Get the color of car2
% ?- get_frame_property(car2, color, Color).