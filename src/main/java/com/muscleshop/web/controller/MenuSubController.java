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
@RequestMapping("/hola/")
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

    @GetMapping("/{menuUrl}/{menuSubUrl}")
    public String menuSubProductos(Model model,
                                   @PathVariable("menuUrl") String menuUrl,
                                   @PathVariable("menuSubUrl") String menuSubUrl,
                                   /*@RequestParam(required = false) Double minPrecio,
                                   @RequestParam(required = false) Double maxPrecio,*/
                                   HttpSession session) {

        Menu menu = menuService.obtenerMenuPorUrl(menuUrl);
        MenuSub menuSub = menuSubService.obtenerMenuSubPorUrl(menuSubUrl);

        List<BannerMenuSub> bannerMovilTablet = (menuSub.getBannerMenuSubs()).stream()
                .filter(ban -> "movil_tablet".equals(ban.getTipoDispositivo()))
                .toList();

        List<BannerMenuSub> bannerLaptopPc = (menuSub.getBannerMenuSubs()).stream()
                .filter(ban -> "laptop_pc".equals(ban.getTipoDispositivo()))
                .toList();

        List<ProductoCategoriaDto> productoCategoriaDtos = productoCategoriaService.obtenerProductoCategoriasPorMenuSubId(menuSub.getId());
        List<MenuSubDto> menuSubDtos = menuSubService.obtenerMenuSubsPorMenuId(menu.getId());
        List<MenuSubDto> menuSubPorObjetivoDtos = menuSubService.obtenerMenuSubsPorMenuId(5);
        List<MenuSubDto> menuSubPorMarcaDtos = menuSubService.obtenerMenuSubsPorMenuId(6);

        //List<ProductoItemsDto> productos = iProductoPropiedadesDetallesService.obtenerProductosIndividualesPorMenuSubId(minPrecio, maxPrecio, menuSub.getId());
        List<ProductoDto> productos = productoService.obtenerProductosItemsIndividialesPorMenuSubId(menuSub.getId(),0,100);

        model.addAttribute("nombreMenuSub", menuSub.getNombre());
        model.addAttribute("bannerMenuSubMovilTablet", bannerMovilTablet);
        model.addAttribute("bannerMenuSubLaptopPc", bannerLaptopPc);
        model.addAttribute("categorias", productoCategoriaDtos);
        model.addAttribute("otrasCategorias", menuSubDtos);
        model.addAttribute("porObjetivos", menuSubPorObjetivoDtos);
        model.addAttribute("porMarcas", menuSubPorMarcaDtos);
        model.addAttribute("productos", productos);

		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("menuSubUrl", menuSubUrl);
        return "pages/product-menu-sub";
    }

    @GetMapping("listar")
    public ResponseEntity<List<ProductoDto>> obtenerProductoPorPrecio(@RequestParam("menuSubId") int menuSubId) {

        List<ProductoDto> productos = iProductoService.obtenerProductosItemsIndividialesPorMenuSubId(menuSubId,1,100);
        return ResponseEntity.ok(productos);
    }
}
