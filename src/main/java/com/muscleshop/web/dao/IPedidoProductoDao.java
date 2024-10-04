package com.muscleshop.web.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.muscleshop.web.models.PedidosProductos;
import com.muscleshop.web.models.Pedidos;


public interface IPedidoProductoDao extends JpaRepository<PedidosProductos, Integer> {

	List<PedidosProductos> findByPedido(Pedidos pedido);
}
