/*
PRODUCTO CARTESIANO
Implementar un predicado de sintaxis: Resultado es el producto cartesiano de Conj1 por Conj2 por Conj3 caray.
donde Resultado es lo obtenido al hacer los productos de Conj2 y Conj3, y posteriormente hacer el producto por Conj1.

Ej: X es el producto cartesiano de [1,2] por [a] por [3,4] caray.
X=[[1, [a, 3]], [1, [a, 4]], [2, [a, 3]], [2, [a, 4]]].
*/

:-op(100,xfy,[por]).
:-op(200,fx,[de]).
:-op(300,fx,[cartesiano]).
:-op(400,fx,[producto]).
:-op(500,fx,[el]).
:-op(600,xfx,[es]).
:-op(700,xf,[caray]).

[] es el producto cartesiano de [] por _ por _ caray.
R es el producto cartesiano de Conj1 por Conj2 por Conj3 caray:-cartesiano(Conj2,Conj3,R1),cartesiano(Conj1,R1,R).

cartesiano([],_,[]).
cartesiano([Car|Cdr],Conj,R):-linea(Car,Conj,A),cartesiano(Cdr,Conj,B),append(A,B,R).

linea(_,[],[]).
linea(E,[Car|Cdr],[[E,Car]|R]):-linea(E,Cdr,R).

/*
UNION
Implementar un predicado de sintaxis: si unimos Conj1 con Conj2 con Conj3 obtenemos Resultado como resultado.
donde Resultado es el resultado de unir Conj1 y Conj2, y despues con Conj3.

Ej: si unimos [1,2,4] con [a,b] con [4,5,6] obtenemos X como resultado.
X=[1,2,3,a,b,4,5,6].
*/

:-op(100,xfy,[con]).
:-op(200,fx,[unimos]).
:-op(300,fx,[si]).
:-op(400,xfx,[obtenemos]).
:-op(500,xf,[como]).
:-op(600,xf,[resultado]).

si unimos [] con Conj1 con Conj2 obtenemos R como resultado:-union(Conj1,Conj2,R).
si unimos Conj1 con Conj2 con Conj3 obtenemos R como resultado:-union(Conj1,Conj2,R1),union(R1,Conj3,R).

union([],C,C).
union(C,[],C).
union([Car|Cdr],C2,R):-member(Car,C2),!,union(Cdr,C2,R).
union([Car|Cdr],C2,[Car|R]):-union(Cdr,C2,R).

/*
INTERSECCION
Implementar un predicado de sintaxis: si interseco Conj1 y Conj2 y Conj3 tenemos como respuesta Respuesta.
donde Respuesta es el resultado de intersecar los conjuntos Conj1 y Conj2, y despues con Conj3.

Ej: si interseco [1,a,3] y [a,b,3] y [3,a,4] tenemos como respuesta X.
X=[a,3].
*/

:-op(100,yfx,[y]).
:-op(200,fx,[interseco]).
:-op(300,fx,[si]).
:-op(400,fx,[respuesta]).
:-op(500,fx,[como]).
:-op(600,xfx,[tenemos]).

si interseco [] y _ y _ tenemos como respuesta [].
si interseco Conj1 y Conj2 y Conj3 tenemos como respuesta R:-interseccion(Conj1,Conj2,R1),interseccion(R1,Conj3,R).

interseccion([],_,[]).
interseccion(_,[],[]).
interseccion([Car|Cdr],Conj,[Car|R]):-member(Car,Conj),!,interseccion(Cdr,Conj,R).
interseccion([_|Cdr],Conj,R):-interseccion(Cdr,Conj,R).
