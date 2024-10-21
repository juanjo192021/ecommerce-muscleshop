package com.muscleshop.web.controller;

import com.muscleshop.web.models.MenuSub;
import com.muscleshop.web.models.Producto;
import com.muscleshop.web.services.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/producto/")
public class ProductoController {
    @Autowired
    private ProductoService iProductoService;

    // Método http para obtener un sub menu por su url
    @GetMapping("buscarPorUrlProducto")
    @ResponseBody
    public ResponseEntity<Producto> buscarPorUrlProducto(@RequestParam("productoUrl") String productoUrl) {

        Producto producto = iProductoService.obtenerProductoPorUrl(productoUrl);
        return ResponseEntity.ok(producto);
    }
}
