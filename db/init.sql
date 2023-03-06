

\c ai2sql;

CREATE TABLE ciudad (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  paradas_de_metro INTEGER NOT NULL,
  pais VARCHAR(100) NOT NULL
);

CREATE TABLE persona (
  dni VARCHAR(10) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  fecha_de_nacimiento DATE NOT NULL,
  ciudad_nacimiento INTEGER NOT NULL,
  FOREIGN KEY (ciudad_nacimiento) REFERENCES ciudad(id)
);

CREATE TABLE productos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  pvp NUMERIC(10,2) NOT NULL,
  categoria VARCHAR(100) NOT NULL
);

CREATE TABLE pedidos (
  id_persona VARCHAR(10) NOT NULL,
  id_producto INTEGER NOT NULL,
  precio NUMERIC(10,2) NOT NULL,
  FOREIGN KEY (id_persona) REFERENCES persona(dni),
  FOREIGN KEY (id_producto) REFERENCES productos(id),
  PRIMARY KEY (id_persona, id_producto)
);

INSERT INTO ciudad (nombre, paradas_de_metro, pais)
VALUES ('Madrid', 12, 'España'),
       ('Barcelona', 8, 'España'),
       ('Paris', 14, 'Francia'),
       ('Londres', 10, 'Reino Unido'),
       ('Nueva York', 24, 'EE. UU.'),
       ('Tokio', 9, 'Japón'),
       ('Roma', 11, 'Italia'),
       ('Sídney', 6, 'Australia'),
       ('Buenos Aires', 8, 'Argentina'),
       ('Moscú', 9, 'Rusia'),
       ('Estocolmo', 6, 'Suecia'),
       ('México D.F.', 13, 'México'),
       ('Lisboa', 4, 'Portugal'),
       ('Berlín', 12, 'Alemania'),
       ('Shanghái', 14, 'China'),
       ('Toronto', 5, 'Canadá'),
       ('Ámsterdam', 9, 'Países Bajos'),
       ('Dubái', 2, 'Emiratos Árabes Unidos'),
       ('Sao Paulo', 10, 'Brasil'),
       ('Seúl', 10, 'Corea del Sur');

INSERT INTO productos (nombre, pvp, categoria)
VALUES ('Camiseta', 12.99, 'Ropa'),
    ('Pantalón', 29.99, 'Ropa'),
    ('Calcetines', 5.99, 'Ropa'),
    ('Zapatillas', 59.99, 'Calzado'),
    ('Botas', 79.99, 'Calzado'),
    ('Gafas de sol', 19.99, 'Complementos'),
    ('Bolso', 49.99, 'Complementos'),
    ('Reloj', 99.99, 'Complementos'),
    ('Móvil', 499.99, 'Electrónica'),
    ('Ordenador portátil', 899.99, 'Electrónica'),
    ('Televisor', 799.99, 'Electrónica'),
    ('Cámara de fotos', 299.99, 'Electrónica'),
    ('Videojuego', 59.99, 'Ocio'),
    ('Libro', 14.99, 'Ocio'),
    ('Película en DVD', 9.99, 'Ocio'),
    ('Disco de música', 12.99, 'Ocio'),
    ('Perfume', 49.99, 'Cosmética'),
    ('Crema hidratante', 19.99, 'Cosmética'),
    ('Champú', 7.99, 'Cosmética'),
    ('Maquillaje', 29.99, 'Cosmética');


INSERT INTO persona (dni, nombre, fecha_de_nacimiento, ciudad_nacimiento)
VALUES ('12345678A', 'Juan Pérez', '1990-06-25', 1),
       ('23456789B', 'Ana García', '1985-02-18', 2),
       ('34567890C', 'Pedro Sánchez', '1982-09-02', 1),
       ('45678901D', 'María Torres', '1995-12-10', 4),
       ('56789012E', 'Luis Fernández', '1999-07-17', 1),
       ('67890123F', 'Lucía Martínez', '1997-04-22', 6),
       ('78901234G', 'Manuel Rodríguez', '1980-11-30', 1),
       ('89012345H', 'Carmen González', '1978-08-15', 8),
       ('90123456I', 'Laura Ruiz', '1987-03-12', 9),
       ('01234567J', 'Javier Hernández', '1992-05-08', 1),
       ('12345678K', 'Sara Gómez', '1991-01-23', 11),
       ('23456789L', 'Fernando López', '1984-10-19', 1),
       ('34567890M', 'Marta Jiménez', '1981-07-06', 1),
       ('45678901N', 'Carlos Castro', '1994-09-03', 14),
       ('56789012O', 'Cristina Álvarez', '1996-12-21', 15),
       ('67890123P', 'Diego Sánchez', '1983-02-14', 12),
       ('78901234Q', 'Elena García', '1986-11-07', 17);

