-module(lesson3_task2).
-export([words/1]).




words(Text) -> words(Text, <<>>, []).

words(<<>>, Word, List) -> reverse([Word|List]);
words(<<$\s, Rest/binary>>, Word, List) -> words(Rest, <<>>, [Word|List]);
words(<<H, Rest/binary>>, Word, List) -> words(Rest, <<Word/binary, H>>, List).


reverse(List)->reverse(List,[]).

reverse([],List)->List;
reverse([H|T],List)->reverse(T,[H|List]).