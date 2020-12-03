:- [lib].

% count letters
count_letters(_, [], 0).
count_letters(L, [X|Xs], N0) :-
  X = L,
  count_letters(L, Xs, N1),
  N0 is N1+1.
count_letters(L, [X|Xs], N0) :-
  not(X = L),
  count_letters(L, Xs, N0).

% test
valid(Pl, Pw) :-
  get_policy_first(Pl, Min),
  get_policy_second(Pl, Max),
  get_policy_letter(Pl, L),
  count_letters(L, Pw, C),
  C >= Min,
  C =< Max.


?- show_valids.