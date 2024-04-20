% Define the context-free grammar rules
s --> [].
s --> [a], s, [b].

% Define the predicate to recognize the string
recognize(String) :-
    phrase(s, String).

% Example usage
% Test with a valid string: "aabb"
% ?- recognize([a,a,b,b]).
% Output: true

% Test with an invalid string: "aabba"
% ?- recognize([a,a,b,b,a]).
% Output: false
