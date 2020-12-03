:- use_module(library(pio)).

% parsing
rules([])     --> call(eos), !.
rules([R|Rs]) --> rule(R), rules(Rs).

eos([], []).

rule((Pl, Pw)) --> policy_string(Pl), ": ", letters(Pw), ( "\n" ; call(eos) ).

policy_string(policy(Min, Max, Letter)) --> integer(Min), "-", integer(Max), " ", letter(Letter).

integer(I) -->
        digit(D0),
        digits(D),
        { number_codes(I, [D0|D]) }.


digits([D|T]) --> digit(D), !, digits(T).
digits([]) --> [].
digit(D) --> [D], { code_type(D, digit) }.


letters([L|Ls]) --> letter(L), !, letters(Ls).
letters([]) --> [].
letter(C) --> [X], { code_type(X, alpha) }, { char_code(C, X) }.



% policy
get_policy_first(policy(M, _, _), M).
get_policy_second(policy(_, M, _), M).
get_policy_letter(policy(_, _, L), L).


% count valid passwords
count_valids([], 0).
count_valids([(Pl, Pw)|T], N0) :-
  valid(Pl, Pw),
  count_valids(T, N1),
  N0 is N1+1.
count_valids([(Pl, Pw)|T], N0) :-
  not(valid(Pl, Pw)),
  count_valids(T, N0).

% output

show_valids :-
    phrase_from_file(rules(Rs), 'input.txt'),
    count_valids(Rs, C),
    write(C), nl,
    fail.

show_valids.