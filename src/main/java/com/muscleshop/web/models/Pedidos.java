package com.muscleshop.web.models;

import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity
@Table(name = "pedidos")
public class Pedidos {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Timestamp fecha;
	private double total_costo;
	
	@OneToOne
	@JoinColumn(name = "usuario_id")
	private Usuario usuario;

	@OneToOne
	@JoinColumn(name = "metodo_pago_id")
	private MetodoPago metodo;

	@OneToOne
	@JoinColumn(name = "comprobante_id")
	private ComprobantePago comprobante;
	
	@OneToOne
	@JoinColumn(name = "ubigeo_id")
	private Ubigeo ubigeo;

	private String num_pedido;

	@ManyToOne
	@JoinColumn(name="estado_id")
	private EstadoPedido estadoPedido;

	@OneToMany(mappedBy = "pedido")
	@JsonIgnore
	private List<PedidosProductos> pedidosProductos;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getFecha() {
		return fecha;
	}

	public void setFecha(Timestamp fecha) {
		this.fecha = fecha;
	}

	public double getTotal_costo() {
		return total_costo;
	}

	public void setTotal_costo(double total_costo) {
		this.total_costo = total_costo;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public MetodoPago getMetodo() {
		return metodo;
	}

	public void setMetodo(MetodoPago metodo) {
		this.metodo = metodo;
	}

	public ComprobantePago getComprobante() {
		return comprobante;
	}

	public void setComprobante(ComprobantePago estado) {
		this.comprobante = estado;
	}

	public List<PedidosProductos> getPedidosProductos() {
		return pedidosProductos;
	}

	public void setPedidosProductos(List<PedidosProductos> pedidosProductos) {
		this.pedidosProductos = pedidosProductos;
	}

	public Ubigeo getUbigeo() {
		return ubigeo;
	}

	public void setUbigeo(Ubigeo ubigeo) {
		this.ubigeo = ubigeo;
	}

	public String getNum_pedido() {
		return num_pedido;
	}

	public void setNum_pedido(String num_pedido) {
		this.num_pedido = num_pedido;
	}

	public EstadoPedido getEstadoPedido() {
		return estadoPedido;
	}

	public void setEstadoPedido(EstadoPedido estadoPedido) {
		this.estadoPedido = estadoPedido;
	}
}
