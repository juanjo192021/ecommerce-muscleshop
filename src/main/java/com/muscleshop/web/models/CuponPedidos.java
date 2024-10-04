package com.muscleshop.web.models;

import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
@Table(name = "cupon_pedidos")
public class CuponPedidos {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "cupon_id")
	private Cupon cupon;

	@ManyToOne
	@JoinColumn(name = "pedidos_id")
	private Pedidos pedidos;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Cupon getCupon() {
		return cupon;
	}

	public void setCupon(Cupon cupon) {
		this.cupon = cupon;
	}

	public Pedidos getPedidos() {
		return pedidos;
	}

	public void setPedidos(Pedidos pedidos) {
		this.pedidos = pedidos;
	}
}
