-module(lib_misc).
-export([for/3]).

for(Max, Max, Func) ->
    [Func(Max)];
for(Counter, Max, Func) ->
    [Func(Counter)|for(Counter + 1, Max, Func)].
