DROP DATABASE IF EXISTS nocturnalHunters;
CREATE DATABASE nocturnalHunters;
USE nocturnalHunters;

CREATE TABLE Clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Gmail VARCHAR(255),
    Usuario VARCHAR(255),
    Contraseña VARCHAR(255)
);

insert into Clientes (Gmail, Usuario, Contraseña) values
("j@gmail.com", "Joaquin", "1234"),
("jo@gmail.com", "Manu", "1234"),
("aj@gmail.com", "Adri", "1234"),
("uj@gmail.com", "Juan", "1234");

CREATE TABLE Niveles (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Nivel VARCHAR(255),
    Descripción VARCHAR(255),
    Dificultad ENUM('basico', 'intermedio', 'dificil')
);

insert into Niveles (Nombre_Nivel, Descripción, Dificultad) values
("Nivel_1", "No se que descripcion poner", "basico"),
("Nivel_2", "No se que descripcion poner", "basico"),
("Nivel_3", "No se que descripcion poner", "basico"),
("Nivel_4", "No se que descripcion poner", "intermedio"),
("Nivel_5", "No se que descripcion poner", "intermedio"),
("Nivel_6", "No se que descripcion poner", "intermedio"),
("Nivel_7", "No se que descripcion poner", "intermedio"),
("Nivel_8", "No se que descripcion poner", "dificil"),
("Nivel_9", "No se que descripcion poner", "dificil"),
("Nivel_10", "No se que descripcion poner", "dificil");


CREATE TABLE Enemigos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Tipo ENUM('basicos', 'intermedios', 'bosses'),
    Vida INT,
    Daño INT,
    Velocidad INT
);

insert into Enemigos (Nombre, Tipo, Vida, Daño, Velocidad) values /*Cambiar estadisticas segun el juego*/
("Fantasma", "basicos", 11, 11, 11),
("Ojo", "basicos", 12, 12, 12),
("Slime azul", "basicos", 13, 13, 13),
("Esqueleto", "basicos", 14, 14, 14),
("Violet Slime", "intermedios", 15, 15, 15),
("Fantasma Shooter", "intermedios", 16, 16, 16),
("Dragon", "intermedios", 17, 17, 17),
("Murcielago", "basicos", 18, 18, 18);

CREATE TABLE Personajes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Tipo ENUM('pj1', 'pj2', 'pj3', 'pj4'),
    Vida INT,
    Daño INT,
    Velocidad INT,
    ClienteID INT,
    CONSTRAINT fk_cliente_personaje FOREIGN KEY (ClienteID) REFERENCES Clientes(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Personajes (Nombre, Tipo, Vida, Daño, Velocidad, ClienteID) values 
("Disparador", "pj1", 6, 7, 2, 1 ),
("Espadachin", "pj2", 7, 5, 3, 2 ),
("Ladron", "pj3", 6, 5, 5, 3 ),
("Caballero", "pj4", 10, 5, 3, 4 );

CREATE TABLE Partidas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_Hora_inicio datetime,
    Duración TIME,
    Resultado VARCHAR(255),
	ClienteID INT,
    Nombre_Pj VARCHAR (255),
    Enemigos_Eliminados INT,
    CONSTRAINT fk_cliente_partida FOREIGN KEY (ClienteID) REFERENCES Clientes(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Partidas (Fecha_Hora_inicio, Duración, Resultado, ClienteID, Nombre_Pj , Enemigos_Eliminados) values
('2024-05-01 10:30:00', '00:30:00', '200', 1, "Disparador" , 40),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 40),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 40),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 40),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 40),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 40),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 40),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 40),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 40),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 40),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 40),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 40),
('2024-05-02 11:15:00', '01:15:00', '500', 3, "Samurai" , 20),
('2024-05-03 12:45:00', '00:45:00', '1500', 2, "Bandido", 30),
('2024-05-04 13:55:00', '00:55:00', '2000', 2, "Disparador", 10);


CREATE TABLE Mejoras(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Mejora ENUM('Pocion', 'Buff Daño', 'Velocidad', 'Buff daño2'),
    Buffo ENUM ('Velocidad *1.5', 'Vida +1' , 'Daño +1', 'Daño +2'),
    Precio DECIMAL(10, 2),
    ClienteID INT,
    CONSTRAINT fk_cliente_mejora FOREIGN KEY (ClienteID) REFERENCES Clientes(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Mejoras (Nombre_Mejora, Buffo, Precio, ClienteID) values 
("Pocion", 'Vida +1' , 15 , 1),
("Buff Daño", 'Daño +1' , 20 , 2),
("Velocidad", 'Velocidad *1.5'  , 25 , 3),
("Buff Daño2", 'Daño +2', 30 , 4);





