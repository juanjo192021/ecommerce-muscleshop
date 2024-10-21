package com.muscleshop.web.dao;

import com.muscleshop.web.models.ProductoMenuSub;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IProductoMenuSubDao extends JpaRepository<ProductoMenuSub, Integer> {
    List<ProductoMenuSub> findByProductoCategoria_MenuSub_IdAndProductoCategoria_MenuSub_Estado_Id_AndProductoCategoria_Estado_Id(int menuSubId, int menuSubEstadoId, int productoCategoriaEstadoId);
    List<ProductoMenuSub> findByProductoCategoria_MenuSub_Id(int menuSubId);
    List<ProductoMenuSub> findByProductoCategoria_Id(int productoCategoriaId);
}
