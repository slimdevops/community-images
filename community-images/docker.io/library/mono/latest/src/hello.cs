using System;
using System.Net;
using System.Text;
using System.Threading.Tasks;

class Program
{
    static void Main(string[] args)
    {
        var listener = new HttpListener();
        listener.Prefixes.Add("http://127.0.0.1:8080/");
        listener.Start();
        Console.WriteLine("Listening on http://127.0.0.1:8080/");

        Task.Run(async () =>
        {
            while (true)
            {
                var context = await listener.GetContextAsync();
                var response = context.Response;
                var buffer = Encoding.UTF8.GetBytes("Hello, World!");
                response.ContentLength64 = buffer.Length;
                response.ContentType = "text/plain";
                await response.OutputStream.WriteAsync(buffer, 0, buffer.Length);
                response.Close();
            }
        }).Wait();
    }
}