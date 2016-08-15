%tests
:- begin_tests(vizinhos).
 test(v1)  :- vizinhos([casa(amarela, _, _, _, _), casa(azul, _,_, _, _), casa(vermelho, _, _, _, _), casa(verde, _, _, _, _), casa(branca, _, _, _, _)]).
 test(v2)  :- vizinhos([casa(_, _, _, dunhill, _), casa(azul, _,_, _, _), casa(_, _, leite, _, _), casa(verde, _, _, _, peixes), casa(_, _, cerveja, _, _)]).

 test(v3,  [fail])  :- vizinhos([casa(amarela, _, _, _, _), casa(_, _,agua, _, _), casa(_, _, _, pall_mall, _), casa(verde, _, alemao, _, _), casa(branca, sueco, _, _, _)]).

:- end_tests(vizinhos).

:- begin_tests(a_esquerda).
 test(v1, Rua):- a_esquerda([casa(amarela,_,_,_,_)], [casa(_, _,cha,_,_)], Rua).

 test(v2, [fail]):- a_esquerda([casa(_,_,_,_,cachorros)], [casa(_, _,_,_, peixes)], [casa(_, _, _, _, gatos), casa(_, _, _, _, cavalos), casa(_, _, _, _, passaros), casa(_, _, _, _, peixes), casa(_, _, _, _, cachorros)]).

 test(v3, Rua):- a_esquerda([casa(_,_,_,_,passaros)], [casa(_, _,_,_, peixes)], Rua).


:- end_tests(a_esquerda).

:- begin_tests(ao_lado).
 test(v6, Rua):- ao_lado(casa(_,_,leite,_,_), casa(_, _,_,bluemaster,_), Rua).
 test(v7, Rua, [fail]):- ao_lado(casa(branca,_,_,_,_), casa(vermelho, _,_,_,_), Rua).
 test(v8, Rua):- ao_lado(casa(_,alemao,_,cafe,_), casa(_, _,_,_,passaros), Rua).
:- end_tests(ao_lado).

:- begin_tests(a_direita).
test(v9, Rua):- a_direita(casa(amarela,_,_,_,_), casa(vermelho, _,_,_,_), Rua).
test(v10, Rua):- a_direita(casa(_,sueco,_,_,_), casa(_, _,_,pall_mall,_), Rua).
test(v11, Rua, [fail]):- a_direita(casa(_,dinamarques,_,_,cavalos), casa(_, _,_,_,gatos), Rua).
:- end_tests(a_direita).


vizinhos(Rua):-
	length(Rua,5),
	% com cores diferentes
	member(casa(azul, _, _, _, _), Rua),
	member(casa(vermelho, _, _, _, _), Rua),
	member(casa(branca, _, _, _, _), Rua),
	member(casa(verde, _, _, _, _), Rua),
        member(casa(amarela, _, _, _, _), Rua),
	member(casa(vermelho, ingles, _, _, _), Rua),
	member(casa(_, sueco, _, _, cachorros), Rua),
	member(casa(_,dinamarques, cha, _, _), Rua),
	member(casa(verde,_, cafe, _, _), Rua),
	member(casa(_, _, _, pall_mall, passaros), Rua),
	member(casa(amarela, _, _, dunhill, _), Rua),
	member(casa( _, _, cerveja, bluemaster, _), Rua),
	member(casa( _, alemao, _, prince, _), Rua),
	member(casa( _, _, _, _, peixes), Rua),
	a_esquerda(casa(verde, _, _, _, _), casa(branca, _, _, _, _),Rua),
	ao_lado(casa(_, _, _, blends,_), casa(_, _, _, _, gatos),Rua),
	ao_lado(casa(_, _, _, _, cavalos), casa(_, _, _, dunhill, _),Rua),
	ao_lado(casa(_, noruegues, _, _, _), casa(azul, _, _, _, _),Rua),
	ao_lado(casa(_, _, _, blends,  _), casa(_, _, agua, _, _),Rua),
	Rua = [_, _, casa(_, _, leite, _,_), _, _],
	Rua = [casa(_, noruegues, _, _, _), _, _, _, _],!.

a_direita(A,D, [D,A | _]):-!.
a_direita(A, D, [ _ | AS]):-
	a_direita(A,D,AS).

a_esquerda(A, E,[A,E | _]) :- !.
a_esquerda(A, E , [_| AS]) :-
    a_esquerda(A, E, AS).

ao_lado(A, B, AS) :-
	a_direita(A,B, AS).
ao_lado(A, B, AS) :-
	a_esquerda(A, B, AS).













