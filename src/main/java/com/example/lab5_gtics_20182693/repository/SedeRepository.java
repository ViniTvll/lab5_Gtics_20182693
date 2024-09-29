package com.example.lab5_gtics_20182693.repository;

import com.example.lab5_gtics_20182693.entity.Profesionales;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SedeRepository extends JpaRepository<Profesionales, Integer> {
}
