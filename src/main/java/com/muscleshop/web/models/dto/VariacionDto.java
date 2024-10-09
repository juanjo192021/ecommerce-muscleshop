package com.muscleshop.web.models.dto;

import java.util.List;

public class VariacionDto {
    private Integer idPropiedad; // ID de la propiedad
    private String nombreVariacion;
    private List<AtributoDto> atributosDto;

    // Constructor, getters y setters
    public VariacionDto(Integer idPropiedad, String nombreVariacion, List<AtributoDto> atributosDto) {
        this.idPropiedad = idPropiedad;
        this.nombreVariacion = nombreVariacion;
        this.atributosDto = atributosDto;
    }

    // Getters y Setters
    public Integer getIdPropiedad() {
        return idPropiedad;
    }

    public void setIdPropiedad(Integer idPropiedad) {
        this.idPropiedad = idPropiedad;
    }

    public String getNombreVariacion() {
        return nombreVariacion;
    }

    public void setNombreVariacion(String nombreVariacion) {
        this.nombreVariacion = nombreVariacion;
    }

    public List<AtributoDto> getAtributosDto() {
        return atributosDto;
    }

    public void setAtributosDto(List<AtributoDto> atributosDto) {
        this.atributosDto = atributosDto;
    }
}
