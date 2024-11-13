package com.muscleshop.web.models;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "pedidos_estados_cambios")
public class PedidosEstadosCambios {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "pedidos_id")
    private Pedidos pedido;

    @OneToOne
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name="estado_inicial_id")
    private EstadoPedido estadoInicial;

    @ManyToOne
    @JoinColumn(name="estado_cambiado_id")
    private EstadoPedido estadoCambiado;

    private LocalDate fecha;

    private Integer tipoCambio;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Pedidos getPedido() {
        return pedido;
    }

    public void setPedido(Pedidos pedido) {
        this.pedido = pedido;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public EstadoPedido getEstadoInicial() {
        return estadoInicial;
    }

    public void setEstadoInicial(EstadoPedido estadoInicial) {
        this.estadoInicial = estadoInicial;
    }

    public EstadoPedido getEstadoCambiado() {
        return estadoCambiado;
    }

    public void setEstadoCambiado(EstadoPedido estadoCambiado) {
        this.estadoCambiado = estadoCambiado;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public Integer getTipoCambio() {
        return tipoCambio;
    }

    public void setTipoCambio(Integer tipoCambio) {
        this.tipoCambio = tipoCambio;
    }
}
