use Socket;

my $port = 8080;
my $protocol = getprotobyname( "tcp" );

socket( SOCK, PF_INET, SOCK_STREAM, $protocol ) or die "couldn't open a socket: $!";
setsockopt( SOCK, SOL_SOCKET, SO_REUSEADDR, 1 ) or die "couldn't set socket options: $!";
bind( SOCK, sockaddr_in($port, INADDR_ANY) ) or die "couldn't bind socket to port $port: $!";


listen( SOCK, SOMAXCONN ) or die "couldn't listen to port $port: $!";

while( accept(CLIENT, SOCK) ){
  print CLIENT "HTTP/1.1 200 OK\r\n" .
               "Content-Type: text/html; charset=UTF-8\r\n\r\n" .
               "Hello World!";
  close CLIENT;
}