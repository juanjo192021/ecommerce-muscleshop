package com.muscleshop.web.services;

import com.muscleshop.web.models.PropiedadDetalleImagen;

import java.util.List;

public interface IPropiedadDetalleImagenService {
    List<PropiedadDetalleImagen> obtenerImagenesPresentacionPorProductoPropiedadesDetallesId(int productoPropiedadesDetallesId);
}
