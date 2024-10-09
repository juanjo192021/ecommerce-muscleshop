package com.muscleshop.web.services.implementation;

import java.util.Collections;
import java.util.List;

import com.muscleshop.web.dao.IMenuSubDao;
import com.muscleshop.web.dao.IProductoCategoriaDao;
import com.muscleshop.web.models.MenuSub;
import com.muscleshop.web.models.ProductoCategoria;
import com.muscleshop.web.services.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IMenuDao;
import com.muscleshop.web.models.Menu;

@Service
public class MenuService implements IMenuService {

	@Autowired
	private IMenuDao menuDao;

	@Autowired
	private IMenuSubDao menuSubDao;

	@Autowired
	private IProductoCategoriaDao productoCategoriaDao;

    public List<Menu> obtenerMenus() {
		// Paso 1: Obtener menús activos
		List<Menu> activeMenus = menuDao.findByEstado_Id(1);  // estado_id = 1

		// Filtrar submenús y categorías de productos para cada menú
		for (Menu menu : activeMenus) {
			// Obtener submenús activos para este menú
			List<MenuSub> activeMenuSubs = menuSubDao.findActiveMenuSubs(Collections.singletonList(menu.getId()), 1);  // estado_id = 1

			// Establecer solo los submenús activos en el menú
			menu.setMenuSubs(activeMenuSubs);

			// Para cada submenú activo, cargar las categorías de productos activas
			for (MenuSub menuSub : activeMenuSubs) {
				List<ProductoCategoria> activeProductCategories = productoCategoriaDao.findActiveProductCategories(Collections.singletonList(menuSub.getId()), 1);  // estado_id = 1

				// Establecer solo las categorías de productos activas en el submenú
				menuSub.setProductoCategorias(activeProductCategories);
			}
		}

		return activeMenus;
	}

	public Menu listarMenuID(Integer id) {
		return menuDao.findById(id).orElse(null);
	}

	public Menu obtenerMenuPorUrl(String url) {
		return menuDao.findByUrl(url);
	}
}
