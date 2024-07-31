Create Database FATECBD2ViniciusVenancioEx1

Go 

 

Use FATECBD2ViniciusVenancioEx1

Go 

Create Table Departamentos 
(CodigoDepartamentos Int Primary Key,  
 NomeDepartamentos VarChar(30)) 
Go 

Create Table TipoEmpregados  
 (CodigoTipoEmpregado Int Primary Key,  
  Descricao VarChar(50)) 
Go 

 

Create Table Empregados 
(CodigoEmpregado Int Primary Key,  
 NomeEmpregado VarChar(30),  
 SalarioEmpregado Numeric(8,2),  
 CodigoTipoEmpregado Int References TipoEmpregados(CodigoTipoEmpregado),  
 CodigoTipoDepartamentos Int References Departamentos(CodigoDepartamentos)) 
Go 

 

Insert Into Departamentos 
Values (1, 'RH'),
		(2, 'Marketing'),
		(3, 'Contabilidade'),
		(4, 'Logistica'),
		(5, 'TI'),
		(6, 'P&D') 
Go 

 

Insert Into TipoEmpregados
Values (1, 'Engenheiro Civil'),
		(2, 'CEO'),
		(3, 'Caixa'),
		(4, 'Analista') 

 

Insert Into Empregados 
Values (1, 'João Silva', 1000, 1, 1), 
		(2, 'Ana Santos', 300, 2, 2), 
		(3, 'Pedro Oliveira', 3000, 2, 2),
		(4, 'Maria Costa', 1500, 1, 2),
		(5, 'Carlos Pereira', 1600, 2, 1),
		(6, 'Sofia Rodrigues', 2000, 2, 1), 
		(7, 'Miguel Fernandes', 100, 3, 1), 
		(8, 'Inês Martins', 1090, 3, 3), 
		(9, 'Luís Sousa', 1080, 3, 1),
		(10, 'Andreia Almeida', 1800, 3, 1),
		(11, 'Tiago Ramos', 1800, 3, 1),
		(12, 'Mariana Carvalho', 5000, 3, Null),
		(13, 'Diogo Pereira', 1300, 3, 6) 
Go

-- Selecionando of funcionários por departamento --

select E.NomeEmpregado, D.NomeDepartamentos
From Empregados E Inner Join Departamentos D
	on E.CodigoTipoDepartamentos = D.CodigoDepartamentos
order by D.NomeDepartamentos
go

-- Selecionando of funcionários com o salário maior que 1200 --

Select E.NomeEmpregado, D.NomeDepartamentos, E.SalarioEmpregado
From Empregados E Inner Join Departamentos D
	On E.CodigoTipoDepartamentos = D.CodigoDepartamentos
Where E.SalarioEmpregado > 1200
Order By E.SalarioEmpregado Desc
Go

-- Selecionando a média dos salários por departamento --

Select D.NomeDepartamentos, Convert(int,AVG(E.SalarioEmpregado)) As MediaSalarial
from Empregados E Join Departamentos D On E.CodigoTipoDepartamentos = D.CodigoDepartamentos
Group By D.NomeDepartamentos
Go

-- Selecionando o departamento com a maior média salarial --

Select Top 1 D.NomeDepartamentos, Convert(int,AVG(E.SalarioEmpregado)) As MediaSalarial
From Empregados E Join Departamentos D On E.CodigoTipoDepartamentos = D.CodigoDepartamentos
Group By D.NomeDepartamentos
Order By CONVERT(int,AVG(E.SalarioEmpregado)) Desc
Go

-- Selecionando a média salarial dos departamentos em que a média salarial é maior que 1200 --

Select D.NomeDepartamentos, Convert(int,AVG(E.SalarioEmpregado)) As MediaSalarial
From Empregados E join Departamentos D On E.CodigoTipoDepartamentos = D.CodigoDepartamentos
Group By D.NomeDepartamentos
Having AVG(E.SalarioEmpregado) > 1200
Order by CONVERT(int,AVG(E.SalarioEmpregado)) Desc
Go

