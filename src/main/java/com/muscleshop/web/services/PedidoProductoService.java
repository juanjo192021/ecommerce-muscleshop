package com.muscleshop.web.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IPedidoProductoDao;
import com.muscleshop.web.models.PedidosProductos;

@Service
public class PedidoProductoService {

	@Autowired
	private IPedidoProductoDao pedidoProductoDao;

	public PedidosProductos guardarPedidoPro(PedidosProductos pedidosProductos) {
		return pedidoProductoDao.save(pedidosProductos);
	}

	public PedidosProductos listarID(Integer id) {
		return pedidoProductoDao.findById(id).orElse(null);
	}

	
}
