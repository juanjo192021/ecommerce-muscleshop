package com.muscleshop.web.services;

import com.muscleshop.web.dao.IComprobantePagoDao;
import com.muscleshop.web.models.ComprobantePago;

import java.util.List;

public interface IComprobantePagoService {

    List<ComprobantePago> listarComprobante();

    ComprobantePago listarComproID(Integer id);

    ComprobantePago obtenerNombreComp(String nombre) ;
}
