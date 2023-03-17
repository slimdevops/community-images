using System;
using System.IO;

public class HelloWorld
{
    public static void Main(string[] args)
    {
        File.Copy("hello.aspx", "project/hello.aspx");
        Console.WriteLine ("Hello Mono World");
    }
}