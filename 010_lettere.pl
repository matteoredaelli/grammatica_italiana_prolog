/*
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
vocale_minuscola('a').
vocale_minuscola('à').
vocale_minuscola('e').
vocale_minuscola('è').
vocale_minuscola('é').
vocale_minuscola('i').
vocale_minuscola('o').
vocale_minuscola('ò').
vocale_minuscola('u').
vocale_minuscola('ù').
vocale(L) :-
        downcase_atom(L, Low),
        vocale_minuscola(Low).
is_vocale(L):- vocale(L).

dittongo(ai).
dittongo(au).
dittongo(ei).
dittongo(eu).
dittongo(ia).
dittongo(ie).
dittongo(io).
dittongo(iu).
dittongo(oi).
dittongo(ua).
dittongo(ue).
dittongo(ui).
dittongo(uo).

trittongo(aiu).
trittongo(iai).
trittongo(iei).
trittongo(ioi).
trittongo(uai).
trittongo(uia).
trittongo(uie)
trittongo(uio).
trittongo(uoi).

/* quando nessuna delle due vocali è i o u */
iato(V1V2):-
  atom_chars(V1V2, [V1,V2]),
  vocale(V1), vocale(V2),
  V1 \= V2,
  V1 \= 'i',
  V1 \= 'u',
  V2 \= 'i',
  V2 \= 'u'.
    
consonante_minuscola('b').
consonante_minuscola('c').
consonante_minuscola('d').
consonante_minuscola('f').
consonante_minuscola('g').
consonante_minuscola('h').
consonante_minuscola('j').
consonante_minuscola('k').
consonante_minuscola('l').
consonante_minuscola('m').
consonante_minuscola('n').
consonante_minuscola('p').
consonante_minuscola('q').
consonante_minuscola('r').
consonante_minuscola('s').
consonante_minuscola('t').
consonante_minuscola('v').
consonante_minuscola('w').
consonante_minuscola('x').
consonante_minuscola('y').
consonante_minuscola('z').
consonante(L) :-
        downcase_atom(L, Low),
        consonante_minuscola(Low).
is_consonante(L):- consonante(L).

lettera_minuscola(L):- consonante_minuscola(L).
lettera_minuscola(L):- vocale_minuscola(L).
lettera(L):- consonante(L).
lettera(L):- vocale(L).
is_lettera(L):- lettera(L).
