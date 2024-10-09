package com.muscleshop.web.models.dto;

public class AtributoDto {

    private Integer id;
    private String nombreAtributo;

    // Constructor, getters y setters
    public AtributoDto(Integer id, String nombreAtributo) {
        this.id = id;
        this.nombreAtributo = nombreAtributo;
    }

    // Getters y Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombreAtributo() {
        return nombreAtributo;
    }

    public void setNombreAtributo(String nombreAtributo) {
        this.nombreAtributo = nombreAtributo;
    }
}
