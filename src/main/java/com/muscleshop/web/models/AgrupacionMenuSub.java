package com.muscleshop.web.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity
@Table(name="agrupacion_menu_sub")
public class AgrupacionMenuSub {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name="agrupacion_id")
    //@JsonIgnore
    private Agrupacion agrupacion;

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

    public Agrupacion getAgrupacion() {
        return agrupacion;
    }

    public void setAgrupacion(Agrupacion agrupacion) {
        this.agrupacion = agrupacion;
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