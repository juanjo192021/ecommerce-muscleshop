package com.muscleshop.web.security;

import java.util.ArrayList;
import java.util.List;

import com.muscleshop.web.models.dto.UsuarioDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.muscleshop.web.models.Roles;
import com.muscleshop.web.models.Usuario;
import com.muscleshop.web.services.UsuarioService;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Component
public class FormLogin implements UserDetailsService {

	@Autowired
	private UsuarioService usuarioService;

	@Override
	@Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		UsuarioDto usuar = usuarioService.obtenerUsuarioPorCorreo(username);

		if (usuar == null) {
			throw new UsernameNotFoundException("No existe el Usuario");
		}

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession(true);
		session.setAttribute("usuario", usuar);
		authorities.add(new SimpleGrantedAuthority(usuar.getNombreRolPerfil()));

		/*for (Roles ro : usuar.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(ro.getNombre()));
		}*/

        return new User(usuar.getCorreo(),
				"$2a$10$MJWApri4BHTAuo/jxbBL9uTnvi8KtGJtsNigE5i7OnRWTUDAa8EpW",
				authorities);
	}

}
