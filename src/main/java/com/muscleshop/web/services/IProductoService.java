package com.muscleshop.web.services;

import com.muscleshop.web.models.Producto;
import com.muscleshop.web.models.dto.ProductoDto;
import com.muscleshop.web.models.dto.UsuarioDto;
import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IProductoService {

    Producto obtenerProductoPorUrl(String productoUrl);
    Page<ProductoDto> obtenerProductosItemsIndividialesPorMenuSubId(int menuSubId, double minPrecio, double maxPrecio, Pageable pageable);
    Page<ProductoDto> obtenerProductosItemsIndividialesPorCategoriaId(int productoCategoriaId, double minPrecio, double maxPrecio, Pageable pageable);
    Page<ProductoDto> obtenerProductosItemsIndividialesPorObjetivoId(int objetivoId, double minPrecio, double maxPrecio, Pageable pageable);
    Page<ProductoDto> obtenerProductosItemsIndividialesPorMarcaId(int marcaId, double minPrecio, double maxPrecio, Pageable pageable);
    List<ProductoDto> obtenerProductosItemsIndividualesPorForma(int formaId);
    Page<ProductoDto> obtenerProductosItemsIndividualesPorNombreProducto(String productoNombre,double minPrecio, double maxPrecio, Pageable pageable);
}
