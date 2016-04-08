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
preposizione_minuscola('di', semplice).
preposizione_minuscola('a', semplice).
preposizione_minuscola('da', semplice).
preposizione_minuscola('in', semplice).
preposizione_minuscola('con', semplice).
preposizione_minuscola('su', semplice).
preposizione_minuscola('per', semplice).
preposizione_minuscola('tra', semplice).
preposizione_minuscola('fa', semplice).
preposizione_minuscola(P, articolata):- articolo_minuscolo(P,composto,_,_).
preposizione(L, Type) :-
        downcase_atom(L, Low),
        preposizione_minuscola(Low, Type).

is_preposizione(L):- preposizione(L, _Type).
