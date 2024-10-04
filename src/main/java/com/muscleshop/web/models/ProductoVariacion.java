package com.muscleshop.web.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity
@Table(name = "producto_variacion")
public class ProductoVariacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "producto_id")
    private Producto producto;

    /*No se creó el OneToMany en Propiedades*/
    @ManyToOne
    @JoinColumn(name = "propiedades_id")
    private Propiedades propiedades;

    private String valor;

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

    public Propiedades getPropiedades() {
        return propiedades;
    }

    public void setPropiedades(Propiedades propiedades) {
        this.propiedades = propiedades;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }
}