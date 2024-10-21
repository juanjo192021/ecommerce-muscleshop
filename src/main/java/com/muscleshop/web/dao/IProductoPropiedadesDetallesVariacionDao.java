package com.muscleshop.web.dao;

import com.muscleshop.web.models.ProductoPropiedadesDetalles;
import com.muscleshop.web.models.ProductoPropiedadesDetallesVariacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IProductoPropiedadesDetallesVariacionDao extends JpaRepository<ProductoPropiedadesDetallesVariacion, Integer> {

    @Query("SELECT ppdv FROM ProductoPropiedadesDetallesVariacion ppdv " +
            "WHERE ppdv.productoPropiedadesDetalles.id IN :productoPropiedadesDetallesIds")
    List<ProductoPropiedadesDetallesVariacion> findActiveProductoPropiedadesDetallesVariaciones(@Param("productoPropiedadesDetallesIds") List<Integer> productoPropiedadesDetallesIds);

    List<ProductoPropiedadesDetallesVariacion> findByProductoPropiedadesDetalles_Id(Integer productoPropiedadesDetallesId);

}
