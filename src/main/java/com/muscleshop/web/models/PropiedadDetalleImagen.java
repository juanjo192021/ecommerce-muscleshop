package com.muscleshop.web.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

@Entity
@Table(name = "propiedad_detalle_imagen")
public class PropiedadDetalleImagen {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;

    @ManyToOne
    @JoinColumn(name="producto_propiedad_detalle_id")
    private ProductoPropiedadesDetalles productoPropiedadesDetalles;

    @ManyToOne
    @JoinColumn(name="estado_id")
    private Estado estado;

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

    public ProductoPropiedadesDetalles getProductoPropiedadesDetalles() {
        return productoPropiedadesDetalles;
    }

    public void setProductoPropiedadesDetalles(ProductoPropiedadesDetalles productoPropiedadesDetalles) {
        this.productoPropiedadesDetalles = productoPropiedadesDetalles;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
}
