package com.muscleshop.web.controller;

import com.muscleshop.web.models.Producto;
import com.muscleshop.web.models.dto.PresentacionDto;
import com.muscleshop.web.services.IProductoPropiedadesDetallesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/productoPropiedadesDetalles/")
public class ProductoPropiedadesDetallesController {

    @Autowired
    private IProductoPropiedadesDetallesService iProductoPropiedadesDetallesService;

    @GetMapping("buscarPorProductoIdAndVariaciones")
    @ResponseBody
    public ResponseEntity<PresentacionDto> buscarPorProductoIdAndVariaciones(@RequestParam("productoId") int productoId, @RequestParam("variaciones") String variaciones) {
        // Convertimos la cadena separada por comas en una lista de variaciones
        List<String> variacionesStr = Arrays.asList(variaciones.split(","));
        PresentacionDto presentacionDtos = iProductoPropiedadesDetallesService.obtenerPresentacionPorIdProductoAndVariaciones(productoId, variacionesStr);
        return ResponseEntity.ok(presentacionDtos);
    }
}
