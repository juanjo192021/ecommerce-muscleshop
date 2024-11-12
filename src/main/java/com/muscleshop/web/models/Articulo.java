package com.muscleshop.web.models;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity
@Table(name = "articulo")
public class Articulo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String imagen;
	private String url;
	private String titulo;
	private String descripcion;

	@ManyToOne
	@JoinColumn(name = "estado_id")
	private EstadoArticuloProducto estado;

	@OneToMany(mappedBy = "articulo")
	@JsonIgnore
	private List<ArticuloComentario> articuloCom;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public EstadoArticuloProducto getEstado() {
		return estado;
	}

	public void setEstado(EstadoArticuloProducto estado) {
		this.estado = estado;
	}

	public List<ArticuloComentario> getArticuloCom() {
		return articuloCom;
	}

	public void setArticuloCom(List<ArticuloComentario> articuloCom) {
		this.articuloCom = articuloCom;
	}

}
