package com.tarea.seguridad.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class AppController {

    @GetMapping("/")
    public String inicio() {
        return "inicio";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/403")
    public String error403() {
        return "403";
    }

    @GetMapping("/new")
    public String nuevo(Model model) {
        model.addAttribute("mensaje", "Página NEW: acceso para ADMIN y DOCENTE");
        return "accion";
    }

    @GetMapping("/edit/{id}")
    public String editar(@PathVariable int id, Model model) {
        model.addAttribute("mensaje", "Editando el registro " + id + ": acceso para ADMIN y DOCENTE");
        return "accion";
    }

    @GetMapping("/delete/{id}")
    public String eliminar(@PathVariable int id, Model model) {
        model.addAttribute("mensaje", "Eliminando el registro " + id + ": acceso solo para ADMIN");
        return "accion";
    }
}