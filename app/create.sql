CREATE DATABASE nombre_de_tu_base_de_datos;

\c nombre_de_tu_base_de_datos;

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