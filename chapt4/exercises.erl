-module(exercises).
-export([my_tuple_to_list/1, my_time_func/1, my_date_string/1]).

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

%% Formats a Microsecond value as returned by os:timestamp() as a string.
%% Example code taken from the os:timestamp man page.
my_date_string(Timestamp) ->
    {{Year,Month,Day},{Hour,Minute,Second}} =
        calendar:now_to_universal_time(Timestamp),
    MonthString =
        case Month of
            1 -> "Jan";
            2 -> "Feb";
            3 -> "Mar";
            4 -> "Apr";
            5 -> "May";
            6 -> "Jun";
            7 -> "Jul";
            8 -> "Aug";
            9 -> "Sept";
            10 -> "Oct";
            11 -> "Nov";
            12 -> "Dec"
        end,
    io:format("~2w ~s ~4w, ~2w:~2w, ~4w",
              [Day, MonthString, Year, Hour, Minute, Second]).
                
                      
    
    
    
