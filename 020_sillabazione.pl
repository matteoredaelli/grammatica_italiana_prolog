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
lettere_to_vocale_consonante([],[]).
lettere_to_vocale_consonante([L|P],[v|lettere_to_vocale_consonante(P)]):-
  vocale(L), !.
lettere_to_vocale_consonante([_L|P],[c|lettere_to_vocale_consonante(P)]).

sillabazione([], []):- !.
sillabazione([L], [[L]]):- vocale(L), ! .
sillabazione([L1, L2], [[L1, L2]]):- ! .
sillabazione([a,n,t,i|P], [[a,n],[t,i]|S]):-  !,
	sillabazione(P, S).
sillabazione([V, C, C|P], [[V,C]|S]):- 
    vocale(V), consonante(C), !,
    sillabazione([C|P], S).
sillabazione([V, c, q|P], [[V,c]|S]):- 
    vocale(V), !,
    sillabazione([q|P], S).
sillabazione([V, l, C|P], [[V,l]|S]):- 
    vocale(V), consonante(C), !,
    sillabazione([C|P], S).
/* una vocale iniziale seguita da consonante semplice forma una sillaba */
sillabazione([V, C, V2|P], [[V]|S]):- 
    vocale(V), consonante(C), vocale(V2), !,
    sillabazione([C,V2|P], S).
sillabazione([c, h, V|P], [[c,h,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).
sillabazione([c, r, V|P], [[c,r,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).
sillabazione([g, h, V|P], [[g,h,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).
sillabazione([g, l, V|P], [[g,l,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).
sillabazione([g, n, V|P], [[g,n,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).
sillabazione([p, r, V|P], [[p,r,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).
sillabazione([s, c, V|P], [[s,c,V]|S]):- 
    vocale(V), (V == e; V == i), !,
    sillabazione(P, S).
sillabazione([r,i,e|P], [[r,i]|S]):-  !,
	sillabazione([e|P], S).
sillabazione([s,t,r,V|P], [[s,t,r,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).
sillabazione([t,r,i|P], [[t,r,i]|S]):-  !,
	sillabazione(P, S).
sillabazione([C, V, C2, C2|P], [[C,V,C2]|S]):- 
    vocale(V), consonante(C), consonante(C2), !,
    sillabazione([C2|P], S).
sillabazione([C, V, C2, C3|P], [[C,V,C2]|S]):- 
    vocale(V), consonante(C), consonante(C2), consonante(C3), C2 \= C3, !,
    sillabazione([C3|P], S).
sillabazione([C,V,C2,V2|P], [[C,V]|S]) :-
  vocale(V), vocale(V2),
    consonante(C), consonante(C2), !,
    sillabazione([C2,V2|P], S).
sillabazione([C,C2,V|P], [[C, C2, V]|S]) :-
    consonante(C), consonante(C2), vocale(V), !,
    sillabazione(P, S).
sillabazione([C,V1,V2|P], [[C, V1, V2]|S]) :-
    consonante(C), atom_chars(V1V2, [V1,V2]), dittongo(V1V2), !,
    sillabazione(P, S).
sillabazione([C,V1,V2|P], [[C, V1]|S]) :-
    consonante(C), atom_chars(V1V2, [V1,V2]), iato(V1V2), !,
    sillabazione([V2|P], S).

chars_atom(C,A) :- atom_chars(A,C).

sillabazione_stringa(Parola, Sillabe):-
	atom_string(A,Parola),
	atom_chars(A, L),
	sillabazione(L, L2),
	maplist(chars_atom,L2, L3),
	atomic_list_concat(L3, '-', Atom),
	atom_string(Atom, Sillabe).

