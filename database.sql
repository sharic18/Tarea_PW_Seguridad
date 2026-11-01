CREATE DATABASE tarea_seguridad
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE users (
    user_id  SERIAL PRIMARY KEY,
    username VARCHAR(45) NOT NULL UNIQUE,
    password VARCHAR(64) NOT NULL,
    enabled  BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    name    VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE users_roles (
    user_id INT NOT NULL REFERENCES users(user_id),
    role_id INT NOT NULL REFERENCES roles(role_id),
    PRIMARY KEY (user_id, role_id)
);

INSERT INTO roles (name) VALUES ('ADMIN'), ('DOCENTE'), ('ESTUDIANTE'), ('GRADUADO');



INSERT INTO users (username, password, enabled) VALUES
 ('admin',   '$2a$10$OuL6zq8RVEpXDkIQxw2pTOSImpYDIhyVu5iWhdQ7QiKANNyUD6l3a',   true),
 ('docente', '$2a$10$pLFzNgpB/A3rKIqn9Cxu/OsQ9NXljxKcJQaQ3Oao1q468zLRYOH7G', true),
 ('sharic',   '$2a$10$HyEmxlxKBdYUZIyAzXKMzOxqm7e6GKeIBlxN/ZA7tnb2CzIIftleO',   true);

SELECT * FROM users;
SELECT * FROM roles;

INSERT INTO users_roles (user_id, role_id) VALUES
 (1, 1),
 (2, 2),
 (3, 3),
 (3, 4);

SELECT u.username, r.name AS rol
FROM users u
JOIN users_roles ur ON u.user_id = ur.user_id
JOIN roles r ON r.role_id = ur.role_id
ORDER BY u.username;