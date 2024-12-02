package com.muscleshop.web.services;

import com.muscleshop.web.models.Pedidos;
import com.muscleshop.web.models.Usuario;

import java.util.List;

public interface IPedidosService {
    Pedidos guardarPedido(Pedidos pedido);

    List<Pedidos> listarPedido() ;

    Pedidos listarPorId(Integer id) ;

    List<Pedidos> obtenerUsuario(Usuario usuario) ;
}
