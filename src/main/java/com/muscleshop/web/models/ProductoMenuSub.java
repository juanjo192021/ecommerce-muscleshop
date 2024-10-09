package com.muscleshop.web.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name="producto_menu_sub")
public class ProductoMenuSub{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name="producto_id")
    //@JsonIgnore
    private Producto producto;

    @ManyToOne
    @JoinColumn(name="menu_sub_id")
    @JsonIgnore
    private MenuSub menuSub;

    @ManyToOne
    @JoinColumn(name = "categoria_id")
    //@JsonIgnore
    private ProductoCategoria productoCategoria;

    @ManyToOne
    @JoinColumn(name="recomendado_producto_menu_sub_id")
    private RecomendadoProductoMenuSub recomendadoProductoMenuSub;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public MenuSub getMenuSub() {
        return menuSub;
    }

    public void setMenuSub(MenuSub menuSub) {
        this.menuSub = menuSub;
    }

    public ProductoCategoria getProductoCategoria() {
        return productoCategoria;
    }

    public void setProductoCategoria(ProductoCategoria productoCategoria) {
        this.productoCategoria = productoCategoria;
    }

    public RecomendadoProductoMenuSub getRecomendadoProductoMenuSub() {
        return recomendadoProductoMenuSub;
    }

    public void setRecomendadoProductoMenuSub(RecomendadoProductoMenuSub recomendadoProductoMenuSub) {
        this.recomendadoProductoMenuSub = recomendadoProductoMenuSub;
    }
}