package com.muscleshop.web.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.oauth2.client.CommonOAuth2Provider;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.client.web.DefaultOAuth2AuthorizationRequestResolver;
import org.springframework.security.oauth2.client.web.OAuth2AuthorizationRequestResolver;
import org.springframework.security.oauth2.core.endpoint.OAuth2AuthorizationRequest;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
public class Security {

    @Bean
    AuthenticationManager authManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }

    @Bean
    PasswordEncoder passwordEn() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        //Quitarle acceso al método login del LoginController "/login"
        http.authorizeHttpRequests((auth) -> auth
                        .requestMatchers("/","/**", "/auth/**","/usuario/**","/menuSub/**","/productoCategoria/**", "/producto/**", "/productoPropiedadesDetalles/**", "/ubigeo/**", "/pedidos/**").permitAll()
                        .requestMatchers("/porProducto").hasAnyAuthority("ROLE_CLIENTE", "ROLE_ADMIN")
                        // Permitir acceso a archivos estáticos (favicon, CSS, JS, etc.)
                        .requestMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**").permitAll()
                        // Rutas restantes requieren autenticación
                        .anyRequest().authenticated())
                .formLogin((login) -> login
                        .successHandler((request, response, authentication) -> {
                            // Obtén la URL previa de la petición
                            String prevURL = request.getHeader("Referer");
                            String redirectUrl = (prevURL != null) ? prevURL : "/";
                            response.sendRedirect(redirectUrl);
                        })
                        .failureUrl("/?error=true")
                        .permitAll())
                .logout((logout) -> logout
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                        .clearAuthentication(true)
                        .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                        .logoutSuccessUrl("/"))
                .exceptionHandling((exceptions) -> exceptions
                        .accessDeniedPage("/403"))
                .oauth2Login(oauth2 -> oauth2
                        .authorizationEndpoint(authorization -> authorization
                                .baseUri("/oauth2/authorization"))  // Configura el URI de autorización si es necesario
                        .redirectionEndpoint(redirection -> redirection
                                .baseUri("/login/oauth2/code/*"))  // Callback URI para OAuth2
                        .successHandler((request, response, authentication) -> {
                            // Obtén la URL previa de la petición
                            String prevURL = request.getHeader("Referer");
                            String redirectUrl = (prevURL != null) ? prevURL : "/";
                            response.sendRedirect(redirectUrl);
                        })
                );
        return http.build();
    }

    //Pero aquí llamarlo
    //.loginPage("/")
    //.loginProcessingUrl("/login")

    /*.authorizationEndpoint(authorization -> authorization
                                .authorizationRequestResolver(customAuthorizationRequestResolver()) // Usamos la versión personalizada
                        )*/
    /*.successHandler((request, response, authentication) -> {
                            // Obtener la URL actual de la solicitud
                            String referer = request.getHeader("Referer");

                            // Si la URL de referencia es válida, redirigir a ella
                            if (referer != null && referer.startsWith(request.getContextPath())) {
                                response.sendRedirect(referer);
                            } else {
                                // Si no hay URL de referencia válida, redirigir a una página por defecto
                                response.sendRedirect(request.getContextPath() + "/");
                            }
                        })*/

    @Bean
    public OAuth2AuthorizationRequestResolver customAuthorizationRequestResolver() {
        // Crear el resolver predeterminado utilizando la URL de autenticación OAuth2
        DefaultOAuth2AuthorizationRequestResolver defaultResolver =
                new DefaultOAuth2AuthorizationRequestResolver(clientRegistrationRepository(), "/oauth2/authorization");

        return new OAuth2AuthorizationRequestResolver() {
            @Override
            public OAuth2AuthorizationRequest resolve(HttpServletRequest request) {
                OAuth2AuthorizationRequest authorizationRequest = defaultResolver.resolve(request);

                if (authorizationRequest != null) {
                    // Modificar para agregar "prompt=select_account"
                    Map<String, Object> additionalParameters = new HashMap<>(authorizationRequest.getAdditionalParameters());
                    additionalParameters.put("prompt", "select_account");

                    return OAuth2AuthorizationRequest.from(authorizationRequest)
                            .additionalParameters(additionalParameters)
                            .build();
                }

                return null;
            }

            @Override
            public OAuth2AuthorizationRequest resolve(HttpServletRequest request, String clientRegistrationId) {
                OAuth2AuthorizationRequest authorizationRequest = defaultResolver.resolve(request, clientRegistrationId);

                if (authorizationRequest != null) {
                    // Modificar para agregar "prompt=select_account"
                    Map<String, Object> additionalParameters = new HashMap<>(authorizationRequest.getAdditionalParameters());
                    additionalParameters.put("prompt", "select_account");

                    return OAuth2AuthorizationRequest.from(authorizationRequest)
                            .additionalParameters(additionalParameters)
                            .build();
                }

                return null;
            }
        };
    }

    @Bean
    public ClientRegistrationRepository clientRegistrationRepository() {
        // Esto es necesario para obtener las configuraciones de OAuth2 para los clientes (como Google)
        return new InMemoryClientRegistrationRepository(this.googleClientRegistration());
    }

    private ClientRegistration googleClientRegistration() {
        return CommonOAuth2Provider.GOOGLE.getBuilder("google")

                .scope("openid", "profile", "email")
                .redirectUri("http://localhost:8080/login/oauth2/code/google")
                .build();
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:8080/", "http://104.218.48.244:8080/"
        ));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PATCH", "PUT", "DELETE", "OPTIONS", "HEAD"));
        configuration.setAllowCredentials(true);
        configuration.setAllowedHeaders(Arrays.asList("Authorization", "Content-Type"));
        configuration.setExposedHeaders(Arrays.asList("X-Get-Header"));
        configuration.setMaxAge(3600L);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

}
