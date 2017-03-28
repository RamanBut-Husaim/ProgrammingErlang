%%%-------------------------------------------------------------------
%%% @author raman
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Mar 2017 10:09 PM
%%%-------------------------------------------------------------------
-module(exercises).
-author("raman").

%% API
-export([reverse_bytes/1]).

reverse_bytes(X) when is_binary(X) ->
  reverse_bytes(X, <<>>).

reverse_bytes(<<>>, Accum) ->
  Accum;
reverse_bytes(<<H:1/binary, T/binary>>, Accum) ->
  reverse_bytes(T, <<H/binary, Accum/binary>>).
