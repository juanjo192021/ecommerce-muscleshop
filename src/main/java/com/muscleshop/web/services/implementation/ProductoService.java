package com.muscleshop.web.services.implementation;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.muscleshop.web.dao.IProductoMenuSubDao;
import com.muscleshop.web.dao.IProductoPropiedadesDetallesDao;
import com.muscleshop.web.dao.IProductoPropiedadesDetallesVariacionDao;
import com.muscleshop.web.models.*;
import com.muscleshop.web.models.dto.ProductoDto;
import com.muscleshop.web.models.dto.UsuarioDto;
import com.muscleshop.web.services.IProductoService;
import com.muscleshop.web.services.UsuarioService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IProductoDao;

@Service
public class ProductoService implements IProductoService {

	@Autowired
	private IProductoDao productoDao;

	@Autowired
	private IProductoMenuSubDao productoMenuSubDao;

	@Autowired
	private IProductoPropiedadesDetallesDao productoPropiedadesDetallesDao;

	@Autowired
	private IProductoPropiedadesDetallesVariacionDao productoPropiedadesDetallesVariacionDao;

	@Override
	public Producto obtenerProductoPorUrl(String productoUrl){
		return productoDao.findByUrl(productoUrl);
	}

	@Override
	public Page<ProductoDto> obtenerProductosItemsIndividialesPorMenuSubId(int menuSubId, double minPrecio, double maxPrecio, Pageable pageable) {
		List<ProductoDto> productosFinales = new ArrayList<>();
		List<ProductoMenuSub> productosPage = productoMenuSubDao.findByProductoCategoria_MenuSub_Id(menuSubId);
		for (ProductoMenuSub productoMenuSub : productosPage) {
			ProductoCategoria categoria = productoMenuSub.getProductoCategoria();
			List<ProductoPropiedadesDetalles> propiedadesDetalles = productoPropiedadesDetallesDao.findByProductoIdAndPrecioReducido(productoMenuSub.getProducto().getId(), minPrecio, maxPrecio);

			for (ProductoPropiedadesDetalles detalle : propiedadesDetalles) {
				ProductoDto productoDTO = new ProductoDto();
				productoDTO.setId(productoMenuSub.getProducto().getId());
				productoDTO.setNombre(productoMenuSub.getProducto().getNombre());
				productoDTO.setUrlProducto(productoMenuSub.getProducto().getUrl());
				productoDTO.setImagen(detalle.getImagen());
				productoDTO.setNombreCategoria(categoria.getNombre());
				productoDTO.setUrlCategoria(categoria.getUrl());
				productoDTO.setNombreMenuSub(categoria.getMenuSub().getNombre());
				productoDTO.setUrlMenuSub(categoria.getMenuSub().getUrl());
				productoDTO.setNombreMenu(categoria.getMenuSub().getMenu().getNombre());
				productoDTO.setUrlMenu(categoria.getMenuSub().getMenu().getUrl());
				productoDTO.setNombreMarca(productoMenuSub.getProducto().getMarca().getNombre());
				productoDTO.setUrlMarca(productoMenuSub.getProducto().getMarca().getUrl());
				productoDTO.setProductoPropiedadDetalleId(detalle.getId());
				productoDTO.setSkuProductoPropiedadesDetalles(detalle.getSku());

				productoDTO.setPrecio(detalle.getPrecio());
				productoDTO.setPrecioReducido(detalle.getPrecioReducido());
				productoDTO.setPrecioTeam(detalle.getPrecioTeam());
				productoDTO.setPrecioTeamVip(detalle.getPrecioTeamVip());
				productoDTO.setPrecioFamiliar(detalle.getPrecioFamiliar());

				productoDTO.setStock(detalle.getStock());
				List<String> variaciones = obtenerVariaciones(detalle.getId());
				productoDTO.setVariacion(String.join(" ", variaciones));
				productoDTO.setVariaciones(variaciones);
				productosFinales.add(productoDTO);
			}
		}

		int start = (int) pageable.getOffset();
		int end = Math.min((start + pageable.getPageSize()), productosFinales.size());
		Page<ProductoDto> page = new PageImpl<>(productosFinales.subList(start, end), pageable, productosFinales.size());
		return page;
	}

