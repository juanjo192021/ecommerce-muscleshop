package com.muscleshop.web.services;

import com.muscleshop.web.models.ProductoCategoria;
import com.muscleshop.web.models.dto.ProductoCategoriaDto;

import java.util.List;

public interface IProductoCategoriaService {

    ProductoCategoriaDto obtenerProductoCategoriaPorUrl(String categoriaUrl, int menuSubId);

    List<ProductoCategoriaDto> obtenerProductoCategoriasPorMenuSubId(int menuSubId);

}
