package com.muscleshop.web.services;

import java.util.List;

import com.muscleshop.web.models.dto.UsuarioDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IUsuarioDao;
import com.muscleshop.web.models.Usuario;

@Service
public class UsuarioService {

	@Autowired
	private IUsuarioDao usuarioDao;

	public List<Usuario> listarUsuario() {
		return usuarioDao.findAll();
	}

	public Usuario listarUsuarioID(Integer id) {
		return usuarioDao.findById(id).orElse(null);
	}

	public void saveUsuario(Usuario usuario) {
		usuarioDao.save(usuario);
	}

	public UsuarioDto obtenerUsuarioPorCorreo(String correo) {
		return usuarioDao.findByEmail(correo);
	}

	public Usuario obtenerUsuarioPorCorreoV2(String correo) {
		return usuarioDao.findByEmailV2(correo);
	}
}
