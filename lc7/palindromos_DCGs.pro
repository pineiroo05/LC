/*
- VERSION 1
  Problema que presenta esta implementacion? Solamente va a poder trabajar para la frase considerada (abba en este caso), si pongo otra el programa no iría -> falla al generalizar con los caracteres.
  Es para cada frase considerada debería modificar el diccionario de caracteres -> poco util/practico
*/

%Base de datos intensiva -> clausulas de nuestro programa
palindromo(p(C,P,C),P0,P3):-caracter(C,P0,P1),palindromo(P,P1,P2),caracter(C,P2,P3).
palindromo(p(nil),P0,P0).
palindromo(p(C),P0,P1):-P1 is P0+1,caracter(C,P0,P1).

%Base de datos extensiva -> diccionario de caracteres
caracter(a,0,1).
caracter(b,1,2).
caracter(b,2,3).
caracter(a,3,4).

/*
- VERSION 2
  Uso de diferencias de listas -> permite identificar palindromos independientemente de las cadenas introducidas (usa posicionamiento implicito).
  OJO -> evidentemente solo funciona con los caracteres que yo tengo definido, es decir si yo le meto "aca" y la c no esta en la bd extensiva no funciona.
  La diferencia es que ahora si identifica el palindromo si pongo "abba", "baab", "aba"... precisamente pq no le estoy las posiciones de cada caracter. 
*/

analiza(Arbol,Cadena):-palindromo_dl(Arbol,Cadena-[]).

%Base de datos intensiva
palindromo_dl(p(C,P,C),P0-P3):-caracter_dl(C,P0-P1),palindromo_dl(P,P1-P2),caracter(C,P2-P3).
palindromo_dl(p(nil),P0-P0).
palindromo_dl(p(C),P0-P1):-caracter(C,P0-P1).

%Base de datos extensiva
caracter_dl(a,[a|X]-X).
caracter_dl(b,[b|X]-X).