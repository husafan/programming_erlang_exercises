-module(geometry).
-export([test/0, area/1]).

test() ->
    12 = area({rectangle, 3, 4}),
    144 = area({square, 12}),
    12.566370614359172 = area({circle, 2}),
    tests_worked.

area({rectangle, Width, Height}) ->
    Width * Height;
area({square, Size}) ->
    Size * Size;
area({circle, Radius}) ->
    math:pi() * math:pow(Radius, 2).


