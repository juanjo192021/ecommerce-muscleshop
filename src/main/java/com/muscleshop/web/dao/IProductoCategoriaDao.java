package com.muscleshop.web.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.muscleshop.web.models.dto.ProductoCategoriaDto;
import com.muscleshop.web.models.ProductoCategoria;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface IProductoCategoriaDao extends JpaRepository<ProductoCategoria, Integer> {

    // Método para buscar categorías de productos por su estado activo
    List<ProductoCategoria> findByEstado_Id(int estadoId);

    // Método para buscar una categoría de producto por su id y estado activo
    ProductoCategoria findByIdAndEstado_Id(int id, int estadoId);

    // Método para buscar una categoría de producto por su url y estado activo

    @Query("SELECT new com.muscleshop.web.models.dto.ProductoCategoriaDto(pc.id, pc.nombre, pc.url,ms.id, ms.nombre,ms.url,m.id, m.nombre, m.url, pc.estado.nombre ) " +
            "FROM ProductoCategoria pc " +
            "JOIN MenuSub ms ON pc.menuSub.id = ms.id " +
            "JOIN Menu m on ms.menu.id = m.id " +
            "WHERE pc.url = :categoriaUrl " +
            "AND pc.menuSub.id = :menuSubId " +
            "AND pc.estado.nombre = 'Activo'")
    ProductoCategoriaDto findByUrlAndMenuSub_Id(String categoriaUrl, int menuSubId);

    // Método para buscar categorías de productos por su id de submenú y estado activo
    @Query("SELECT new com.muscleshop.web.models.dto.ProductoCategoriaDto(pc.id, pc.nombre, pc.url,ms.id, ms.nombre,ms.url,m.id, m.nombre, m.url, pc.estado.nombre ) " +
            "FROM ProductoCategoria pc " +
            "JOIN MenuSub ms ON pc.menuSub.id = ms.id " +
            "JOIN Menu m on ms.menu.id = m.id " +
            "WHERE pc.menuSub.id = :menuSubId AND pc.estado.id = :estadoId")
    List<ProductoCategoriaDto> findByMenuSub_IdAndEstado_Id(@Param("menuSubId") int menuSubId,@Param("estadoId") int estadoId);

    // Método para obtener categorías de productos por su id de menú y estado
    List<ProductoCategoria> findByMenuSub_Menu_IdAndEstado_Id(int menuId, int estadoId);

    // Método para buscar categorías de productos activas por su id de submenú y estado activo
    @Query("SELECT pc FROM ProductoCategoria pc WHERE pc.menuSub.id IN :menuSubIds AND pc.estado.id = :estadoId")
    List<ProductoCategoria> findActiveProductCategories(@Param("menuSubIds") List<Integer> menuSubIds, @Param("estadoId") int estadoId);
}
