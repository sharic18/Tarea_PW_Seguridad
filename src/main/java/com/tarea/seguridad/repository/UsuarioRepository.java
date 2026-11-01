package com.tarea.seguridad.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tarea.seguridad.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {

    Usuario findByUsername(String username);
}