-module(exercises).
-export([map_search/2, test/0]).

test() ->
    TestMap = #{name => "Joshua", age => 36},
    {name, "Joshua"} = map_search(TestMap, fun find_josh/2),
    none_found = map_search(TestMap, fun(_, _) -> false end),
    tests_worked.
    
find_josh(name, "Joshua") -> true;
find_josh(_, _) -> false.

map_search(Map, Pred) ->
    map_search_helper(maps:keys(Map), Map, Pred).
map_search_helper([Head|Tail], Map, Pred) ->
    case Pred(Head, maps:get(Head, Map)) of
        true ->
            {Head, maps:get(Head, Map)};
        false ->
            map_search_helper(Tail, Map, Pred)
    end;
map_search_helper([], _, _) ->
    none_found.
