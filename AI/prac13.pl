evenlength([]).
evenlength([_, _|Tail]) :- evenlength(Tail).

oddlength([_]).
oddlength([_, _|Tail]) :- oddlength(Tail).