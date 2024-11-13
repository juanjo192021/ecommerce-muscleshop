package com.muscleshop.web.models;

import jakarta.persistence.*;

@Entity
@Table(name = "ubigeo")
public class Ubigeo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String region;
	private String provincia;
	private String distrito;
	private Double costo;

	@Column(name = "costo_expres")
	private Double costoExpress;

	@ManyToOne
	@JoinColumn(name = "estado_id")
	private Estado estado;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getDistrito() {
		return distrito;
	}
	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}

	public Double getCosto() {
		return costo;
	}

	public void setCosto(Double costo) {
		this.costo = costo;
	}

	public Double getCostoExpress() {
		return costoExpress;
	}

	public void setCostoExpress(Double costoExpress) {
		this.costoExpress = costoExpress;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}
}
