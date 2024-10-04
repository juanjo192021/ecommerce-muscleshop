package com.muscleshop.web.models;

import jakarta.persistence.*;

@Entity
@Table(name = "producto_propiedades_detalles_variacion")
public class ProductoPropiedadesDetallesVariacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "producto_propiedades_detalles_id")
    private ProductoPropiedadesDetalles productoPropiedadesDetalles;

    @ManyToOne
    @JoinColumn(name = "producto_variacion_id")
    private ProductoVariacion productoVariacion;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ProductoPropiedadesDetalles getProductoPropiedadesDetalles() {
        return productoPropiedadesDetalles;
    }

    public void setProductoPropiedadesDetalles(ProductoPropiedadesDetalles productoPropiedadesDetalles) {
        this.productoPropiedadesDetalles = productoPropiedadesDetalles;
    }

    public ProductoVariacion getProductoVariacion() {
        return productoVariacion;
    }

    public void setProductoVariacion(ProductoVariacion productoVariacion) {
        this.productoVariacion = productoVariacion;
    }
}
