%rainhas_p(?Q) is nondet
%Permuta as possiveis posicoes de 0 a 8 e verifica
%se a solucao esta dentro do conjuto solucao
rainhas_p(Q) :-
 permutation([1,2,3,4,5,6,7,8], Q),
 is_solucao(Q).

%caso base para o predicado is_solucao
is_solucao([]).

% is_solucao(?Q) is semidet.
% Caso nao haja diagonais conflitantes
% retorna verdadeiro, nao ocorrem conflitos entre
% as posicoes das rainhas, em relacao a diagonal, linha e coluna.
is_solucao([X|XS]) :-
 is_solucao(XS),
 is_posicao_valida(X,XS,1).

%caso base para o predicado is_posicao_valida
is_posicao_valida(_,[],_).

% is_posicao_valida(+O, +Lista, +Q) is semidet.
% a cada iteracao a posicao Y altera-se ate completar
% todas as 8 posicoes conflitantes, como cada rainha
% esta em uma coluna diferente, entao
% Y - Y1 =\= cooredenada atual
is_posicao_valida(Y,[Y1|YS],D) :-
 Y1-Y=\=D,
 Y-Y1=\=D,
 D1 is D + 1,
 is_posicao_valida(Y,YS,D1).

%tests
:- begin_tests(rainhas_p).
test(rainhas, [nondet]) :- rainhas_p([1, 6, 8, 3, 7, 4, 2, 5]).
test(rainhas, [nondet]) :- rainhas_p([1, 7, 5, 8, 2, 4, 6, 3]).
test(rainhas, [nondet]) :- rainhas_p([2, 5, 7, 1, 3, 8, 6, 4]).
test(rainhas, [nondet]) :- rainhas_p([2, 7, 3, 6, 8, 5, 1, 4]).
test(rainhas, [nondet]) :- rainhas_p([2, 8, 6, 1, 3, 5, 7, 4]).
test(rainhas, [nondet]) :- rainhas_p([3, 1, 7, 5, 8, 2, 4, 6]).
test(rainhas, [nondet]) :- rainhas_p([3, 7, 2, 8, 5, 1, 4, 6]).
test(rainhas, [nondet]) :- rainhas_p([3, 7, 2, 8, 6, 4, 1, 5]).
test(rainhas, [nondet]) :- rainhas_p([4, 1, 5, 8, 2, 7, 3, 6]).
test(rainhas, [nondet]) :- rainhas_p([4, 2, 7, 3, 6, 8, 5, 1]).
test(rainhas, [nondet]) :- rainhas_p([4, 6, 8, 3, 1, 7, 5, 2]).
test(rainhas, [nondet]) :- rainhas_p([5, 7, 2, 6, 3, 1, 8, 4]).
test(rainhas, [nondet]) :- rainhas_p([5, 8, 4, 1, 7, 2, 6, 3]).
test(rainhas, [nondet]) :- rainhas_p([6, 3, 5, 7, 1, 4, 2, 8]).
test(rainhas, [nondet]) :- rainhas_p([6, 8, 2, 4, 1, 7, 5, 3]).
test(rainhas, [nondet]) :- rainhas_p([7, 3, 8, 2, 5, 1, 6, 4]).
test(rainhas, [nondet]) :- rainhas_p([7, 5, 3, 1, 6, 8, 2, 4]).
test(rainhas, [nondet]) :- rainhas_p([8, 2, 4, 1, 7, 5, 3, 6]).
test(rainhas, [nondet]) :- rainhas_p([8, 4, 1, 3, 6, 2, 7, 5]).
test(rainhas, [nondet], [fail]) :- rainhas_p([2, 1, 3, 4, 5, 6, 7, 8]).
test(rainhas, [nondet], [fail]) :- rainhas_p([3, 4, 2, 1, 6, 8, 5, 7]).
test(rainhas, [nondet], [fail]) :- rainhas_p([3, 3 ,3, 3, 3, 3, 3, 3]).
test(rainhas, [nondet], [fail]) :- rainhas_p([2, 1, 2, 4, 5, 6, 7, 8]).
test(rainhas, [nondet], [fail]) :- rainhas_p([1, 2, 3, 4, 5, 6, 7, 8]).
:- end_tests(rainhas_p).







