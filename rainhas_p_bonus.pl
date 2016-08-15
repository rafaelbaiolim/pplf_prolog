%rainhas_p_bonus(?Q,+N) is nondet
% numlist(+low,+high,-list) cria uma lista de 0 a N e referencia em XS
%Permuta as possiveis posicoes de 1 a N e verifica
%se a solucao esta dentro do conjuto solucao
rainhas_p_bonus(Q,N) :-
  numlist(1, N, XS),
  permutation(XS, Q),
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

:- begin_tests(rainhas_p_bonus).
test(rainhas_p_bonus, [nondet]):- rainhas_p_bonus([1, 4, 7, 3, 6, 2, 5], 7).
test(rainhas_p_bonus, [nondet]):- rainhas_p_bonus([3, 1, 6, 4, 2, 7, 5], 7).
test(rainhas_p_bonus, [nondet]):- rainhas_p_bonus([3, 6, 2, 5, 1, 4], 6).
test(rainhas_p_bonus, [nondet]):- rainhas_p_bonus([5, 3, 1, 6, 4, 2], 6).
test(rainhas_p_bonus, [nondet]):- rainhas_p_bonus([1, 7, 4, 8, 3, 9, 6, 2, 5], 9).
test(rainhas_p_bonus, [nondet]):- rainhas_p_bonus([3, 7, 4, 2, 9, 5, 1, 8, 6], 9).
test(rainhas_p_bonus, [nondet], [fail]):- rainhas_p_bonus([3,6,1,4,2,7,5], 7).
test(rainhas_p_bonus, [nondet], [fail]):- rainhas_p_bonus([3,6,1,4,2,7], 6).
test(rainhas_p_bonus, [nondet], [fail]):- rainhas_p_bonus([3, 7, 1, 2, 9, 5, 4, 8, 6], 9).
test(rainhas_p_bonus, [nondet], [fail]):- rainhas_p_bonus([1,2,3,4,5,6,7,8], 8).
:- end_tests(rainhas_p_bonus).









