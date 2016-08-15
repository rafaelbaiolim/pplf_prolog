% fatos conhecidos 
criminoso(ana, A):- ana \= A.
criminoso(bruno, carlos).
criminoso(carlos, daniel).
criminoso(daniel, A):- A \= daniel.

%% solucao(?C, ?V) is semidet.
%% Encontra C como criminoso e V como , quem fala verdade
%% para cada C em Grupo , faz o backtrack verificando
%% se a condicao unifica, para evitar redundancias , usou-se
%% o setof , garantindo que os elementos nunca se repitam
solucao(C, V):-
	Grupo = [ana, bruno, carlos, daniel],
	member(C, Grupo),
	setof(X, criminoso(X,C),[V]),!.

%tests
:- begin_tests(solucao).
test(solucao) :- solucao(ana, daniel).
test(solucao, C == ana):- solucao(C, daniel).
test(solucao, V == daniel):- solucao(ana, V).
test(solucao, [fail]) :- solucao(daniel, _).
test(solucao, [fail]) :- solucao(carlos, _).
test(solucao, [fail]) :- solucao(bruno, _).
test(solucao, [fail]) :- solucao(ana, ana).
test(solucao, [fail]) :- solucao(daniel, daniel).
test(solucao, [fail]) :- solucao(bruno, bruno).
test(solucao, [fail]) :- solucao(carlos, carlos).
test(solucao, [fail]) :- solucao(ana, bruno).
test(solucao, [fail]) :- solucao(ana, carlos).
:- end_tests(solucao).
