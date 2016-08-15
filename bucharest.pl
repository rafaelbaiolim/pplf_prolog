%distancia(?C, ?D) tal que D representa a distância de C
%até Bucharest , em linha reta.
distancia(arad, 366).
distancia(bucharest, 0).
distancia(craiova, 160).
distancia(dobreta, 242).
distancia(eforie, 161).
distancia(fagaras, 178).
distancia(giurgiu, 77).
distancia(hirsova, 151).
distancia(iasi, 226).
distancia(lugoj, 244).
distancia(mehadia, 241).
distancia(neamt, 234).
distancia(oradea, 380).
distancia(pitesti, 98).
distancia(rimnicu_vilcea, 193).
distancia(sibiu, 253).
distancia(timisoara, 329).
distancia(urziceni, 80).
distancia(vaslui, 199).
distancia(zerind, 374).
vizinho(arad, [zerind, sibiu, timisoara]).
vizinho(bucharest, [pitesti, giurgiu, urziceni, fagaras]).
vizinho(craiova, [dobreta, rimnicu_vilcea, pitesti]).
vizinho(dobreta, [mehadia, craiova]).
vizinho(eforie, [hirsova]).
vizinho(fagaras, [bucharest, sibiu]).
vizinho(giurgiu, [bucharest]).
vizinho(hirsova, [eforie, urziceni]).
vizinho(iasi, [vaslui, neamt]).
vizinho(lugoj, [mehadia, timisoara]).
vizinho(mehadia, [dobreta, lugoj]).
vizinho(neamt, [iasi]).
vizinho(oradea, [zerind, sibiu]).
vizinho(pitesti, [bucharest, rimnicu_vilcea, craiova]).
vizinho(rimnicu_vilcea, [sibiu, pitesti, craiova]).
vizinho(sibiu, [rimnicu_vilcea, fagaras, arad, oradea]).
vizinho(timisoara, [lugoj, arad]).
vizinho(urziceni, [bucharest, hirsova]).
vizinho(vaslui, [urziceni, iasi]).
vizinho(zerind, [oradea, arad]).

% busca(+L, +Inicio, ?Fim) is semidet.
% Retorna a lista com o caminho da cidade Inicio até Bucharest.
% recursivamente ocorre o append da lista solucao, caso a cidade nao
% seja bucharest, a concateção da lista ocorre no segundo predicado
% melhor_vizinho(+Lista, +Inicio, +Fim) , enquanto a cidade nao for bucharest.
melhor_vizinho(XS, S, F) :-
	vizinho(S, A),
	melhor(A, M),
	M == bucharest,
	append(XS, [M], F).

melhor_vizinho(XS, S, F) :-
	vizinho(S, A),
	melhor(A, M),
	M \= bucharest,
	append(XS, [M], LS),
	melhor_vizinho(LS, M, F).

%Caso base menor distancia
melhor([A], A).

% melhor(+L, ?M) is det.
% Encontra o menor elemento da lista,
% no predicado a comparação é feita relativa a distancia
% das cidade fornecidas pela tabela.
melhor([A, B | C], M) :-
	distancia(A, X),
	distancia(B, Y),
	X < Y, !,
	melhor([A | C], M).

%Recursoa para percorrer o resto da lista
% e pegar o vizinho de melhor distancia
melhor([_ , B | C], M) :-
	melhor([B | C], M).


%melhor_caminho(+O,+C) is nondet
%Caso base cidade de bucharest encontrada
melhor_caminho(bucharest, [bucharest]) :- !.
melhor_caminho(O, C) :-
	melhor_vizinho([O], O, C),!.

:- begin_tests(melhor_caminho).
test(melhor_caminho, [nondet]) :- melhor_caminho(bucharest, [bucharest]).
test(melhor_caminho, [nondet]) :- melhor_caminho(arad, [arad, sibiu, fagaras,bucharest]).
test(melhor_caminho, [nondet]) :- melhor_caminho(urziceni, [urziceni, bucharest]).
test(melhor_caminho, [nondet]) :- melhor_caminho(craiova, [craiova,pitesti,bucharest]).
test(melhor_caminho, [nondet]) :- melhor_caminho(dobreta, [dobreta,craiova,pitesti,bucharest]).
test(melhor_caminho, [nondet]) :- melhor_caminho(timisoara, [timisoara,lugoj,mehadia,dobreta,craiova,pitesti,bucharest]).
:- end_tests(melhor_caminho).

%tests
:- begin_tests(melhor).
test(melhor, [nondet]) :- melhor([8, 5, 2 , 1], 1).
test(melhor, [nondet]) :- melhor([1], 1).
test(melhor, [fail])   :- melhor([8, 5, 2 , 1], 5).
test(melhor, [fail])   :- melhor([], _).
:- end_tests(melhor).




