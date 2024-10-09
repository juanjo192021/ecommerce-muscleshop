package com.muscleshop.web.services.implementation;

import com.muscleshop.web.dao.IProductoPropiedadesDetallesVariacionDao;
import com.muscleshop.web.dao.IProductoVariacionDao;
import com.muscleshop.web.models.ProductoPropiedadesDetallesVariacion;
import com.muscleshop.web.models.ProductoVariacion;
import com.muscleshop.web.services.IProductoPropiedadesDetallesVariacionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductoPropiedadesDetallesVariacionService implements IProductoPropiedadesDetallesVariacionService {

    @Autowired
    IProductoPropiedadesDetallesVariacionDao productoPropiedadesDetallesVariacionDao;

    @Override
    public List<ProductoPropiedadesDetallesVariacion> pruebasProductosPropiedadesDetallesVariacion() {
        List<Integer> lista = new ArrayList<>();
        lista.add(1);
        lista.add(2);
        lista.add(6);
        lista.add(7);
        lista.add(13);
        lista.add(14);
        lista.add(20);
        lista.add(21);
        lista.add(22);
        lista.add(23);

        return productoPropiedadesDetallesVariacionDao.findActiveProductoPropiedadesDetallesVariaciones(lista);
    }
}
