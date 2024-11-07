package com.muscleshop.web.controller;

import com.muscleshop.web.models.BannerMenuSub;
import com.muscleshop.web.models.Menu;
import com.muscleshop.web.models.MenuSub;
import com.muscleshop.web.models.PreferenceResponse;
import com.muscleshop.web.models.dto.MenuSubDto;
import com.muscleshop.web.models.dto.ProductoCategoriaDto;
import com.muscleshop.web.models.dto.ProductoDto;
import com.muscleshop.web.services.ProductoService;
import com.muscleshop.web.services.implementation.MenuService;
import com.muscleshop.web.services.implementation.MenuSubService;
import com.muscleshop.web.services.implementation.ProductoCategoriaService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
