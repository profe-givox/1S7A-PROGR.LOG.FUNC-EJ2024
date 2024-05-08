:- use_module(library(pce)).

% Definir el predicado principal que crea y muestra la ventana
main :-
    new(@main, dialog('Ventana de ejemplo')),
    send(@main, append, new(@texto, text_item('Ingrese texto aquí:'))),
    send(@main, append, button(ok, message(@prolog, procesar))),
    send(@main, append, button(cancel, message(@main, destroy))),
    send(@main, open).

% Predicado para procesar la entrada del usuario
procesar :-
    get(@texto, selection, Texto),
    writeln('Texto ingresado:'),
    writeln(Texto).
    %halt. % Terminar la ejecución cuando se presiona el botón "ok"
