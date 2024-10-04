package com.muscleshop.web.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "pedidos_productos")
public class PedidosProductos {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "pedidos_id")
	private Pedidos pedido;

	@OneToOne
	@JoinColumn(name = "productos_id")
	private Producto producto;

	private Integer cantidad;
	private double sub_total;

	@OneToOne
	@JoinColumn(name = "producto_propiedades_detalles_id")
	private ProductoPropiedadesDetalles productoPropiedadesDetalles;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public Pedidos getPedido() {
		return pedido;
	}

	public void setPedido(Pedidos pedido) {
		this.pedido = pedido;
	}

	public double getSub_total() {
		return sub_total;
	}

	public void setSub_total(double sub_total) {
		this.sub_total = sub_total;
	}

	public ProductoPropiedadesDetalles getProductoProDetal() {
		return productoPropiedadesDetalles;
	}

	public void setProductoProDetal(ProductoPropiedadesDetalles productoPropiedadesDetalles) {
		this.productoPropiedadesDetalles = productoPropiedadesDetalles;
	}
}
