-module(lib_misc).
-export([for/3, odds_and_evens/1, odds_and_evens1/1]).

for(Max, Max, Func) ->
    [Func(Max)];
for(Counter, Max, Func) ->
    [Func(Counter)|for(Counter + 1, Max, Func)].

odds_and_evens(List) ->
    odds_and_evens_helper(List, [], []).

odds_and_evens_helper([H|Tail], Odds, Evens) ->
    case H rem 2 of
        0 ->
            odds_and_evens_helper(Tail, Odds, [H|Evens]);
        1 ->
            odds_and_evens_helper(Tail, [H|Odds], Evens)
    end;
odds_and_evens_helper([], Odds, Evens) ->
    {Odds, Evens}.


odds_and_evens1(List) ->
    odds_and_evens_helper1(List, [], []).
odds_and_evens_helper1([H|Tail], Odds, Evens) when H rem 2 =:= 0 ->
    odds_and_evens_helper1(Tail, Odds, [H|Evens]);
odds_and_evens_helper1([H|Tail], Odds, Evens) ->
    odds_and_evens_helper1(Tail, [H|Odds], Evens);
odds_and_evens_helper1([], Odds, Evens) ->
    {Odds, Evens}.





