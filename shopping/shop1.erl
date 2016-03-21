-module(shop1).
-export([total/1]).
-import(lists, [map/2, sum/1]).

total(L) ->
    sum(map(fun({Item, Count}) ->
                    shop:cost(Item) * Count end, L)).



