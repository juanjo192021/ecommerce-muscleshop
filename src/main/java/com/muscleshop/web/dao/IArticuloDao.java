package com.muscleshop.web.dao;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.muscleshop.web.models.Articulo;

import java.util.List;

public interface IArticuloDao extends JpaRepository<Articulo, Integer> {

    List<Articulo> findByEstado_Nombre(String nombreEstado);

    List<Articulo> findAllByEstado_NombreOrderByIdDesc(String estadoNombre, Pageable pageable);
}
