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

/* No se esta usando */
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

INSERT INTO Enemigos (Nombre, Tipo, Vida, Daño, Velocidad) VALUES
("Fantasma", "basicos", 40, 1, 2),  
("Ojo", "basicos", 50, 1, 2),  
("Slime azul", "basicos", 20, 1, 1),  
("Esqueleto", "basicos", 25, 1, 1.5),  
("Violet Slime", "intermedios", 60, 1, 1),  
("Fantasma Shooter", "intermedios", 25, 1, 1),  
("Dragon", "intermedios", 60, 1, 1),  
("Murcielago", "basicos", 25, 1, 2),  
("Boss", "bosses", 150, 2, 3.5);

CREATE TABLE Personajes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Tipo ENUM('Shooter', 'Melee', 'Melee rapido', 'Tanque'),
    Vida INT,
    Daño INT,
    Velocidad INT,
    ClienteID INT,
    CONSTRAINT fk_cliente_personaje FOREIGN KEY (ClienteID) REFERENCES Clientes(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Personajes (Nombre, Tipo, Vida, Daño, Velocidad, ClienteID) values 
("Disparador", "Shooter", 10, 10, 3.5, 1 ),
("Samurai", "Melee", 14, 8, 5, 2 ),
("Ladron", "Melee rapido", 12, 5, 5, 3 ),
("Caballero", "Tanque", 16, 5, 4, 4 );

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

-- Enero
insert into Partidas (Fecha_Hora_inicio, Duración, Resultado, ClienteID, Nombre_Pj , Enemigos_Eliminados) values
('2024-01-03 10:00:00', '00:50:00', '300', 1, "Disparador", 40),
('2024-01-10 09:15:00', '00:45:00', '350', 1, "Caballero", 40),
('2024-01-15 14:00:00', '01:00:00', '450', 1, "Samurai", 50),
('2024-01-20 16:20:00', '00:55:00', '320', 1, "Ladron", 25),
('2024-01-25 11:45:00', '01:05:00', '400', 1, "Disparador", 35);

-- Febrero
insert into Partidas (Fecha_Hora_inicio, Duración, Resultado, ClienteID, Nombre_Pj , Enemigos_Eliminados) values
('2024-02-02 10:30:00', '01:10:00', '700', 1, "Caballero", 60),
('2024-02-07 13:00:00', '00:40:00', '250', 1, "Samurai", 30),
('2024-02-12 09:45:00', '00:55:00', '370', 1, "Ladron", 28),
('2024-02-18 15:20:00', '01:15:00', '620', 1, "Disparador", 50),
('2024-02-25 17:10:00', '00:50:00', '310', 1, "Caballero", 35),
('2024-02-28 11:30:00', '01:00:00', '420', 1, "Samurai", 45);

-- Marzo
insert into Partidas (Fecha_Hora_inicio, Duración, Resultado, ClienteID, Nombre_Pj , Enemigos_Eliminados) values
('2024-03-01 08:50:00', '00:45:00', '270', 1, "Ladron", 40),
('2024-03-05 10:10:00', '01:00:00', '500', 1, "Disparador", 55),
('2024-03-10 12:20:00', '00:35:00', '280', 1, "Caballero", 32),
('2024-03-15 14:25:00', '00:55:00', '360', 1, "Samurai", 38),
('2024-03-18 11:25:00', '01:20:00', '900', 1, "Ladron", 45),
('2024-03-22 16:30:00', '01:10:00', '650', 1, "Disparador", 52),
('2024-03-28 09:15:00', '00:50:00', '400', 1, "Caballero", 43);

-- Abril
insert into Partidas (Fecha_Hora_inicio, Duración, Resultado, ClienteID, Nombre_Pj , Enemigos_Eliminados) values
('2024-04-03 07:55:00', '00:45:00', '270', 1, "Samurai", 38),
('2024-04-07 10:05:00', '00:40:00', '310', 1, "Ladron", 42),
('2024-04-12 08:55:00', '00:35:00', '270', 1, "Disparador", 35),
('2024-04-15 12:25:00', '01:10:00', '700', 1, "Caballero", 60),
('2024-04-20 13:40:00', '00:50:00', '410', 1, "Samurai", 32),
('2024-04-25 17:45:00', '00:45:00', '300', 1, "Ladron", 28);

-- Mayo
insert into Partidas (Fecha_Hora_inicio, Duración, Resultado, ClienteID, Nombre_Pj , Enemigos_Eliminados) values
('2024-05-01 10:30:00', '00:30:00', '200', 1, "Disparador" , 80),
('2024-05-02 10:31:00', '00:31:00', '200', 1, "Caballero" , 30),
('2024-05-02 11:15:00', '01:15:00', '500', 1, "Samurai" , 27),
('2024-05-03 12:45:00', '00:45:00', '1500', 1, "Ladron", 32),
('2024-05-05 10:05:00', '01:05:00', '510', 1, "Disparador", 55),
('2024-05-12 17:45:00', '00:25:00', '290', 1, "Caballero", 28),
('2024-05-22 16:20:00', '00:55:00', '320', 1, "Samurai", 25),
('2024-05-28 14:00:00', '01:00:00', '450', 1, "Ladron", 50);

-- Junio
insert into Partidas (Fecha_Hora_inicio, Duración, Resultado, ClienteID, Nombre_Pj , Enemigos_Eliminados) values
('2024-06-01 12:30:00', '00:30:00', '300', 1, "Samurai", 32),
('2024-06-05 08:45:00', '01:00:00', '550', 1, "Ladron", 42),
('2024-06-10 14:50:00', '01:15:00', '600', 1, "Disparador", 53),
('2024-06-12 10:25:00', '00:35:00', '250', 1, "Caballero", 30),
('2024-06-18 09:00:00', '00:55:00', '480', 1, "Samurai", 48),
('2024-06-22 16:15:00', '01:10:00', '650', 1, "Ladron", 58),
('2024-06-25 18:20:00', '00:45:00', '370', 1, "Disparador", 37),
('2024-06-30 13:15:00', '01:30:00', '750', 1, "Caballero", 61);


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
