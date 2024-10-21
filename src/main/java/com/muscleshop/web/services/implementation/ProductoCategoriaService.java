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

	//Obtener el listado de todas las categorías de productos
	public List<ProductoCategoria> listarProductoCategoria() {
		return iProductoCategoriaDao.findByEstado_Id(estadoId);
	}

	//Obtener una categoría de producto por su id
	public ProductoCategoria obtenerProductoCategoriaPorId(Integer id) {
		return iProductoCategoriaDao.findByIdAndEstado_Id(id, estadoId);
	}

	//Obtener una categoría de producto por su url
	public ProductoCategoria obtenerProductoCategoriaPorUrl(String categoriaUrl) {
		return iProductoCategoriaDao.findByUrlAndEstado_Id(categoriaUrl, estadoId);
	}

	//Obtener el listado de categorías de productos por su ID del submenú
	public List<ProductoCategoriaDto> obtenerProductoCategoriasPorMenuSubId(int menuSubId) {
        return iProductoCategoriaDao.findByMenuSub_IdAndEstado_Id(menuSubId, estadoId);
    }

	//Obtener el listado de categorías de productos por su ID del menú
	public List<ProductoCategoria> obtenerProductoCategoriaPorMenuId(int menuId) {
        return iProductoCategoriaDao.findByMenuSub_Menu_IdAndEstado_Id(menuId, estadoId);
    }
}
