package com.muscleshop.web.services.implementation;

import com.muscleshop.web.dao.IProductoMenuSubDao;
import com.muscleshop.web.models.ProductoMenuSub;
import com.muscleshop.web.services.IProductoMenuSubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductoMenuSubService implements IProductoMenuSubService {

    @Autowired
    IProductoMenuSubDao iProductoMenuSubDao;

    @Override
    public List<ProductoMenuSub> obtenerProductoMenuSubs() {
        return iProductoMenuSubDao.findByProductos();
    }
}
