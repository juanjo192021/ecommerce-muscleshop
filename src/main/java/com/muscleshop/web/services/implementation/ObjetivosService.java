package com.muscleshop.web.services.implementation;

import com.muscleshop.web.dao.IObjetivosDao;
import com.muscleshop.web.models.Objetivos;
import com.muscleshop.web.services.IObjetivosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ObjetivosService implements IObjetivosService {

    @Autowired
    private IObjetivosDao iObjetivosDao;


    @Override
    public List<Objetivos> obtenerObjetivos() {
        return iObjetivosDao.findAll();
    }

    @Override
    public Objetivos obtenerObjetivosPorUrl(String url) {
        return iObjetivosDao.findByUrl(url);
    }
}
