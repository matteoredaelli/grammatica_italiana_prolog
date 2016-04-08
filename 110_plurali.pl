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
plurale('il','i').
plurale('lo','gli').
plurale('la','le').
plurale('lo','i').
plurale('un','dei').
plurale('una','delle').
plurale('del','dei').
plurale('dell\'','degli').
plurale('dell\'','delle').
plurale('dello','degli').
plurale('della','delle').
plurale('al','ai').
plurale('all\'','agli').
plurale('allo','agli').
plurale('alla','alle').
plurale('all\'','alle').
plurale('dal','dai').
plurale('dall\'','dagli').
plurale('dallo','dagli').
plurale('dalla','dalle').
plurale('dall\'','dalle').
plurale('nel','nei').
plurale('nell\'','negli').
plurale('nello','negli').
plurale('nella','nelle').
plurale('nell\'','nelle').
plurale('col','coi').
plurale('coll\'','cogli').
plurale('collo','cogli').
plurale('colla','colle').
plurale('coll\'','colle').
plurale('sul','sui').
plurale('sull\'','sugli').
plurale('sullo','sugli').
plurale('sulla','sulle').
plurale('sull\'','sulle').
plurale('pel','pei').

plurale('ala','ali').
plurale('amico','amici').
plurale('aparago','aparagi').
plurale('astrologo','astrologi').
plurale('auto','auto').
plurale('barabba','barabba').
plurale('boia','boia').
plurale('cinema','cinema').
plurale('chirurgo','chirurghi').
plurale('dinamo','dinamo').
plurale('dio','dei').
plurale('effigie','effigi').
plurale('frutta','frutta').
plurale('gorgo','gorghi').
plurale('gorilla','gorilla').
plurale('mancia','mance').
plurale('moglie','mogli').
plurale('paria','paria').
plurale('porco','porci').
plurale('procaccia','procaccia').
plurale('teologo','teologi').
plurale('radio','radio').
plurale('scheggia','schegge').
plurale('sosia','sosia').
plurale('superficie','superfici').
plurale('tempio','templi').
plurale('vaglia','vaglia').
plurale('zio','zii').
plurale(P, P):- last_char(P, i).
plurale(P, P):- last_char(P, 'à').
plurale(P, P):- last_char(P, 'è').
plurale(P, P):- last_char(P, 'ì').
plurale(P, P):- last_char(P, 'ò').
plurale(P, P):- last_char(P, 'ù').
plurale(P, P):- last_char(P, 'à').
plurale(P, P):- last_char(P, L), is_consonante(L), !, true.
plurale(P, P):- last_nchar(P, 2, 'ie'), !, true.
/*
TODO: machile o femminile
*/
plurale(P, P1):- last_nchar(P, 2, 'ca'), !,
                 remove_last_nchar(P, 2, P0),
                 atom_concat(P0, che, P1).
plurale(P, P1):- last_nchar(P, 2, 'ga'), !,
                 remove_last_nchar(P, 2, P0),
                 atom_concat(P0, ghe, P1).
plurale(P, P1):- last_nchar(P, 2, 'co'), 
                 remove_last_nchar(P, 2, P0),
                 last_char(P0, L),
                 is_consonante(L), !,
                 atom_concat(P0, chi, P1).
plurale(P, P1):- last_nchar(P, 2, 'go'),
                 remove_last_nchar(P, 2, P0),
                 last_char(P0, L),
                 is_consonante(L), !,
                 atom_concat(P0, ghi, P1).

/*
todo: monosillabi tipo zio, zii
*/
plurale(P, P1):- last_nchar(P, 2, 'io'), !,
                 remove_last_nchar(P, 1, P1).
plurale(P, P1):- last_char(P, C), 
                 member(C, [e,o]), !,
                 remove_last_nchar(P, 1, P0),
                 atom_concat(P0, i, P1).
