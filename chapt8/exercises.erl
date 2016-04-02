-module(exercises).
-export([most_funcs/0, most_common_func/0, unamb_funcs/0, test/0]).
-compile(export_all).

most_funcs() ->
    ExportSizes = lists:map(
                    fun({Module, _}) ->
                            {length(get_exports(Module)), Module} end,
                    code:all_loaded()),
    [H|_] = lists:reverse(
              lists:sort(fun(One, Two) ->
                                 element(1, One) =< element(1, Two) end,
                         ExportSizes)),
    element(2, H).

most_common_func() ->
    maps:fold(
      fun(K, V, {_, Count}) when V > Count ->
              {K, V};
         (_, _, {Func, Count}) ->
              {Func, Count} end,
      {stub, 0},
      get_func_name_count()).

unamb_funcs() ->
    maps:keys(maps:filter(
      fun(_, 1) -> true;
         (_, _) -> false end,
      get_func_name_count())).

test() ->
    Exports = get_exports(exercises),
    6 = length(Exports),
    tests_worked.

get_exports(Module) ->
    element(2, lists:keyfind(exports, 1, Module:module_info())).

get_func_name_count() ->
    get_func_name_count(#{}, code:all_loaded()).

get_func_name_count(#{}=Counts, [CurrentModule|Modules]) ->
    get_func_name_count(Counts, Modules, get_exports(element(1, CurrentModule)));
get_func_name_count(#{}=Counts, []) ->
    Counts.

get_func_name_count(#{}=Counts, Modules, [CurrentFunc|Funcs]) ->
    Count = maps:get(element(1, CurrentFunc), Counts, 0),
    ModifiedCounts =
        maps:put(element(1, CurrentFunc), Count + 1, Counts),
    get_func_name_count(ModifiedCounts, Modules, Funcs);
get_func_name_count(#{}=Counts, Modules, []) ->
    get_func_name_count(Counts, Modules).

