package com.example.lab5_gtics_20182693.controller;
import com.example.lab5_gtics_20182693.entity.Profesionales;
import com.example.lab5_gtics_20182693.repository.AreaRepository;
import com.example.lab5_gtics_20182693.repository.ProfesionalesRepository;
import com.example.lab5_gtics_20182693.repository.SedeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProfesionalesController {

    final ProfesionalesRepository profesionalesRepository;
    final AreaRepository areaRepository;
    final SedeRepository sedeRepository;

    public ProfesionalesController(
            ProfesionalesRepository profesionalesRepository, AreaRepository areaRepository, SedeRepository sedeRepository) {
             this.profesionalesRepository = profesionalesRepository;
             this.areaRepository = areaRepository;
             this.sedeRepository = sedeRepository;
    }

    List<Profesionales> profesionales = new ArrayList<>();

    @GetMapping("/profesionales")
    public String listarProfesionales(Model model) {
        model.addAttribute("profesionales", profesionalesRepository.findAll());
        model.addAttribute("listaAreas", areaRepository.findAll());
        model.addAttribute("listaSedes", sedeRepository.findAll());

        return "profesionales";
    }

    @GetMapping("/profesionales/filtrar")
    public String filtrarProfesionales(
            @RequestParam(value = "nombreProfesional", required = false) String nombreProfesional,
            @RequestParam(value = "idArea", required = false) Integer idArea,
            @RequestParam(value = "idSede", required = false) Integer idSede,
            @RequestParam(value = "fecha", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fecha,
            Model model) {

        List<Profesionales> listaProfesionales = profesionalesRepository.buscarPorNombreAreaSede(nombreProfesional, idArea, idSede, fecha);

        model.addAttribute("listaProfesionales", listaProfesionales);

        model.addAttribute("listaAreas", areaRepository.findAll());
        model.addAttribute("listaSedes", sedeRepository.findAll());

        // Retornar la vista correspondiente
        return "profesionales/gestion_profesionales";
    }


}


