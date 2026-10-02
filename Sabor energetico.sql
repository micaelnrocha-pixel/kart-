CREATE DATABASE kart_gt_bd;
USE kart_gt_bd;

CREATE TABLE baterias(
id_baterias INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
valor DECIMAL (8,2) NOT NULL,
duracao_minutos INT NOT NULL
);

CREATE TABLE pilotos(
id_piloto INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100) NOT NULL,
cpf VARCHAR (14) UNIQUE NOT NULL,
telefone VARCHAR (20),
data_nascimento DATE NOT NULL
);

CREATE TABLE karts(
id_kart INT AUTO_INCREMENT PRIMARY KEY,
numero INT NOT NULL UNIQUE,
categoria VARCHAR(50) NOT NULL,
potencia_hp VARCHAR (20)
);

CREATE TABLE reservas(
id_reserva INT AUTO_INCREMENT PRIMARY KEY,
id_piloto INT NOT NULL,
id_baterias INT NOT NULL,
id_kart INT,
data_corrida DATE DEFAULT (CURRENT_DATE),
status VARCHAR(20) DEFAULT 'Confirmada',
FOREIGN KEY (id_piloto) REFERENCES pilotos(id_piloto),
FOREIGN KEY (id_baterias) REFERENCES baterias(id_baterias),
FOREIGN KEY (id_kart) REFERENCES karts(id_kart)
);

INSERT INTO baterias (nome, valor, duracao_minutos) VALUES 
('Treino Livre', 99.90, 15),
('Sprint Race', 149.90, 25),
('Grand Prix GP', 199.90, 40);

INSERT INTO karts(numero, categoria, potencia_hp) VALUES
(12, 'Rental Padrao', '6.5 HP'),
(27, 'Rental Padrao', '6.5 HP'),
(44, 'Profissional 2T', '13 HP');

INSERT INTO pilotos (nome, cpf, telefone, data_nascimento) VALUES
('Lucas Mendes', '111.222.333-44', '41-99999-3333', '1998-05-04'),
('Mariana Souza', '222.333.444-55', '41-98888-8888', '1998-04-05'),
('Roberto Lima', '333.444.555-66', '41-97777-4444', '1997-04-10');

INSERT INTO reservas (id_piloto, id_baterias, id_kart) VALUES
(1.2,1),
(2,3,2),
(3,1,3);



