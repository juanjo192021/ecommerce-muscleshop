package com.muscleshop.web.services;

import java.util.List;

import com.muscleshop.web.models.Ubigeo;

public interface IUbigeoService {

	List<String> listaRegion();
	List<String> listaProvincia(String region);
	List<Ubigeo> listaDistrito(String region, String provincia);
    Ubigeo obtenerUbigeoId(Integer id);

}
