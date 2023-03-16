package com.bincoder.demo.controller;

// Importing required classes
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DemoController {
    @RequestMapping("/")
    @ResponseBody

    // Method
    public String helloWorld() {
        return "Hello, World!";
    }
}