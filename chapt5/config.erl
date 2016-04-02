-module(config).
-export([read_config/1]).

read_file(Name) ->
    file:read_file(Name).

get_json({ok, Binary}) ->
    {json, maps:from_json(Binary)};
get_json({Error, Reason}) ->
    {Error, Reason}.

read_config(Filename) ->
    get_json(read_file(Filename)).
