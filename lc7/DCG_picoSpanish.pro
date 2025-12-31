%BASE DE DATOS INTENSIVA -> CLAUSULAS/SINTAXIS DEL PROGRAMA
frase(Arbol,Frase):-frase_dl(Arbol,Frase-[]).

frase_dl(f(SN,SV),P0-P2):-sn(SN,Numero,P0-P1),sv(SV,Numero,P1-P2).

%Definicion del sintagma nominal
sn(sn(nil),P0-P0).
sn(sn(Det,N,Adj),P0-P3):-det(Det,Numero,Genero,P0-P1),n(N,Numero,Genero,P1-P2),adj(Adj,Numero,Genero,P2-P3).
sn(sn(Det,N),P0-P2):-det(Det,Numero,Genero,P0-P1),n(N,Numero,Genero,P1-P2).
sn(sn(N),P0-P1):-n(N,Numero,_,P0-P1).

%Definicion del sintagma verbal
sv(sv(nil),_,P0-P0).
sv(sv(V),Numero,P0-P1):-v(V,Numero,P0-P1).
sv(sv(V,SN),Numero,P0-P2):-v(V,Numero,P0-P1),sn(SN,_,P1-P2).
sv(sv(V,SPREP),Numero,P0-P2):-v(V,Numero,P0-P1),sprep(SPREP,P1-P2).
sv(sv(V,SN,SPREP),Numero,P0-P3):-v(V,Numero,P0-P1),sn(SN,_,P1-P2),sprep(SPREP,P2-P3).

%Definicion del sintagma preposicional
sprep(sprep(Prep,SN),P0-P2):-prep(Prep,P0-P1),sn(SN,_,P1-P2).

%BASE DE DATOS EXTENSIVA -> DICCIONARIO DE DATOS
det(el,singular,masculino,[el|X]-X).
det(la,singular,femenino,[la|X]-X).
det(los,plural,masculino,[los|X]-X).
det(las,plural,femenino,[las|X]-X).

n(gato,singular,masculino,[gato|X]\X).
n(gata,singular,femenino,[gata|X]\X).
n(gatos,plural,masculino,[gatos|X]\X).
n(gatas,plural,femenino,[gatas|X]\X).
n('Pepe',singular,masculino,['Pepe'|X]\X).
n('Pepa',singular,femenino,['Pepa'|X]\X).
n(casa,singular,femenino,[casa|X]\X).
n(casas,plural,femenino,[casas|X]\X).
n(cafe,singular,masculino,[cafe|X]\X).
n(cafes,plural,masculino,[cafes|X]\X).

adj(negro,singular,masculino,[negro|X]\X).
adj(negra,singular,femenino,[negra|X]\X).
adj(negros,plural,masculino,[negros|X]\X).
adj(negras,plural,femenino,[negras|X]\X).
adj(bueno,singular,masculino,[bueno|X]\X).
adj(buena,singular,femenino,[buena|X]\X).
adj(buenos,plural,masculino,[buenos|X]\X).
adj(buenas,plural,femenino,[buenas|X]\X).
adj(malo,singular,masculino,[malo|X]\X).
adj(mala,singular,femenino,[mala|X]\X).
adj(malos,plural,masculino,[malos|X]\X).
adj(malas,plural,femenino,[malas|X]\X).

v(come,singular,[come|X]\X).
v(comia,singular,[comia|X]\X).
v(comen,plural,[comen|X]\X).
v(comian,plural,[comian|X]\X).
v(bebe,singular,[bebe|X]\X).
v(bebia,singular,[bebia|X]\X).
v(beben,plural,[beben|X]\X).
v(bebian,plural,[bebian|X]\X).

prep(de,[de|X]\X).
prep(a,[a|X]\X).
prep(con,[con|X]\X).
prep(en,[en|X]\X).

/*
PREGUNTAS
- Con respuesta positiva
  frase(Arbol['Pepe',comia]).
  frase(Arbol[el,gato,negro,malo]).
  frase(Arbol[los,gatos,de,'Pepe',comian]).
  frase(Arbol['Pepe',bebia,con,'Pepa']).
- Con respuesta negativa -> pq no se esta teniendo en cuenta el numero y Genero
  frase(Arbol['Pepe',comian]).
  frase(Arbol[los,gato,negra,malos]).
  frase(Arbol[los,gato,de,'Pepe',comian]).
  frase(Arbol['Pepe',beben,con,'Pepa']).
*/