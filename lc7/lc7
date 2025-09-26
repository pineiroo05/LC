%LC_7
/*
practica1
*/

hombre(adan).
hombre(eva).
mortal(X):-hombre(X).

/*
Ej2. Sintaxis y semantica 
nat(X): X es un numero natural.
sig(X) funcion, solo es notacion.
*/

nat(0).
nat(sig(X)):-nat(X).

%EJERCICIO SUMA
/*
Sintaxis semantica
suma(X+1,Y,Z+1):-suma(X,Y,Z).
suma(X,Y,Z): X+Y=Z
Y=Z-X
*/

suma(0,X,X).
suma(sig(X),Y,sig(Z)):-suma(X,Y,Z).

/*
sig(X)	Y	sig(Z)		X   Y   Z
2	2	sig(?)		1   2	?
1	2	sig(sig(?)	0   2	?1
0	2	sig(sig(sig(?)	?   2	?2
*/

%EJERCICIO IGUALES
/*
Sintaxis semanticq
igual(X,Y): X==Y
*/

igual(X,X).

%EJERCICIO NUMEROS PARES/IMPARES
/*
Sintaxis semantica
par(X): X es un numero par
*/

par(0).
par(sig(sig(X))):-par(X).

impar(sig(0)).
impar(sig(sig(X))):-impar(X).

%EJERCICIO MULTIPLICACION
/*
Sintaxis semantica
mult(X,Y,Z) X*Y=Z
*/

mult(X,0,0).
%mult(X,sig(0),X). Es redundante pq unifica en los dos
mult(X,sig(Y),R):-mult(X,Y,W).sum(X,W,R).

%EJERCICIO EXPONENCIAL
/*
exp(X,Y,R) X^Y=R
*/

exp(X,0,sig(0)).
%exp(X,sig(0),X). Es tmb redundante
exp(X,sig(Y),R):-exp(X,Y,W).mult(X,W,R).