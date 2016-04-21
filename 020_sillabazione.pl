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

count(_, [], 0):-!.
count(X, [X | T], N) :-
  !, count(X, T, N1),
  N is N1 + 1.
count(X, [_ | T], N) :-
  count(X, T, N). 


lettere_to_vocale_consonante([],[]).
lettere_to_vocale_consonante([L|P],[v|VC]):-
	vocale(L), !,
	lettere_to_vocale_consonante(P,VC).
lettere_to_vocale_consonante([_L|P],[c|VC]):-
	lettere_to_vocale_consonante(P,VC).

/* le consonanti doppi

   si sdoppiano */
macro_sillabe(P,L):-
	macro_sillabe(P,[], L).

macro_sillabe([], Prefisso, [Prefisso]):- !.
macro_sillabe([Letter], Prefisso, [List]):- !,
	append(Prefisso, [Letter], List).
macro_sillabe([Letter,Letter|Parola], Prefisso, List):- consonante(Letter), !,
	append(Prefisso, [Letter], List1),
	macro_sillabe([Letter|Parola],[],List2),
	append([List1],List2, List).
macro_sillabe([Letter,Letter2|Parola], Prefisso, List):-
	((Letter == c, Letter2 == q) ;
	 (Letter == l, consonante(Letter2));
	 (Letter == m, consonante(Letter2));
	 (Letter == n, consonante(Letter2));
	 (Letter == r, consonante(Letter2))
	), !,
	append(Prefisso, [Letter], List1),
	macro_sillabe([Letter2|Parola],[],List2),
	append([List1],List2, List).
macro_sillabe([Letter,Letter2|Parola], Prefisso, List):-
	append(Prefisso, [Letter], List1),
	macro_sillabe([Letter2|Parola],List1,List).


sillabazione([], []):- !.
sillabazione([L], [[L]]):- vocale(L), ! .
sillabazione([L1, L2], [[L1, L2]]):- ! .

/* se la parola contiene una sola vocale, allora è già una sillaba
   (non esisterebbe una sillaba senza una vocale */
sillabazione(P,[P]):-
	lettere_to_vocale_consonante(P,L),
	count(v,L,1), !.

sillabazione([a,n,t,i|P], [[a,n],[t,i]|S]):-  !,
	sillabazione(P, S).

/* una vocale iniziale seguita da consonante doppia 
sillabazione([V, C, C|P], [[V,C]|S]):- 
    vocale(V), consonante(C), !,
    sillabazione([C|P], S).
*/
/* si divide anche il gruppo cq: ac-qua 
sillabazione([V, c, q|P], [[V,c]|S]):- 
    vocale(V), !,
    sillabazione([q|P], S).
*/
/* l, r, m, n vanno separate dalla consonante che le segue 
sillabazione([V, C1, C2|P], [[V,C1]|S]):- 
	vocale(V), consonante(C1), consonante(C2),
	(C1 == l; C1 == m; C1 == n; C1 == r),
	C1 \= C2, !,
    sillabazione([C2|P], S).
*/

/* una vocale iniziale seguita da consonante semplice */
sillabazione([V, C, L|P], [[V]|S]):- 
    vocale(V), consonante(C), C \= L, !,
    sillabazione([C,L|P], S).

sillabazione([c, h, V1, V2|P], [[c,h,V1,V2]|S]):- 
    vocale(V1), vocale(V2), atom_chars(V1V2, [V1,V2]), dittongo(V1V2), !,
    sillabazione(P, S).
