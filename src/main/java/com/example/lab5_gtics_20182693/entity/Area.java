package com.example.lab5_gtics_20182693.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "areas")
public class Area {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idAreas;

    @Column(nullable = false)
    private String nombreArea;

}
