package com.muscleshop.web.services;

import com.muscleshop.web.models.ProductoPropiedadesDetallesVariacion;
import com.muscleshop.web.models.ProductoVariacion;
import com.muscleshop.web.models.dto.VariacionDto;

import java.util.List;

public interface IProductoVariacionService {
    List<VariacionDto> obtenerProductoVariacion(Integer productoId);

    List<ProductoVariacion> pruebasProductoVariaciones();
}
