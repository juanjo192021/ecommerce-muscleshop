package com.muscleshop.web.services;

import com.muscleshop.web.models.Marcas;

import java.util.List;

public interface IMarcasService {

    List<Marcas> obtenerMarcas();
    Marcas obtenerMarcaPorUrl(String url);
}
