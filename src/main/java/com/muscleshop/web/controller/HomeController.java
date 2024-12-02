package com.muscleshop.web.controller;

import java.util.*;

import com.muscleshop.web.models.*;
import com.muscleshop.web.models.dto.*;
import com.muscleshop.web.services.*;
import com.muscleshop.web.services.implementation.MenuSubService;
import com.muscleshop.web.services.implementation.ProductoCategoriaService;
import com.muscleshop.web.services.implementation.ProductoPropiedadDetalleService;
import com.muscleshop.web.services.implementation.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	ProductoService productoService;

	@Autowired
	IComprobantePagoService comprobantePagoService;

	@Autowired
	IBannerService bannerService;

	@Autowired
	IPopupService popupService;

	@Autowired
	IMenuService menuService;

	@Autowired
	IArticuloService articuloService;

	@Autowired
	IProductoPropiedadesDetallesService productoPropiedadesDetallesService;

	@Autowired
	ArticuloComService artiComService;

	@Autowired
	EstadoService estadoService;

	@Autowired
	UsuarioService usuarioService;

	@Autowired
	MenuSubService menuSubService;

	@Autowired
	ProductoCategoriaService proCateService;

	@Autowired
	ProDetalService proDetalService;

	@Autowired
	PedidoProductoComentarioService pedProComService;

	@Autowired
	FooterService footerService;

	@Autowired
	RedesSocialesService redesSocialesService;

	@Autowired
	HeaderService headerService;

	@Autowired
	IProductoPropiedadesDetallesService iProductoPropiedadesDetallesService;

	@Autowired
	LogosService logosService;

	@Autowired
	public IProductoAgrupadoService iProductoAgrupadoService;

	@Autowired
	CuponService cuponService;

	@Autowired
	IMarketplaceService iMarketplaceService;

	@Autowired
	private ProductoPropiedadDetalleService productoPropiedadDetalleService;

	@Autowired
	private ProductoCategoriaService productoCategoriaService;

	@ModelAttribute("logosTienda")
	public List<Logos> logos() {
		return logosService.listarLogos();
	}

	@ModelAttribute("headers")
	public List<Header> headers() {
		return headerService.listarHeader();
	}

	//Modelos para el menu de la barra Header Bottom
	@ModelAttribute("menusHeader")
	public List<Menu> menus() {
		return menuService.obtenerMenus();
	}

	@ModelAttribute("footer")
	public List<Footer> footers() {
		return footerService.listarFooter();
	}

	@ModelAttribute("redesSociales")
	public List<RedesSociales> redesSociales() {
		return redesSocialesService.listarRedes();
	}

	@Autowired
	IProductoVariacionService iProductoVariacionService;

