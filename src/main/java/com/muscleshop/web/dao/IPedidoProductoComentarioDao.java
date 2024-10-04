package com.muscleshop.web.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.muscleshop.web.models.PedidoProductoComentario;

public interface IPedidoProductoComentarioDao extends JpaRepository<PedidoProductoComentario, Integer>{
    List<PedidoProductoComentario> findByEstado_Id(Integer estadoId);
}
