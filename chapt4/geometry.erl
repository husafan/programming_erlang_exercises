-module(geometry).
-export([test/0, area/1, perimeter/1]).

test() ->
    12 = area({rectangle, 3, 4}),
    144 = area({square, 12}),
    12.566370614359172 = area({circle, 2}),
    6.0 = area({right_triangle, 3, 4}),
    16 = perimeter({rectangle, 2, 6}),
    8 = perimeter({square, 2}),
    12.566370614359172 = perimeter({circle, 2}),
    12.0 = perimeter({right_triangle, 3, 4}),
    tests_worked.

area({rectangle, Width, Height}) ->
    Width * Height;
area({square, Size}) ->
    Size * Size;
area({circle, Radius}) ->
    math:pi() * math:pow(Radius, 2);
area({right_triangle, Width, Height}) ->
    area({rectangle, Width, Height}) / 2.

perimeter({rectangle, Width, Height}) ->
    (Width * 2) + (Height * 2);
perimeter({square, Size}) ->
    Size * 4;
perimeter({circle, Radius}) ->
    math:pi() * 2 * Radius;
perimeter({right_triangle, Width, Height}) ->
    math:sqrt(math:pow(Width, 2) + math:pow(Height, 2)) + Width + Height.