/*
	@GetMapping("/prueba/{q}")
	@ResponseBody
	public ResponseEntity<List<VariacionDto>> resp(@PathVariable String q) {
		List<VariacionDto> productoVariacions = iProductoVariacionService.obtenerProductoVariacion(Integer.parseInt(q));
		return ResponseEntity.ok(productoVariacions);
	}

*/

	@Autowired
	IProductoMenuSubService iProductoMenuSubService;

	@Autowired
	IProductoPropiedadesDetallesVariacionService iProductoPropiedadesDetallesVariacionService;

	// MENÚS
	@SuppressWarnings("unchecked")
	@GetMapping("/")
	public String Inicio(Model model, HttpSession session) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// Verificar si el usuario está autenticado y si la autenticación no es anónima
		if (authentication != null && authentication.isAuthenticated() && !(authentication instanceof AnonymousAuthenticationToken)) {
			// Hacer el cast a OAuth2AuthenticationToken solo si no es anónimo
			if (authentication instanceof OAuth2AuthenticationToken) {
				OAuth2AuthenticationToken oauthToken = (OAuth2AuthenticationToken) authentication;
				OAuth2User oAuth2User = oauthToken.getPrincipal();

				String email = (String) oAuth2User.getAttributes().get("email");

				UsuarioDto usuario = usuarioService.obtenerUsuarioPorCorreo(email);

				model.addAttribute("usuario", usuario);
				model.addAttribute("data", oAuth2User);
				session.setAttribute("usuario", usuario);

			}
		}

		List<Banner> banners = bannerService.obtenerBanners();

		List<Banner> bannerMovilTablet = banners.stream()
				.filter(ban -> "movil_tablet".equals(ban.getTipoDispositivo()))
				.toList();

		List<Banner> bannerLaptopPc = banners.stream()
				.filter(ban -> "laptop_pc".equals(ban.getTipoDispositivo()))
				.toList();

		List<Popup> popups = popupService.obtenerPopups();

		int menuId = 5;
		List<MenuSubDto> menuSubDtos = menuSubService.obtenerMenuSubsPorMenuId(menuId);

		List<Articulo> articulos = articuloService.obtenerArticulosPorCantidad();

		List<PedidoProductoComentario> pedidoProductoComentarios = pedProComService.comentariosMostrables(1);

		List<Marketplace> marketplaces = iMarketplaceService.listarMarketplaces();


		/*model.addAttribute("productos", productos);*/
		model.addAttribute("popup", popups);
		model.addAttribute("bannerMovilTablet", bannerMovilTablet);
		model.addAttribute("bannerLaptopPc", bannerLaptopPc);
		model.addAttribute("articulos", articulos);
		model.addAttribute("subMenus", menuSubDtos);
		//model.addAttribute("productos", productos);
		model.addAttribute("pedidoProductoComentarios", pedidoProductoComentarios);
		model.addAttribute("marketplaces", marketplaces);

		// LÓGICA CARRITO

		if (session.getAttribute("usuario") != null) {
			UsuarioDto usuario = usuarioService.obtenerUsuarioPorCorreo(session.getAttribute("usuario").toString());

			/*if (usuario != null && usuario.getRolPerfil() != null && usuario.getRolPerfil().getId() == 2) {
				session.removeAttribute("carrito");
				session.removeAttribute("totalCarrito");
			}*/
		}

		Object carritoSession = session.getAttribute("carrito");
		List<PedidosProductos> carrito;

		if (carritoSession == null) {
			carrito = new ArrayList<PedidosProductos>();
		} else {
			carrito = (List<PedidosProductos>) carritoSession;
		}

		session.setAttribute("carrito", carrito);

		return "inicio";
	}

	@Autowired
	IMarcasService iMarcasService;

	@Autowired
	IObjetivosService iObjetivosService;

	@GetMapping("/{menuUrl}")
	public String menuProducto(@PathVariable("menuUrl") String menuUrl, Model model) {

		Menu menu = menuService.obtenerMenuPorUrl(menuUrl);

		if(menu.getUrl().equals("blogs")) {
			List<Articulo> articulos = articuloService.obtenerArticulos();
			model.addAttribute("articulos", articulos);
			model.addAttribute("menu", menu);
			return "pages/blog-grid";
		}

		List<MenuSubDto> menuSubDtos = menuSubService.obtenerMenuSubsPorMenuId(menu.getId());
		model.addAttribute("menuSubs",menuSubDtos );
		model.addAttribute("menu", menu);
		return "pages/menu-grid";
	}

	@GetMapping("/{menuUrl}/{menuSubUrl}")
	public String menuSubProductos(Model model,
								   @PathVariable("menuUrl") String menuUrl,
								   @PathVariable("menuSubUrl") String menuSubUrl) {


		if (menuUrl.equals("por-marcas")){

			Marcas marca = iMarcasService.obtenerMarcaPorUrl(menuSubUrl);
			List<Objetivos> objetivos = iObjetivosService.obtenerObjetivos();
			List<Marcas> marcas = iMarcasService.obtenerMarcas();

			model.addAttribute("objetivos", objetivos);
			model.addAttribute("marcas", marcas);
			model.addAttribute("marcaId", marca.getId());

			//model.addAttribute("menuUrl", menuUrl);
			//model.addAttribute("menuSubUrl", menuSubUrl);

			return "pages/product-brands";
		}

		if (menuUrl.equals("por-objetivos")){
			Objetivos objetivo = iObjetivosService.obtenerObjetivosPorUrl(menuSubUrl);
			List<Objetivos> objetivos = iObjetivosService.obtenerObjetivos();
			List<Marcas> marcas = iMarcasService.obtenerMarcas();

			model.addAttribute("objetivos", objetivos);
			model.addAttribute("marcas", marcas);
			model.addAttribute("objetivoId", objetivo.getId());

			return "pages/product-goals";
		}

		Menu menu = menuService.obtenerMenuPorUrl(menuUrl);
		MenuSub menuSub = menuSubService.obtenerMenuSubPorUrl(menuSubUrl);

		if(menu.getUrl().equals("blogs")) {

			List<Articulo> articulos = articuloService.obtenerArticulosPorCantidad();
			model.addAttribute("articulos", articulos);
			model.addAttribute("menu", menu);
			return "pages/blog-detail";
		}
		/*List<BannerMenuSub> bannerMovilTablet = (menuSub.getBannerMenuSubs()).stream()
				.filter(ban -> "movil_tablet".equals(ban.getTipoDispositivo()))
				.toList();

		List<BannerMenuSub> bannerLaptopPc = (menuSub.getBannerMenuSubs()).stream()
				.filter(ban -> "laptop_pc".equals(ban.getTipoDispositivo()))
				.toList();*/

		List<ProductoCategoriaDto> productoCategoriaDtos = productoCategoriaService.obtenerProductoCategoriasPorMenuSubId(menuSub.getId());
		List<MenuSubDto> menuSubDtos = menuSubService.obtenerMenuSubsPorMenuId(menu.getId());
		List<Objetivos> objetivos = iObjetivosService.obtenerObjetivos();
		List<Marcas> marcas = iMarcasService.obtenerMarcas();

		model.addAttribute("nombreMenuSub", menuSub.getNombre());
		/*model.addAttribute("bannerMenuSubMovilTablet", bannerMovilTablet);
		model.addAttribute("bannerMenuSubLaptopPc", bannerLaptopPc);*/
		model.addAttribute("categorias", productoCategoriaDtos);
		model.addAttribute("otrasCategorias", menuSubDtos);
		model.addAttribute("objetivos", objetivos);
		model.addAttribute("marcas", marcas);

		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("menuSubUrl", menuSubUrl);
		return "pages/product-menu-sub";
	}

	@GetMapping("/{menuUrl}/{menuSubUrl}/{categoriaUrl}")
	public String listarProCate(Model model,
								HttpSession session,
								@PathVariable String menuUrl,
								@PathVariable String menuSubUrl,
								@PathVariable String categoriaUrl) {

		Menu menu = menuService.obtenerMenuPorUrl(menuUrl);
		MenuSub menuSub = menuSubService.obtenerMenuSubPorUrl(menuSubUrl);
		ProductoCategoriaDto productoCategoria = productoCategoriaService.obtenerProductoCategoriaPorUrl(categoriaUrl, menuSub.getId());

		List<ProductoCategoriaDto> productoCategoriaDtos = productoCategoriaService.obtenerProductoCategoriasPorMenuSubId(menuSub.getId());
		List<MenuSubDto> menuSubDtos = menuSubService.obtenerMenuSubsPorMenuId(menu.getId());
		List<Objetivos> objetivos = iObjetivosService.obtenerObjetivos();
		List<Marcas> marcas = iMarcasService.obtenerMarcas();

		model.addAttribute("nombreMenuSub", menuSub.getNombre());
		model.addAttribute("nombreCategoria", productoCategoria.getNombreCategoria());
		model.addAttribute("categorias", productoCategoriaDtos);
		model.addAttribute("otrasCategorias", menuSubDtos);
		model.addAttribute("objetivos", objetivos);
		model.addAttribute("marcas", marcas);
		//model.addAttribute("productos", productos);

		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("menuSubUrl", menuSubUrl);
		model.addAttribute("categoriaUrl", categoriaUrl);
		model.addAttribute("menuSubId", menuSub.getId());

		/*return "porProductos/categoriaPro";*/
		return "pages/products-categories";
	}

	@Autowired
	IPropiedadDetalleImagenService iPropiedadDetalleImagenService;
	@GetMapping("/{menuUrl}/{menuSubUrl}/{categoriaUrl}/{productoUrl}")
	public String verProducto(@PathVariable String menuUrl,
							  @PathVariable String menuSubUrl,
							  @PathVariable String categoriaUrl,
							  @PathVariable String productoUrl,
							  @RequestParam Map<String, String> allParams,
							  Model model) {

		Map<String, String> auxiliar = new LinkedHashMap<>();
		List<String> variaciones = new ArrayList<>();
		allParams.forEach((key, value) -> {
			if (key.startsWith("variacion")) {
				auxiliar.put(key, value);
				variaciones.add(value);
			}
		});
		model.addAttribute("auxiliar", auxiliar);
		Producto producto = productoService.obtenerProductoPorUrl(productoUrl);
		PresentacionDto presentacionDto = iProductoPropiedadesDetallesService.obtenerPresentacionPorIdProductoAndVariaciones(producto.getId(),variaciones);
		List<PropiedadDetalleImagen> propiedadDetalleImagenes = iPropiedadDetalleImagenService.obtenerImagenesPresentacionPorProductoPropiedadesDetallesId(presentacionDto.getId());
		List<VariacionDto>  variacionDtos = iProductoVariacionService.obtenerProductoVariacion(producto.getId());

		model.addAttribute("menuUrl",menuUrl);
		model.addAttribute("menuSubUrl",menuSubUrl);
		model.addAttribute("categoriaUrl",categoriaUrl);
		model.addAttribute("productoUrl",productoUrl);
		model.addAttribute("allParams", allParams);
		model.addAttribute("propiedadDetalleImagenes", propiedadDetalleImagenes);
		model.addAttribute("variaciones", variacionDtos);
		model.addAttribute("presentacion", presentacionDto);
		model.addAttribute("productoInformacion", producto.getProductoInformacion());
		return "pages/product-detail";
	}

	@GetMapping("/about-us")
	public String AboutUs(Model model, HttpSession session) {
		return "landings-pages/about-us";
	}


	@GetMapping("/brands")
	public String Brands(Model model, HttpSession session) {
		return "landings-pages/brands";
	}

	@GetMapping("/contact")
	public String Contact(Model model, HttpSession session) {
		return "landings-pages/contact";
	}

	@GetMapping("/faq")
	public String Faq(Model model, HttpSession session) {
		return "landings-pages/faq";
	}
	@GetMapping("/view-cart")
	public String ViewCart(Model model, HttpSession session) {
		return "pages/view-cart";
	}
	@GetMapping("/checkout")
	public String Checkout(Model model, HttpSession session) {

		List<ComprobantePago> comprobantePagos = comprobantePagoService.listarComprobante();
		model.addAttribute("comprobantes", comprobantePagos);
		return "user/checkout";
	}

	@GetMapping("/wishlist")
	public String Wishlist(Model model, HttpSession session) {
		return "user/wishlist";
	}

	/*
	@SuppressWarnings("unchecked")
	@GetMapping("/cupon")
	public String aplicarCupon(HttpServletRequest request, HttpSession session, @RequestParam(name = "imputCupon") String cupon) {

		Cupon cuponResponse = cuponService.buscarCuponNombre(cupon);
		List<PedidosProductos> carrito = (List<PedidosProductos>) session.getAttribute("carrito");
		double descuento = 0.0;
		double totalCart = 0.0;

		for (PedidosProductos pedidoProd : carrito) {
			totalCart += pedidoProd.getSub_total();
		}


		*//*if(cuponResponse == null) {
			Cupon cuponvacio = new Cupon("El cupon no existe", "0");
			session.setAttribute("cupon", cuponvacio);
			session.setAttribute("descuento", descuento);
			session.setAttribute("totalCarrito", Math.round(totalCart * 100.00) / 100.00);
		}else {
			double porcentaje = Double.parseDouble(cuponResponse.getValor());
			descuento = Math.round((porcentaje/100)* totalCart);
			totalCart=totalCart-descuento;
			session.setAttribute("cupon", cuponResponse);
			session.setAttribute("descuento", descuento);
			session.setAttribute("totalCarrito", totalCart);
		}*//*


		String referer = request.getHeader("referer");
		return "redirect:" + referer;
	}
	*/
}
