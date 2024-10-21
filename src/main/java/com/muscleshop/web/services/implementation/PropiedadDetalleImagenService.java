package com.muscleshop.web.services.implementation;

import com.muscleshop.web.dao.IPropiedadDetalleImagenDao;
import com.muscleshop.web.models.PropiedadDetalleImagen;
import com.muscleshop.web.services.IPropiedadDetalleImagenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropiedadDetalleImagenService implements IPropiedadDetalleImagenService {

    @Autowired
    IPropiedadDetalleImagenDao iPropiedadDetalleImagenDao;

    int estadoId=1;

    @Override
    public List<PropiedadDetalleImagen> obtenerImagenesPresentacionPorProductoPropiedadesDetallesId(int productoPropiedadesDetallesId) {
        return iPropiedadDetalleImagenDao.findByProductoPropiedadesDetalles_IdAndEstado_Id(productoPropiedadesDetallesId, estadoId);
    }
}
