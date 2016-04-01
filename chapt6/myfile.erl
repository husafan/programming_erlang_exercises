-module(myfile).
-export([test/0, read/1]).

test() ->
    try read("nonexistent")
    catch
        throw:{error, _} ->
            tests_worked
    end.
            

read(Filename) ->
    case file:read_file(Filename) of
        {error, Reason} ->
            throw({error, Reason});
        {ok, Binary} ->
            {ok, Binary}
    end.
    
