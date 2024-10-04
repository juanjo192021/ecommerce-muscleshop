package com.muscleshop.web.models;

import jakarta.persistence.*;

@Entity
@Table(name = "producto_recomendado")
public class ProductoRecomendado {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "menu_sub_id")
    private MenuSub menuSub;

    @ManyToOne
    @JoinColumn(name = "producto_id")
    private Producto producto;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public MenuSub getMenuSub() {
        return menuSub;
    }

    public void setMenuSub(MenuSub menuSub) {
        this.menuSub = menuSub;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
}
