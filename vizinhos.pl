%Predicado com as permutacaoes possiveis
%aplicaveis a resolucao do conjunto solucao
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

%a_direita(?A,?D,+XS) is semidet,
% Verifica-se a posicao com base na recursao,
% e o caso base do elemento a direita
a_direita(A,D, [D,A | _]):-!.
a_direita(A, D, [ _ | AS]):-
	a_direita(A,D,AS).

%a_esquerda(?A,?D,+XS) is semidet,
% Verifica-se a posicao com base na recursao,
% e o caso base do elemento a esquerda
a_esquerda(A, E,[A,E | _]) :- !.
a_esquerda(A, E , [_| AS]) :-
    a_esquerda(A, E, AS).

%a_esquerda(?A,?D,+XS) is semidet,
% Verifica-se a posicao com base na recursao,
% testando a posicao tanto para esquerda , quanto
% para direita
ao_lado(A, B, AS) :-
	a_direita(A,B, AS).
ao_lado(A, B, AS) :-
	a_esquerda(A, B, AS).

%tests
:- begin_tests(vizinhos).
 test(vizinhos)  :- vizinhos([casa(amarela, _, _, _, _), casa(azul, _,_, _, _), casa(vermelho, _, _, _, _), casa(verde, _, _, _, _), casa(branca, _, _, _, _)]).
 test(vizinhos)  :- vizinhos([casa(_, _, _, dunhill, _), casa(azul, _,_, _, _), casa(_, _, leite, _, _), casa(verde, _, _, _, peixes), casa(_, _, cerveja, _, _)]).
 test(vizinhos,  [fail])  :- vizinhos([casa(amarela, _, _, _, _), casa(_, _,agua, _, _), casa(_, _, _, pall_mall, _), casa(verde, _, alemao, _, _), casa(branca, sueco, _, _, _)]).
:- end_tests(vizinhos).

:- begin_tests(a_esquerda).
test(a_esquerda) :- a_esquerda(1,2,[1,2,3,4,5]).
test(vizinhos, [fail]):- a_esquerda([casa(_,_,_,_,cachorros)], [casa(_, _,_,_, peixes)], [casa(_, _, _, _, gatos), casa(_, _, _, _, cavalos), casa(_, _, _, _, passaros), casa(_, _, _, _, peixes), casa(_, _, _, _, cachorros)]).
:- end_tests(a_esquerda).

:- begin_tests(a_direita).
test(a_direita)   :- a_direita(5, 4, [4, 5, 2, 1]).
test(a_direita, [fail]) :- a_direita(2, 3, [2, 1, 3]).
test(a_direita, X == 1,[fail]) :- a_direita(X, 2, [1, 2, 3]).
:- end_tests(a_direita).

:-begin_tests(ao_lado).
test(ao_lado, all(X == [5])) :- ao_lado(X, 2, [2,5,1,3,4]).
test(ao_lado, all(X == [4,1])) :- ao_lado(X, 3, [2,5,1,3,4]).
:- end_tests(ao_lado).














