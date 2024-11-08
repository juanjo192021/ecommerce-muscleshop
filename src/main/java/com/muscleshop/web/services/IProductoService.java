package com.muscleshop.web.services;

import com.muscleshop.web.models.Producto;
import com.muscleshop.web.models.dto.ProductoDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IProductoService {

    Producto obtenerProductoPorUrl(String productoUrl);
    Page<ProductoDto> obtenerProductosItemsIndividialesPorMenuSubId(int menuSubId, double minPrecio, double maxPrecio, Pageable pageable);
    List<ProductoDto> obtenerProductosItemsIndividialesPorCategoriaId(int productoCategoriaId);
    List<ProductoDto> obtenerProductosItemsIndividualesPorForma(int formaId);
    Page<ProductoDto> obtenerProductosItemsIndividualesPorNombreProducto(String productoNombre,double minPrecio, double maxPrecio, Pageable pageable);
}