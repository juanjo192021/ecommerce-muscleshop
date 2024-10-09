package com.muscleshop.web.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.muscleshop.web.models.Menu;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IMenuDao extends JpaRepository<Menu, Integer> {

    List<Menu> findByEstado_Id(int estadoMenuId);

    Menu findByUrl(String url);
}
