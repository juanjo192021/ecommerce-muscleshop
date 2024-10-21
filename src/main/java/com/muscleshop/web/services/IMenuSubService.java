package com.muscleshop.web.services;

import com.muscleshop.web.models.MenuSub;
import com.muscleshop.web.models.dto.MenuSubDto;

import java.util.List;

public interface IMenuSubService {

    //Listar todos los submenus
    List<MenuSub> obtenerMenuSubs();

    //Obtener Sub Menu por medio del ID del mismo
    MenuSub obtenerMenuSubID(Integer id);

    //Listar Sub Menus por medio del ID del menu
    List<MenuSubDto> obtenerMenuSubsPorMenuId(Integer menuID);

    //Obtener Sub Menu por medio de la url del mismo
    MenuSub obtenerMenuSubPorUrl(String url);

    // Listar Sub Menus por medio del url del menu
    List<MenuSub> obtenerMenuSubsPorMenuUrl(String menuUrl);
}
