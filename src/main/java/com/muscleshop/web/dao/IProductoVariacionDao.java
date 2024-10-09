package com.muscleshop.web.dao;

import com.muscleshop.web.models.ProductoPropiedadesDetallesVariacion;
import com.muscleshop.web.models.ProductoVariacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IProductoVariacionDao extends JpaRepository<ProductoVariacion, Integer> {
    List<ProductoVariacion> findByProducto_Id(Integer productoId);

    @Query("SELECT pv FROM ProductoVariacion pv " +
            "WHERE pv.id IN :productoVariacionesIds")
    List<ProductoVariacion> findActiveProductoVariaciones(@Param("productoVariacionesIds") List<Integer> productoVariacionesIds);
}
