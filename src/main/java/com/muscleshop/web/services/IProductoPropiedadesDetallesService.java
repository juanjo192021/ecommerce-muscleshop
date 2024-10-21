package com.muscleshop.web.services;

import com.muscleshop.web.models.ProductoPropiedadesDetalles;
import com.muscleshop.web.models.dto.PresentacionDto;
import com.muscleshop.web.models.dto.ProductoCarritoDto;
import com.muscleshop.web.models.dto.ProductoItemsDto;

import java.util.List;

public interface IProductoPropiedadesDetallesService {

    List<ProductoItemsDto> obtenerProductoPropiedadesDetallesPorForma(int productoFormaId);
    List<ProductoItemsDto> obtenerProductosIndividualesPorMenuSubId(Double minPrecio, Double maxPrecio, Integer menuSubId);
    List<ProductoItemsDto> obtenerProductosIndividualesPorCategoriaId (Double minPrecio, Double maxPrecio,Integer categoriaId);
    ProductoPropiedadesDetalles obtenerProductoPropiedadDetallesPorVariaciones(int productoId, String variacion1, String variacion2);
    ProductoCarritoDto obtenerProductoPropiedadDetallePorId(Integer id);
    List<ProductoPropiedadesDetalles> pruebasProductosPropiedadesDetalles();
    PresentacionDto obtenerPresentacionPorIdProductoAndSkuProductoPropiedadesDetalles(int productoId, String sku );
    PresentacionDto obtenerPresentacionPorIdProductoAndVariaciones(int productoId, List<String> variaciones );
}
