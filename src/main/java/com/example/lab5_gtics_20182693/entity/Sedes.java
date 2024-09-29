package com.example.lab5_gtics_20182693.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "sedes")
@Getter
@Setter
public class Sedes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idSedes")
    private int idSedes;

    @Column(name = "nombreSede", nullable = false, length = 45)
    private String nombreSede;
}