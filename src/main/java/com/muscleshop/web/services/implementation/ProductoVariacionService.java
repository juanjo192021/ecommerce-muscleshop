package com.muscleshop.web.services.implementation;

import com.muscleshop.web.dao.IProductoVariacionDao;
import com.muscleshop.web.models.ProductoVariacion;
import com.muscleshop.web.models.dto.AtributoDto;
import com.muscleshop.web.models.dto.VariacionDto;
import com.muscleshop.web.services.IProductoVariacionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProductoVariacionService implements IProductoVariacionService {

    @Autowired
    IProductoVariacionDao productoVariacionDao;

    public List<VariacionDto> obtenerProductoVariacion(Integer productoId) {
        List<ProductoVariacion> productoVariaciones = productoVariacionDao.findByProducto_Id(productoId);

        // Usar un LinkedHashMap para mantener el orden de inserción
        Map<Integer, VariacionDto> variacionMap = new LinkedHashMap<>();

        // Recorrer todas las variaciones del producto
        for (ProductoVariacion variacion : productoVariaciones) {
            String nombreVariacion = variacion.getPropiedades().getNombre(); // Obtener nombre de la propiedad
            Integer idPropiedad = variacion.getPropiedades().getId(); // Obtener el ID de la propiedad

            // Crear un AtributoDto
            AtributoDto atributoDto = new AtributoDto(
                    variacion.getId(),
                    variacion.getValor()
            );

            // Agregar el atributo a la lista correspondiente en el Map
            variacionMap.computeIfAbsent(idPropiedad, k -> new VariacionDto(idPropiedad, nombreVariacion, new ArrayList<>()))
                    .getAtributosDto().add(atributoDto);
        }

        // Convertir el Map a una lista de VariacionDto
        List<VariacionDto> variacionDtos = new ArrayList<>(variacionMap.values());

        /*// Ordenar por idPropiedad de menor a mayor
        variacionDtos.sort(Comparator.comparing(VariacionDto::getIdPropiedad));*/

        return variacionDtos;
    }
    public List<ProductoVariacion> pruebasProductoVariaciones(){
        List<Integer> lista = new ArrayList<>();
        lista.add(1);
        lista.add(2);
        lista.add(4);
        lista.add(5);
        lista.add(15);
        lista.add(17);
        lista.add(16);
        lista.add(17);
        lista.add(23);
        lista.add(25);
        lista.add(23);
        lista.add(26);
        lista.add(24);
        lista.add(25);
        lista.add(24);
        lista.add(26);

        return productoVariacionDao.findActiveProductoVariaciones(lista);
    }
}
