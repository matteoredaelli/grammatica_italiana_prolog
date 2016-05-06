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

tipo_coniugazione_verbo(V, C):-
	sub_string(V,_,3,0,C),
	member(C, ["are", "ere", "ire"]).
		   
radice_verbo(V, R):-
	string_length(V,Len),
	Len1 is Len - 3,
	sub_string(V,0,Len1,_,R).

coniugazione_soggetti(['io','tu','egli','noi','voi','essi']).


/*  ************************************************
    modi e tempi
    ************************************************ */
modi_verbali(['indicativo', 'congiuntivo', 'condizionale', 'imperativo', 'infinito', 'participio', 'gerundio']).

tempi_verbali_semplici('indicativo',   ['presente', 'passato remoto', 'futuro semplice']).
tempi_verbali_semplici('congiuntivo',  ['presente', 'imperfetto']).
tempi_verbali_semplici('condizionale', ['presente']).
tempi_verbali_semplici('gerundio',     ['presente']).
tempi_verbali_semplici('imperativo',   ['presente']).
tempi_verbali_semplici('infinito',     ['presente']).
tempi_verbali_semplici('participio',   ['presente']).


tempi_verbali_composti('indicativo',   ['passato prossimo', 'trapassato remoto', 'futuro anteriore']).
tempi_verbali_composti('congiuntivo',  ['passato', 'trapassato']).
tempi_verbali_composti('condizionale', ['passato']).
tempi_verbali_composti('gerundio',     ['passato']).
tempi_verbali_composti('imperativo',   []).
tempi_verbali_composti('infinito',     ['passato']).
tempi_verbali_composti('participio',   ['passato']).


/*  ************************************************
    verbi regolari in ARE: prima coniugazione
    ************************************************ */

postfissi_verbo("are", 'indicativo',  'presente',        ["o", "i", "a", "iamo", "iate", "anno"]).
postfissi_verbo("are", 'indicativo',  'imperfetto',      ["avo", "avi", "ava", "avamo", "avate", "avano"]).
postfissi_verbo("are", 'indicativo',  'passato remoto',  ["iai", "asti", "ò", "ammo", "aste", "arono"]).	      
postfissi_verbo("are", 'indicativo',  'futuro semplice', ["erò", "erai", "erà", "eremo", "erete", "eranno"]).
postfissi_verbo("are", 'condizionale','presente',        ["erei", "eresti", "erebbe", "eremmo", "ereste", "erebbero"]).
postfissi_verbo("are", 'congiuntivo', 'presente',        ["i", "i", "i", "iamo", "iate", "ino"]).
postfissi_verbo("are", 'congiuntivo', 'imperfetto',      ["assi", "assi", "asse", "assimo", "aste", "assero"]).
postfissi_verbo("are", 'gerundio',    'presente',        ["ante"]).
postfissi_verbo("are", 'imperativo',  'presente',        ["--", "a", "i", "iamo", "ate", "ino"]).
postfissi_verbo("are", 'participio',  'presente',        ["ante"]).
postfissi_verbo("are", 'participio',  'passato',         ["ato"]).

/*  ************************************************
    verbi regolari in ERE: seconda coniugazione
    ************************************************ */

postfissi_verbo("ere", 'indicativo',  'presente',        ["o", "i", "e", "iamo", "ete", "ono"]).
postfissi_verbo("ere", 'indicativo',  'imperfetto',      ["evo", "evi", "eva", "evamo", "evate", "evano"]).
postfissi_verbo("ere", 'indicativo',  'passato remoto',  ["ei", "esti", "ette", "emmo", "este", "erono"]).	       
postfissi_verbo("ere", 'indicativo',  'futuro semplice', ["erò", "erai", "erà", "eremo", "erete", "eranno"]).
postfissi_verbo("ere", 'condizionale','presente',        ["erei", "eresti", "erebbe", "eremmo", "ereste", "erebbero"]).
postfissi_verbo("ere", 'congiuntivo', 'presente',        ["a", "a", "a", "iamo", "iate", "ano"]).
postfissi_verbo("ere", 'congiuntivo', 'imperfetto',      ["essi", "essi", "esse", "essimo", "este", "essero"]).
postfissi_verbo("ere", 'gerundio',    'presente',        ["endo"]).
postfissi_verbo("ere", 'imperativo',  'presente',        ["--", "i", "a", "iamo", "ete", "ano"]).
postfissi_verbo("ere", 'participio',  'presente',        ["ente"]).
postfissi_verbo("ere", 'participio',  'passato',         ["uto"]).

