require 'socket'

server = TCPServer.new(8080)

loop do
  client = server.accept

  request = client.gets
  puts request

  client.puts "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Connection: close\r\n\r\n" +
               "Hello, World!"

  client.close
end