package com.muscleshop.web.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.muscleshop.web.models.MenuSub;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IMenuSubDao extends JpaRepository<MenuSub, Integer> {

	List<MenuSub> findByMenu_Id(int menuId);

	public MenuSub findByUrl(String url);

	List<MenuSub> findByMenu_Url(String menuUrl);

	@Query("SELECT ms FROM MenuSub ms WHERE ms.menu.id IN :menuIds AND ms.estado.id = :estadoId")
	List<MenuSub> findActiveMenuSubs(@Param("menuIds") List<Integer> menuIds, @Param("estadoId") int estadoId);


	/*@Query("SELECT ms FROM MenuSub ms " +
			"join ProductoCategoria pc on ms.id = pc.menuSub.id " +
			"join Producto p on pc.id = p.productoCategoria.id " +
			"join ProductoPropiedadDetalle ppd on p.id= ppd.producto.id " +
			"join PropiedadesDetalles pd on ppd.propiedadesDetalles.id = pd.detalles.id " +
			"join Propiedades pro on pd.propiedades.id = pro.id " +
			"where ms.url=:menuSubUrl")
	List<MenuSub> findProductoFormasByMenuSubUrl(@Param("menuSubUrl") String menuSubUrl);*/
}