	@Override
	public Page<ProductoDto> obtenerProductosItemsIndividialesPorCategoriaId(int productoCategoriaId, double minPrecio, double maxPrecio, Pageable pageable){

		List<ProductoDto> productosFinales = new ArrayList<>();
		List<ProductoMenuSub> productos = productoMenuSubDao.findByProductoCategoria_Id(productoCategoriaId);

		for (ProductoMenuSub productoMenuSub : productos) {
			ProductoCategoria categoria = productoMenuSub.getProductoCategoria();
			List<ProductoPropiedadesDetalles> propiedadesDetalles = productoPropiedadesDetallesDao.findByProductoIdAndPrecioReducido(productoMenuSub.getProducto().getId(),minPrecio,maxPrecio);

			for (ProductoPropiedadesDetalles detalle : propiedadesDetalles) {
				ProductoDto productoDTO = new ProductoDto();
				productoDTO.setId(productoMenuSub.getProducto().getId());
				productoDTO.setNombre(productoMenuSub.getProducto().getNombre());
				productoDTO.setUrlProducto(productoMenuSub.getProducto().getUrl());
				productoDTO.setImagen(detalle.getImagen());
				productoDTO.setNombreCategoria(categoria.getNombre());
				productoDTO.setUrlCategoria(categoria.getUrl());
				productoDTO.setNombreMenuSub(categoria.getMenuSub().getNombre());
				productoDTO.setUrlMenuSub(categoria.getMenuSub().getUrl());
				productoDTO.setNombreMenu(categoria.getMenuSub().getMenu().getNombre());
				productoDTO.setUrlMenu(categoria.getMenuSub().getMenu().getUrl());
				productoDTO.setNombreMarca(productoMenuSub.getProducto().getMarca().getNombre());
				productoDTO.setUrlMarca(productoMenuSub.getProducto().getMarca().getUrl());
				productoDTO.setProductoPropiedadDetalleId(detalle.getId());
				productoDTO.setSkuProductoPropiedadesDetalles(detalle.getSku());

				productoDTO.setPrecio(detalle.getPrecio());
				productoDTO.setPrecioReducido(detalle.getPrecioReducido());
				productoDTO.setPrecioTeam(detalle.getPrecioTeam());
				productoDTO.setPrecioTeamVip(detalle.getPrecioTeamVip());
				productoDTO.setPrecioFamiliar(detalle.getPrecioFamiliar());

				productoDTO.setStock(detalle.getStock());

				// Obtener las variaciones respetando el orden de creación
				List<String> variaciones = obtenerVariaciones(detalle.getId());
				productoDTO.setVariacion(String.join(" ", variaciones));
				productoDTO.setVariaciones(variaciones);

				productosFinales.add(productoDTO);
			}
		}
		int start = (int) pageable.getOffset();
		int end = Math.min((start + pageable.getPageSize()), productosFinales.size());
		Page<ProductoDto> page = new PageImpl<>(productosFinales.subList(start, end), pageable, productosFinales.size());
		return page;
	}

