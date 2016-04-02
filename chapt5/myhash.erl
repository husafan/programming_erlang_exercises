-module(myhash).
-export([test/0, assoc/2, delete/2, count_characters/1]).

test() ->
    Map = #{[1, 2] => 3, "Name" => "Brooke", josh => "Harrison"},
    {error} = assoc("Chewie", Map),
    {ok, "Name", "Brooke"} = assoc("Name", Map),
    #{} = delete("josh", #{"josh" => "Harrison"}),
    tests_worked.

assoc(Key, Map) ->
    case maps:find(Key, Map) of
        error ->
            {error};
        {ok, Result} ->
            {ok, Key, Result}
    end.

delete(Key, Map) ->
    maps:remove(Key, Map).

