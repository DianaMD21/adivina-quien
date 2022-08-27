:-dynamic cierto/1.
:-dynamic falso/1.

%pais(republica_Dominicana).
%pais(espana).
%pais(australia).
%pais(estados_Unidos).
%pais(italia).
%pais(mexico).
%pais(haiti).
%pais(inglaterra).
%pais(brazil).
%pais(japon).
%pais(china).
%pais(bolivia).

pais_america(P):-continente(P,america).
pais_oceania(P):-continente(P,oceania).
pais_europa(P):-continente(P,europa).
pais_asia(P):-continente(P,asia).


ubicacion_am_norte(P):-pais_america(P),especifico(P,america_del_norte).
ubicacion_am_sur(P):-pais_america(P),especifico(P,america_del_sur).
ubicacion_am_central(P):-pais_america(P),especifico(P,america_central).
ubicacion_caribe(P):-pais_america(P),especifico(P,caribe).
ubicacion_oceania(P):-pais_oceania(P).
ubicacion_asia(P):-pais_asia(P).
ubicacion_europa(P):-pais_europa(P).

idioma_romano(P):-idioma(P,romano).
idioma_ingles(P):-idioma(P,ingles).

idioma_espanol(P):-idioma_romano(P),idioma_especifico(P,espanol).
idioma_portugues(P):-idioma_romamo(P),idioma_especifico(P,portugues).
idioma_italiano(P):-idioma_romamo(P),idioma_especifico(P,italiano).

pais_playa(P):-tiene_playa(P,playa).
grande(P):-not(es_isla),paises_mas_grandes(P,paises_grandes).

palillos_chinos(P):-not(idioma_romano(P)),not(idioma_ingles(P)),not(es_isla(P)),comida_palillos_chinos(P,palillos_chinos).

pais_isla(P):-es_isla(P,isla).
pais_primermundista(P):-primermundista(P,primer_mundo).
conquistador(P):-fue_conquistador(P,conquistador).
clima_tropical(P):-clima(P,tropical).
clima_frio_humedo(P):-clima(P,frio_humedo).
clima_estaciones(P):-clima(P,acorde_a_estaciones).
pais_nieve(P):-cae_nieve(P,nieve).



coloca(P,republica_dominicana):-pais_america(P),ubicacion_caribe(P),pais_isla(P),clima_tropical(P).
coloca(P,estados_unidos):-pais_america(P),ubicacion_am_norte(P),clima_estaciones(P),pais_nieve(P),idioma_ingles(P),pais_playa(P),grande(P),pais_primermundista(P).
coloca(P,mexico):-pais_america(P),ubicacion_am_central(P),clima_estaciones(P),idioma_espanol(P),pais_playa(P).
coloca(P,inglaterra):-pais_europa(P),clima_frio_humedo(P),idioma_ingles(P),pais_playa(P),conquistador(P),pais_nieve(P).
coloca(P,italia):-pais_europa(P),clima_estaciones(P),idioma_italiano(P),pais_playa(P),pais_nieve(P).
coloca(P,inglaterra):-pais_europa(P),clima_frio_humedo(P),idioma_ingles(P),pais_playa(P),conquistador(P),pais_nieve(P).
coloca(P,inglaterra):-pais_europa(P),clima_frio_humedo(P),idioma_ingles(P),pais_playa(P),conquistador(P),pais_nieve(P).
coloca(P,inglaterra):-pais_europa(P),clima_frio_humedo(P),idioma_ingles(P),pais_playa(P),conquistador(P),pais_nieve(P).


%coloca(P,australia):-pais_oceania(P),clima(P,tropical).
%coloca(P,inglaterra):-pais_europa(P),clima(P,humedo_frio).
coloca(P,japon):-pais_asia(P),clima(P,estaciones).

visualiza_pregunta(A):-write(A), write('(si/no)? ').
pregunta(A,Resp):-visualiza_pregunta(A), read(Resp).

responde(si, A):-!,assertz(cierto(A)).
responde(no, A):-!,assertz(falso(A)), fail.

preguntable(continente(_,_)).
preguntable(especifico(_,_)).
preguntable(idioma(_,_)).
preguntable(idioma_especifico(_,_)).
preguntable(es_isla(_,_)).
preguntable(tiene_playa(_,_)).
preguntable(paises_mas_grandes(_,_)).
preguntable(fue_conquistador(_,_)).
preguntable(cae_nieve(_,_)).
preguntable(clima(_,_)).


resuelve(true):-!.
resuelve((A,B)):-!,resuelve(A), resuelve(B).
resuelve(A):-falso(A), !, fail.
resuelve(A):-cierto(A),!.
resuelve(A):-clause(A,B),resuelve(B).
resuelve(A):-preguntable(A),pregunta(A,Resp),responde(Resp,A).

probando(X):-cierto(X).

adivina(X):-X = inglaterra, cierto(continente(_, europa)),cierto(clima(_, frio_humedo)),cierto(idioma(_, ingles)),cierto(tiene_playa(_, playa)),cierto(fue_conquistador(_, conquistador)),cierto(cae_nieve(_, nieve)).
adivina(X):-X = republica_dominicana, cierto(continente(_, america)),cierto(especifico(_, caribe)),cierto(clima(_, tropical)),cierto(es_isla(_,isla)),cierto(idioma(_,latin)),cierto(idioma_especifico(_,espanol)),cierto(tiene_playa(_,playa)).
adivina(X):-X = china,cierto(continente(_, asia)),cierto(clima(_, estaciones)),cierto(idioma(_, mandarin)),cierto(tiene_playa(_, playa)),cierto(fue_conquistador(_, conquistador)),cierto(cae_nieve(_, nieve)).

adivina(X):-X = italia, cierto(continente(_, europa)),cierto(clima(_, estaciones)),cierto(cae_nieve(_,nieve)),cierto(idioma(_, latin)),cierto(idioma_especifico(_,italiano)),cierto(tiene_playa(_, playa)),cierto(fue_conquistador(_, conquistador)).
adivina(X):-X = bazil, cierto(continente(_, america)),cierto(especifico(_, sur)),cierto(clima(_, estaciones)),cierto(idioma(_,latin)),cierto(idioma_especifico(_,portugues)),cierto(tiene_playa(_,playa)).
adivina(X):-X = japon,cierto(continente(_, asia)),cierto(clima(_, estaciones)),cierto(idioma(_, japones)),cierto(tiene_playa(_, playa)),cierto(fue_conquistador(_, conquistador)),cierto(cae_nieve(_, nieve)).

adivina(X):-X = espana, cierto(continente(_, europa)),cierto(clima(_, estaciones)),cierto(idioma(_, latin)),cierto(idioma_especifico(_,espanol)),cierto(tiene_playa(_, playa)),cierto(fue_conquistador(_, conquistador)),cierto(cae_nieve(_, nieve)).
adivina(X):-X = mexico, cierto(continente(_, america)),cierto(especifico(_, central)),cierto(clima(_, estaciones)),cierto(idioma(_,latin)),cierto(idioma_especifico(_,espanol)),cierto(tiene_playa(_,playa)).
adivina(X):-X = estados_unidos,cierto(continente(_, america)),cierto(especifico(_,norte)),cierto(clima(_, estaciones)),cierto(idioma(_, ingles)),cierto(tiene_playa(_, playa)),cierto(cae_nieve(_, nieve)).


