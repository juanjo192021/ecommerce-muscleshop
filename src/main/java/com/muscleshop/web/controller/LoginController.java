package com.muscleshop.web.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.muscleshop.web.models.dto.UsuarioDto;
import com.muscleshop.web.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.muscleshop.web.models.Estado;
import com.muscleshop.web.models.Footer;
import com.muscleshop.web.models.Header;
import com.muscleshop.web.models.Logos;
import com.muscleshop.web.models.Menu;
import com.muscleshop.web.models.RedesSociales;
import com.muscleshop.web.models.RolPerfil;
import com.muscleshop.web.models.Roles;
import com.muscleshop.web.models.Usuario;
import com.muscleshop.web.models.UsuarioPerfil;
import com.muscleshop.web.services.implementation.MenuService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/auth/")
public class LoginController {

	@Autowired
	UsuarioService usuarioService;
	
	@Autowired
	RolPerfilService rolPerfilService;

	@Autowired
	LogosService logosService;

	@Autowired
	RolesService rolesService;
	
	@Autowired
	EstadoService estadoService;

	@Autowired
	UsuarioPerfilService usuPerfilService;
	
	@Autowired
	FooterService footerService;

	@Autowired
	RedesSocialesService redesSocialesService;

	@Autowired
	HeaderService headerService;
	
	@Autowired
	IMenuService menuService;

	//Modelo para el logo de la tienda
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

/*	@ModelAttribute("productos")
	public List<Producto> productos() {
		return productoService.listarProducto();
	}*/

	@ModelAttribute("footer")
	public List<Footer> footers() {
		return footerService.listarFooter();
	}

	@ModelAttribute("redesSociales")
	public List<RedesSociales> redesSociales() {
		return redesSocialesService.listarRedes();
	}
	
	@GetMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error, Model model) {
		if (error != null) {
			model.addAttribute("error", "Usuario y/o Contraseña son incorrectos");
		}
		return "pages/product-goals";
	}
	
	@GetMapping("/registrar")
	public String registrar(Model model) {
		model.addAttribute("usuarioPerfil", new UsuarioPerfil());
		return "registrar";
	}
	
	@PostMapping("/registrar")
	public String registrar(@Valid @ModelAttribute UsuarioPerfil usuarioPerfil, BindingResult br, Model model,
	                        RedirectAttributes ra, HttpSession session) {

	    if (br.hasErrors()) {
	        return "registrar";
	    } else {
	        UsuarioDto usuExiste = usuarioService.obtenerUsuarioPorCorreo(usuarioPerfil.getUsuario().getCorreo());
	        if (usuExiste == null) {
	        	
	            Usuario nuevoUsuario = new Usuario();
	            nuevoUsuario.setCorreo(usuarioPerfil.getUsuario().getCorreo());
				String passwordEncriptada = new BCryptPasswordEncoder().encode(usuarioPerfil.getUsuario().getPassword());
				nuevoUsuario.setPassword(passwordEncriptada);
	            nuevoUsuario.setFecha(LocalDate.now());

	            RolPerfil rolPerfil = rolPerfilService.listarRolPerfilID(1);
	            nuevoUsuario.setRolPerfil(rolPerfil);
	            
	            Estado estado = estadoService.listarEstadoID(1);
	            nuevoUsuario.setEstado(estado);

	            Set<Roles> roles = new HashSet<>();
	            Roles rol = rolesService.listarROlesID(3);
	            roles.add(rol);
	            //nuevoUsuario.setRoles(roles);

	            usuarioService.saveUsuario(nuevoUsuario);

	            usuarioPerfil.setUsuario(nuevoUsuario);
	            usuPerfilService.saveUsuPerfil(usuarioPerfil);
	            return "redirect:/login";
	        }
	    }
	    return "redirect:/registrar";
	}
	
	@GetMapping("/cambiar-contrasena")
	public String mostrarFormularioCambioContraseña() {
	    return "contrasena";
	}
	
	@PostMapping("/cambiar-contrasena")
    public String cambiarContraseña(@RequestParam("correo") String correo,
                                    @RequestParam("nuevaContraseña") String nuevaContraseña,
                                    RedirectAttributes ra, HttpSession session) {

        UsuarioDto usuario = usuarioService.obtenerUsuarioPorCorreo(correo);
        if (usuario != null) {
            String passwordEncriptada = new BCryptPasswordEncoder().encode(nuevaContraseña);
            /*usuario.setPassword(passwordEncriptada);
            usuarioService.saveUsuario(usuario);*/
            
            ra.addFlashAttribute("successMessage", "Contraseña cambiada exitosamente");
            return "redirect:/cambiar-contrasena";
        } else {
            ra.addFlashAttribute("errorMessage", "Usuario no encontrado");
            return "redirect:/cambiar-contrasena";
        }
    }




}
