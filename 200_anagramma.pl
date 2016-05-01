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

anagramma(Parola, Parole):-
	atom_string(Parola,ParolaAtom),
	atom_chars(ParolaAtom, ListaLettere),
	findall(P, permutation(ListaLettere,P),L),
	maplist(atomic_list_concat, L,L2),
	maplist(atom_string, L2,Parole).
