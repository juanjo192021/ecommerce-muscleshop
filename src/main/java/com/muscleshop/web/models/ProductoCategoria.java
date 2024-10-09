package com.muscleshop.web.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "producto_categoria")
public class ProductoCategoria {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nombre;

	@OneToOne
	@JoinColumn(name = "estado_id")
	private Estado estado;

	private String url;

	@ManyToOne
	@JoinColumn(name = "menu_sub_id")
	private MenuSub menuSub;

	@OneToMany(mappedBy = "productoCategoria")
	@JsonIgnore
	private List<ProductoMenuSub> productoMenuSubs;

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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public MenuSub getMenuSub() {
		return menuSub;
	}

	public void setMenuSub(MenuSub menuSub) {
		this.menuSub = menuSub;
	}

	public List<ProductoMenuSub> getProductoMenuSubs() {
		return productoMenuSubs;
	}

	public void setProductoMenuSubs(List<ProductoMenuSub> productoMenuSubs) {
		this.productoMenuSubs = productoMenuSubs;
	}
}
