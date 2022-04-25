% -------- COSTANTS --------
team(bufali; tigri; iene; coccodrilli; leoni).
points(9..13).
captain(antonio; luca; maurizio; paolo; tommaso).
class(a4; b4; c4; a5; b5).

% -------- MODELS PRODUCTION --------
1 { elem(Team, Points, Captain, Class) : points(Points), captain(Captain), class(Class)} 1 :-
    team(Team).

elem_per_class(Class, Count) :-
    Count = #count{Team, Points, Captain : elem(Team, Points, Captain, Class)}, elem(_, _, _, Class).

elem_per_captain(Captain, Count) :-
    Count = #count{Team, Points, Class : elem(Team, Points, Captain, Class)}, elem(_, _, Captain, _).

elem_per_points(Points, Count) :-
    Count = #count{Team, Points, Class : elem(Team, Points, Captain, Class)}, elem(_, Points, _, _).

:- elem_per_class(_, Count), Count != 1.
:- elem_per_captain(_, Count), Count != 1.
:- elem_per_points(_, Count), Count != 1.

% -------- CONSTRAINTS --------

% Constraints derived from point 1)
:- elem(_, _, tommaso, b5).
:- elem(iene, _, _, c4).
:- elem(coccodrilli, _, paolo, _).
:- elem(bufali, _, luca, _).
:- elem(bufali, _, maurizio, _).
:- elem(tigri, _, luca, _).
:- elem(tigri, _, maurizio, _).
:- elem(bufali, 11, _, _).
:- elem(tigri, 11, _, _).
:- elem(_, 11, maurizio, _).
:- elem(_, 11, luca, _).

% 'La squadra della 5B ha un punto in più di quella di Tommaso'
:- not elem(_, Points1, _, b5), elem(_, Points2, tommaso, _), Points1 = Points2 + 1.

% 'La squadra della 5B ha un punto in meno di quella della 4A'
:- not elem(_, Points1, _, b5), elem(_, Points2, _, a4), Points1 = Points2 - 1.

% 'La squadra di Antonio non è a 12 punti nè a 10'
:- elem(_, 12, antonio, _).
:- elem(_, 10, antonio, _).

% 'Il capitano delle Iene è uno fra Antonio e Tommaso'
:- elem(iene, _, luca, _).
:- elem(iene, _, maurizio, _).
:- elem(iene, _, paolo, _).

% 'Le iene hanno un punto in più della squadra della 4C'
plus_x_1(Team1, Class2):- elem(Team1, Points1, _, _), elem(_, Points2, _, Class2), Points1 = Points2 + 1.
:- not plus_x_1(iene, c4).

% 'La squadra della 4C non è capitanata da Luca'
:- elem(_, _, luca, c4).

% 'Le iene hanno un punto in meno delle tigri'
:- not elem(iene, Points1, _, _), elem(tigri, Points2, _, _), Points1 = Points2 - 1.

% 'La squadra di Paolo ha un punto in meno dei coccodrilli'
:- not elem(_, Points1, paolo, _), elem(coccodrilli, Points2, _, _), Points1 = Points2 - 1.

% 'La squadra di Paolo ha un punto in più della squadra della 5A'
:- not elem(_, Points1, paolo, _), elem(_, Points2, _, a5), Points1 = Points2 + 1.


#show elem/4.


