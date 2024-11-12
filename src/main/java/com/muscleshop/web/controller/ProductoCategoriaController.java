package com.muscleshop.web.controller;

import com.muscleshop.web.models.ProductoCategoria;
import com.muscleshop.web.models.dto.ProductoCategoriaDto;
import com.muscleshop.web.services.IProductoCategoriaService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/productoCategoria/")
public class ProductoCategoriaController {

    @Autowired
    private IProductoCategoriaService iProductoCategoriaService;

    @GetMapping("obtenerCategoriaPorUrlAndMenuSubId")
    @ResponseBody
    public ResponseEntity<ProductoCategoriaDto> obtenerCategoriaPorUrlAndMenuSubId(@RequestParam("categoriaUrl") String categoriaUrl,
                                                                                @RequestParam("menuSubId") int menuSubId) {
        //UsuarioDto usuario = (UsuarioDto) session.getAttribute("usuario");
        ProductoCategoriaDto productoCategoriaDto = iProductoCategoriaService.obtenerProductoCategoriaPorUrl(categoriaUrl, menuSubId);
        return ResponseEntity.ok(productoCategoriaDto);

    }
}
