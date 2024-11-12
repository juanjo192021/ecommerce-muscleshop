package com.muscleshop.web.dao;

import com.muscleshop.web.models.Objetivos;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IObjetivosDao extends JpaRepository<Objetivos, Integer> {

    Objetivos findByUrl(String url);
}
