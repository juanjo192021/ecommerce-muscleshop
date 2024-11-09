package com.muscleshop.web.models;

import java.time.LocalDate;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity
@Table(name = "usuarios")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String correo;
	private String password;

	@OneToOne
	@JoinColumn(name = "estado_id")
	private Estado estado;

	private LocalDate fecha;

	@Column(name = "ultimo_acceso")
	private LocalDate ultimoAcceso;

	@ManyToOne
	@JoinColumn(name = "rol_perfil_id")
	private RolPerfil rolPerfil;

	@OneToMany(mappedBy = "usuario")
	@JsonIgnore
	private Set<UsuarioRol> usuarioRoles;

	@OneToOne(mappedBy = "usuario")
	private UsuarioPerfil usuarioPerfil;

	@OneToMany(mappedBy = "usuario")
	@JsonIgnore
	private Set<UsuarioDireccion> usuarioDirecciones;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public LocalDate getUltimoAcceso() {
		return ultimoAcceso;
	}

	public void setUltimoAcceso(LocalDate ultimoAcceso) {
		this.ultimoAcceso = ultimoAcceso;
	}

	public RolPerfil getRolPerfil() {
		return rolPerfil;
	}

	public void setRolPerfil(RolPerfil rolPerfil) {
		this.rolPerfil = rolPerfil;
	}

	public Set<UsuarioRol> getUsuarioRoles() {
		return usuarioRoles;
	}

	public void setUsuarioRoles(Set<UsuarioRol> usuarioRoles) {
		this.usuarioRoles = usuarioRoles;
	}

	public UsuarioPerfil getUsuarioPerfil() {
		return usuarioPerfil;
	}

	public void setUsuarioPerfil(UsuarioPerfil usuarioPerfil) {
		this.usuarioPerfil = usuarioPerfil;
	}

	public Set<UsuarioDireccion> getUsuarioDirecciones() {
		return usuarioDirecciones;
	}

	public void setUsuarioDirecciones(Set<UsuarioDireccion> usuarioDirecciones) {
		this.usuarioDirecciones = usuarioDirecciones;
	}
}
