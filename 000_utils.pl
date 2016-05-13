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

last_nchar(Atom, N, C) :- sub_atom(Atom, _, N, 0, C).
last_char(Atom, C) :- sub_atom(Atom, _, 1, 0, C).
remove_last_nchar(Atom, N, NewAtom):-
	atom_length(Atom,L),
        L1 is L -N,
        L1 > 0,
	sub_atom(Atom,_,L1,N,NewAtom).


merge_lists(L1, L2, L3):-
	merge_lists(L1, L2, ' ', L3).
merge_lists([], L, _Sep, L).
merge_lists([E1|L1], [E2|L2], Sep, [E|L]):-
	atom_concat(E1, Sep, E1sep),
	atom_concat(E1sep, E2, E),
	merge_lists(L1, L2, Sep, L).

add_prefix_to_list(String, L1, L2):-
	length(L1, N),
	build_list(String, N, List),
	merge_lists(List, L1, '', L2).

add_postfix_to_list(String, L1, L2):-
	length(L1, N),
	build_list(String, N, List),
	merge_lists(L1, List, '', L2).

/*
  ?- build_list("casa",3,L).
L = ["casa", "casa", "casa"].
*/
build_list(X, N, List)  :- 
    length(List, N), 
    maplist(=(X), List).

