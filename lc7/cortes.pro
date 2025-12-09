/*
CORTES
-Si el corte es rojo, el corte es necesario para q funcione
*/

%Member
miembro(E,[E|_]):-!.
miembro(E,[_|Cdr]):-miembro(E,Cdr).

/*
L1, L2, L3 conjuntos sin elem repetidos
interseccion int(L1, L2, L3) E pertenece a l3 sii E pertenece a L1 y L2
union(L1, L2, L3) E pertenece a L3 sii E pertenece a L1 o L2
*/
int([],L,[]).
int([Car1|Cdr1],L2,[Car1|R]):-miembro(Car1,L2),!,int(Cdr1,L,R).
int([Car1|Cdr1],L2,R):-int(Cdr1,L2,R).

union([],L,L).
union([Car|Cdr],L2,R):-miembro(Car,L2),!,union(Cdr,L2,R).
union([Car|Cdr],L2,[Car|R]):-union(Cdr,L2,R).

/*
superiores(E,L1,L2) devuelve los elem de la lista q sean mayores a E.
hasta(E,L1,L2) devuelve los elem de la lista hasta encontrar a E.
creciente(L1) me dice si esta en orden creciente la lista.
*/

superiores(_,[],[]).
superiores(E,[Car|Cdr],[Car|R]):-Car>E,!,superiores(E,Cdr,R).
superiores(E,[_|Cdr],R):-superiores(E,Cdr,R).

hasta(E,[E|_],[]):-!.
hasta(E,[Car|Cdr],[Car|R]):-hasta(E,Cdr,R).

creciente([_]).
creciente([Car1,Car2|Cdr]):-Car1<Car2,creciente([Car2|Cdr]).