	@Override
	public Page<ProductoDto> obtenerProductosItemsIndividialesPorObjetivoId(int objetivoId, double minPrecio, double maxPrecio, Pageable pageable){

		List<ProductoDto> productosFinales = new ArrayList<>();
		List<ProductoMenuSub> productos = productoMenuSubDao.findByObjetivoId(objetivoId);

		for (ProductoMenuSub productoMenuSub : productos) {
			ProductoCategoria categoria = productoMenuSub.getProductoCategoria();
			List<ProductoPropiedadesDetalles> propiedadesDetalles = productoPropiedadesDetallesDao.findByProductoIdAndPrecioReducido(productoMenuSub.getProducto().getId(),minPrecio,maxPrecio);

			for (ProductoPropiedadesDetalles detalle : propiedadesDetalles) {
				ProductoDto productoDTO = new ProductoDto();
				productoDTO.setId(productoMenuSub.getProducto().getId());
				productoDTO.setNombre(productoMenuSub.getProducto().getNombre());
				productoDTO.setUrlProducto(productoMenuSub.getProducto().getUrl());
				productoDTO.setImagen(detalle.getImagen());
				productoDTO.setNombreCategoria(categoria.getNombre());
				productoDTO.setUrlCategoria(categoria.getUrl());
				productoDTO.setNombreMenuSub(categoria.getMenuSub().getNombre());
				productoDTO.setUrlMenuSub(categoria.getMenuSub().getUrl());
				productoDTO.setNombreMenu(categoria.getMenuSub().getMenu().getNombre());
				productoDTO.setUrlMenu(categoria.getMenuSub().getMenu().getUrl());
				productoDTO.setNombreMarca(productoMenuSub.getProducto().getMarca().getNombre());
				productoDTO.setUrlMarca(productoMenuSub.getProducto().getMarca().getUrl());
				productoDTO.setProductoPropiedadDetalleId(detalle.getId());
				productoDTO.setSkuProductoPropiedadesDetalles(detalle.getSku());

				productoDTO.setPrecio(detalle.getPrecio());
				productoDTO.setPrecioReducido(detalle.getPrecioReducido());
				productoDTO.setPrecioTeam(detalle.getPrecioTeam());
				productoDTO.setPrecioTeamVip(detalle.getPrecioTeamVip());
				productoDTO.setPrecioFamiliar(detalle.getPrecioFamiliar());

				productoDTO.setStock(detalle.getStock());

				// Obtener las variaciones respetando el orden de creación
				List<String> variaciones = obtenerVariaciones(detalle.getId());
				productoDTO.setVariacion(String.join(" ", variaciones));
				productoDTO.setVariaciones(variaciones);

				productosFinales.add(productoDTO);
			}
		}
		int start = (int) pageable.getOffset();
		int end = Math.min((start + pageable.getPageSize()), productosFinales.size());
		Page<ProductoDto> page = new PageImpl<>(productosFinales.subList(start, end), pageable, productosFinales.size());
		return page;
	}


	@Override
	public Page<ProductoDto> obtenerProductosItemsIndividialesPorMarcaId(int marcaId, double minPrecio, double maxPrecio, Pageable pageable){

		List<ProductoDto> productosFinales = new ArrayList<>();
		List<ProductoMenuSub> productos = productoMenuSubDao.findByMarcaId(marcaId);

		for (ProductoMenuSub productoMenuSub : productos) {
			ProductoCategoria categoria = productoMenuSub.getProductoCategoria();
			List<ProductoPropiedadesDetalles> propiedadesDetalles = productoPropiedadesDetallesDao.findByProductoIdAndPrecioReducido(productoMenuSub.getProducto().getId(),minPrecio,maxPrecio);

			for (ProductoPropiedadesDetalles detalle : propiedadesDetalles) {
				ProductoDto productoDTO = new ProductoDto();
				productoDTO.setId(productoMenuSub.getProducto().getId());
				productoDTO.setNombre(productoMenuSub.getProducto().getNombre());
				productoDTO.setUrlProducto(productoMenuSub.getProducto().getUrl());
				productoDTO.setImagen(detalle.getImagen());
				productoDTO.setNombreCategoria(categoria.getNombre());
				productoDTO.setUrlCategoria(categoria.getUrl());
				productoDTO.setNombreMenuSub(categoria.getMenuSub().getNombre());
				productoDTO.setUrlMenuSub(categoria.getMenuSub().getUrl());
				productoDTO.setNombreMenu(categoria.getMenuSub().getMenu().getNombre());
				productoDTO.setUrlMenu(categoria.getMenuSub().getMenu().getUrl());
				productoDTO.setNombreMarca(productoMenuSub.getProducto().getMarca().getNombre());
				productoDTO.setUrlMarca(productoMenuSub.getProducto().getMarca().getUrl());
				productoDTO.setProductoPropiedadDetalleId(detalle.getId());
				productoDTO.setSkuProductoPropiedadesDetalles(detalle.getSku());

				productoDTO.setPrecio(detalle.getPrecio());
				productoDTO.setPrecioReducido(detalle.getPrecioReducido());
				productoDTO.setPrecioTeam(detalle.getPrecioTeam());
				productoDTO.setPrecioTeamVip(detalle.getPrecioTeamVip());
				productoDTO.setPrecioFamiliar(detalle.getPrecioFamiliar());

				productoDTO.setStock(detalle.getStock());

				// Obtener las variaciones respetando el orden de creación
				List<String> variaciones = obtenerVariaciones(detalle.getId());
				productoDTO.setVariacion(String.join(" ", variaciones));
				productoDTO.setVariaciones(variaciones);

				productosFinales.add(productoDTO);
			}
		}
		int start = (int) pageable.getOffset();
		int end = Math.min((start + pageable.getPageSize()), productosFinales.size());
		Page<ProductoDto> page = new PageImpl<>(productosFinales.subList(start, end), pageable, productosFinales.size());
		return page;
	}


