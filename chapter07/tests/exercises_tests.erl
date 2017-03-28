%%%-------------------------------------------------------------------
%%% @author raman
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Mar 2017 10:17 PM
%%%-------------------------------------------------------------------
-module(exercises_tests).
-author("raman").

-include_lib("eunit/include/eunit.hrl").

-import(exercises, [reverse_bytes/1]).

reverse_bytes_WhenTheEmptyBinaryIsPassed_ShouldReturnEmptyBinary_test() ->
  Data = <<>>,
  Expected = <<>>,
  ?assertEqual(Expected, reverse_bytes(Data)).

reverse_bytes_WhenTheBinaryIsPassed_ShouldReverseBytesInBinary_test() ->
  Data = <<1, 2, 3>>,
  Expected = <<3, 2, 1>>,
  ?assertEqual(Expected, reverse_bytes(Data)).
