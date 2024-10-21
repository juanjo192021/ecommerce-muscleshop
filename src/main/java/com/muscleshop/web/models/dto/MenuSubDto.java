package com.muscleshop.web.models.dto;

public class MenuSubDto {
    private Integer idMenuSub;
    private String nombreMenuSub;
    private String urlMenuSub;
    private String imagenMenuSub;
    private Integer idMenu;
    private String nombreMenu;
    private String urlMenu;
    private String nombreEstadoMenuSub;

    public MenuSubDto (){}

    public MenuSubDto(Integer idMenuSub, String nombreMenuSub, String urlMenuSub, String imagenMenuSub, Integer idMenu, String nombreMenu, String urlMenu, String nombreEstadoMenuSub) {
        this.idMenuSub = idMenuSub;
        this.nombreMenuSub = nombreMenuSub;
        this.urlMenuSub = urlMenuSub;
        this.imagenMenuSub = imagenMenuSub;
        this.idMenu = idMenu;
        this.nombreMenu = nombreMenu;
        this.urlMenu = urlMenu;
        this.nombreEstadoMenuSub = nombreEstadoMenuSub;
    }

    public Integer getIdMenuSub() {
        return idMenuSub;
    }

    public void setIdMenuSub(Integer idMenuSub) {
        this.idMenuSub = idMenuSub;
    }

    public String getNombreMenuSub() {
        return nombreMenuSub;
    }

    public void setNombreMenuSub(String nombreMenuSub) {
        this.nombreMenuSub = nombreMenuSub;
    }

    public String getUrlMenuSub() {
        return urlMenuSub;
    }

    public void setUrlMenuSub(String urlMenuSub) {
        this.urlMenuSub = urlMenuSub;
    }

    public String getImagenMenuSub() {
        return imagenMenuSub;
    }

    public void setImagenMenuSub(String imagenMenuSub) {
        this.imagenMenuSub = imagenMenuSub;
    }

    public Integer getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(Integer idMenu) {
        this.idMenu = idMenu;
    }

    public String getNombreMenu() {
        return nombreMenu;
    }

    public void setNombreMenu(String nombreMenu) {
        this.nombreMenu = nombreMenu;
    }

    public String getUrlMenu() {
        return urlMenu;
    }

    public void setUrlMenu(String urlMenu) {
        this.urlMenu = urlMenu;
    }

    public String getNombreEstadoMenuSub() {
        return nombreEstadoMenuSub;
    }

    public void setNombreEstadoMenuSub(String nombreEstadoMenuSub) {
        this.nombreEstadoMenuSub = nombreEstadoMenuSub;
    }
}
