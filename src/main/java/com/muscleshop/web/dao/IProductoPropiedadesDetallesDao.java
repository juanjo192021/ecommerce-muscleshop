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

    List<ProductoPropiedadesDetalles> findByProductoForma_IdAndProductoForma_Estado_IdAndEstado_Id(int productoFormaId,int productoFormaEstadoId, int estadoId);

    /*@Query("select ppd from ProductoPropiedadesDetalles ppd " +
            "join PropiedadesDetalles pd on ppd.propiedadesDetalles.id=pd.id " +
            "join Detalles d on pd.detalles.id=d.id " +
            "join Producto  p on ppd.producto.id=p.id " +
            "join ProductoCategoria  pc on p.productoCategoria.id= pc.id "+
            "join MenuSub ms on pc.menuSub.id=ms.id " +
            "where ms.url=:menuSubUrl and p.estado.id=:estado")
    List<ProductoPropiedadesDetalles> findByMenuSubUrl(@Param("menuSubUrl") String menuSubUrl,
                                                       @Param("estado") Integer estado);

    @Query("select ppd from ProductoPropiedadesDetalles ppd " +
            "join PropiedadesDetalles pd on ppd.propiedadesDetalles.id=pd.id " +
            "join Detalles d on pd.detalles.id=d.id " +
            "join Producto  p on ppd.producto.id=p.id " +
            "join ProductoCategoria  pc on p.productoCategoria.id= pc.id "+
            "where pc.url=:categoriaUrl and p.estado.id=:estado")
    List<ProductoPropiedadesDetalles> findByCategoriaUrl(@Param("categoriaUrl") String categoriaUrl,
                                                         @Param("estado") Integer estado);


    @Query("select ppd from ProductoPropiedadesDetalles ppd " +
            "join PropiedadDetalleImagen pdi on ppd.id=pdi.productoPropiedadDetalle.id " +
            "where ppd.producto.id=:productoId and ppd.propiedadesDetalles.id =:propiedadesDetallesId and ppd.propiedadesDetalles2.id=:propiedadesDetallesId2")
    ProductoPropiedadesDetalles findByPropiedadesDetallesAndProductoId(@Param("productoId") Integer productoId,
                                                                       @Param("propiedadesDetallesId") Integer propiedadesDetallesId,
                                                                       @Param("propiedadesDetallesId2") Integer propiedadesDetallesId2);
*/
/*
    //Filtrar una lista de productos por precio mínimo, precio máximo, id del submenú y id de sus propiedades
    @Query("SELECT ppd FROM ProductoPropiedadesDetalles ppd " +
            "join Producto p on ppd.producto.id=p.id " +
            "join ProductoCategoria pc on p.productoCategoria.id=pc.id " +
            "join MenuSub ms on pc.menuSub.id=ms.id " +
            "where (ppd.precioReducido BETWEEN :minPrecio and :maxPrecio) " +
            "and ms.id=:menuSubId")
    List<ProductoPropiedadesDetalles> findByPrecioBetweenAndMenuSubId(@Param("minPrecio") Double minPrecio,
                                                                      @Param("maxPrecio") Double maxPrecio,
                                                                      @Param("menuSubId") Integer menuSubId);
    //Filtrar una lista de productos por precio mínimo, precio máximo, id del submenú y id de sus propiedades
    @Query("SELECT ppd FROM ProductoPropiedadesDetalles ppd " +
            "join Producto p on ppd.producto.id=p.id " +
            "where (ppd.precioReducido BETWEEN :minPrecio and :maxPrecio) " +
            "and p.productoCategoria.id=:productoCategoriaId")
    List<ProductoPropiedadesDetalles> findByPrecioBetweenAndCategoriaId(@Param("minPrecio") Double minPrecio,
                                                                        @Param("maxPrecio") Double maxPrecio,
                                                                        @Param("productoCategoriaId") Integer productoCategoriaId);
    // Listar productos por url del MenuSub: va según la escala ProductoCategoria.MenuSub.url
    List<ProductoPropiedadesDetalles> findByProducto_ProductoCategoria_MenuSub_Id(Integer menuSubId);

    // Listar productos por url de la categoría: va según la escala ProductoCategoria.id
    List<ProductoPropiedadesDetalles> findByProducto_ProductoCategoria_Id(Integer categoriaId);

    ProductoPropiedadesDetalles findByProducto_IdAndProductoVariacion1_ValorAndProductoVariacion2_Valor(int productoId, String variacion1, String variacion2);*/



    @Query("SELECT ppd FROM ProductoPropiedadesDetalles ppd " +
            "WHERE ppd.producto.id IN :productoIds AND ppd.estado.id = :estadoId")
    List<ProductoPropiedadesDetalles> findActiveProductoPropiedadesDetalles(@Param("productoIds") List<Integer> productoIds, @Param("estadoId") int estadoId);

    // Método para buscar categorías de productos por su id de submenú y estado activo
    @Query("SELECT ppd " +
            "FROM ProductoPropiedadesDetalles ppd " +
            "WHERE ppd.producto.id =:productoId " +
            "AND (ppd.precioReducido BETWEEN :minPrecio and :maxPrecio) " +
            "AND ppd.productoForma.id=:productoFormaId " +
            "AND ppd.estado.id = :estadoId")
    List<ProductoPropiedadesDetalles> findByProductoIdAndPrecioReducidoAndProductoFormaIdAndEstadoId(@Param("productoId") int productoId ,
                                             @Param("minPrecio") double minPrecio,
                                             @Param("maxPrecio") double maxPrecio,
                                             @Param("productoFormaId") double productoFormaId,
                                             @Param("estadoId") int estadoId);

    // Método para buscar categorías de productos por su id de submenú y estado activo
    @Query("SELECT new com.muscleshop.web.models.dto.PresentacionDto(ppd.id, ppd.producto.id, ppd.producto.nombre, ppd.producto.url, ppd.producto.estado.nombre,  ppd.producto.imagen, ppd.sku, ppd.stock, ppd.precio, ppd.precioReducido, ppd.precioTeam, ppd.precioTeamVip, ppd.precioFamiliar, ppd.estado.nombre ) " +
            "FROM ProductoPropiedadesDetalles ppd " +
            "WHERE ppd.producto.id = :productoId AND ppd.sku =:skuProductoPropiedadesDetalles AND ppd.estado.id = :estadoId")
    PresentacionDto findPresentacionByIdProductoAndSku(@Param("productoId") int productoId,
                                                             @Param("skuProductoPropiedadesDetalles") String skuProductoPropiedadesDetalles,
                                                             @Param("estadoId") int estadoId);

    // Método para buscar categorías de productos por su id de submenú y estado activo
    @Query("SELECT DISTINCT new com.muscleshop.web.models.dto.PresentacionDto(" +
                "ppdv.productoPropiedadesDetalles.id, ppdv.productoPropiedadesDetalles.producto.id, " +
                "ppdv.productoPropiedadesDetalles.producto.nombre, ppdv.productoPropiedadesDetalles.producto.url," +
                "ppdv.productoPropiedadesDetalles.producto.estado.nombre,  " +
                "ppdv.productoPropiedadesDetalles.producto.imagen, ppdv.productoPropiedadesDetalles.sku," +
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
