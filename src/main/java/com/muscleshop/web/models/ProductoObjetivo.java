package com.muscleshop.web.models;

import jakarta.persistence.*;

@Entity
@Table(name = "producto_objetivo")
public class ProductoObjetivo {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "producto_id")
    private Producto producto;

    @ManyToOne
    @JoinColumn(name = "objetivos_id")
    private Objetivos objetivo;

    public ProductoObjetivo() {}

    public ProductoObjetivo(int id, Producto producto, Objetivos objetivo) {
        this.id = id;
        this.producto = producto;
        this.objetivo = objetivo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Objetivos getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(Objetivos objetivo) {
        this.objetivo = objetivo;
    }
}
