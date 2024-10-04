package com.muscleshop.web.services;

import com.muscleshop.web.models.ProductoCategoria;

import java.util.List;

public interface IProductoCategoriaService {

    List<ProductoCategoria> listarProductoCategoria();
    ProductoCategoria obtenerProductoCategoriaPorId(Integer id);
    ProductoCategoria obtenerProductoCategoriaPorUrl(String categoriaUrl);
    List<ProductoCategoria> listarPorMenuSubId(int menuSubId);
    List<ProductoCategoria> obtenerProductoCategoriaPorMenuId(int menuId);

}
