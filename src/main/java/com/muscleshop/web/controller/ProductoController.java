package com.muscleshop.web.controller;

import com.muscleshop.web.models.MenuSub;
import com.muscleshop.web.models.Producto;
import com.muscleshop.web.models.dto.ProductoDto;
import com.muscleshop.web.services.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

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

    @GetMapping("obtenerProductos")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> obtenerProductoPorPrecio(
            @RequestParam("menuSubId") int menuSubId,
            @RequestParam("minPrecio") double minPrecio,
            @RequestParam("maxPrecio") double maxPrecio,
            @RequestParam("page") int page,
            Model model) {
        Pageable pageable = PageRequest.of(page, 2);
        Page<ProductoDto> productos = iProductoService.obtenerProductosItemsIndividialesPorMenuSubId(menuSubId, minPrecio, maxPrecio, pageable);

        Map<String, Object> response = new HashMap<>();
        response.put("productos", productos.getContent());
        response.put("pagePrevious", productos.hasPrevious());
        response.put("pageNext", productos.hasNext());
        response.put("pageNumber", productos.getNumber());
        response.put("totalPages", productos.getTotalPages());

        return ResponseEntity.ok(response);
    }

    @GetMapping("obtenerProductosPorNombreProducto")
    @ResponseBody
    public ResponseEntity<Page<ProductoDto>> obtenerProductosPorNombreProducto(
            @RequestParam("productoNombre") String productoNombre,
            @RequestParam("minPrecio") double minPrecio,
            @RequestParam("maxPrecio") double maxPrecio,
            Model model) {
        Pageable pageable = PageRequest.of(0, 5);
        Page<ProductoDto> productos = iProductoService.obtenerProductosItemsIndividualesPorNombreProducto(productoNombre, minPrecio, maxPrecio, pageable);

        return ResponseEntity.ok(productos);
    }

}