INSERT INTO persona (dni, nombre, fecha_de_nacimiento, ciudad_nacimiento)
VALUES
    ('87654321B', 'Juan Fernández', '1995-02-14', 1),
    ('98765432C', 'María López', '1985-05-22', 1),
    ('78901234E', 'Laura Gómez', '1998-07-31', 1),
    ('56789012F', 'José Pérez', '1975-09-12', 1),
    ('34567890G', 'Sara Martínez', '1988-04-19', 1),
    ('90123456H', 'Pablo Sánchez', '1992-11-26', 1),
    ('23456789I', 'Carmen Ruiz', '1996-08-08', 1),
    ('67890123J', 'Javier Castro', '1979-03-17', 1),
    ('87654321L', 'Antonio Jiménez', '1994-03-07', 1),
    ('98765432M', 'Isabel Santos', '1984-10-10', 1),
    ('78901234O', 'Marta García', '1999-02-28', 1),
    ('56789012P', 'Jorge Hernández', '1976-07-20', 1),
    ('34567890Q', 'Cristina Muñoz', '1989-09-04', 1),
    ('90123456R', 'Francisco Navarro', '1993-12-15', 1),
    ('23456789S', 'Lucas Torres', '1997-05-17', 1),
    ('67890123T', 'Elena Moreno', '1982-08-27', 1),
    ('12345678U', 'David Álvarez', '1986-04-12', 1),
    ('87654321V', 'Paula Ortiz', '1991-01-08', 1),
    ('98765432W', 'Adrián Gutiérrez', '1983-02-18', 1),
    ('45678901X', 'Marina Vázquez', '1980-06-09', 1),
    ('78901234Y', 'Miguel Benítez', '1998-11-24', 1),
    ('56789012Z', 'Natalia Romero', '1977-12-01', 1),
    ('11223344A', 'Roberto González', '1996-09-27', 1);


INSERT INTO pedidos (id_persona, id_producto, precio)
VALUES ('12345678A', 1, 12.99),
        ('23456789B', 2, 29.99),
        ('34567890C', 3, 5.99),
        ('34567890C', 4, 59.99),
        ('34567890C', 5, 79.99),
        ('45678901D', 6, 19.99),
        ('78901234Q', 7, 49.99),
        ('45678901N', 8, 99.99),
        ('12345678K', 9, 499.99),
        ('90123456I', 10, 899.99),
        ('78901234G', 11, 799.99),
        ('67890123F', 12, 299.99),
        ('56789012O', 13, 59.99),
        ('67890123F', 14, 14.99),
        ('56789012E', 15, 9.99),
        ('12345678K', 16, 12.99),
        ('34567890M', 17, 49.99),
        ('34567890M', 18, 19.99),
        ('56789012E', 19, 7.99),
        ('56789012E', 20, 29.99),
        ('12345678A', 4, 59.99),
        ('23456789B', 5, 79.99),
        ('34567890C', 6, 19.99),
        ('34567890C', 7, 49.99),
        ('34567890C', 8, 99.99),
        ('45678901D', 9, 499.99),
        ('78901234Q', 10, 899.99),
        ('45678901N', 11, 799.99),
        ('12345678K', 12, 299.99),
        ('90123456I', 13, 59.99),
        ('78901234G', 14, 14.99),
        ('67890123F', 15, 9.99),
        ('56789012O', 16, 12.99),
        ('67890123F', 17, 49.99),
        ('56789012E', 18, 19.99),
        ('12345678K', 19, 7.99),
        ('34567890M', 20, 29.99),
        ('34567890M', 1, 12.99),
        ('56789012E', 2, 29.99),
        ('56789012E', 3, 5.99);