CREATE DATABASE veterinaria_patitas_felices;
USE veterinaria_patitas_felices;
--Ejercicio 2: Crear Tabla Duenos
CREATE TABLE duenos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(100)
)
--Ejercicio 3: Crear Tabla Mascotas
CREATE TABLE mascotas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    id_dueno INT,
    FOREIGN KEY (id_dueno) REFERENCES duenos(id)
)
--Ejercicio 4:Crear Tabla Veterinarios
CREATE TABLE veterinarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL
)

--Ejercicio 5: Crear Tabla Historial-Clinico
CREATE TABLE historial_clinico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_mascota INT NOT NULL,
    id_veterinario INT NOT NULL,
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id) ON DELETE CASCADE,
    FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id),
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descripcion VARCHAR(250) NOT NULL
)

--Ejercicio 6: Insertar Registros
INSERT INTO duenos (nombre, apellido, telefono, direccion) VALUES
('Carlos', 'Muzzopappa', '123456789', 'San Pedrito 2682'),
('Isabel', 'Monteagudo', '987654321', 'Rivadavia 10400'),
('Alejandro', 'Gonzalez', '456123789', 'Chilavert 2456');
INSERT INTO mascotas (nombre, especie, fecha_nacimiento, id_dueno) VALUES
('Loli', 'Perro', '2015-05-10', 1),
('Phoebe', 'Gato', '2021-11-22', 2),
('Pity', 'Perro', '2015-07-15', 3);
INSERT INTO veterinarios (nombre, apellido, matricula, especialidad) VALUES
('Chiara', 'Grifone', 'VET12345', 'Clinica General'),
('Matias', 'Scopelli', 'VET67890', 'Cirugia');
INSERT INTO historial_clinico (id_mascota, id_veterinario, descripcion) VALUES
(1, 1, 'Chequeo anual y vacunacion.'),
(2, 1, 'Tratamiento por infeccion urinaria.'),
(3, 2, 'Esterilizacion.');

--Ejercicio 7: Actualizar Registros
UPDATE duenos SET direccion = 'Castanon 3256' WHERE id = 1;
UPDATE veterinarios SET especialidad = 'Medicina Interna' WHERE id = 1;
UPDATE historial_clinico SET descripcion = 'Chequeo anual, vacunacion y desparasitacion.' WHERE id = 1;

--Ejercico 8: Eliminar Registros
DELETE FROM mascotas WHERE id = 3;

--Ejercicio 9: JOIN Simple
SELECT m.nombre, m.especie, d.apellido , d.nombre
FROM mascotas m
JOIN duenos d
ON m.id_dueno = d.id

--Ejercicio 10: JOIN Multiple con Historial Clinico
SELECT hc.fecha_registro, hc.descripcion, m.nombre, m.especie , d.nombre , d.apellido , v.nombre, v.apellido
FROM historial_clinico hc
JOIN mascotas m ON hc.id_mascota = m.id
JOIN duenos d ON m.id_dueno = d.id
JOIN veterinarios v ON hc.id_veterinario = v.id
ORDER BY hc.fecha_registro DESC;

