package com.muscleshop.web.controller;

import com.muscleshop.web.models.Producto;
import com.muscleshop.web.models.PropiedadDetalleImagen;
import com.muscleshop.web.services.IPropiedadDetalleImagenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/propiedadDetalleImagen/")
public class PropiedadDetalleImagenController {
    @Autowired
    private IPropiedadDetalleImagenService iPropiedadDetalleImagenService;



    // Método http para obtener un sub menu por su url
    @GetMapping("buscarPropiedadDetalleImagenesPorProductoPropiedadesDetallesId")
    @ResponseBody
    public ResponseEntity<List<PropiedadDetalleImagen>> buscarPropiedadDetalleImagenesPorProductoPropiedadesDetallesId(@RequestParam("productoPropiedadesDetallesId") int productoPropiedadesDetallesId) {

        List<PropiedadDetalleImagen> propiedadDetalleImagenes = iPropiedadDetalleImagenService.obtenerImagenesPresentacionPorProductoPropiedadesDetallesId(productoPropiedadesDetallesId);
        return ResponseEntity.ok(propiedadDetalleImagenes);
    }
}
