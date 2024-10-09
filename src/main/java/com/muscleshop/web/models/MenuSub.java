package com.muscleshop.web.models;

import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity
@Table(name = "menu_sub")
public class MenuSub {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nombre;
	private String url;

	@ManyToOne
	@JoinColumn(name = "menu_id")
	private Menu menu;

	@ManyToOne
	@JoinColumn(name = "estado_id")
	private Estado estado;

	private String imagen;

	@OneToMany(mappedBy = "menuSub")
	@JsonIgnore
	private List<ProductoCategoria> productoCategorias;

	@OneToMany(mappedBy = "menuSub")
	@JsonIgnore
	private List<ProductoMenuSub> productoMenuSubs;

	@OneToMany(mappedBy = "menuSub", cascade = CascadeType.ALL)
	private List<BannerMenuSub> bannerMenuSubs;

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

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public List<ProductoCategoria> getProductoCategorias() {
		return productoCategorias;
	}

	public void setProductoCategorias(List<ProductoCategoria> productoCategorias) {
		this.productoCategorias = productoCategorias;
	}

	public List<ProductoMenuSub> getProductoMenuSubs() {
		return productoMenuSubs;
	}

	public void setProductoMenuSubs(List<ProductoMenuSub> productoMenuSubs) {
		this.productoMenuSubs = productoMenuSubs;
	}

	public List<BannerMenuSub> getBannerMenuSubs() {
		return bannerMenuSubs;
	}

	public void setBannerMenuSubs(List<BannerMenuSub> bannerMenuSubs) {
		this.bannerMenuSubs = bannerMenuSubs;
	}
}
