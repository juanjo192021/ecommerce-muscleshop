package com.muscleshop.web.dao;

import java.util.List;

import com.muscleshop.web.models.dto.MenuSubDto;
import com.muscleshop.web.models.dto.ProductoCategoriaDto;
import org.springframework.data.jpa.repository.JpaRepository;

import com.muscleshop.web.models.MenuSub;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IMenuSubDao extends JpaRepository<MenuSub, Integer> {

	List<MenuSub> findByMenu_Id(int menuId);

	public MenuSub findByUrl(String url);

	List<MenuSub> findByMenu_Url(String menuUrl);

	// Método para buscar categorías de productos por su id de submenú y estado activo
	@Query("SELECT new com.muscleshop.web.models.dto.MenuSubDto(ms.id, ms.nombre, ms.url,ms.imagen, m.id, m.nombre, m.url, ms.estado.nombre ) " +
			"FROM MenuSub ms " +
			"JOIN Menu m on ms.menu.id = m.id "+
			"WHERE ms.menu.id = :menuId AND ms.estado.id = :estadoId")
	List<MenuSubDto> findByMenu_IdAndEstado_Id(@Param("menuId") int menuId, @Param("estadoId") int estadoId);

	@Query("SELECT ms FROM MenuSub ms WHERE ms.menu.id IN :menuIds AND ms.estado.id = :estadoId")
	List<MenuSub> findActiveMenuSubs(@Param("menuIds") List<Integer> menuIds, @Param("estadoId") int estadoId);
}
