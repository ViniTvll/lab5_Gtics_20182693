package com.example.lab5_gtics_20182693.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {



    @GetMapping("/citas")
    public String citas() {
        return "citas";
    }

    @GetMapping("/pacientes")
    public String pacientes() {
        return "pacientes";
    }

    @GetMapping("/foro")
    public String foro() {
        return "foro";
    }

    @GetMapping("/recursos")
    public String recursos() {
        return "recursos";
    }



}
