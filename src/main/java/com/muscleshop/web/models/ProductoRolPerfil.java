package com.muscleshop.web.models;

import jakarta.persistence.*;

@Entity
@Table(name = "producto_rol_perfil")
public class ProductoRolPerfil {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "producto_id")
    private Producto producto;

    @ManyToOne
    @JoinColumn(name = "rol_perfil_id")
    private RolPerfil rolPerfil;

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

    public RolPerfil getRolPerfil() {
        return rolPerfil;
    }

    public void setRolPerfil(RolPerfil rolPerfil) {
        this.rolPerfil = rolPerfil;
    }
}
