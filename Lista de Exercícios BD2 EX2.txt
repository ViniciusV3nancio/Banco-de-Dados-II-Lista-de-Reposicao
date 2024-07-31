Create Database FATECBD2ViniciusVenancioEx2
Go

Use FATECBD2ViniciusVenancioEx2
Go

-- Criando as Tabelas de Livros, Autores e Editoras  --
Create Table Livros 
	(CodigoDoLivro Int Primary Key Identity (1,1),
	ISBN Int Unique Not Null,
	EdicaoDoLivro TinyInt Null,
	NomeDoLivro Varchar(5633) Not Null,
	LinguaDoLivro Varchar(30) Null,
	AnoDoLivro Date Not Null,
	CodigoAutorDoLivro SmallInt Not Null,
	CodigoEditoraDoLivro SmallInt Not Null,
	CodigoCategoriaDoLivro TinyInt Not Null)
Go

Create Table Autores 
	(CodigoAutor SmallInt Primary Key Identity (1,1),
	NomeAutor Varchar(50) Null,
	DtNascAutor Date Null,
	PaisNascAutor Varchar(30) Null,
	NtBioAutor Varchar(80) Null)
Go

Create Table Editoras 
	(CodigoEditora SmallInt Primary Key Identity (1,1),
	NomeEditora Varchar(100) Not Null,
	EndEditora Varchar(200) Not Null,
	TelEditora Char(20) Null)
Go

Create Table Categorias 
	(CodigoCategorias TinyInt Primary Key Identity (1,1),
	GeneroLiterario Varchar(50) Not Null,
	ClassIndicDeIdade Char(2) Null)
Go

-- Criando os Relacionamentos --
Alter Table Livros
	Add Constraint [FK_Livros_Autores] Foreign Key (CodigoAutorDoLivro)
	References Autores (CodigoAutor)
Go

Alter Table Livros
	Add Constraint [FK_Livros_Editoras] Foreign Key (CodigoEditoraDoLivro)
	References Editoras (CodigoEditora)
Go

Alter Table Livros
	Add Constraint [FK_Livros_Categorias] Foreign Key (CodigoCategoriaDoLivro)
	References Categorias (CodigoCategorias)
Go

Insert Into Autores (NomeAutor, DtNascAutor, PaisNascAutor, NtBioAutor)
 Values ('Karl Marx', '05/05/1818', 'Alemão', 'Pai do Comunismo'),
		('Friedrich Engels', '28/11/1820', 'Prussiano', 'Comunista Talarico'),
		('Domenico Losurdo', '28/06/1941', 'Italiano', 'Filósofo Italiano'),
		('Elias Khalil Jabbour', '12/12/1975', 'Brasileiro', 'Acadêmico Brasileiro'),
		('Vladímir Ilitch Lênin', '22/04/1870', 'Russo', 'Revolucionário'),
		('Jorge Amado', '10/08/1912', 'Brasileiro', 'Literário Brasileiro'),
		('GeorgWilhelm Friedrick Hegel', '27/08/1770', 'Germânico', 'Filósofo'),
		('Euclides da Cunha', '20/01/1866', 'Brasileiro', 'Literário Brasileiro')
Go

Insert Into Editoras (NomeEditora, EndEditora, TelEditora)
 Values ('Editora Boitempo', 'Rua Pereira Leite 373 Sumarezinho | 05442-000 São Paulo | SP | Brasil',  '113875-7250'),
		('Editora Bestbolso', 'Rua Argentina, 171 – São Cristovão Rio de Janeiro/RJ', '2153478964'),
		('Editora Companhia de Bolso', 'Rua Bandeira Paulista, 702, cj. 3204532-002 São Paulo - SP', '113707-3500'),
		('Editora Vozes', 'Rua Frei Luiz, 100, Centro, Petrópolis, RJ 25685020', '2422339000'),
		('Editora Principis', 'R. José Albino Pereira, 54 - Jardim Alvorada, Jandira - SP, 06612-001', '113761-9500'),
		('Editora Panini', 'Alameda Caiapós, 425. Tamboré/SP. 06460-110', '1196547238'),
		('Editora JBC', 'R. Bandeira Paulista, 702 - 3° andarSão Paulo/SP 04532-012', '1169547823'),
		('Editora Fundação Getúlio Vargas', 'R. Jorn. Orlando Dantas, 9 - Botafogo, Rio de Janeiro - RJ, 22231-010', '2141658562')
Go

Insert Into Categorias(GeneroLiterario, ClassIndicDeIdade)
 Values ('Fantasia', 'L'),
		('Ficção Infantojuvenil', '10'),
		('Religioso', '12'),
		('Romance Paranormal', '14'),
		('Suspense', '16'),
		('Distopia', '18'),
		('Política', '14'),
		('Literatura', 'L')
Go

Insert Into Livros (ISBN, EdicaoDoLivro, NomeDoLivro, LinguaDoLivro, AnoDoLivro, CodigoAutorDoLivro, CodigoEditoraDoLivro, CodigoCategoriaDoLivro)
 Values (9786557172292, 1, 'O Capital', 'Português', '14/09/1865', 1, 1, 1),
		(9788577992317, 1, 'A Origem da Familia, da Propriedade Privada e do Estado', 'Português', '01/01/1884', 2, 2, 2),
		(9788575594384, 3, 'A Luta de Classes: Uma História Política e Filosófica', 'Português', '01/01/2013', 3, 3, 3),
		(9786557171097, 2, 'China: O Socialismo do Século XXI', 'Português', '01/01/2021', 4, 4, 4),
		(9788575595749, 5, 'O Estado e a Revolução', 'Português', '01/01/1917', 5, 5, 5),
		(9788535914061, 1, 'Capitães da Areia', 'Português', '01/01/1980', 6, 6, 6),
		(9788532627698, 3, 'Fenomenologia do Espirito', 'Português', '01/01/1807', 7, 7, 7),
		(9788544001295, 2, 'Os Sertões', 'Português', '01/01/1902', 8, 8, 8)
Go

-- Alterando 2 linhas de Registro na Tabela de Livros --
Update Livros
Set AnoDoLivro = '01/01/1966'
Where CodigoDoLivro = 1
Go

Update Livros
Set AnoDoLivro = '01/01/1937'
Where CodigoDoLivro = 6
Go

-- Excluindo 4 linhas de registro na Tabela de Livros --
Delete From Livros
Where CodigoDoLivro >= 2
And CodigoDoLivro < 6
Go


-- Adicionando uma nova coluna que aceita valores nulos atráves do Alter Table --
Alter Table Editoras
Add CNPJ Varchar(13) Null
Go

-- Removendo todos os dados de uma tabela --
Truncate Table Livros
Go

-- Removendo fisicamente a tabela --
Drop Table Livros
Go