package com.example.lab5_gtics_20182693.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "areas")
@Getter
@Setter
public class Areas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idAreas")
    private int idAreas;

    @Column(name = "nombreArea", nullable = false, length = 45)
    private String nombreArea;
}
