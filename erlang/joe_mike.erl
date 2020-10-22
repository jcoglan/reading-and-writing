-module(joe_mike).
-compile(export_all).

% Ctr = spawn(fun() -> counter(0) end).
% [spawn(fun() -> Ctr ! { inc } end) || _ <- lists:seq(1, 1000)]
% Ctr ! { get, self() }.
% flush().
counter(Value) ->
    receive
        { inc } -> counter(Value + 1);
        { get, From } -> From ! Value, counter(Value)
    end.

joe() ->
    receive
        { hello, Mike } ->
            io:format("starting Joe.hello~n"),
            Mike ! { hello, self() },
            io:format("finishing Joe.hello~n");
        { interrupt } ->
            io:format("INTERRUPTING JOE~n")
    end,
    joe().

mike() ->
    receive
        { hello, Joe } ->
            Joe ! { interrupt }
    end,
    mike().
