/*
TORRES DE HANOI
*/

:-op(600,xfy,[a]).
:-dynamic hanoi2/5.
:-dynamic hanoi3/5.

hanoi(1,A,B._,[A a B]).
hanoi(N,A,B,C,R):-N>1,N1 is N-1,hanoi(N1,A,C,B,R1),hanoi(N1,C,B,A,R2),append(R1,[A a B|R2],R).

%Con prog dinamica -> mete en memoria los resultados, si lo tengo va y los saca -> mas rapido
hanoi2(1,A,B._,[A a B]).
hanoi2(N,A,B,C,R):-N>1,N1 is N-1,hanoi2(N1,A,C,B,R1),asserta(hanoi2(N1,A,C,B,R1):-!),hanoi2(N1,C,B,A,R2),append(R1,[A a B|R2],R).

%Gasta memoria -> limpiamos memoria -> al hacer listing esta mas vacio
hanoi3(1,A,B._,[A a B]).
hanoi3(N,A,B,C,R):-N>1,N1 is N-1,hanoi3(N1,A,C,B,R1),asserta(hanoi3(N1,A,C,B,R1):-!),hanoi3(N1,C,B,A,R2),retract(hanoi3(N1,A,C,B,R1):-!),append(R1,[A a B|R2],R).
