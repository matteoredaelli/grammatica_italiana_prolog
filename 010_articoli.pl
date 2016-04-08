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
articolo_minuscolo('il',determinativo,maschile,singolare).
articolo_minuscolo('lo',determinativo,maschile,singolare).
articolo_minuscolo('la',determinativo,femminile,singolare).
articolo_minuscolo('l\'',determinativo,femminile,singolare).
articolo_minuscolo('i',determinativo,maschile,plurale).
articolo_minuscolo('gli',determinativo,maschile,plurale).
articolo_minuscolo('le',determinativo,femminile,plurale).
articolo_minuscolo('un',indeterminativo,maschile,singolare).
articolo_minuscolo('uno',indeterminativo,maschile,singolare).
articolo_minuscolo('una',indeterminativo,femminile,singolare).
articolo_minuscolo('del',composto,maschile,singolare).
articolo_minuscolo('dell',composto,maschile,singolare).
articolo_minuscolo('dello',composto,maschile,singolare).
articolo_minuscolo('dei',composto,maschile,plurale).
articolo_minuscolo('degli',composto,maschile,plurale).
articolo_minuscolo('della',composto,femminile,singolare).
articolo_minuscolo('dell\'',composto,femminile,singolare).
articolo_minuscolo('delle',composto,femminile,plurale).
articolo_minuscolo('al',composto,maschile,singolare).
articolo_minuscolo('all\'',composto,maschile,singolare).
articolo_minuscolo('allo',composto,maschile,singolare).
articolo_minuscolo('ai',composto,maschile,plurale).
articolo_minuscolo('agli',composto,maschile,plurale).
articolo_minuscolo('alla',composto,femminile,singolare).
articolo_minuscolo('all\'',composto,femminile,singolare).
articolo_minuscolo('alle',composto,femminile,plurale).
articolo_minuscolo('dal',composto,maschile,singolare).
articolo_minuscolo('dall\'',composto,maschile,singolare).
articolo_minuscolo('dallo',composto,maschile,singolare).
articolo_minuscolo('dai',composto,maschile,plurale).
articolo_minuscolo('dagli',composto,maschile,plurale).
articolo_minuscolo('dalla',composto,femminile,singolare).
articolo_minuscolo('dall\'',composto,femminile,singolare).
articolo_minuscolo('dalle',composto,femminile,plurale).
articolo_minuscolo('nel',composto,maschile,singolare).
articolo_minuscolo('nell\'',composto,maschile,singolare).
articolo_minuscolo('nello',composto,maschile,singolare).
articolo_minuscolo('nei',composto,maschile,plurale).
articolo_minuscolo('negli',composto,maschile,plurale).
articolo_minuscolo('nella',composto,femminile,singolare).
articolo_minuscolo('nell\'',composto,femminile,singolare).
articolo_minuscolo('nelle',composto,femminile,plurale).
articolo_minuscolo('col',composto,maschile,singolare).
articolo_minuscolo('coll\'',composto,maschile,singolare).
articolo_minuscolo('collo',composto,maschile,singolare).
articolo_minuscolo('coi',composto,maschile,plurale).
articolo_minuscolo('cogli',composto,maschile,plurale).
articolo_minuscolo('colla',composto,femminile,singolare).
articolo_minuscolo('coll\'',composto,femminile,singolare).
articolo_minuscolo('colle',composto,femminile,plurale).
articolo_minuscolo('sul',composto,maschile,singolare).
articolo_minuscolo('sull\'',composto,maschile,singolare).
articolo_minuscolo('sullo',composto,maschile,singolare).
articolo_minuscolo('sui',composto,maschile,plurale).
articolo_minuscolo('sugli',composto,maschile,plurale).
articolo_minuscolo('sulla',composto,femminile,singolare).
articolo_minuscolo('sull\'',composto,femminile,singolare).
articolo_minuscolo('sulle',composto,femminile,plurale).
articolo_minuscolo('pel',composto,maschile,singolare).
articolo_minuscolo('pei',composto,maschile,plurale).
articolo(A,Type,Sex,SingPlurale):- 
	downcase_atom(A, Aa),
	articolo_minuscolo(Aa,Type,Sex,SingPlurale).
is_articolo(A):- articolo(A, _, _, _).
