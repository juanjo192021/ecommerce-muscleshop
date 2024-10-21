package com.muscleshop.web.models.dto;

public class PresentacionDto {
    private Integer id;
    private Integer idProducto; // id del Producto de ProductoMenuSub
    private String nombreProducto; // nombre del Producto de ProductoMenuSub
    private String urlProducto; // url del Producto de ProductoMenuSub
    private String nombreEstadoProducto; // url del Producto de ProductoMenuSub
    private String imagen; // imagen del Producto de ProductoMenuSub
    private String skuProductoPropiedadesDetalles;
    private Integer stock;
    private Double precio;
    private Double precioReducido;
    private Double precioTeam;
    private Double precioTeamVip;
    private Double precioFamiliar;
    private String nombreEstadoProductoPropiedadesDetalles;

    public PresentacionDto(){}

    public PresentacionDto(Integer id, Integer idProducto, String nombreProducto, String urlProducto, String nombreEstadoProducto, String imagen, String skuProductoPropiedadesDetalles, Integer stock, Double precio, Double precioReducido, Double precioTeam, Double precioTeamVip, Double precioFamiliar, String nombreEstadoProductoPropiedadesDetalles) {
        this.id = id;
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.urlProducto = urlProducto;
        this.nombreEstadoProducto = nombreEstadoProducto;
        this.imagen = imagen;
        this.skuProductoPropiedadesDetalles = skuProductoPropiedadesDetalles;
        this.stock = stock;
        this.precio = precio;
        this.precioReducido = precioReducido;
        this.precioTeam = precioTeam;
        this.precioTeamVip = precioTeamVip;
        this.precioFamiliar = precioFamiliar;
        this.nombreEstadoProductoPropiedadesDetalles = nombreEstadoProductoPropiedadesDetalles;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getUrlProducto() {
        return urlProducto;
    }

    public void setUrlProducto(String urlProducto) {
        this.urlProducto = urlProducto;
    }

    public String getNombreEstadoProducto() {
        return nombreEstadoProducto;
    }

    public void setNombreEstadoProducto(String nombreEstadoProducto) {
        this.nombreEstadoProducto = nombreEstadoProducto;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getSkuProductoPropiedadesDetalles() {
        return skuProductoPropiedadesDetalles;
    }

    public void setSkuProductoPropiedadesDetalles(String skuProductoPropiedadesDetalles) {
        this.skuProductoPropiedadesDetalles = skuProductoPropiedadesDetalles;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
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

    public String getNombreEstadoProductoPropiedadesDetalles() {
        return nombreEstadoProductoPropiedadesDetalles;
    }

    public void setNombreEstadoProductoPropiedadesDetalles(String nombreEstadoProductoPropiedadesDetalles) {
        this.nombreEstadoProductoPropiedadesDetalles = nombreEstadoProductoPropiedadesDetalles;
    }
}
