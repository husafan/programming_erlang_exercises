-module(shop).
-export([test/0, cost/1, total/1]).

test() ->
    12 = total([{apples, 6}]),
    67 = total([{orange, 3}, {newspaper, 2}, {pears, 4}]),
    tests_worked.

cost(orange) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

total([]) ->
    0;
total([{Item, Count}|Tail]) ->
    cost(Item) * Count + total(Tail).
