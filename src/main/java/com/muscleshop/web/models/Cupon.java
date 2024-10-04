package com.muscleshop.web.models;

import jakarta.persistence.*;

@Entity
@Table(name = "cupon")
public class Cupon {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nombre;
	private Double valor;

	@Column(name = "valor_porcentual")
	private Integer valorPorcentual;

	@Column(name = "costo_minimo")
	private Double costoMinimo;

	@ManyToOne
	@JoinColumn(name = "estado_id")
	private Estado estado;

	@ManyToOne
	@JoinColumn(name = "cupon_categoria_id")
	private CuponCategoria cuponCategoria;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Integer getValorPorcentual() {
		return valorPorcentual;
	}

	public void setValorPorcentual(Integer valorPorcentual) {
		this.valorPorcentual = valorPorcentual;
	}

	public Double getCostoMinimo() {
		return costoMinimo;
	}

	public void setCostoMinimo(Double costoMinimo) {
		this.costoMinimo = costoMinimo;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public CuponCategoria getCuponCategoria() {
		return cuponCategoria;
	}

	public void setCuponCategoria(CuponCategoria cuponCategoria) {
		this.cuponCategoria = cuponCategoria;
	}
}
