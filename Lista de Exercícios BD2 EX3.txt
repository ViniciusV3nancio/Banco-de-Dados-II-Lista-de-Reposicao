Create Database FATECBD2ViniciusVenancioEx3
Go

Use FATECBD2ViniciusVenancioEx3
Go

Create table Imovel (
 CDImovel int Primary Key,
 CDTipoImovel Int Not Null,
 Endereco Varchar(100) Not Null,
 Bairro Varchar (50) Not Null,
 Cidade Varchar(85) Not Null,
 Estado Varchar(85) Not Null,
 ValorImovel Numeric Not Null,
 DescricaoImovel Varchar(250),
 RGProprietario Varchar(10) Not Null,
 DataCadastro Date Not Null)
Go

Create table Vendas(
NumeroVenda Int,
DataVenda Date Not Null,
CDCorretor int Not Null,
ValorComissao Varchar(250) Not Null,
ValorVenda Varchar (250) Not Null)
Go

Create table Corretor(
CDCorretor Int Primary Key,
NomeCorretor Varchar (100)
)
go

Create Table TipoImovel(
CDTipoImovel Int Not Null,
DescricaoImovel Varchar(250),
StatusImovel Varchar(50) Not Null)
Go

INSERT INTO Imovel (CDImovel, CDTipoImovel, Endereco, Bairro, Cidade, Estado, ValorImovel, DescricaoImovel, RGProprietario, DataCadastro) 
VALUES 
    (1, 1, 'Rua Jota, 123', 'Centro', 'São Paulo', 'SP', 135478, 'Casa Charmosa', '11234567', '2024-02-20'),
    (2, 2, 'Avenida Xana, 456', 'Barra', 'Rio de Janeiro', 'RJ', 958746, 'Casa Charmosa', '10234567', '2024-02-21'),
    (3, 1, 'Rua Coca, 789', 'Centro', 'Belo Horizonte', 'MG', 247859, 'Casa Charmosa', '08901234', '2024-02-22'),
    (4, 3, 'Rua Droga, 321', 'São Cristóvão', 'Porto Alegre', 'RS', 654782, 'Casa Charmosa', '07890123', '2024-02-23'),
    (5, 2, 'Avenida Verme, 1000', 'Itaim Bibi', 'São Paulo', 'SP', 123456, 'Casa Charmosa', '12234567', '2024-02-24'),
    (6, 1, 'Rua Elipse, 987', 'Jardins', 'São Paulo', 'SP', 325748, 'Casa Charmosa', '06789012', '2024-02-25'),
    (7, 2, 'Avenida Gado, 582', 'Salvador', 'Recife', 'PE', 465843, 'Casa Charmosa', '05678901', '2024-02-26'),
    (8, 1, 'Rua Torta, 651', 'Lapa', 'São Paulo', 'SP', 124587, 'Casa Charmosa', '04567890', '2024-02-27'),
    (9, 3, 'Alameda Reta, 948', 'Chapacabana', 'Rio de Janeiro', 'RJ', 15948234, 'Casa Charmosa', '02345678', '2024-02-28'),
    (10, 2, 'Avenida Pica, 69', 'Xana', 'Rio de Janeiro', 'RJ', 987562, 'Casa Charmosa', '01000000', '2024-02-29');
Go

INSERT INTO Vendas (NumeroVenda, DataVenda, CDCorretor, ValorComissao, ValorVenda)
VALUES
    (1, '2020-02-10', 101, '90.00', '1500.00'),
    (2, '2021-02-05', 102, '120.00', '2000.00'),
    (3, '2021-02-13', 103, '108.00', '1800.00'),
    (4, '2022-02-09', 104, '150.00', '2500.00'),
    (5, '2022-02-15', 105, '132.00', '2200.00'),
    (6, '2023-02-29', 106, '114.00', '1900.00'),
    (7, '2023-02-31', 107, '126.00', '2100.00'),
    (8, '2023-02-14', 108, '105.00', '1750.00'),
    (9, '2024-02-03', 109, '144.00', '2400.00'),
    (10, '2024-03-08', 110, '156.00', '2600.00');
Go

INSERT INTO Corretor (CDCorretor, NomeCorretor)
VALUES
    (101, 'Sofia Oliveira'),
    (102, 'Lucas Santos'),
    (103, 'Ana Carolina Pereira'),
    (104, 'Pedro Fernandes'),
    (105, 'Mariana Costa'),
    (106, 'João Miguel'),
    (107, 'Beatriz Almeida'),
    (108, 'Gabriel Rodrigues'),
    (109, 'Laura Silva'),
    (110, 'Rafael Martins');
Go

INSERT INTO TipoImovel (CDTipoImovel, DescricaoImovel, StatusImovel)
VALUES
    (1, 'Kitnet', 'Disponível'),
    (2, 'Sítio', 'Indisponível'),
    (3, 'Sobrado', 'Disponível'),
    (4, 'Fazenda', 'Indisponível'),
    (5, 'Loft', 'Disponível'),
    (6, 'Chácara', 'Disponível'),
    (7, 'Área', 'Indisponível'),
    (8, 'Cobertura', 'Disponível'),
    (9, 'Casa Térrea', 'Indisponível'),
    (10, 'Apartamento', 'Disponível');
Go

-- 2. --
Alter Table Imovel
Add Situacao char(1) Default 'N' check (Situacao in ('S', 's', 'N', 'n'))
Go

-- 3. -- 
Alter Table Imovel
Add Constraint DFLT_Estado Default 'SP' For Estado
Go

-- 4. --
Alter Table TipoImovel
Drop Column StatusImovel
Go

-- 5. --
Alter table TipoImovel
Add Constraint PK_CDTipoImovel Primary Key (CDTipoImovel)
Go

Alter Table Vendas
Add Constraint PK_NumeroVendas Primary Key (NumeroVendas)
Go

Alter Table Vendas
Add Constraint FK_Corretor Foreign Key (CDCorretor) References Corretor(CDCorretor)
Go

Alter table Imovel
Add Constraint FK_TipoImovel Foreign Key (CDTipoImovel) 
References TipoImovel(CDTipoImovel)
Go

-- 6. --
Alter Table Corretor
Add DataNascimento Date
Go

Alter Table Corretor
Add Constraint CK_DataNascimento Check (DateDiff(Year, DataNascimento, GetDate()) >= 18)
Go

-- 7. --
Create NonClustered Index IX_RGProprietario On Imovel (RGProprietario)
Go

-- 8. --
Create NonClustered Index IX_CDCorretor On Vendas (CDCorretor)
Go

-- 9. --
Alter Table Vendas
Add RGComprador Varchar(10)
Go

Create NonClustered Index IX_RGComprador On Vendas (RGComprador)
Go

-- 10. --
Select V.NumeroVenda, V.DataVenda, V.CDCorretor, V.ValorComissao, V.ValorVenda,
		C.NomeCorretor, C.DataNascimento
From Vendas V
Inner Join Corretor C On V.CDCorretor = C.CDCorretor
Go