-- Tipos de empregado que estão em mais de um departamento --

Select Distinct T.Descricao As 'Descrição tipo Empregado',
	D.NomeDepartamentos As 'Nome do Departamento'
From Empregados E Inner Join Departamentos D
	On E.CodigoTipoDepartamentos = D.CodigoDepartamentos
	Inner Join TipoEmpregados T
	On E.CodigoTipoEmpregado = T.CodigoTipoEmpregado
Order By T.Descricao
Go

-- Departamentos que não possuem empregados --

Select Distinct T.Descricao As 'Descrição tipo Empregado',
                Null As 'Nome do Departamento'
From TipoEmpregados T
LEFT JOIN Empregados E On T.CodigoTipoEmpregado = E.CodigoTipoEmpregado
Where E.CodigoTipoEmpregado Is Null
Order By T.Descricao;
go

-- Selecionando a média dos salários por tipo de empregado e por departamento --

Select T.Descricao As 'Tipo de Empregado',
		D.NomeDepartamentos As 'Departamento',
		AVG(E.SalarioEmpregado) As 'Media Salarial'
From Empregados E
Inner Join TipoEmpregados T On E.CodigoTipoEmpregado = T.CodigoTipoEmpregado
inner Join Departamentos D On E.CodigoTipoDepartamentos = D.CodigoDepartamentos
Group By T.Descricao, D.NomeDepartamentos
Go

-- Selecionando o total de funcionários por departamento e por tipo de empregado --

Select D.NomeDepartamentos as 'Departamento',
		T.Descricao as 'Tipo de Empregado',
		COUNT(*) as 'Total de funcionarios'
From Empregados E
Inner Join TipoEmpregados T On E.CodigoTipoEmpregado = T.CodigoTipoEmpregado
Inner Join Departamentos D On E.CodigoTipoDepartamentos = D.CodigoDepartamentos
Group By D.NomeDepartamentos, T.Descricao
Go

-- Selecionando o total de funcionários por departamento, salário e tipo de empregado por funcionários com salário maior ou igual a 1000 --
Select D.NomeDepartamentos As 'Departamento',
		T.Descricao As 'Tipo de Empregado',
		E.SalarioEmpregado As 'Salario',
		COUNT(*) As 'Total de funcionarios'
From Empregados E
Inner join TipoEmpregados T On E.CodigoTipoEmpregado = T.CodigoTipoEmpregado
Inner join Departamentos D On E.CodigoTipoDepartamentos = D.CodigoDepartamentos
Where E.SalarioEmpregado >= 1000.00
Group By D.NomeDepartamentos, T.Descricao, E.SalarioEmpregado 
Go

-- Selecionando o total de funcionários por departamento com a média do salário do departamento se o total de funcionários for maior que 1 --
Select D.NomeDepartamentos As 'Departamento',
		COUNT(*) as 'Total de funcionarios',
		AVG(E.SalarioEmpregado) As 'Media Salarial do departamento'
From Empregados E
Inner Join Departamentos D On E.CodigoTipoDepartamentos = D.CodigoDepartamentos
Group By D.NomeDepartamentos
Having COUNT(*) > 1
Go

-- Selecionando o total de funcionários por departamento e por tipo de empregado no departamento se o total de funcionários for maior que 1 --

Select D.NomeDepartamentos As 'Departamento',
		T.Descricao As 'Tipo de Empregado',
		COUNT(*) As 'Total de funcionarios'
From Empregados E
Inner Join Departamentos D On E.CodigoTipoDepartamentos = D.CodigoDepartamentos
Inner Join TipoEmpregados T On E.CodigoTipoEmpregado = T.CodigoTipoEmpregado
Group By D.NomeDepartamentos, T.Descricao
Having Count(*) > 1
Go