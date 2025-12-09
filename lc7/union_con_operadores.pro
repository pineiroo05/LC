/*
UNION
Pregunta: la union del [1,2] con [2,3] es un X sin ninguna duda.
*/

op().

union([],C,C).
union([Car|Cdr],L2,R):-member(Car,L2),union(Cdr,L2,R).
union([Car|Cdr],L2,[Car|R]):-union(Cdr,L2,R).
