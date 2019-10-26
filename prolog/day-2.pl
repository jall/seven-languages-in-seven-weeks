% Fibonacci
% https://gist.github.com/hoelzro/3973656
% https://www.swi-prolog.org/pldoc/man?section=tabling-memoize
fib(0, 1) :- !.
fib(1, 1) :- !.
fib(N, F) :-
  N > 1,
  N1 is N-1,
  N2 is N-2,
  fib(N1, F1),
  fib(N2, F2),
  F is F1+F2.

% A real-world community using Prolog. What problems are they solving with it today?
% https://www.quora.com/What-is-Prolog-used-for-today

% An implementation of the Towers of Hanoi. How does it work?
% https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_3.html
% Recursive solution - here's a handy breakdown of the three sub-problems being solved at each level
% https://en.wikipedia.org/wiki/Tower_of_Hanoi#/media/File:Tower_of_Hanoi_recursion_SMIL.svg
% Useful insight - any disk larger than the ones in the current stack you're trying to move
% effectively doesn't exist in the next recursive call of the algorithm, because any smaller disk can be placed on it
% (i.e. it's effectively the same as the floor).

% What are some of the problems of dealing with “not” expressions? Why do you have to be careful with negation in Prolog?
% http://www.cse.unsw.edu.au/~billw/dictionaries/prolog/negation.html
% TL;DR Prolog can only try to prove something from the rules it knows, and if that fails the expression is false.
% Easy to miss out a rule and invalidate this 'negation as failure' approach.

% Reverse the elements of a list.
rev([First|[]]) :- [First].
rev([First|Rest], Reversed) :- append(rev(Rest), First, Reversed).

% Find the smallest element of a list.
smallest(List, Smallest) :-
  List = [First|_],
  smallest(List, First, Smallest).

smallest([], Smallest, Smallest).

smallest([First|Rest], Candidate, Smallest) :-
  Candidate =< First,
  smallest(Rest, Candidate, Smallest).

smallest([First|Rest], Candidate, Smallest) :-
  Candidate > First,
  smallest(Rest, First, Smallest).

% Sort the elements of a list.
sorted([], []).
sorted(List, Sorted) :-
  smallest(List, Smallest),
  select(Smallest, List, Rest),
  sorted(Rest, SortedRest),
  append([Smallest], SortedRest, Sorted).
