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
congiunzione_minuscola('anzi',semplice).
congiunzione_minuscola('che',semplice).
congiunzione_minuscola('dunque',semplice).
congiunzione_minuscola('e',semplice).
congiunzione_minuscola('inoltre',semplice).
congiunzione_minuscola('né',semplice).
congiunzione_minuscola('o',semplice).
congiunzione_minuscola('però',semplice).

congiunzione_minuscola('affinché',composta).
congiunzione_minuscola('allorché',composta).
congiunzione_minuscola('dopoché',composta).
congiunzione_minuscola('eppure',composta).
congiunzione_minuscola('giacché',composta).
congiunzione_minuscola('oppure',composta).
congiunzione_minuscola('perché',composta).
congiunzione_minuscola('purché',composta).

congiunzione_minuscola('con tutto ciò','locuzione congiuntiva').
congiunzione_minuscola('di modo che','locuzione congiuntiva').
congiunzione_minuscola('in quanto che','locuzione congiuntiva').

congiunzione_minuscola('anche','congiunzione coordinativa copulativa').
congiunzione_minuscola('e','congiunzione coordinativa copulativa').
congiunzione_minuscola('neanche','congiunzione coordinativa copulativa').
congiunzione_minuscola('neppure','congiunzione coordinativa copulativa').

congiunzione_minuscola('o','congiunzione coordinativa disgiuntiva').
congiunzione_minuscola('ossi','congiunzione coordinativa disgiuntiva').
congiunzione_minuscola('oppure','congiunzione coordinativa disgiuntiva').
congiunzione_minuscola('ovvero','congiunzione coordinativa disgiuntiva').

congiunzione_minuscola('anzi','congiunzione coordinativa avversiva').
congiunzione_minuscola('ma','congiunzione coordinativa avversiva').
congiunzione_minuscola('però','congiunzione coordinativa avversiva').
congiunzione_minuscola('tuttavia','congiunzione coordinativa avversiva').

congiunzione_minuscola('cioè','congiunzione coordinativa dichiarativa').
congiunzione_minuscola('infatti','congiunzione coordinativa dichiarativa').
congiunzione_minuscola('ossia','congiunzione coordinativa dichiarativa').

congiunzione_minuscola('dunque','congiunzione coordinativa conclusiva').
congiunzione_minuscola('quindi','congiunzione coordinativa conclusiva').
congiunzione_minuscola('perciò','congiunzione coordinativa conclusiva').

congiunzione_minuscola('che','congiunzione subordinativa dichiarativa').
congiunzione_minuscola('come','congiunzione subordinativa dichiarativa').

congiunzione_minuscola('finché','congiunzione subordinativa temporale').
congiunzione_minuscola('mentre','congiunzione subordinativa temporale').
congiunzione_minuscola('quando','congiunzione subordinativa temporale').

congiunzione_minuscola('affinché','congiunzione subordinativa finale').
congiunzione_minuscola('perché','congiunzione subordinativa finale').

congiunzione_minuscola('perché','congiunzione subordinativa causale').
congiunzione_minuscola('poiché','congiunzione subordinativa causale').
congiunzione_minuscola('siccome','congiunzione subordinativa causale').

congiunzione_minuscola('così che','congiunzione subordinativa consecutiva').
congiunzione_minuscola('tanto che','congiunzione subordinativa consecutiva').

congiunzione_minuscola('come','congiunzione subordinativa modale').

congiunzione_minuscola('più che','congiunzione subordinativa comparativa').
congiunzione_minuscola('tanto che','congiunzione subordinativa comparativa').

congiunzione_minuscola('quantunque','congiunzione subordinativa concessiva').
congiunzione_minuscola('sebbene','congiunzione subordinativa concessiva').

congiunzione_minuscola('purché','congiunzione subordinativa condizionale').
congiunzione_minuscola('qualora','congiunzione subordinativa condizionale').
congiunzione_minuscola('se','congiunzione subordinativa condizionale').

congiunzione_minuscola('come','congiunzione subordinativa interrogativa').
congiunzione_minuscola('perché','congiunzione subordinativa interrogativa').
congiunzione_minuscola('se','congiunzione subordinativa interrogativa').

congiunzione_minuscola('fuorché','congiunzione subordinativa eccettuativa').
congiunzione_minuscola('tranne che','congiunzione subordinativa eccettuativa').

congiunzione(A,Type):- 
	downcase_atom(A, Aa),
	congiunzione_minuscola(Aa,Type).

is_congiunzione(A):- congiunzione(A, _).
