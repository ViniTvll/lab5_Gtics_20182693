package com.example.lab5_gtics_20182693.controller;
import com.example.lab5_gtics_20182693.entity.Profesionales;
import com.example.lab5_gtics_20182693.repository.ProfesionalesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProfesionalesController {

    final ProfesionalesRepository profesionalesRepository;

    public ProfesionalesController(ProfesionalesRepository profesionalesRepository) {this.profesionalesRepository = profesionalesRepository;}

    List<Profesionales> profesionales = new ArrayList<>();

    @GetMapping("/profesionales")
    public String listarProfesionales(

            Model model) {
        model.addAttribute("profesionales", profesionalesRepository.findAll());
        return "profesionales";
    }
}


