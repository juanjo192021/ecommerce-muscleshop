package com.muscleshop.web.services;

import com.muscleshop.web.models.Objetivos;

import java.util.List;

public interface IObjetivosService {

    List<Objetivos> obtenerObjetivos();
    Objetivos obtenerObjetivosPorUrl(String url);
}
