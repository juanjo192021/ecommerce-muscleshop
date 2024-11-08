package com.muscleshop.web.services.implementation;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import com.muscleshop.web.models.ProductoMenuSub;
import com.muscleshop.web.models.ProductoPropiedadesDetalles;
import com.muscleshop.web.models.dto.PresentacionDto;
import com.muscleshop.web.models.dto.ProductoCarritoDto;
import com.muscleshop.web.models.dto.ProductoItemsDto;
import com.muscleshop.web.services.IProductoPropiedadesDetallesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IProductoPropiedadesDetallesDao;

@Service
public class ProductoPropiedadDetalleService implements IProductoPropiedadesDetallesService {
	
	@Autowired
	private IProductoPropiedadesDetallesDao iProductoPropiedadesDetallesDao;

	private int estadoId=1;

	//Se usaba en pedidos en la sesión, no se usa
	public ProductoCarritoDto obtenerProductoPropiedadDetallePorId(Integer id) {
		ProductoPropiedadesDetalles productoPropiedadesDetalles = iProductoPropiedadesDetallesDao.findById(id).orElse(null);
		ProductoCarritoDto productoCarritoDto = new ProductoCarritoDto();
        assert productoPropiedadesDetalles != null;
        productoCarritoDto.setProductoId(productoPropiedadesDetalles.getProducto().getId());
		productoCarritoDto.setProductoPropiedadDetalleId(productoPropiedadesDetalles.getId());
		productoCarritoDto.setNombreProducto(productoPropiedadesDetalles.getProducto().getNombre());
		productoCarritoDto.setImagenProducto(productoPropiedadesDetalles.getImagen());
		//productoCarritoDto.setNombrePropiedadDetalle(productoPropiedadesDetalles.getProductoVariacion1().getValor());
		//productoCarritoDto.setNombrePropiedadDetalle2(productoPropiedadesDetalles.getProductoVariacion2()==null || productoPropiedadesDetalles.getProductoVariacion2().getValor()==null ? "Sin sabor" : productoPropiedadesDetalles.getProductoVariacion2().getValor());
		productoCarritoDto.setPrecio(productoPropiedadesDetalles.getPrecio());
		productoCarritoDto.setPrecioReducido(productoPropiedadesDetalles.getPrecioReducido());

		return productoCarritoDto;
	}

	//No se usa
	public List<ProductoItemsDto> obtenerProductosItemsModificados(List<ProductoPropiedadesDetalles> productoPropiedadesDetalles){

		List<ProductoItemsDto> productosIndividuales = new ArrayList<>();

		for(ProductoPropiedadesDetalles productoPropiedadDetalle: productoPropiedadesDetalles){
			ProductoItemsDto nuevoProducto = new ProductoItemsDto();
			nuevoProducto.setId(productoPropiedadDetalle.getProducto().getId());
			nuevoProducto.setNombre(productoPropiedadDetalle.getProducto().getNombre());
			nuevoProducto.setImagen(productoPropiedadDetalle.getImagen().isEmpty() ? productoPropiedadDetalle.getProducto().getImagen() : productoPropiedadDetalle.getImagen());
			nuevoProducto.setUrlProducto(productoPropiedadDetalle.getProducto().getUrl());
			//nuevoProducto.setNombreCategoria(productoPropiedadDetalle.getProducto().getProductoCategoria().getNombre());
			//nuevoProducto.setUrlCategoria(productoPropiedadDetalle.getProducto().getProductoCategoria().getUrl());
			//nuevoProducto.setNombreMenuSub(productoPropiedadDetalle.getProducto().getProductoCategoria().getMenuSub().getNombre());
			//nuevoProducto.setUrlMenuSub(productoPropiedadDetalle.getProducto().getProductoCategoria().getMenuSub().getUrl());
			nuevoProducto.setProductoPropiedadDetalleId(productoPropiedadDetalle.getId());
			nuevoProducto.setPrecio(productoPropiedadDetalle.getPrecio());
			nuevoProducto.setPrecioReducido(productoPropiedadDetalle.getPrecioReducido());
			nuevoProducto.setStock(productoPropiedadDetalle.getStock());
			//nuevoProducto.setDetalleNombre(productoPropiedadDetalle.getProductoVariacion1().getValor());
			//nuevoProducto.setDetalleModificado(productoPropiedadDetalle.getProductoVariacion2() == null || productoPropiedadDetalle.getProductoVariacion2().getValor() == null ? "Sin sabor" : productoPropiedadDetalle.getProductoVariacion2().getValor());
			for(ProductoMenuSub pms : productoPropiedadDetalle.getProducto().getProductoMenusSub()){
				if(pms.getMenuSub().getMenu().getId() == 6){
					nuevoProducto.setNombreMarca(pms.getMenuSub().getNombre());
					nuevoProducto.setUrlMarca(pms.getMenuSub().getUrl());
					nuevoProducto.setUrlMenuMarca(pms.getMenuSub().getMenu().getUrl());
				}
			}
			productosIndividuales.add(nuevoProducto);
		}

		// Ordenar la lista por el id de forma descendente .reversed()
		productosIndividuales.sort(Comparator.comparing(ProductoItemsDto::getId));

		return productosIndividuales;
	}

	@Override
	public PresentacionDto obtenerPresentacionPorIdProductoAndVariaciones(int productoId, List<String> variaciones) {
		return iProductoPropiedadesDetallesDao.findPresentacionByIdProductoAndVariacionesValor(productoId, variaciones, variaciones.size() ,estadoId);
	}


}
