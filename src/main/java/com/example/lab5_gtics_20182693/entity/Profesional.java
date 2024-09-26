package com.example.lab5_gtics_20182693.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "profesionales")
public class Profesional {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idProfesionales;

    @Column(nullable = false)
    private String nombre;
    private String descripcionProfesional;
    private String imagen;

    @ManyToOne
    @JoinColumn(name= "idArea")
    private Area area;

    @ManyToOne
    @JoinColumn(name= "idSede")
    private Sede sede;


    private String fechaDisponible;



}
