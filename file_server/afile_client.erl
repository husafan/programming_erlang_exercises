-module(afile_client).
-export([ls/1, get_file/2, put_file/3]).

ls(Server) ->
    Server ! {self(), list_dir},
    receive
        {Server, Filelist} ->
            Filelist
    end.

get_file(Server, File) ->
    Server ! {self(), {get_file, File}},
    receive
        {Server, Contents} ->
            Contents
    end.

put_file(Server, File, Bin) ->
    Server ! {self(), {put_file, File, Bin}},
    receive
        {Server, Result} ->
            Result
    end.
