package com.muscleshop.web.models;

import jakarta.persistence.*;

@Entity
@Table(name = "pedido_producto_comentario")
public class PedidoProductoComentario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "pedidos_productos_id")
	private PedidosProductos pedidosProductos;

	private String comentario;

	@ManyToOne
	@JoinColumn(name = "estado_id")
	private Estado estado;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public PedidosProductos getPedidoProducto() {
		return pedidosProductos;
	}

	public void setPedidoProducto(PedidosProductos pedidosProductos) {
		this.pedidosProductos = pedidosProductos;
	}
}
