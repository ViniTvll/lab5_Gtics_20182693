package com.example.lab5_gtics_20182693.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "sedes")
public class Sede {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idSedes;

    @Column(nullable = false)
    private String nombreSede;

}
