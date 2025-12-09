/*
LENGUAJES INDEPENDIENTES DEL CONTEXTO
- Palindromos serian dependientes
*/

/*
palindromo([]).
palindromo([_]).
palindromo([C|X]):-append(Medio,[C],X),palindromo(Medio).
*/

%Definimos el lenguaje de los palindromos S->CSC. Las W, X y Y me dicen las posiciones de los C

%BD intensiva -> analizador sintactico
analizador(Arbol,F):-palindromo_dl(Arbol,F-[]).
palindromo_dl(p(C,M,C),P0-P3):-caracter_dl(C,P0-P1),palindromo_dl(M,P1-P2),caracter_dl(C,P2-P3).
palindromo_dl(p(nil),X-X).
palindromo_dl(p(C),P0-P1):-caracter_dl(C,P0-P1).

%BD extensiva
caracter(a,[a|X]-X).
caracter(b,[b|X]-X).
caracter(c,[c|X]-X).

/*
Ejercicio picoSpanish
*/

