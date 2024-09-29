package com.example.lab5_gtics_20182693.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "fechas")
@Getter
@Setter
public class Fechas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idFechas")
    private int idFechas;

    @Column(name = "fechaDisponibilidad", nullable = false)
    private LocalDate fechaDisponibilidad;

    @ManyToOne
    @JoinColumn(name = "idProfesional", nullable = false)
    private Profesionales profesional;
}
