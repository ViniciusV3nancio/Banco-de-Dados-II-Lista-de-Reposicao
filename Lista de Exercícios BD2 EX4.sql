Create Database FATECBD2ViniciusVenancioEx5
Go

Use FATECBD2ViniciusVenancioEx5
Go


Declare @QuantidadeTotal Int = 101
Declare @Contador Int = 1
Declare @NumeroPseudoAleatorio Int
Declare @JaExiste Int


Create Table #NumerosGerados (
    Id int Identity(1,1),
    NumeroGerado int) 
	


while @Contador <= @QuantidadeTotal
Begin

    Set @NumeroPseudoAleatorio = CONVERT(int, RAND()*1000)
    Set @JaExiste = Null


    Select @JaExiste = NumeroGerado 
    From #NumerosGerados 
    Where NumeroGerado = @NumeroPseudoAleatorio

    If @JaExiste Is Null
    Begin
        Insert Into #NumerosGerados (NumeroGerado)
        Values (@NumeroPseudoAleatorio)
        Set @Contador = @Contador + 1 
    End
End


Select NumeroGerado 
From #NumerosGerados 
Order By NumeroGerado Asc 

Select NumeroGerado 
From #NumerosGerados 
Order By NumeroGerado Desc

Drop Table #NumerosGerados
Go

-- Professor o Caio que me ajudou a fazer isso aqui, não entendi nada, abraço. --
