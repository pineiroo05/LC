/*
OPERADORES
- y -> menor/igual prioridad
- x -> mayor prioridad

Binarios	ASOCIATIVIDAD	EJEMPLO
xfx		No tiene	como
xfy		Derecha
yfx		Izquierda
Unarios
xf		No tiene
fx		No tiene
yf		Izquierda
fy		Derecha
*/


% CARTESIANO

:-op(100, xfx, [por]).
:-op(200, xfx,[es]).
:-op(50, fx, [del]).
:-op(55, fx, [cartesiano]).
:-op(60, fx, [el]).

el cartesiano del [] por _ es [].
el cartesiano del [Car|Cdr] por C es R:-linea(Car,C,L),el cartesiano del Cdr por C es Resto,concatenar(L,Resto,R).

%L1 x L2 igual R :- cartesiano(L1, L2, R).
%L1 x E igual R :- E igual R2, cartesiano(L1, R2, R).

linea(E,[],[]).
linea(E,[Car|Cdr],[[E|Car]|R]):-linea(E,Cdr,R).

concatenar([],[],[]).
concatenar([],[Car|Cdr],[Car|Cdr]).
concatenar([Car1|Cdr1],L,[Car1|R]):-concatenar(Cdr1,L,R).

cartesiano([],C2,[]).
cartesiano([Car|Cdr],L2,R):-linea(Car,L2,Linea1),cartesiano(Cdr,L2,R2),concatenar(Linea1,R2,R).

