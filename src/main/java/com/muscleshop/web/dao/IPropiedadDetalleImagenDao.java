package com.muscleshop.web.dao;

import com.muscleshop.web.models.PropiedadDetalleImagen;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IPropiedadDetalleImagenDao extends JpaRepository<PropiedadDetalleImagen, Integer> {

    List<PropiedadDetalleImagen> findByProductoPropiedadesDetalles_IdAndEstado_Id(Integer productoPropiedadesDetallesId, Integer estadoId);
}
