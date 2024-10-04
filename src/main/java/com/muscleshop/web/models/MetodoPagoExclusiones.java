package com.muscleshop.web.models;

import jakarta.persistence.*;

@Entity
@Table(name = "metodo_pago_exclusiones")
public class MetodoPagoExclusiones {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "metodo_pago_id")
    private MetodoPago metodoPago;

    @ManyToOne
    @JoinColumn(name = "rol_perfil_id")
    private RolPerfil rolPerfil;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public MetodoPago getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(MetodoPago metodoPago) {
        this.metodoPago = metodoPago;
    }

    public RolPerfil getRolPerfil() {
        return rolPerfil;
    }

    public void setRolPerfil(RolPerfil rolPerfil) {
        this.rolPerfil = rolPerfil;
    }
}
