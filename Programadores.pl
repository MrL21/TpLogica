personas(fernando).
personas(andres).
personas(julieta).
personas(marcos).
personas(santiago).
lenguajes(cobol).
lenguajes(java).
lenguajes(ecmascript).
lenguajes(visualbasic).
lenguajes(assembler).
sabeProgramarEn(fernando,cobol).
sabeProgramarEn(fernando,visualbasic).
sabeProgramarEn(fernando,java).
sabeProgramarEn(julieta,java).
sabeProgramarEn(marcos,java).
sabeProgramarEn(santiago,java).
sabeProgramarEn(santiago,ecmascript).
cumpleElRollDe(fernando,analista).
cumpleElRollDe(andres,projectleader).
esProgramador(Alguien):-personas(Alguien),lenguajes(Lenguajes),sabeProgramarEn(Alguien,Lenguajes).

seProgramaEn(sumatra,java).
seProgramaEn(sumatra,net).
seProgramaEn(prometeus,cobol).
trabajaEn(fernando,prometeus).
trabajaEn(santiago,prometeus).
trabajaEn(julieta,sumatra).
trabajaEn(marcos,sumatra).
trabajaEn(andres,sumatra).

estaBienAsignado(Alguien,Proyecto):- 
trabajaEn(Alguien,Proyecto),
seProgramaEn(Proyecto,Lenguaje),
sabeProgramarEn(Alguien,Lenguaje).
estaBienAsignado(Alguien,Proyecto):-
trabajaEn(Alguien,Proyecto),
cumpleElRollDe(Alguien,analista).
estaBienAsignado(Alguien,Proyecto):-
trabajaEn(Alguien,Proyecto),
cumpleElRollDe(Alguien,projectleader).

%____Consultas______
%?- estaBienAsignado(santiago,prometeus).
%false.
%?- estaBienAsignado(fernando,prometeus).
%true .

proyecto(Proyecto):- seProgramaEn(Proyecto,_).
estaBienDefinido(Proyecto):-
proyecto(Proyecto),
forall(trabajaEn(Alguien,Proyecto),estaBienAsignado(Alguien,Proyecto)),
(trabajaEn(Persona,Proyecto),cumpleElRollDe(Persona,analista)).


%____Consultas______
%---Punto 1---
%?- seProgramaEn(sumatra,Lenguaje).
%Lenguaje = java ;
%Lenguaje = net.

%---Punto 2----
%?- not((seProgramaEn(prometeus,Lenguaje),Lenguaje\=cobol)).
%true.

%---Punto 3----
%?- trabajaEn(fernando,Proyecto).
%Proyecto = prometeus.

%----Punto 4----
%?- trabajaEn(santiago,Proyecto).
%Proyecto = prometeus.

%----Punto 5----
%̀?- trabajaEn(Personas,sumatra).
%Personas = julieta ;
%Personas = marcos ;
%Personas = andres.

%---Punto 6---
%?- estaBienAsignado(Persona,sumatra).
%Persona = julieta ;
%Persona = marcos ;
%Persona = andres.

%---Punto 7---
%?- estaBienAsignado(Persona,prometeus).
%Persona = fernando ;
%Persona = fernando ;
%false.

%---Punto 8---
%?- estaBienAsignado(Persona,_).
%Persona = fernando ;
%Persona = julieta ;
% = marcos ;
%Persona = fernando ;
%Persona = andres.

%-----Punto 9----
%?- estaBienAsignado(_,Proyecto).
%Proyecto = prometeus ;
%Proyecto = sumatra ;
%Proyecto = sumatra ;
%Proyecto = prometeus ;
%Proyecto = sumatra.
