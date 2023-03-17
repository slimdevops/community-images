import java.io.*;
import java.net.*;

public class HelloWorld {
    public static void main(String[] args) throws IOException {
        ServerSocket server = new ServerSocket(8080);
        System.out.println("Listening for connection on port 8080 ....");
        while (true) {
            Socket clientSocket = server.accept();
            OutputStream os = clientSocket.getOutputStream();
            PrintWriter pw = new PrintWriter(os, true);
            pw.println("HTTP/1.1 200 OK");
            pw.println("Content-Type: text/html");
            pw.println("\r\n");
            pw.println("Hello World");
            pw.flush();
            pw.close();
            os.close();
            clientSocket.close();
        }
    }
}