char('A').
char('B').
char('C').
char('D').
char('E').
char('F').
char('G').
char('H').
char('I').
char('J').
char('K').
char('L').
char('M').
char('N').
char('O').
char('P').
char('Q').
char('R').
char('S').
char('T').
char('U').
char('V').
char('W').
char('X').
char('Y').
char('Z').


all_space(X1, X2, X3, X4, X5) :- char(X1), char(X2), char(X3), char(X4), char(X5).

correct_spot(X1, X2, X3, X4, X5) :- all_space(X1, X2, X3, X4, X5),
    X1 = 'W',
    X2 = 'H'.

wrong_spot1(X1, X2, X3, X4, X5) :- all_space(X1, X2, X3, X4, X5), X3 = 'A'.
wrong_spot1(X1, X2, X3, X4, X5) :- all_space(X1, X2, X3, X4, X5), X4 = 'A'.

wrong_spot2(X1, X2, X3, X4, X5) :- all_space(X1, X2, X3, X4, X5), X3 = 'K'.
wrong_spot2(X1, X2, X3, X4, X5) :- all_space(X1, X2, X3, X4, X5), X4 = 'K'.
wrong_spot2(X1, X2, X3, X4, X5) :- all_space(X1, X2, X3, X4, X5), X5 = 'K'.

wrong_spot(X1, X2, X3, X4, X5) :- all_space(X1, X2, X3, X4, X5),
    wrong_spot1(X1, X2, X3, X4, X5),
    wrong_spot2(X1, X2, X3, X4, X5).


never_char('D').
never_char('E').
never_char('G').
never_char('I').
never_char('L').
never_char('N').
never_char('O').
never_char('Q').
never_char('R').
never_char('S').
never_char('T').
never_char('U').

never(X1, X2, X3, X4, X5) :- all_space(X1, X2, X3, X4, X5),
    not(never_char(X1)),
    not(never_char(X2)),
    not(never_char(X3)),
    not(never_char(X4)),
    not(never_char(X5)).

candidate(X1, X2, X3, X4, X5) :- never(X1, X2, X3, X4, X5), correct_spot(X1, X2, X3, X4, X5), wrong_spot(X1, X2, X3, X4, X5).


wordle :- forall(candidate(X1, X2, X3, X4, X5), (write(X1), write(X2), write(X3), write(X4), write(X5), write("\n"))).
