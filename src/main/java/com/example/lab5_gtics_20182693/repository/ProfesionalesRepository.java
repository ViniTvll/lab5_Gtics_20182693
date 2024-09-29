package com.example.lab5_gtics_20182693.repository;

import com.example.lab5_gtics_20182693.entity.Profesionales;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProfesionalesRepository extends JpaRepository<Profesionales, Integer> {

    @Query("SELECT p FROM Profesionales p WHERE p.nombre LIKE %:keyword%")
    List<Profesionales> buscarPorNombre(@Param("keyword") String keyword);
}
