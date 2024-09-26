package com.example.lab5_gtics_20182693.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("")
    public String inicio(){

        return "navbar";
    }

}
