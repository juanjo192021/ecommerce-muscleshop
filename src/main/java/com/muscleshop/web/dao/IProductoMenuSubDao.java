package com.muscleshop.web.dao;

import com.muscleshop.web.models.ProductoMenuSub;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IProductoMenuSubDao extends JpaRepository<ProductoMenuSub, Integer> {

    @Query("SELECT pms FROM ProductoMenuSub pms " +
            "WHERE pms.producto.mostrar = 'si' " +
            "AND pms.producto.estado.nombre = 'Activo' " +
            "AND pms.productoCategoria.id IN ( " +
            "    SELECT MIN(innerPms.productoCategoria.id) " +
            "    FROM ProductoMenuSub innerPms " +
            "    WHERE innerPms.producto.estado.nombre = 'Activo' " +
            "    AND innerPms.producto.mostrar = 'si' " +
            "    AND innerPms.producto.id = pms.producto.id" +
            "    AND innerPms.producto.estado.nombre = 'Activo' " +
            ") " +
            "ORDER BY pms.producto.prioridad asc")
    List<ProductoMenuSub> findByProductos();


    @Query("SELECT pms FROM ProductoMenuSub pms " +
            "WHERE pms.productoCategoria.menuSub.id = :menuSubId " +
            "AND pms.producto.estado.nombre = 'Activo' " +
            "AND pms.producto.mostrar = 'si' " +
            "AND pms.producto.estado.nombre = 'Activo' " +
            "AND pms.productoCategoria.id IN ( " +
            "    SELECT MIN(innerPms.productoCategoria.id) " +
            "    FROM ProductoMenuSub innerPms " +
            "    WHERE innerPms.productoCategoria.menuSub.id = :menuSubId" +
            "    AND innerPms.productoCategoria.id = pms.productoCategoria.id" +
            "    AND innerPms.producto.estado.nombre = 'Activo' " +
            "    AND innerPms.producto.mostrar = 'si' " +
            "    AND innerPms.producto.estado.nombre = 'Activo' " +
            ") " +
            "ORDER BY pms.producto.prioridad asc")
    List<ProductoMenuSub> findByProductoCategoria_MenuSub_Id(int menuSubId);

    @Query("SELECT pms FROM ProductoMenuSub pms " +
            "WHERE pms.productoCategoria.id = :productoCategoriaId " +
            "AND pms.producto.estado.nombre = 'Activo' " +
            "AND pms.producto.mostrar = 'si' " +
            "AND pms.producto.estado.nombre = 'Activo' " +
            "ORDER BY pms.producto.prioridad asc")
    List<ProductoMenuSub> findByProductoCategoria_Id(int productoCategoriaId);


    @Query("SELECT pms FROM ProductoMenuSub pms " +
            "JOIN ProductoObjetivo po on po.producto.id = pms.producto.id " +
            "WHERE po.objetivo.id = :objetivoId " +
            "AND pms.producto.estado.nombre = 'Activo' " +
            "AND pms.producto.mostrar = 'si' " +
            "AND pms.producto.estado.nombre = 'Activo' " +
            "AND pms.productoCategoria.id IN ( " +
            "    SELECT MIN(innerPms.productoCategoria.id) " +
            "    FROM ProductoMenuSub innerPms " +
            "    JOIN ProductoObjetivo innerPo on innerPo.producto.id = innerPms.producto.id" +
            "    WHERE innerPo.objetivo.id = :objetivoId" +
            "    AND innerPms.producto.id = pms.producto.id " +
            "    AND innerPms.producto.estado.nombre = 'Activo' " +
            "    AND innerPms.producto.mostrar = 'si' " +
            "    AND innerPms.producto.estado.nombre = 'Activo' " +
            ") " +
            "ORDER BY pms.producto.prioridad asc")
    List<ProductoMenuSub> findByObjetivoId(int objetivoId);

    @Query("SELECT pms FROM ProductoMenuSub pms " +
            "WHERE pms.producto.marca.id = :marcaId " +
            "AND pms.producto.estado.nombre = 'Activo' " +
            "AND pms.producto.mostrar = 'si' " +
            "AND pms.producto.estado.nombre = 'Activo' " +
            "AND pms.productoCategoria.id IN ( " +
            "    SELECT MIN(innerPms.productoCategoria.id) " +
            "    FROM ProductoMenuSub innerPms " +
            "    WHERE innerPms.producto.marca.id = :marcaId" +
            "    AND innerPms.producto.id = pms.producto.id " +
            "    AND innerPms.producto.estado.nombre = 'Activo' " +
            "    AND innerPms.producto.mostrar = 'si' " +
            "    AND innerPms.producto.estado.nombre = 'Activo' " +
            ") " +
            "ORDER BY pms.producto.prioridad asc")
    List<ProductoMenuSub> findByMarcaId(int marcaId);

    @Query("SELECT pms FROM ProductoMenuSub pms " +
            "WHERE LOWER(pms.producto.nombre) " +
            "LIKE LOWER(CONCAT('%', :productoNombre, '%')) " +
            "AND pms.producto.estado.nombre = 'Activo' " +
            "AND pms.producto.mostrar = 'si' " +
            "AND pms.productoCategoria.estado.nombre = 'Activo' " +
            "AND pms.productoCategoria.id IN ( " +
            "    SELECT MIN(innerPms.productoCategoria.id) " +
            "    FROM ProductoMenuSub innerPms " +
            "    WHERE LOWER(innerPms.producto.nombre) " +
            "    LIKE LOWER(CONCAT('%', :productoNombre, '%')) " +
            "    AND innerPms.producto.estado.nombre = 'Activo' " +
            "    AND innerPms.producto.mostrar = 'si' " +
            "    AND innerPms.productoCategoria.estado.nombre = 'Activo' " +
            ") " +
            "ORDER BY pms.producto.prioridad ASC")
    List<ProductoMenuSub> findByNombreProducto(String productoNombre);

}
