package com.muscleshop.web.dao;

import java.util.List;

import com.muscleshop.web.models.MenuSub;
import com.muscleshop.web.models.ProductoPropiedadesDetalles;
import com.muscleshop.web.models.dto.PresentacionDto;
import com.muscleshop.web.models.dto.ProductoCategoriaDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IProductoPropiedadesDetallesDao extends JpaRepository<ProductoPropiedadesDetalles, Integer> {

    // Método para buscar categorías de productos por su id de submenú y estado activo
    @Query("SELECT ppd " +
            "FROM ProductoPropiedadesDetalles ppd " +
            "WHERE ppd.producto.id =:productoId " +
            "AND ppd.productoForma.id=:productoFormaId " +
            "AND ppd.producto.estado.nombre = 'Activo' " +
            "AND ppd.estado.nombre = 'Activo'")
    List<ProductoPropiedadesDetalles> findByProductoIdAndProductoFormaId(@Param("productoId") int productoId ,
                                                                                          @Param("productoFormaId") double productoFormaId);
    @Query("SELECT ppd " +
            "FROM ProductoPropiedadesDetalles ppd " +
            "WHERE ppd.producto.id =:productoId " +
            "AND (ppd.precioReducido BETWEEN :minPrecio and :maxPrecio) " +
            "AND ppd.producto.estado.nombre = 'Activo' " +
            "AND ppd.estado.nombre = 'Activo'")
    List<ProductoPropiedadesDetalles> findByProductoIdAndPrecioReducido(@Param("productoId") int productoId ,
                                                                        @Param("minPrecio") double minPrecio,
                                                                        @Param("maxPrecio") double maxPrecio);

    // Método para buscar categorías de productos por su id de submenú y estado activo
    @Query("SELECT DISTINCT new com.muscleshop.web.models.dto.PresentacionDto(" +
                "ppdv.productoPropiedadesDetalles.id, ppdv.productoPropiedadesDetalles.producto.id, " +
                "ppdv.productoPropiedadesDetalles.producto.nombre, ppdv.productoPropiedadesDetalles.producto.url," +
                "ppdv.productoPropiedadesDetalles.producto.estado.nombre,  " +
                "ppdv.productoPropiedadesDetalles.imagen, ppdv.productoPropiedadesDetalles.sku," +
                "ppdv.productoPropiedadesDetalles.stock, ppdv.productoPropiedadesDetalles.precio, " +
                "ppdv.productoPropiedadesDetalles.precioReducido, ppdv.productoPropiedadesDetalles.precioTeam, " +
                "ppdv.productoPropiedadesDetalles.precioTeamVip, ppdv.productoPropiedadesDetalles.precioFamiliar," +
                "ppdv.productoPropiedadesDetalles.estado.nombre ) " +
            "FROM ProductoPropiedadesDetallesVariacion ppdv " +
            "WHERE ppdv.productoVariacion.producto.id = :productoId " +
            "AND ppdv.productoPropiedadesDetalles.estado.id = :estadoId " +
            "AND ppdv.productoPropiedadesDetalles.id IN (" +
                "SELECT ppdv2.productoPropiedadesDetalles.id " +
                "FROM ProductoPropiedadesDetallesVariacion ppdv2 " +
                "WHERE ppdv2.productoVariacion.valor IN (:variacionesValor ) " +
                "GROUP BY ppdv2.productoPropiedadesDetalles.id " +
                "HAVING COUNT(DISTINCT ppdv2.productoVariacion.valor)=:cantidadVariaciones) " +
            "ORDER BY ppdv.productoPropiedadesDetalles.id")
    PresentacionDto findPresentacionByIdProductoAndVariacionesValor(@Param("productoId") int productoId,
                                                                   @Param("variacionesValor") List<String> variacionesValor,
                                                                   @Param("cantidadVariaciones") int cantidadVariaciones,
                                                                   @Param("estadoId") int estadoId);
}
