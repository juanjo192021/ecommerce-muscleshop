package com.muscleshop.web.services;

import com.muscleshop.web.models.ProductoPropiedadesDetalles;
import com.muscleshop.web.models.dto.PresentacionDto;
import com.muscleshop.web.models.dto.ProductoCarritoDto;
import com.muscleshop.web.models.dto.ProductoItemsDto;

import java.util.List;

public interface IProductoPropiedadesDetallesService {
    PresentacionDto obtenerPresentacionPorIdProductoAndVariaciones(int productoId, List<String> variaciones );
}
