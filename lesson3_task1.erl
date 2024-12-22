-module(lesson3_task1).
-export([first_word/1]).




first_word(Text) -> first_word(Text, <<>>).

first_word(<<>>, Text) -> Text;
first_word(<<$\s, _/binary>>, Text) -> Text;
first_word(<<H, Rest/binary>>, Text) -> first_word(Rest, <<Text/binary, H>>).