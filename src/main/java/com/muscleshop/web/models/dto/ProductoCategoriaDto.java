package com.muscleshop.web.models.dto;

public class ProductoCategoriaDto {

    private Integer idCategoria;
    private String nombreCategoria;
    private String urlCategoria;
    private Integer idMenuSub;
    private String nombreMenuSub;
    private String urlMenuSub;
    private Integer idMenu;
    private String nombreMenu;
    private String urlMenu;
    private String nombreEstadoCategoria;

    public ProductoCategoriaDto() {}

    public ProductoCategoriaDto(Integer idCategoria, String nombreCategoria, String urlCategoria, Integer idMenuSub, String nombreMenuSub, String urlMenuSub, Integer idMenu, String nombreMenu, String urlMenu, String nombreEstadoCategoria) {
        this.idCategoria = idCategoria;
        this.nombreCategoria = nombreCategoria;
        this.urlCategoria = urlCategoria;
        this.idMenuSub = idMenuSub;
        this.nombreMenuSub = nombreMenuSub;
        this.urlMenuSub = urlMenuSub;
        this.idMenu = idMenu;
        this.nombreMenu = nombreMenu;
        this.urlMenu = urlMenu;
        this.nombreEstadoCategoria = nombreEstadoCategoria;
    }

    public Integer getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(Integer idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

    public String getUrlCategoria() {
        return urlCategoria;
    }

    public void setUrlCategoria(String urlCategoria) {
        this.urlCategoria = urlCategoria;
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

    public String getNombreEstadoCategoria() {
        return nombreEstadoCategoria;
    }

    public void setNombreEstadoCategoria(String nombreEstadoCategoria) {
        this.nombreEstadoCategoria = nombreEstadoCategoria;
    }
}
