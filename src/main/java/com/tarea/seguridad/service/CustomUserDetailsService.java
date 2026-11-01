package com.tarea.seguridad.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.tarea.seguridad.model.Rol;
import com.tarea.seguridad.model.Usuario;
import com.tarea.seguridad.repository.UsuarioRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Usuario usuario = usuarioRepository.findByUsername(username);

        if (usuario == null) {
            throw new UsernameNotFoundException("No existe el usuario: " + username);
        }

        List<GrantedAuthority> authorities = new ArrayList<>();
        for (Rol rol : usuario.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(rol.getName()));
        }

        return new User(
                usuario.getUsername(),
                usuario.getPassword(),
                usuario.isEnabled(),
                true,
                true,
                true,
                authorities);
    }
}