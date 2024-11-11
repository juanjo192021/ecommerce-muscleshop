package com.muscleshop.web.models.dto;

import java.util.List;

public class ProductoDto {
    private Integer id;
    private String nombre;
    private String urlProducto;
    private String imagen;
    private String nombreCategoria;
    private String urlCategoria;
    private String nombreMenuSub;
    private String urlMenuSub;
    private String nombreMenu;
    private String urlMenu;
    private String nombreMarca;
    private String urlMarca;
    private Integer productoPropiedadDetalleId;
    private String skuProductoPropiedadesDetalles;
    private Double precio;
    private Double precioReducido;
    private Double precioTeam;
    private Double precioTeamVip;
    private Double precioFamiliar;
    private Integer stock;
    private String variacion;
    private List<String> variaciones;

    public ProductoDto(){}

    // Constructor


    public ProductoDto(Integer id, String nombre, String urlProducto, String imagen, String nombreCategoria, String urlCategoria, String nombreMenuSub, String urlMenuSub, String nombreMenu, String urlMenu, String nombreMarca, String urlMarca, Integer productoPropiedadDetalleId, String skuProductoPropiedadesDetalles, Double precio, Double precioReducido, Double precioTeam, Double precioTeamVip, Double precioFamiliar, Integer stock, String variacion, List<String> variaciones) {
        this.id = id;
        this.nombre = nombre;
        this.urlProducto = urlProducto;
        this.imagen = imagen;
        this.nombreCategoria = nombreCategoria;
        this.urlCategoria = urlCategoria;
        this.nombreMenuSub = nombreMenuSub;
        this.urlMenuSub = urlMenuSub;
        this.nombreMenu = nombreMenu;
        this.urlMenu = urlMenu;
        this.nombreMarca = nombreMarca;
        this.urlMarca = urlMarca;
        this.productoPropiedadDetalleId = productoPropiedadDetalleId;
        this.skuProductoPropiedadesDetalles = skuProductoPropiedadesDetalles;
        this.precio = precio;
        this.precioReducido = precioReducido;
        this.precioTeam = precioTeam;
        this.precioTeamVip = precioTeamVip;
        this.precioFamiliar = precioFamiliar;
        this.stock = stock;
        this.variacion = variacion;
        this.variaciones = variaciones;
    }

    // Getters y Setters
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

    public String getUrlProducto() {
        return urlProducto;
    }

    public void setUrlProducto(String urlProducto) {
        this.urlProducto = urlProducto;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
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

    public String getNombreMarca() {
        return nombreMarca;
    }

    public void setNombreMarca(String nombreMarca) {
        this.nombreMarca = nombreMarca;
    }

    public String getUrlMarca() {
        return urlMarca;
    }

    public void setUrlMarca(String urlMarca) {
        this.urlMarca = urlMarca;
    }

    public Integer getProductoPropiedadDetalleId() {
        return productoPropiedadDetalleId;
    }

    public void setProductoPropiedadDetalleId(Integer productoPropiedadDetalleId) {
        this.productoPropiedadDetalleId = productoPropiedadDetalleId;
    }

    public String getSkuProductoPropiedadesDetalles() {
        return skuProductoPropiedadesDetalles;
    }

    public void setSkuProductoPropiedadesDetalles(String skuProductoPropiedadesDetalles) {
        this.skuProductoPropiedadesDetalles = skuProductoPropiedadesDetalles;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public Double getPrecioReducido() {
        return precioReducido;
    }

    public void setPrecioReducido(Double precioReducido) {
        this.precioReducido = precioReducido;
    }

    public Double getPrecioTeam() {
        return precioTeam;
    }

    public void setPrecioTeam(Double precioTeam) {
        this.precioTeam = precioTeam;
    }

    public Double getPrecioTeamVip() {
        return precioTeamVip;
    }

    public void setPrecioTeamVip(Double precioTeamVip) {
        this.precioTeamVip = precioTeamVip;
    }

    public Double getPrecioFamiliar() {
        return precioFamiliar;
    }

    public void setPrecioFamiliar(Double precioFamiliar) {
        this.precioFamiliar = precioFamiliar;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getVariacion() {
        return variacion;
    }

    public void setVariacion(String variacion) {
        this.variacion = variacion;
    }

    public List<String> getVariaciones() {
        return variaciones;
    }

    public void setVariaciones(List<String> variaciones) {
        this.variaciones = variaciones;
    }
}
