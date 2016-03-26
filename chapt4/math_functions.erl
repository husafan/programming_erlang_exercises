-module(math_functions).
-export([test/0, even/1, odd/1, filter/2,
        split/1, split1/1, split2/1]).

test() ->
    true = even(68),
    false = even(69),
    true = odd(69),
    false = odd(68),
    [2,4,6] = filter(fun even/1, [1, 2, 3, 4, 5, 6, 7]),
    {[1,3,5],[2,4,6]} = split([1, 2, 3, 4, 5, 6]),
    {[1,3,5],[2,4,6]} = split1([1, 2, 3, 4, 5, 6]),
    {[1,3,5],[2,4,6]} = split2([1, 2, 3, 4, 5, 6]),
    tests_worked.

even(Number) when Number rem 2 =:= 0 ->
    true;
even(_) ->
    false.

odd(Number) when Number rem 2 =:= 1 ->
    true;
odd(_) ->
    false.

filter(Func, List) ->
    filter_helper(Func, List, []).
filter_helper(Func, [Head|Tail], Accum) ->
    case Func(Head) of
        true ->
            filter_helper(Func, Tail, [Head|Accum]);
        false ->
            filter_helper(Func, Tail, Accum)
    end;
filter_helper(_, [], Accum) ->
    lists:reverse(Accum).

split(List) ->
    split_helper(List, fun split_guard/3, [], []).
split1(List) ->
    split_helper(List, fun split_filter/3, [], []).
split2(List) ->
    split_helper(List, fun split_case/3, [], []).
    
split_helper(List, Func, Odds, Evens) ->
    Func(List, Odds, Evens).

split_guard([Head|Tail], Odds, Evens) when Head rem 2 =:= 0 ->
    split_guard(Tail, Odds, [Head|Evens]);
split_guard([Head|Tail], Odds, Evens) ->
    split_guard(Tail, [Head|Odds], Evens);
split_guard([], Odds, Evens) ->
    {lists:reverse(Odds), lists:reverse(Evens)}.

split_filter(List, _, _) ->
    {filter(fun odd/1, List), filter(fun even/1, List)}.

split_case([Head|Tail], Odds, Evens) ->
    case Head rem 2 of
        0 ->
            split_case(Tail, Odds, [Head|Evens]);
        1 ->
            split_case(Tail, [Head|Odds], Evens)
    end;
split_case([], Odds, Evens) ->
    {lists:reverse(Odds), lists:reverse(Evens)}.