	@Override
	public List<ProductoDto> obtenerProductosItemsIndividualesPorForma(int formaId) {
		List<ProductoDto> productosFinales = new ArrayList<>();

/*
		// Mapear los campos de precios para cada rol
		Map<String, String[]> preciosPorRol = Map.of(
				"Cliente", new String[]{"getPrecio", "getPrecioReducido"},
				"Team", new String[]{"getPrecio", "getPrecioTeam"},
				"Team Vip", new String[]{"getPrecio", "getPrecioTeamVip"},
				"Familiar", new String[]{"getPrecio", "getPrecioFamiliar"}
		);

		String nombreRolPerfil = usuario != null ? usuario.getNombreRolPerfil() : "";
		String[] metodosPrecio = preciosPorRol.getOrDefault(nombreRolPerfil, new String[]{"getPrecio", "getPrecioReducido"});
*/

		List<ProductoMenuSub> productos = productoMenuSubDao.findByProductos();
		for (ProductoMenuSub productoMenuSub : productos) {
			ProductoCategoria categoria = productoMenuSub.getProductoCategoria();
			List<ProductoPropiedadesDetalles> propiedadesDetalles = productoPropiedadesDetallesDao.findByProductoIdAndProductoFormaId(productoMenuSub.getProducto().getId(),formaId);

			for (ProductoPropiedadesDetalles detalle : propiedadesDetalles) {
				ProductoDto productoDTO = new ProductoDto();
				productoDTO.setId(productoMenuSub.getProducto().getId());
				productoDTO.setNombre(productoMenuSub.getProducto().getNombre());
				productoDTO.setUrlProducto(productoMenuSub.getProducto().getUrl());
				productoDTO.setImagen(detalle.getImagen());
				productoDTO.setNombreCategoria(categoria.getNombre());
				productoDTO.setUrlCategoria(categoria.getUrl());
				productoDTO.setNombreMenuSub(categoria.getMenuSub().getNombre());
				productoDTO.setUrlMenuSub(categoria.getMenuSub().getUrl());
				productoDTO.setNombreMenu(categoria.getMenuSub().getMenu().getNombre());
				productoDTO.setUrlMenu(categoria.getMenuSub().getMenu().getUrl());
				productoDTO.setNombreMarca(productoMenuSub.getProducto().getMarca().getNombre());
				productoDTO.setUrlMarca(productoMenuSub.getProducto().getMarca().getUrl());
				productoDTO.setProductoPropiedadDetalleId(detalle.getId());
				productoDTO.setSkuProductoPropiedadesDetalles(detalle.getSku());

				productoDTO.setPrecio(detalle.getPrecio());
				productoDTO.setPrecioReducido(detalle.getPrecioReducido());
				productoDTO.setPrecioTeam(detalle.getPrecioTeam());
				productoDTO.setPrecioTeamVip(detalle.getPrecioTeamVip());
				productoDTO.setPrecioFamiliar(detalle.getPrecioFamiliar());

				/*try {
					// Usa reflection para llamar a los métodos de `detalle`
					productoDTO.setPrecio((Double) ProductoPropiedadesDetalles.class.getMethod(metodosPrecio[0]).invoke(detalle));
					productoDTO.setPrecioReducido((Double) ProductoPropiedadesDetalles.class.getMethod(metodosPrecio[1]).invoke(detalle));
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("Error al obtener los precios para el rol " + usuario.getNombreRolPerfil());
				}*/

				productoDTO.setStock(detalle.getStock());

				// Obtener las variaciones respetando el orden de creación
				List<String> variaciones = obtenerVariaciones(detalle.getId());
				productoDTO.setVariacion(String.join(" ", variaciones));
				productoDTO.setVariaciones(variaciones);

				productosFinales.add(productoDTO);
			}
		}
		return productosFinales;
	}

