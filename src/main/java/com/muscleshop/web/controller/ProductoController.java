package com.muscleshop.web.controller;

import com.muscleshop.web.models.Producto;
import com.muscleshop.web.models.dto.ProductoDto;
import com.muscleshop.web.models.dto.UsuarioDto;
import com.muscleshop.web.models.dto.VariacionDto;
import com.muscleshop.web.services.IProductoService;
import com.muscleshop.web.services.IProductoVariacionService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/producto/")
public class ProductoController {
    @Autowired
    private IProductoService iProductoService;

    @GetMapping("obtenerProductoPorForma")
    @ResponseBody
    public ResponseEntity<List<ProductoDto>> obtenerProductosPorForma(@RequestParam("formaId") int formaId, HttpSession session) {
        //UsuarioDto usuario = (UsuarioDto) session.getAttribute("usuario");
        List<ProductoDto> productoDtos = iProductoService.obtenerProductosItemsIndividualesPorForma(formaId);
        return ResponseEntity.ok(productoDtos);

    }

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
            @RequestParam("page") int page) {

        Pageable pageable = PageRequest.of(page, 12);
        Page<ProductoDto> productos = iProductoService.obtenerProductosItemsIndividialesPorMenuSubId(menuSubId, minPrecio, maxPrecio, pageable);

        Map<String, Object> response = new HashMap<>();
        response.put("productos", productos.getContent());
        response.put("pagePrevious", productos.hasPrevious());
        response.put("pageNext", productos.hasNext());
        response.put("pageNumber", productos.getNumber());
        response.put("totalPages", productos.getTotalPages());

        return ResponseEntity.ok(response);

    }


    @GetMapping("obtenerProductosPorCategoriaId")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> obtenerProductosPorCategoriaId(
            @RequestParam("categoriaId") int categoriaId,
            @RequestParam("minPrecio") double minPrecio,
            @RequestParam("maxPrecio") double maxPrecio,
            @RequestParam("page") int page) {

        Pageable pageable = PageRequest.of(page, 12);
        Page<ProductoDto> productos = iProductoService.obtenerProductosItemsIndividialesPorCategoriaId(categoriaId, minPrecio, maxPrecio, pageable);

        Map<String, Object> response = new HashMap<>();
        response.put("productos", productos.getContent());
        response.put("pagePrevious", productos.hasPrevious());
        response.put("pageNext", productos.hasNext());
        response.put("pageNumber", productos.getNumber());
        response.put("totalPages", productos.getTotalPages());

        return ResponseEntity.ok(response);

    }

    @GetMapping("obtenerProductosPorObjetivoId")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> obtenerProductosPorObjetivoId(
            @RequestParam("objetivoId") int objetivoId,
            @RequestParam("minPrecio") double minPrecio,
            @RequestParam("maxPrecio") double maxPrecio,
            @RequestParam("page") int page) {

        Pageable pageable = PageRequest.of(page, 12);
        Page<ProductoDto> productos = iProductoService.obtenerProductosItemsIndividialesPorObjetivoId(objetivoId, minPrecio, maxPrecio, pageable);

        Map<String, Object> response = new HashMap<>();
        response.put("productos", productos.getContent());
        response.put("pagePrevious", productos.hasPrevious());
        response.put("pageNext", productos.hasNext());
        response.put("pageNumber", productos.getNumber());
        response.put("totalPages", productos.getTotalPages());

        return ResponseEntity.ok(response);

    }

    @GetMapping("obtenerProductosPorMarcaId")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> obtenerProductosPorMarcaId(
            @RequestParam("marcaId") int marcaId,
            @RequestParam("minPrecio") double minPrecio,
            @RequestParam("maxPrecio") double maxPrecio,
            @RequestParam("page") int page) {

        Pageable pageable = PageRequest.of(page, 12);
        Page<ProductoDto> productos = iProductoService.obtenerProductosItemsIndividialesPorMarcaId(marcaId, minPrecio, maxPrecio, pageable);

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
            @RequestParam("maxPrecio") double maxPrecio) {

        Pageable pageable = PageRequest.of(0, 5);
        Page<ProductoDto> productos = iProductoService.obtenerProductosItemsIndividualesPorNombreProducto(productoNombre, minPrecio, maxPrecio, pageable);

        return ResponseEntity.ok(productos);

    }

    @Autowired
    IProductoVariacionService iProductoVariacionService;

    @GetMapping("obtenerVariaciones")
    @ResponseBody
    public ResponseEntity<List<VariacionDto>> obtenerVariaciones(@RequestParam("productoId") int productoId) {
        List<VariacionDto> variaciones = iProductoVariacionService.obtenerProductoVariacion(productoId);
        return ResponseEntity.ok(variaciones);
    }
}