/*  ************************************************
    verbi regolari in IRE: terza coniugazione
    ************************************************ */

postfissi_verbo("ire", 'indicativo',  'presente',        ["o", "i", "e", "iamo", "ite", "ono"]).
postfissi_verbo("ire", 'indicativo',  'imperfetto',      ["ivo", "ivi", "iva", "ivamo", "ivate", "ivano"]).
postfissi_verbo("ire", 'indicativo',  'passato remoto',  ["ii", "isti", "ì", "immmo", "iste", "irono"]).	       
postfissi_verbo("ire", 'indicativo',  'futuro semplice', ["irò", "irai", "irà", "iremo", "irete", "iramno"]).
postfissi_verbo("ire", 'condizionale','presente',        ["irei", "iresti", "irebbe", "iremmo", "ireste", "irebbero"]).
postfissi_verbo("ire", 'congiuntivo', 'presente',        ["a", "a", "a", "iamo", "iate", "ano"]).
postfissi_verbo("ire", 'congiuntivo', 'imperfetto',      ["issi", "issi", "isse", "issimo", "iste", "issero"]).
postfissi_verbo("ire", 'gerundio',    'presente',        ["endo"]).
postfissi_verbo("ire", 'imperativo',  'presente',        ["--", "i", "a", "iamo", "ite", "ano"]).
postfissi_verbo("ire", 'participio',  'presente',        ["ente"]).
postfissi_verbo("ire", 'participio',  'passato',         ["ito"]).

/*  ************************************************
    coniugazione verbi
    ************************************************ */

coniugazione_verbo_regolare_tempo_semplice(Verbo, Modo, Tempo, L):-
	tipo_coniugazione(Verbo, Coniugazione),
	tempi_verbali_semplici(Modo, Tempi),
	radice_verbo(Verbo, Radice),
	postfissi_verbo(Coniugazione, Modo, Tempo, L1),
	coniugazione_soggetti(Soggetti),
	merge_lists(Soggetti, L1, L).

coniugazione_verbo_regolare_tempo_composto_per_coniugazione(Coniugazione, Radice, Ausiliare, Modo, Tempo, L):-
	coniugazione_verbo_irregolare(Ausiliare, 'participio', 'passato', [PP]),
	postfissi_verbo(Coniugazione, Modo, Tempo, L1),
	coniugazione_soggetti(Soggetti),
	merge_lists(Soggetti, L1, L).

coniugazione_verbo_regolare_tempo_composto(Verbo, Modo, Tempo, Ausiliare, L):-
	tipo_coniugazione(Verbo, Coniugazione),
	coniugazione_verbo_irregolare(Ausiliare, 'participio', 'passato', [PP]),
	postfissi_verbo(Coniugazione, Modo, Tempo, L1),
	coniugazione_soggetti(Soggetti),
	merge_lists(Soggetti, L1, L).

coniugazione_verbo(Verbo, _Ausiliare, Modo, Tempo, L):-
	coniugazione_verbo_irregolare(Verbo, Modo, Tempo, L), !, .

coniugazione_verbo(Verbo, Ausiliare, Modo, Tempo, L):-
	tipo_coniugazione(Verbo, Coniugazione),
	tempi_verbali_semplici(Modo, Tempi),
	member(Tempo, Tempi), !,
	radice_verbo(Verbo, Radice),
	postfissi_verbo(Coniugazione, Modo, Tempo, L1),
	coniugazione_soggetti(Soggetti),
	merge_lists(Soggetti, L1, L).


coniugazione_verbo(Verbo, Ausiliare, Modo, Tempo, L):-
	tipo_coniugazione(Verbo, Coniugazione),
	tempi_verbali_semplici(Modo, Tempi),
	member(Tempo, Tempi), !,
	radice_verbo(Verbo, Radice),
	postfissi_verbo(Coniugazione, Modo, Tempo, L1),
	coniugazione_soggetti(Soggetti),
	merge_lists(Soggetti, L1, L).
	
	
	
