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

:- http_handler(root(hello_world), say_hi, []).
:- http_handler('/sillabazione', http_get_sillabazione, []).

/*
server(Port) :-
    %% load edges from a csv file
    http_server(http_dispatch, [port(Port)]).
*/
:- consult('go').
:- main.

http_get_sillabazione(Request) :-
    http_parameters(Request,
            [
             parola(NameString,   [])
            ]),
    read_term_from_atom(NameString, Name, []),
    sillabazione_parola(Name, Sillabe),
    prolog_to_json(json([word=Sillabe]), Json),
    reply_json(Json).