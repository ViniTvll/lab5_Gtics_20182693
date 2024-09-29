package com.example.lab5_gtics_20182693.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "profesionales")
@Getter
@Setter
public class Profesionales {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idProfesionales")
    private int idProfesionales;

    @Column(name = "nombre", nullable = false, length = 45)
    private String nombre;

    @Column(name = "imagen", nullable = false, length = 45)
    private String imagen;

    @Column(name = "descripcionProfesional", nullable = false, length = 90)
    private String descripcionProfesional;

    @ManyToOne
    @JoinColumn(name = "idArea", nullable = false)
    private Areas area;

    @ManyToOne
    @JoinColumn(name = "idSede", nullable = false)
    private Sedes sede;
}

