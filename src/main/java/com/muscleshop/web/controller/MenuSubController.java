package com.muscleshop.web.controller;

import com.muscleshop.web.models.MenuSub;
import com.muscleshop.web.services.implementation.ProductoService;
import com.muscleshop.web.services.implementation.MenuService;
import com.muscleshop.web.services.implementation.MenuSubService;
import com.muscleshop.web.services.implementation.ProductoCategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/menuSub/")
public class MenuSubController {

    @Autowired
    ProductoService iProductoService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private MenuSubService menuSubService;
    @Autowired
    private ProductoCategoriaService productoCategoriaService;
    @Autowired
    private ProductoService productoService;

    // Método http para obtener un sub menu por su url
    @GetMapping("obtenerPorUrl")
    @ResponseBody
    public ResponseEntity<MenuSub> obtenerMenuSubPorUrl(@RequestParam("menuSubUrl") String menuSubUrl) {

        MenuSub menuSub = menuSubService.obtenerMenuSubPorUrl(menuSubUrl);
        return ResponseEntity.ok(menuSub);
    }
}
