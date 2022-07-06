transporte(juan, camina).
transporte(marcela, subte(a)).
transporte(pepe, colectivo(160,d)).
transporte(elena, colectivo(76)).
transporte(maria, auto(500, fiat,2015)).
transporte(ana, auto(fiesta, ford, 2014)).
transporte(roberto, auto(qubo, fiat, 2015)).
manejaLento(manuel).
manejaLento(ana).


tardaMucho(Persona):-transporte(Persona, camina).
tardaMucho(Persona):- transporte(Persona, auto(_, _, _)), manejaLento(Persona).

viajaEnColectivo(Persona):-transporte(Persona, Transporte), esColectivo(Transporte).

esColectivo(colectivo(_, _)).
esColectivo(colectivo(_)).

%lugar(nombre,hotel(nombre,cantEstrellas,montoDiario)%
lugar(marDelPlata, hotel(elViajante,4,1500)).
lugar(marDelPlata, hotel(casaNostra,3,1000)).
lugar(lasToninas, hotel(holidays,4,500)).
lugar(tandil,quinta(amanecer,pileta,650)).
lugar(bariloche,carpa(80)).
lugar(laFalda, casa(pileta,600)).
lugar(rosario, casa(garaje,400)).

%puedeGastar(nombre,cantDias,montoTotal)%
puedeGastar(ana,4,10000).
puedeGastar(hernan,5,8000).
puedeGastar(mario,5,4000).


puedeIr(Persona, Lugar, Alojamiento):- lugar(Lugar, Alojamiento), cumpleCondiciones(Alojamiento, MontoDia), puedeGastar(Persona, Dias, MontoTotal), MontoTotal > Dias * MontoDia.

cumpleCondiciones(hotel(_, Estrellas, MontoDia), MontoDia):- Estrellas > 3.
cumpleCondiciones(casa(garaje, MontoDiario), MontoDiario).
cumpleCondiciones(quinta(_, pileta, MontoDiario), MontoDiario).
cumpleCondiciones(carpa(MontoDiario), MontoDiario).

puedeIrATodos(Persona):-persona(Persona), forall(lugar(Lugar, _), puedeIr(Persona, Lugar, _)).


persona(Persona):- puedeGastar(Persona, _, _).

encolar(Elem,[],[Elem]).
encolar(Elem, [Cab|Cola], [Cab|NuevaCola]):-
                encolar(Elem, Cola, NuevaCola).


maximo(Lista, Max):-member(Max, Lista), 
    forall(member(OtroElem, Lista), OtroElem =< Max).

interseccion(Lista, OtraLista, ListaInterseccion):-
    findall(Elem, (member(Elem, Lista), member(Elem, OtraLista)), ListaInterseccion).

esCreciente([_]).
esCreciente([Cab, OtraCab|Cola]):- Cab < OtraCab, esCreciente([OtraCab|Cola]).

sublistasMayoresA([], _, []).
sublistasMayoresA([Cab|Cola], Elem, [Cab|NuevaCola]):- Cab > Elem, 
        sublistasMayoresA(Cola, Elem, NuevaCola).
sublistasMayoresA([_|Cola], Elem, Lista):-
        sublistasMayoresA(Cola, Elem, Lista).


entretenimiento(cine).
entretenimiento(teatro).
entretenimiento(pool).
entretenimiento(parqueTematico).
costo(cine, 300).
costo(teatro, 500).
costo(pool, 250).
costo(parqueTematico, 800).


entretenimientos(Dinero, ListaEntretePosibles):-todosEntretenimientos(Entretenimientos), 
    subConjuntoEntre(Entretenimientos, Dinero, ListaEntretePosibles).

todosEntretenimientos(Lista):-
    findall(Entretenimiento, entretenimiento(Entretenimiento), Lista).

subConjuntoEntre([], _, []).
subConjuntoEntre([Entrete|Cola], Dinero, [Entrete|NuevaCola]):- costo(Entrete, Monto), 
    Dinero >= Monto, Disponible is Dinero - Monto, 
    subConjuntoEntre(Cola, Disponible, NuevaCola).
subConjuntoEntre([_|Cola], Dinero, Lista):-
    subConjuntoEntre(Cola, Dinero, Lista).