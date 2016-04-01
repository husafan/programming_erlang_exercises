-module(exercises).
-export([test/0, term_to_packet/1, reverse_bits/1]).

test() ->
    <<"bc">> = reverse_bytes(<<"cb">>),
    Term = {foo, "BarBaz"},
    <<Size:32, Data/binary>> = term_to_packet(Term),
    18 = Size,
    {foo, "BarBaz"} = binary_to_term(Data),
    Term = packet_to_term(term_to_packet(Term)),
    tests_worked.

reverse_bytes(Bin) ->
    binary:list_to_bin(lists:reverse(binary:bin_to_list(Bin))).

reverse_bits(Bin) ->
    BinList = binary:bin_to_list(<< <<X>> || <<X:1>> <= Bin >>),
    << <<X:1>> || X <- lists:reverse(BinList) >>.

term_to_packet(Term) ->
    Binary = term_to_binary(Term),
    Size = byte_size(Binary),
    <<Size:4/unit:8, Binary:Size/binary>>.

packet_to_term(<<Size:4/unit:8, Data:Size/binary>>) ->
    binary_to_term(Data).


    
