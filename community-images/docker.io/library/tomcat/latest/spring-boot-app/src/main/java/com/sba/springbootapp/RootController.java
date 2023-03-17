package com.sba.springbootapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RootController {
    public String message;

    @GetMapping("/")
    public RootController GetRoot() {
        this.message = "success";
        return this;
    }
}
