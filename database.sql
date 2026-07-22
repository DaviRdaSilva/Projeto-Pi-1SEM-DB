-- Criação do Banco de Dados
CREATE DATABASE Secure_Ship;

USE Secure_Ship;

-- Criação da tabela onde ficara armazenado os dados da Empresa
CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT, -- Chave Primaria
    Nome_Fantasia VARCHAR(80), -- Nome da empresa
    Cnpj CHAR(19), -- cnpj com 19 digitos contando com pontos e traços
    Rua VARCHAR(40), -- Componentes do Endereço da Empresa
    Numero VARCHAR(40), -- Componentes do Endereço da Empresa
    Bairro VARCHAR(40), -- Componentes do Endereço da Empresa
    Estado VARCHAR(40), -- Componentes do Endereço da Empresa
    Telefone VARCHAR(15), -- telefone com 15 digitos no Maximo
    Email VARCHAR(50) -- Email com no maximo 50 digitos 
);

-- Criação da tabela para guardar um usuario especifico de determinada empresa
CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT, -- Chave Primaria
    Nome VARCHAR(80), -- Nome do Usuario
	Email VARCHAR(50), -- Email com no maximo 50 digitos
    CPF CHAR(11) UNIQUE, -- CPF com apenas numeros
	Telefone VARCHAR(15), -- telefone com 15 digitos no Maximo
    Senha CHAR(20), -- Senha ainda sem formatação de criptografia
    FKEmpresa INT, -- Chave Estrangeira da Tabela Empresa
		CONSTRAINT FKEmpresa_U FOREIGN KEY (FKEmpresa)
			REFERENCES Empresa(idEmpresa),
	FKAdmin INT, -- Chave Estrangeira de Recursividade (User - Admin)
		CONSTRAINT FKAdmin_U FOREIGN KEY (FKAdmin)
			REFERENCES Usuario(idUsuario)
);

-- Criação da tabela onde ficara as informações do local onde será retirada as leituras
CREATE TABLE Localizacao(
	idLocal INT PRIMARY KEY AUTO_INCREMENT, -- Chave Primaria
    Nome VARCHAR(80), -- Nome do Local EX(Sala 01,Sala 02)
    FKEmpresa INT, -- Chave Estrangeira da Tabela Empresa
		CONSTRAINT FKEmpresa_L FOREIGN KEY (FKEmpresa)
			REFERENCES Empresa(idEmpresa)
);

-- Criação de uma tabela exclusiva para os sensores (não para os resultados somente para os sensores)
CREATE TABLE Sensores(
	idSensor INT PRIMARY KEY AUTO_INCREMENT, -- Chave Primaria
    Nome VARCHAR(20), -- Nome do sensor
    Tipo VARCHAR(30), -- Tipagem do Sensor EX(Temperatura,Umidade,Luminosidade)
    FKLocal_S INT, -- Chave Estrangeira da Tabela Localizaçao
		CONSTRAINT FKLocal_S FOREIGN KEY (FKLocal_S)
			REFERENCES Localizacao(idLocal)
);

-- Criação da tabela que fara o Relacionamento dos sensores com os resultados e os clientes
CREATE TABLE Leitura (
	idLeitura INT PRIMARY KEY AUTO_INCREMENT, -- Componente da Chave Primaria 
    Leitura_Temp FLOAT, -- Resultado dos sensores
    Leitura_Umi FLOAT, 
    Data_Hora DATETIME DEFAULT CURRENT_TIMESTAMP, -- Data e hora em que os resultados foram computados
    FKLocal_LE INT, -- Componente da Chave Primaria que refere a Tabela Sensores
		CONSTRAINT FKLocal_LE FOREIGN KEY (FKLocal_LE)
			REFERENCES Localizacao(idLocal)
);

INSERT INTO Empresa VALUES
	(NULL, "Teste01", '53.393.263/0001-74', 
    'Hadock Lobo', '595', 'Paulista', 'SP', '11959164441', 'teste01@gmail.com'),
	(NULL, "Teste02", '52.393.263/0001-74', 
    'Hadock Lobo', '595', 'Paulista', 'SP', '11959164441', 'teste02@gmail.com'),
	(NULL, "Teste03", '51.393.263/0001-74', 
    'Hadock Lobo', '595', 'Paulista', 'SP', '11959164441', 'teste03@gmail.com');

INSERT INTO Usuario VALUES
	(NULL, 'Davi Rodrigues', 'davirodrigues0506@gmail.com', 
		'48372073830','11959164441', '@myLOVEisthe0506', 1, NULL),
	(NULL, 'Cesar Martins', 'cesarmartins@gmail.com', 
		'12345678901', '11959164441', 'teste011234', 2, NULL),
	(NULL, 'Simone Lopes', 'simonelopes@gmail.com', 
		'98765432109', '11959164441', 'teste021234', 3, NULL);
        
INSERT INTO Localizacao VALUES
	(NULL, "Container 001", 1),
    (NULL, "Container 002", 1),
    (NULL, "Container 003", 2),
    (NULL, "Container 004", 2),
    (NULL, "Container 005", 3);
    
INSERT INTO Sensores VALUES
	(NULL, "Sensor 001", "Temperatura",1),(NULL, "Sensor 002", "Umidade",1),
	(NULL, "Sensor 003", "Temperatura",2),(NULL, "Sensor 004", "Umidade",2),
    (NULL, "Sensor 005", "Temperatura",3),(NULL, "Sensor 006", "Umidade",3),
    (NULL, "Sensor 007", "Temperatura",4),(NULL, "Sensor 008", "Umidade",4),
    (NULL, "Sensor 009", "Temperatura",5),(NULL, "Sensor 010", "Umidade",5);