package com.muscleshop.web.models.dto;

import java.time.LocalDate;

public class UsuarioDto {

    private Integer id;
    private String nombres;
    private String apellidos;
    private String correo;
    private String tipoDocumento;
    private String nroDocumento;
    private String estadoNombre;
    private LocalDate fechaNacimiento;
    private LocalDate fechaCreacion;
    private LocalDate ultimoAcceso;
    private String nombreRolPerfil;
    private String telefono;

    public UsuarioDto() {}

    public UsuarioDto(Integer id, String nombres, String apellidos, String correo, String tipoDocumento, String nroDocumento, String estadoNombre, LocalDate fechaNacimiento, LocalDate fechaCreacion, LocalDate ultimoAcceso, String nombreRolPerfil, String telefono) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.tipoDocumento = tipoDocumento;
        this.nroDocumento = nroDocumento;
        this.estadoNombre = estadoNombre;
        this.fechaNacimiento = fechaNacimiento;
        this.fechaCreacion = fechaCreacion;
        this.ultimoAcceso = ultimoAcceso;
        this.nombreRolPerfil = nombreRolPerfil;
        this.telefono = telefono;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getNroDocumento() {
        return nroDocumento;
    }

    public void setNroDocumento(String nroDocumento) {
        this.nroDocumento = nroDocumento;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getEstadoNombre() {
        return estadoNombre;
    }

    public void setEstadoNombre(String estadoNombre) {
        this.estadoNombre = estadoNombre;
    }

    public LocalDate getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDate fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public LocalDate getUltimoAcceso() {
        return ultimoAcceso;
    }

    public void setUltimoAcceso(LocalDate ultimoAcceso) {
        this.ultimoAcceso = ultimoAcceso;
    }

    public String getNombreRolPerfil() {
        return nombreRolPerfil;
    }

    public void setNombreRolPerfil(String nombreRolPerfil) {
        this.nombreRolPerfil = nombreRolPerfil;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
