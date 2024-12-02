package com.muscleshop.web.controller;

import com.muscleshop.web.models.ComprobantePago;
import com.muscleshop.web.models.Pedidos;
import com.muscleshop.web.services.IPedidosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("/pedidos/")
public class PedidosController {

    @Autowired
    private IPedidosService iPedidosService;

    // Método http para obtener un sub menu por su url
    @GetMapping("guardarPedido")
    public ResponseEntity<Pedidos> buscarPropiedadDetalleImagenesPorProductoPropiedadesDetallesId(@RequestParam("productoPropiedadesDetallesId") Pedidos pedido) {

        Pedidos propiedadDetalleImagenes = iPedidosService.guardarPedido(pedido);
        return ResponseEntity.ok(propiedadDetalleImagenes);
    }

    // Método http para obtener un sub menu por su url
    @PutMapping("pruebaPost/int/post")
    public ResponseEntity<String> obtenerPost(@RequestBody ComprobantePago pedido) {

        //Pedidos propiedadDetalleImagenes = iPedidosService.guardarPedido(pedido);
        return ResponseEntity.ok(pedido.getNombre());
    }

    @GetMapping("ejemplo")
    public ResponseEntity<String> buscarPropiedadDetalleImagectoPropiedadesDetallesId() {
        return ResponseEntity.ok("Hola");
    }
}
