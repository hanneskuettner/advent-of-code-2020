:- [lib].

at_pos(Ls, L, P) :- 
  nth0(P1, Ls, X),
  P is P1+1,
  X = L.

valid(Pl, Pw) :-
  get_policy_first(Pl, P1),
  get_policy_second(Pl, P2),
  get_policy_letter(Pl, L),
  ((at_pos(Pw, L, P1), not(at_pos(Pw, L, P2)));
   (at_pos(Pw, L, P2), not(at_pos(Pw, L, P1)))).

?- show_valids.