%%%-------------------------------------------------------------------
%%% @author raman
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Mar 2017 11:39 PM
%%%-------------------------------------------------------------------
-module(afile_server).
-author("raman").

%% API
-export([start/1, loop/1]).

start(Dir) ->
  spawn(afile_server, loop, [Dir]).

loop(Dir) ->
  receive
    {Client, list_dir} ->
      Client ! {self(), file:list_dir(Dir)};
    {Client, {get_file, File}} ->
      Full = filename:join(Dir, File),
      Client ! {self(), file:read_file(Full)};
    {Client, {put_file, File}} ->
      Name = filename:basename(File),
      DestinationPath = filename:join(Dir, Name),
      Client ! {self(), file:copy(File, DestinationPath)}
  end,
  loop(Dir).
