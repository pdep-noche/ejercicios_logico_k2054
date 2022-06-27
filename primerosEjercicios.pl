humano(socrates).
humano(platon).
mortal(Persona):-humano(Persona).

%habla(juan, espaniol).
%habla(juan, ingles).
%habla(juan, italiano).
%habla(marcela, espaniol).
%habla(hernan, aleman).
%habla(hernan, italiano).

seComunican(Persona, OtraPersona):- habla(Persona, Idioma), habla(OtraPersona, Idioma), Persona \= OtraPersona.


viveEn(nora, almagro).
viveEn(luis, caballito).
viveEn(ana, lugano).
estaEn(lugano, campus).
estaEn(almagro, medrano).
viajaEnAuto(nora).
viajaEnAuto(matias).

llegaRapido(Persona, Lugar):-viveEn(Persona, Barrio), estaEn(Barrio, Lugar).
llegaRapido(Persona, Lugar):-viajaEnAuto(Persona), estaEn(_, Lugar).

curso(julia, fisicaI).
curso(emilio, inglesII).
curso(elizabeth, quimica).
curso(pedro, economia).

aprobo(emilio, inglesII).
aprobo(elizabeth, quimica).

desaprobo(Persona, Materia):- curso(Persona, Materia), not(aprobo(Persona,Materia)).


contador(roque).
contador(alicia).
joven(roque).
joven(alicia).
trabajoEn(roque,acme).
trabajoEn(ana,omni).
trabajoEn(lucia,omni).
trabajoEn(pablo, fiat).
trabajoEn(alicia, fiat).
honesto(roque).
ingeniero(ana).
ingeniero(pablo).
habla(roque,frances).
habla(ana,ingles).
habla(ana,frances).
habla(lucia,ingles).
habla(lucia,frances).
habla(cecilia,frances).
abogado(cecilia).
ambicioso(cecilia).
ambicioso(Persona):-contador(Persona),joven(Persona).
tieneExperiencia(Persona):-trabajoEn(Persona, _).
esProfesional(Persona):-contador(Persona).
esProfesional(Persona):-abogado(Persona).
esProfesional(Persona):-ingeniero(Persona).

puedeAndar(comercioExterior, Persona):-ambicioso(Persona).
puedeAndar(contaduria, Persona):-contador(Persona), honesto(Persona).
puedeAndar(ventas, Persona):-ambicioso(Persona), tieneExperiencia(Persona).
puedeAndar(ventas, lucia).
puedeAndar(proyectos,Persona):-tieneExperiencia(Persona),ingeniero(Persona).
puedeAndar(proyectos,Persona):-abogado(Persona),joven(Persona).
puedeAndar(logistica,Persona):-esProfesional(Persona),cumpleCondicion(Persona).

cumpleCondicion(Persona):-joven(Persona).
cumpleCondicion(Persona):-trabajoEn(Persona,omni).


madre(mona, homero).
madre(jaqueline, marge).
madre(marge, maggie).
madre(marge, bart).
madre(marge, lisa).
padre(abraham, herbert).
padre(abraham, homero).
padre(clancy, jaqueline).
padre(homero, maggie).
padre(homero, bart).
padre(homero, lisa).

hermano(Persona, OtraPersona):-mismaMadre(Persona, OtraPersona), mismoPadre(Persona, OtraPersona).

mismaMadre(Persona, OtraPersona):- madre(Madre, Persona),  madre(Madre, OtraPersona), Persona \= OtraPersona.
mismoPadre(Persona, OtraPersona):- padre(Padre, Persona), padre(Padre, OtraPersona), Persona \= OtraPersona.

medioHermano(Persona, OtraPersona):-mismaMadre(Persona, OtraPersona), not(mismoPadre(Persona, OtraPersona)).
medioHermano(Persona, OtraPersona):-mismoPadre(Persona, OtraPersona), not(mismaMadre(Persona, OtraPersona)).

hijoUnico(Persona):-hijoDe(Persona, _), not(hermano(Persona, _)), not(medioHermano(Persona, _)).

hijoDe(Persona, Madre):-madre(Madre, Persona).
hijoDe(Persona, Padre):-padre(Padre, Persona).

tio(Tio, Sobrino):-hijoDe(Sobrino, Progenitor), hermano(Tio, Progenitor).
tio(Tio, Sobrino):-hijoDe(Sobrino, Progenitor), medioHermano(Tio, Progenitor).


