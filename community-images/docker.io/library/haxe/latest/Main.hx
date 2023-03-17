import sys.net.Socket;
import sys.net.Host;

class Main {
	static function main() {
		var socket = new Socket();

		socket.bind(new Host("0.0.0.0"), 8080);
		socket.listen(50);

		while (true) {
			var connection = socket.accept();
			connection.setFastSend(true);
			connection.setBlocking(false);
			connection.waitForRead();
			connection.output.writeString("HTTP/1.1 200 OK\r\n\r\nsuccess");
			connection.output.flush();
			connection.output.close();
		}
	}
}
