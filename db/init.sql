

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
VALUES ('12345678A', 'Juan Pérez', '1990-06-25', 12),
       ('23456789B', 'Ana García', '1985-02-18', 2),
       ('34567890C', 'Pedro Sánchez', '1982-09-02', 12),
       ('45678901D', 'María Torres', '1995-12-10', 4),
       ('56789012E', 'Luis Fernández', '1999-07-17', 12),
       ('67890123F', 'Lucía Martínez', '1997-04-22', 6),
       ('78901234G', 'Manuel Rodríguez', '1980-11-30', 12),
       ('89012345H', 'Carmen González', '1978-08-15', 8),
       ('90123456I', 'Laura Ruiz', '1987-03-12', 9),
       ('01234567J', 'Javier Hernández', '1992-05-08', 12),
       ('12345678K', 'Sara Gómez', '1991-01-23', 11),
       ('23456789L', 'Fernando López', '1984-10-19', 12),
       ('34567890M', 'Marta Jiménez', '1981-07-06', 12),
       ('45678901N', 'Carlos Castro', '1994-09-03', 14),
       ('56789012O', 'Cristina Álvarez', '1996-12-21', 15),
       ('67890123P', 'Diego Sánchez', '1983-02-14', 12),
       ('78901234Q', 'Elena García', '1986-11-07', 17);

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