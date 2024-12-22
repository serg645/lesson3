-module(lesson3_task3).
-export([split/2]).




split(Text, Sep) -> split(Text, <<>>, [], Sep, first(Sep)).

split(<<>>, Word, List, Sep, First) -> reverse([Word|List]);
split(<<First, Rest/binary>>, Word, List, Sep, First) ->
  case [First|firsts_in_bitstring(Rest, len(Sep)-1)] == Sep of
    true -> split(trim(Rest, len(Sep)-2), <<>>, [Word|List], Sep, First);
    false -> split(Rest, <<Word/binary, First>>, List, Sep, First)
  end;
split(<<H, Rest/binary>>, Word, List, Sep, First) -> split(Rest, <<Word/binary, H>>, List, Sep, First).


reverse(List)->reverse(List,[]).

reverse([],List)->List;
reverse([H|T],List)->reverse(T,[H|List]).


first([H|T]) -> H.


firsts_in_bitstring(Text, Len) -> firsts_in_bitstring(Text, [], Len).

firsts_in_bitstring(Text, Acc, 0) -> reverse(Acc);
firsts_in_bitstring(<<H, Rest/binary>>, Acc, N) -> firsts_in_bitstring(Rest, [H|Acc], N-1).


firsts_in_list(Text, Len) -> firsts_in_list(Text, [], Len).

firsts_in_list(Text, Acc, 0) -> reverse(Acc);
firsts_in_list([H|T], Acc, N) -> firsts_in_list(T, [H|Acc], N-1).


trim(<<H, Rest/binary>>, 0) -> Rest;
trim(<<H, Rest/binary>>, Len) -> trim(Rest, Len-1).


len([])->0;
len([H|T])->1+len(T).