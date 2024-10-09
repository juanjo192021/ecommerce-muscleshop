package com.muscleshop.web.services;

import java.util.ArrayList;
import java.util.List;

import com.muscleshop.web.dao.IProductoMenuSubDao;
import com.muscleshop.web.dao.IProductoPropiedadesDetallesDao;
import com.muscleshop.web.dao.IProductoPropiedadesDetallesVariacionDao;
import com.muscleshop.web.models.*;
import com.muscleshop.web.models.dto.ProductoCarritoDto;
import com.muscleshop.web.models.dto.ProductoItemsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IProductoDao;

@Service
public class ProductoService {

	@Autowired
	private IProductoDao productoDao;
	
	@Autowired
	UsuarioService usuarioService;

	@Autowired
	IProductoMenuSubDao productoMenuSubDao;

	@Autowired
	IProductoPropiedadesDetallesDao productoPropiedadesDetallesDao;

	@Autowired
	IProductoPropiedadesDetallesVariacionDao productoPropiedadesDetallesVariacionDao;

	public List<Producto> listarProducto() {
		return productoDao.findAll();
	}

	public Producto listarProductoPorID(Integer id) {
		return productoDao.findById(id).orElse(null);
	}

	public Producto obtenerProductoPorUrl(String productoUrl){
		return productoDao.findByUrl(productoUrl);
	}

    public List<Producto> buscarProducto(String nombre) {
		return productoDao.buscarProducto(nombre);
	}


	public List<ProductoDto> obtenerProductosItemsIndividualesPorForma() {
		List<ProductoDto> productosFinales = new ArrayList<>();

		List<ProductoMenuSub> productos = productoMenuSubDao.findByProductoCategoria_MenuSub_IdAndProductoCategoria_MenuSub_Estado_Id_AndProductoCategoria_Estado_Id(4,1,1);
		for (ProductoMenuSub productoMenuSub : productos) {
			ProductoCategoria categoria = productoMenuSub.getProductoCategoria();
			List<ProductoPropiedadesDetalles> propiedadesDetalles = productoPropiedadesDetallesDao.findByProducto_IdAndProductoForma_Id(productoMenuSub.getProducto().getId(),2);

			for (ProductoPropiedadesDetalles detalle : propiedadesDetalles) {
				ProductoDto productoDTO = new ProductoDto();
				productoDTO.setId(productoMenuSub.getProducto().getId());
				productoDTO.setNombre(productoMenuSub.getProducto().getNombre());
				productoDTO.setUrlProducto(productoMenuSub.getProducto().getUrl());
				productoDTO.setImagen(productoMenuSub.getProducto().getImagen());
				productoDTO.setNombreCategoria(categoria.getNombre());
				productoDTO.setUrlCategoria(categoria.getUrl());
				productoDTO.setNombreMenuSub(categoria.getMenuSub().getNombre());
				productoDTO.setUrlMenuSub(categoria.getMenuSub().getUrl());
				productoDTO.setProductoPropiedadDetalleId(detalle.getId());
				productoDTO.setPrecio(detalle.getPrecio());
				productoDTO.setPrecioReducido(detalle.getPrecioReducido());
				productoDTO.setStock(detalle.getStock());

				// Obtener las variaciones respetando el orden de creación
				List<String> variaciones = obtenerVariaciones(detalle.getId());
				productoDTO.setVariacion(String.join(" ", variaciones));

				productosFinales.add(productoDTO);
			}
		}
		return productosFinales;
	}

	List<String> obtenerVariaciones(Integer detalleId) {
		List<String> variaciones = new ArrayList<>();
		List<ProductoPropiedadesDetallesVariacion> variacionesDetalles = productoPropiedadesDetallesVariacionDao.findByProductoPropiedadesDetalles_Id(detalleId);

		// Ordenar variaciones según el orden de creación en la base de datos
		//variacionesDetalles.sort(Comparator.comparing(ProductoPropiedadesDetallesVariacion::getOrdenCreacion));

		for (ProductoPropiedadesDetallesVariacion variacion : variacionesDetalles) {
			variaciones.add(variacion.getProductoVariacion().getValor());
		}
		return variaciones;
	}


}
