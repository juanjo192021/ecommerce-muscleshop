package com.muscleshop.web.services.implementation;

import java.util.List;

import com.muscleshop.web.services.IArticuloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IArticuloDao;
import com.muscleshop.web.models.Articulo;

@Service
public class ArticuloService implements IArticuloService {

	@Autowired
	private IArticuloDao articuloDao;

	private int estadoId = 1;
	private int cantidadArticulos = 6;

	@Override
	public List<Articulo> obtenerArticulos() {
		return articuloDao.findByEstado_Nombre("Activo");
	}

	@Override
	public List<Articulo> obtenerArticulosPorCantidad() {
		// Crear un Pageable con el tamaño deseado
		PageRequest pageable = PageRequest.of(0, cantidadArticulos);
		// Llamar al repositorio con el estado deseado y el Pageable
		return  articuloDao.findAllByEstado_NombreOrderByIdDesc("Activo", pageable);
	}
}
