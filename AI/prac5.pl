gcd(X, 0, X).
gcd(X, Y, Result) :- Y > 0, Z is X mod Y, gcd(Y, Z, Result).
