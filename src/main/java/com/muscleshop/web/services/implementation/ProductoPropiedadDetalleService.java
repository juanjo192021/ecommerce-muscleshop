package com.muscleshop.web.services.implementation;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import com.muscleshop.web.models.Producto;
import com.muscleshop.web.models.ProductoMenuSub;
import com.muscleshop.web.models.ProductoPropiedadesDetalles;
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

	public List<ProductoItemsDto> obtenerProductoPropiedadesDetallesPorForma(int productoFormaId){
		List<ProductoPropiedadesDetalles> productoPropiedadesDetalles = iProductoPropiedadesDetallesDao.findByProductoForma_IdAndProductoForma_Estado_IdAndEstado_Id(productoFormaId,estadoId,estadoId);
		return obtenerProductosItemsModificados(productoPropiedadesDetalles);
	}

	/*public List<ProductoPropiedadesDetalles> listarProDetPro() {
		return productoProDetDao.findAll();
	}

	public ProductoPropiedadesDetalles listarPorID(Integer id) {
		return productoProDetDao.findById(id).orElse(null);
	}*/
	
/*	public List<ProductoPropiedadesDetalles> obtenerProductosPorIdPresentacion(int idPresentacion) {
	    return productoProDetDao.findByPropiedadesDetallesId(idPresentacion);
	}*/
	
/*
	public List<ProductoPropiedadesDetalles> obtenerPorTipoDePropiedad(int productoId, int tipoPropiedadId) {
        return productoProDetDao.findByProductoIdAndPropiedadesDetalles_Propiedades_Id(productoId, tipoPropiedadId);
    }
*/



/*	public List<ProductoPropiedadesDetalles> findByMenuSubUrl(String menuSubUrl, Integer estado){
		return productoProDetDao.findByMenuSubUrl(menuSubUrl, estado);
	}

	public List<ProductoPropiedadesDetalles> findByCategoriaUrl(String categoriaUrl, Integer estado){
		return productoProDetDao.findByCategoriaUrl(categoriaUrl, estado);
	}

	public ProductoPropiedadesDetalles obtenerProductoPropiedadDetallePorVariaciones(Integer productoId, Integer propiedadesDetallesId, Integer propiedadesDetallesId2){
		return productoProDetDao.findByPropiedadesDetallesAndProductoId(productoId, propiedadesDetallesId, propiedadesDetallesId2);
	}
*/
	public List<ProductoItemsDto> obtenerProductosIndividualesPorMenuSubId(Double minPrecio, Double maxPrecio, Integer menuSubId) {

		List<ProductoPropiedadesDetalles> productos = new ArrayList<>();
		if(minPrecio == null && maxPrecio == null){
			//productos = iProductoPropiedadesDetallesDao.findByProducto_ProductoCategoria_MenuSub_Id(menuSubId);
			productos = iProductoPropiedadesDetallesDao.findAll();
		}
		if(minPrecio != null && maxPrecio != null){
			//productos = iProductoPropiedadesDetallesDao.findByPrecioBetweenAndMenuSubId(minPrecio, maxPrecio, menuSubId);
			productos = iProductoPropiedadesDetallesDao.findAll();
		}
		return obtenerProductosItemsModificados(productos);
	}
	public List<ProductoItemsDto> obtenerProductosIndividualesPorCategoriaId (Double minPrecio, Double maxPrecio,Integer categoriaId){

		List<ProductoPropiedadesDetalles> productos = new ArrayList<>();
		if(minPrecio == null && maxPrecio == null){
			//productos = iProductoPropiedadesDetallesDao.findByProducto_ProductoCategoria_Id(categoriaId);
			productos = iProductoPropiedadesDetallesDao.findAll();
		}
		if(minPrecio != null && maxPrecio != null){
			//productos = iProductoPropiedadesDetallesDao.findByPrecioBetweenAndCategoriaId(minPrecio, maxPrecio, categoriaId);
			productos = iProductoPropiedadesDetallesDao.findAll();
		}

		return obtenerProductosItemsModificados(productos);
	}

	public ProductoPropiedadesDetalles obtenerProductoPropiedadDetallesPorVariaciones(int productoId, String variacion1, String variacion2){
		//return iProductoPropiedadesDetallesDao.findByProducto_IdAndProductoVariacion1_ValorAndProductoVariacion2_Valor(productoId, variacion1, variacion2);
		return iProductoPropiedadesDetallesDao.findById(1).orElse(null);
	}

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

	@Override
	public List<ProductoPropiedadesDetalles> pruebasProductosPropiedadesDetalles(){
		List<Integer> lista = new ArrayList<>();
		lista.add(1);
		lista.add(2);
		lista.add(7);
		lista.add(11);

		return iProductoPropiedadesDetallesDao.findActiveProductoPropiedadesDetalles(lista, 1);
	}

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
}
