package com.muscleshop.web.dao;

import com.muscleshop.web.models.Marcas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IMarcasDao extends JpaRepository<Marcas, Integer> {

    Marcas findByUrl(String url);
}