	@Override
	public Page<ProductoDto> obtenerProductosItemsIndividualesPorNombreProducto(String productoNombre,double minPrecio, double maxPrecio, Pageable pageable) {
		List<ProductoDto> productosFinales = new ArrayList<>();
		List<ProductoMenuSub> productosPage = productoMenuSubDao.findByNombreProducto(productoNombre);
		for (ProductoMenuSub productoMenuSub : productosPage) {
			ProductoCategoria categoria = productoMenuSub.getProductoCategoria();
			List<ProductoPropiedadesDetalles> propiedadesDetalles = productoPropiedadesDetallesDao.findByProductoIdAndPrecioReducido(productoMenuSub.getProducto().getId(), minPrecio, maxPrecio);

			for (ProductoPropiedadesDetalles detalle : propiedadesDetalles) {
				ProductoDto productoDTO = new ProductoDto();
				productoDTO.setId(productoMenuSub.getProducto().getId());
				productoDTO.setNombre(productoMenuSub.getProducto().getNombre());
				productoDTO.setUrlProducto(productoMenuSub.getProducto().getUrl());
				productoDTO.setImagen(detalle.getImagen());
				productoDTO.setNombreCategoria(categoria.getNombre());
				productoDTO.setUrlCategoria(categoria.getUrl());
				productoDTO.setNombreMenuSub(categoria.getMenuSub().getNombre());
				productoDTO.setUrlMenuSub(categoria.getMenuSub().getUrl());
				productoDTO.setNombreMenu(categoria.getMenuSub().getMenu().getNombre());
				productoDTO.setUrlMenu(categoria.getMenuSub().getMenu().getUrl());
				productoDTO.setNombreMarca(productoMenuSub.getProducto().getMarca().getNombre());
				productoDTO.setUrlMarca(productoMenuSub.getProducto().getMarca().getUrl());
				productoDTO.setProductoPropiedadDetalleId(detalle.getId());
				productoDTO.setSkuProductoPropiedadesDetalles(detalle.getSku());
				productoDTO.setPrecio(detalle.getPrecio());
				productoDTO.setPrecioReducido(detalle.getPrecioReducido());
				productoDTO.setStock(detalle.getStock());
				List<String> variaciones = obtenerVariaciones(detalle.getId());
				productoDTO.setVariacion(String.join(" ", variaciones));
				productoDTO.setVariaciones(variaciones);
				productosFinales.add(productoDTO);
			}
		}

		int start = (int) pageable.getOffset();
		int end = Math.min((start + pageable.getPageSize()), productosFinales.size());
		Page<ProductoDto> page = new PageImpl<>(productosFinales.subList(start, end), pageable, productosFinales.size());
		return page;
	}

	private List<String> obtenerVariaciones(Integer detalleId) {
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
