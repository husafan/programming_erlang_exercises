-module(mylists).
-export([test_sum/0, test_map/0, sum/1, map/2]).

test_sum() ->
    12 = sum([2, 4, 5, 1]),
    tests_worked.

test_map() ->
    [2, 4, 6] = map(fun(X) -> (X * 2) end, [1, 2, 3]),
    tests_worked.

sum([]) ->
    0;
sum([Head|Tail]) ->
    Head + sum(Tail).

map(_, []) ->
    [];
map(Func, [Head|Tail]) ->
    [Func(Head) | map(Func, Tail)].
    
