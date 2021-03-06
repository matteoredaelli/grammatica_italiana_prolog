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

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_client)).
:- use_module(library(uri)).

:- use_module(library(http/json)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_unix_daemon)).
:- initialization http_daemon.

:- http_handler('/anagramma', http_get_anagramma, []).
:- http_handler('/parola', http_get_parola, []).
:- http_handler('/sillabazione', http_get_sillabazione, []).

:- consult('go').
:- main.

http_get_anagramma(Request) :-
    http_parameters(Request,
            [
             parola(NameString,   [])
            ]),
    string_lower(NameString, NameStringLowercase),
    read_term_from_atom(NameStringLowercase, Name, []),
    anagramma(Name, Result),
    prolog_to_json(json([parola=Name,anagrammi=Result]), Json),
    reply_json(Json).

http_get_parola(Request) :-
    http_parameters(Request,
            [
             parola(NameString,   [])
            ]),
    string_lower(NameString, NameStringLowercase),
    read_term_from_atom(NameStringLowercase, Name, []),
    parola(Name, Result0),
    tipo_parola(Result0, Result),
    prolog_to_json(json([parola=Name,tipo=Result]), Json),
    reply_json(Json).

http_get_sillabazione(Request) :-
    http_parameters(Request,
            [
             parola(NameString,   [])
            ]),
    string_lower(NameString, NameStringLowercase),
    read_term_from_atom(NameStringLowercase, Name, []),
    sillabazione_parola(Name, Sillabe),
    prolog_to_json(json([word=Sillabe]), Json),
    reply_json(Json).
