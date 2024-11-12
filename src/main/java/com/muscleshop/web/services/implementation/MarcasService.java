package com.muscleshop.web.services.implementation;

import com.muscleshop.web.dao.IMarcasDao;
import com.muscleshop.web.models.Marcas;
import com.muscleshop.web.services.IMarcasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MarcasService implements IMarcasService {

    @Autowired
    IMarcasDao imarcasDao;

    @Override
    public List<Marcas> obtenerMarcas(){
        return imarcasDao.findAll();
    }

    @Override
    public Marcas obtenerMarcaPorUrl(String url) {
        return imarcasDao.findByUrl(url);
    }
}
