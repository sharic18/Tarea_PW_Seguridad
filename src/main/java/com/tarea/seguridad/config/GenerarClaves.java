package com.tarea.seguridad.config;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GenerarClaves {

    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        System.out.println("HASH_ADMIN=" + encoder.encode("admin123"));
        System.out.println("HASH_DOCENTE=" + encoder.encode("docente123"));
        System.out.println("HASH_SHARIC=" + encoder.encode("sharic123"));
    }
}