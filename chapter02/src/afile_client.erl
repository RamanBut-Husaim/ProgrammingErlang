%%%-------------------------------------------------------------------
%%% @author raman
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Mar 2017 11:52 PM
%%%-------------------------------------------------------------------
-module(afile_client).
-author("raman").

%% API
-export([ls/1, get_file/2, put_file/2]).

ls(Server) ->
  Server ! {self(), list_dir},
  receive
    {Server, FileList} ->
      FileList
  end.

get_file(Server, File) ->
  Server ! {self(), {get_file, File}},
  receive
    {Server, Content} ->
      Content
  end.

put_file(Server, File) ->
  Server ! {self(), {put_file, File}},
  receive
    {Server, Result} ->
      Result
  end.
