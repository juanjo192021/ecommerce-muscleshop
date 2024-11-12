package com.muscleshop.web.services.implementation;

import java.util.List;

import com.muscleshop.web.models.dto.ProductoCategoriaDto;
import com.muscleshop.web.services.IProductoCategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IProductoCategoriaDao;
import com.muscleshop.web.models.ProductoCategoria;

@Service
public class ProductoCategoriaService implements IProductoCategoriaService {

	@Autowired
	private IProductoCategoriaDao iProductoCategoriaDao;

	private final int estadoId = 1;

	//Obtener una categoría de producto por su url
	public ProductoCategoriaDto obtenerProductoCategoriaPorUrl(String categoriaUrl, int menuSubId) {
		return iProductoCategoriaDao.findByUrlAndMenuSub_Id(categoriaUrl, menuSubId);
	}

	//Obtener el listado de categorías de productos por su ID del submenú
	public List<ProductoCategoriaDto> obtenerProductoCategoriasPorMenuSubId(int menuSubId) {
        return iProductoCategoriaDao.findByMenuSub_IdAndEstado_Id(menuSubId, estadoId);
    }

}
