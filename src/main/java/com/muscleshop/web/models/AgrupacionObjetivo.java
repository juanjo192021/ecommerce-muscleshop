package com.muscleshop.web.models;

import jakarta.persistence.*;

@Entity
@Table(name = "agrupacion_objetivo")
public class AgrupacionObjetivo {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name="agrupacion_id")
    private Agrupacion agrupacion;

    @ManyToOne
    @JoinColumn(name = "objetivos_id")
    private Objetivos objetivo;

    public AgrupacionObjetivo() {}

    public AgrupacionObjetivo(int id, Agrupacion agrupacion, Objetivos objetivo) {
        this.id = id;
        this.agrupacion = agrupacion;
        this.objetivo = objetivo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Agrupacion getAgrupacion() {
        return agrupacion;
    }

    public void setAgrupacion(Agrupacion agrupacion) {
        this.agrupacion = agrupacion;
    }

    public Objetivos getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(Objetivos objetivo) {
        this.objetivo = objetivo;
    }
}
