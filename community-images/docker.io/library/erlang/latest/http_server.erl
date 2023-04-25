-module(hello).
-export([main/1]).

main(_) ->
    {ok, Sock} = gen_tcp:listen(8080, [{active, false}]), 
    io:format("Server started on 8080"),
    spawn(fun () ->loop(Sock) end),
    receive
        stop -> ok
    end.
 

loop(Sock) ->
    {ok, Conn} = gen_tcp:accept(Sock),
    Handler = spawn(fun () -> handle(Conn) end),
    gen_tcp:controlling_process(Conn, Handler),
    loop(Sock).

handle(Conn) ->
    gen_tcp:send(Conn, response("Hello World!")),
    gen_tcp:close(Conn).

response(Str) ->
    B = iolist_to_binary(Str),
    iolist_to_binary(
      io_lib:fwrite(
         "HTTP/1.0 200 OK\nContent-Type: text/html\nContent-Length: ~p\n\n~s",
         [size(B), B])).