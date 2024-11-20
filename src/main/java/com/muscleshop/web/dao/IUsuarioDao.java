package com.muscleshop.web.dao;

import com.muscleshop.web.models.dto.UsuarioDto;
import org.springframework.data.jpa.repository.JpaRepository;

import com.muscleshop.web.models.Usuario;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IUsuarioDao extends JpaRepository<Usuario, Integer> {

	@Query("SELECT new com.muscleshop.web.models.dto.UsuarioDto(up.usuario.id, up.nombres, up.apellidos, up.usuario.correo, up.tipoDocumento, up.nroDocumento, up.usuario.estado.nombre,up.fechaNacimiento, up.usuario.fecha, up.usuario.ultimoAcceso, up.usuario.rolPerfil.nombre, up.usuario.usuarioPerfil.telefono) " +
			"FROM UsuarioPerfil up " +
			"WHERE up.usuario.correo =:correo " +
			"AND up.usuario.estado.nombre='Activo'")
	UsuarioDto findByEmail(@Param("correo") String correo);

	@Query("SELECT u " +
			"FROM Usuario u " +
			"WHERE u.correo = :correo " +
			"AND u.estado.nombre='Activo'")
	Usuario findByEmailV2(@Param("correo") String correo);


}
