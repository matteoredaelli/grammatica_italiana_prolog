#!/usr/bin/swipl -q -s -t main

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

main:- 
	load_files('000_utils'),
	load_files('010_lettere'),
	load_files('010_articoli'),
	load_files('010_congiunzioni'),
	load_files('010_preposizioni'),
	load_files('020_sillabazione'),
	load_files('020_verbi_irregolari'),
	load_files('030_verbi'),
	load_files('100_parole'),
	load_files('110_plurali'),
	load_files('200_anagramma').
