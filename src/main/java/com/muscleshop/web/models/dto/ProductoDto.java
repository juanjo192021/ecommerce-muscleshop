package com.muscleshop.web.models.dto;

import java.util.List;

public class ProductoDto {
    private Integer id; // id del Producto de ProductoMenuSub
    private String nombre; // nombre del Producto de ProductoMenuSub
    private String urlProducto; // url del Producto de ProductoMenuSub
    private String imagen; // imagen del Producto de ProductoMenuSub
    private String nombreCategoria; // nombre del ProductoCategoria de ProductoMenuSub
    private String urlCategoria; // urlCategoria del ProductoCategoria de ProductoMenuSub
    private String nombreMenuSub; // nombre del MenuSub de ProductoCategoria de ProductoMenuSub
    private String urlMenuSub; // url del MenuSub de ProductoCategoria de ProductoMenuSub
    private Integer productoPropiedadDetalleId; // id del ProductoPropiedadesDetalles
    private String skuProductoPropiedadesDetalles;
    private Double precio; // precio del ProductoPropiedadesDetalles
    private Double precioReducido; // precioReducido del ProductoPropiedadesDetalles
    private Integer stock; // stock del ProductoPropiedadesDetalles
    private String variacion; // variacion del ProductoVariaciones
    private List<String> variaciones;

    public ProductoDto(){}
    // Constructor


    public ProductoDto(Integer id, String nombre, String urlProducto, String imagen, String nombreCategoria, String urlCategoria, String nombreMenuSub, String urlMenuSub, Integer productoPropiedadDetalleId, String skuProductoPropiedadesDetalles, Double precio, Double precioReducido, Integer stock, String variacion, List<String> variaciones) {
        this.id = id;
        this.nombre = nombre;
        this.urlProducto = urlProducto;
        this.imagen = imagen;
        this.nombreCategoria = nombreCategoria;
        this.urlCategoria = urlCategoria;
        this.nombreMenuSub = nombreMenuSub;
        this.urlMenuSub = urlMenuSub;
        this.productoPropiedadDetalleId = productoPropiedadDetalleId;
        this.skuProductoPropiedadesDetalles = skuProductoPropiedadesDetalles;
        this.precio = precio;
        this.precioReducido = precioReducido;
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
