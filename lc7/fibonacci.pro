/*
FIBONACCI
*/

:-dynamic fib2/2.
:-dynamic fib3/2.

fib(0,0).
fib(1,1).
fib(N,R):-N>1, N1 is N-1, N2 is N-2, fib(N1,R1),fib(N2,R2),R is R1+R2.

%Con asserta -> se hace aserta del + pequeño.
fib2(0,0).
fib2(1,1).
fib2(N,R):-N>1, N1 is N-1, N2 is N-2,fib2(N2,R1),asserta(fib2(N2,R1):-!),fib2(N1,R2),R is R1+R2.

%Con retract -> con valores muy grandes va mas lento, con 50 por ejemplo ya le cuesta
fib3(0,0).
fib3(1,1).
fib3(N,R):-N>1, N1 is N-1, N2 is N-2,fib3(N2,R1),asserta(fib3(N2,R1):-!),fib3(N1,R2),retract(fib3(N2,R1):-!),R is R1+R2.

/*
fib/3 es mas lento ya q por el retract va quitando cosas de memoria
*/