sillabazione([c, h, V|P], [[c,h,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).

sillabazione([c, r, V1, V2|P], [[c,r,V1,V2]|S]):- 
    vocale(V1), vocale(V2), atom_chars(V1V2, [V1,V2]), dittongo(V1V2), !,
    sillabazione(P, S).
sillabazione([c, r, V|P], [[c,r,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).

sillabazione([g, h, V1, V2|P], [[g,h,V1,V2]|S]):- 
    vocale(V1), vocale(V2), atom_chars(V1V2, [V1,V2]), dittongo(V1V2), !,
    sillabazione(P, S).
sillabazione([g, h, V|P], [[g,h,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).

sillabazione([g, l, V1, V2|P], [[g,l,V1,V2]|S]):- 
    vocale(V1), vocale(V2), atom_chars(V1V2, [V1,V2]), dittongo(V1V2), !,
    sillabazione(P, S).
sillabazione([g, l, V|P], [[g,l,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).

sillabazione([g, n, V1, V2|P], [[g,n,V1,V2]|S]):- 
    vocale(V1), vocale(V2), atom_chars(V1V2, [V1,V2]), dittongo(V1V2), !,
    sillabazione(P, S).
sillabazione([g, n, V|P], [[g,n,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).

sillabazione([p, r, V1, V2|P], [[p,r,V1,V2]|S]):- 
    vocale(V1), vocale(V2), atom_chars(V1V2, [V1,V2]), dittongo(V1V2), !,
    sillabazione(P, S).
sillabazione([p, r, V|P], [[p,r,V]|S]):- 
    vocale(V), !,
    sillabazione(P, S).

sillabazione([s, c, V1, V2|P], [[s,c,V1,V2]|S]):- 
    vocale(V1), vocale(V2), atom_chars(V1V2, [V1,V2]), dittongo(V1V2), !,
    sillabazione(P, S).
sillabazione([s, c, V|P], [[s,c,V]|S]):- 
    vocale(V), (V == e; V == i), !,
    sillabazione(P, S).

sillabazione([r,i,e|P], [[r,i]|S]):-  !,
	sillabazione([e|P], S).
sillabazione([s,C,r,V|P], [[s,C,r,V]|S]):- 
	consonante(C),
	vocale(V), !,
    sillabazione(P, S).
sillabazione([t,r,i|P], [[t,r,i]|S]):-  !,
	sillabazione(P, S).
sillabazione([C, V, C2], [[C,V,C2]]):- 
    vocale(V), consonante(C), consonante(C2), !.
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

sillabazione([C,V1,V2,V3|P], [[C, V1, V2, V3]|S]) :-
    consonante(C), atom_chars(V1V2V3, [V1,V2,V3]), trittongo(V1V2V3), !,
    sillabazione(P, S).
/* aiuola? ko */
sillabazione([V,V1,V2,V3|P], [[V], [V1, V2, V3]|S]) :-
    vocale(V), atom_chars(V1V2V3, [V1,V2,V3]), trittongo(V1V2V3), !,
    sillabazione(P, S).
sillabazione([C,V1,V2|P], [[C, V1, V2]|S]) :-
    consonante(C), atom_chars(V1V2, [V1,V2]), dittongo(V1V2), !,
    sillabazione(P, S).
sillabazione([V,V1,V2|P], [[V],[V1, V2]|S]) :-
    vocale(V), atom_chars(V1V2, [V1,V2]), dittongo(V1V2), !,
    sillabazione(P, S).
sillabazione([C,V1,V2|P], [[C, V1]|S]) :-
    consonante(C), atom_chars(V1V2, [V1,V2]), iato(V1V2), !,
    sillabazione([V2|P], S).
chars_atom(C,A) :- atom_chars(A,C).

sillabazione_parola(Parola, Sillabe):-


	/* converto in minuscolo */
	string_lower(Parola, ParolaMinuscola),
	atom_string(A,ParolaMinuscola),
	
	/* considero solo i primi 20 caratteri */
	string_length(Parola,Length),
	min_list([Length,20], Min),
	string_length(A,Length),
	sub_atom(A,0,Min,_,Arestricted),
	atom_chars(Arestricted, L),
	
	macro_sillabe(L, MacroSillabe),
	maplist(sillabazione, MacroSillabe, L2),
	append(L2,L3),
	maplist(chars_atom,L3, L4),
	atomic_list_concat(L4, '-', Atom),
	atom_string(Atom, Sillabe).

