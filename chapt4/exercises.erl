-module(exercises).
-export([my_tuple_to_list/1, my_time_func/1]).

my_tuple_to_list(Tuple) ->
    my_tuple_to_list_helper(Tuple, []).
my_tuple_to_list_helper(Tuple, List) when size(Tuple) > 0 ->
    my_tuple_to_list_helper(
      erlang:delete_element(1, Tuple), [element(1, Tuple)|List]);
my_tuple_to_list_helper({}, List) ->
    lists:reverse(List).

%% This function should be equivalent to timer:tc.
my_time_func(Func) ->
    Start = erlang:timestamp(),
    Value = Func(),
    {timer:now_diff(erlang:timestamp(), Start), Value}.

    
