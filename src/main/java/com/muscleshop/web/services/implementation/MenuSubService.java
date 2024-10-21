package com.muscleshop.web.services.implementation;

import java.util.List;

import com.muscleshop.web.models.dto.MenuSubDto;
import com.muscleshop.web.services.IMenuSubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IMenuSubDao;
import com.muscleshop.web.models.MenuSub;

@Service
public class MenuSubService implements IMenuSubService {

	@Autowired
	private IMenuSubDao menuSubDao;

	private final int estadoId=1;

	//Listar todos los submenus
	public List<MenuSub> obtenerMenuSubs() {
		return menuSubDao.findAll();
	}

	//Obtener Sub Menu por medio del ID del mismo
	public MenuSub obtenerMenuSubID(Integer id) {
		return menuSubDao.findById(id).orElse(null);
	}

	//Listar Sub Menus por medio del ID del menu
	public List<MenuSubDto> obtenerMenuSubsPorMenuId(Integer menuID) {
		return menuSubDao.findByMenu_IdAndEstado_Id(menuID,estadoId);
	}

	//Obtener Sub Menu por medio de la url del mismo
	public MenuSub obtenerMenuSubPorUrl(String url) {
		return menuSubDao.findByUrl(url);
	}

	// Listar Sub Menus por medio del url del menu
	public List<MenuSub> obtenerMenuSubsPorMenuUrl(String menuUrl){
		return menuSubDao.findByMenu_Url(menuUrl);
	}

}
