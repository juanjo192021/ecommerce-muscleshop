package com.muscleshop.web.services.implementation;

import java.util.List;

import com.muscleshop.web.services.IUbigeoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muscleshop.web.dao.IUbigeoDao;
import com.muscleshop.web.models.Ubigeo;

@Service
public class UbigeoService implements IUbigeoService {

	@Autowired
	private IUbigeoDao ubigeoDao;
	
	@Override
	public List<String> listaRegion() {
		return ubigeoDao.listaRegion();
	}

	@Override
	public List<String> listaProvincia(String region) {
		return ubigeoDao.listaProvincia(region);
	}

	@Override
	public List<Ubigeo> listaDistrito(String region, String provincia) {
		return ubigeoDao.listaDistrito(region, provincia);
	}

	@Override
	public Ubigeo obtenerUbigeoId(Integer id) {
		return ubigeoDao.findById(id).orElse(null);
	}

}
