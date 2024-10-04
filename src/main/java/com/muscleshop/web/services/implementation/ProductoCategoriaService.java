package com.muscleshop.web.services.implementation;

import java.util.List;

import com.muscleshop.web.services.IProductoCategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IProductoCategoriaDao;
import com.muscleshop.web.models.ProductoCategoria;

@Service
public class ProductoCategoriaService implements IProductoCategoriaService {

	@Autowired
	private IProductoCategoriaDao proCateDao;

	//Listar todos los productos categorías
	public List<ProductoCategoria> listarProductoCategoria() {
		return proCateDao.findAll();
	}

	//Obtener producto categoría basado en su ID
	public ProductoCategoria obtenerProductoCategoriaPorId(Integer id) {
		return proCateDao.findById(id).orElse(null);
	}

	//Obtener producto categoría basado en su Url
	public ProductoCategoria obtenerProductoCategoriaPorUrl(String categoriaUrl) {
		return proCateDao.findByUrl(categoriaUrl);
	}

	//Obtener producto categoría basado en el ID del submenú
	public List<ProductoCategoria> listarPorMenuSubId(int menuSubId) {
        return proCateDao.findByMenuSub_Id(menuSubId);
    }

	//Obtener producto categoría basado en el ID del submenú
	public List<ProductoCategoria> obtenerProductoCategoriaPorMenuId(int menuId) {
        return proCateDao.findByMenuSub_Menu_Id(menuId);
    }
}
