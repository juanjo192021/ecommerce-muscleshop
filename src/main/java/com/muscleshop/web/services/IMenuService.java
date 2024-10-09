package com.muscleshop.web.services;

import com.muscleshop.web.models.Menu;

import java.util.List;

public interface IMenuService {
    List<Menu> obtenerMenus();

    Menu listarMenuID(Integer id);

    Menu obtenerMenuPorUrl(String url);
}
