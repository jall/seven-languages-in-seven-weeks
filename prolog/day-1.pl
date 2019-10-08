% Tutorials
% https://learnxinyminutes.com/docs/prolog/
% http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse1

% Support forums
% https://stackoverflow.com/questions/tagged/prolog
% https://www.swi-prolog.org/forum

% Online reference for GNU-prolog 1.4.5
% http://www.gprolog.org/manual/gprolog.html

% Make a simple knowledge base. Represent some of your favorite books and authors.

['data/books.pl'].

% Find all books in your knowledge base written by one author

book(Title, iainMBanks, _).

% Make a knowledge base representing musicians and instruments.Also represent musicians and their genre of music.

['data/musicians.pl'].

% Find all musicians who play the guitar

plays('Guitar', Musician).
