package com.example.lab5_gtics_20182693.repository;

import com.example.lab5_gtics_20182693.entity.Profesionales;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ProfesionalesRepository extends JpaRepository<Profesionales, Integer> {


    @Query("SELECT p FROM Profesionales p " +
            "JOIN p.area a " +
            "JOIN p.sede s " +
            "JOIN p.fechaDisponibilidad f " +
            "WHERE (:nombreProfesional IS NULL OR p.nombre LIKE %:nombreProfesional%) " +
            "AND (:idArea IS NULL OR a.idAreas = :idArea) " +
            "AND (:idSede IS NULL OR s.idSedes = :idSede) " +
            "AND (:fechaDisponibilidad IS NULL OR f.fechaDisponibilidad = :fechaDisponibilidad)")
    List<Profesionales> buscarPorNombreAreaSede(@Param("nombre") String nombre,
                                           @Param("idArea") Integer idArea,
                                           @Param("idSede") Integer idSede,
                                           @Param("fechaDisponibilidad") LocalDate fechaDisponibilidad);

}
