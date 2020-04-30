USE DevDB1;

CREATE SCHEMA cursos
GO


CREATE TABLE cursos.Maquinas( 
 id int identity(1,1) constraint pk_maquinas primary key, 
 etiqueta nvarchar(50) not null, 
 procesador nvarchar(50) not null, 
 memoria smallint not null, 
 disco smallint not null, 
 pantalla tinyint not null, 
 constraint ck_memoria check (memoria>0), 
 constraint ck_disco check (disco>0), 
 constraint ck_pantalla check (pantalla>0) 
); 
GO 
CREATE TABLE cursos.Cursos( 
 id int identity(1,1) constraint pk_cursos primary key, 
 codigo nvarchar(10), 
 titulo nvarchar(50), 
 duracion tinyint, 
 programa xml 
); 
GO 
CREATE TABLE cursos.CursosMaquinas( 
 id int identity(1,1) constraint pk_cursosMaquinas primary key, 
 curso int constraint fk_cursosMaquinas_curso references Cursos(id), 
 maquina int constraint fk_cursosMaquinas_maquina references 
Maquinas(id) 
)  
GO  
CREATE TABLE cursos.Salas( 
 id int identity(1,1) constraint pk_salas primary key, 
 etiqueta nvarchar(20), 
 numeroSitios smallint constraint ck_salas_numeroSitios check  
(numeroSitios>0), 
  maquina int constraint fk_salas_maquinas references Maquinas(id) 
); 
GO 
CREATE TABLE cursos.Formaciones( 
 id int identity(1,1) constraint 
 pk_formaciones primary key, 
 cursos int constraint fk_formaciones_cursos references Cursos(id), 
 sala int constraint fk_formaciones_salas references Salas(id), 
 fechaInicio date, 
 fechaFin date 
);


















SELECT * FROM sys.tables


Select * from sales.staffs
WHERE active = 1
GO

Update sales.staffs
SET active = 0
WHERE staff_id IN (3, 6, 9)





DECLARE @Active tinyint
SET @Active = 1
SELECT * 
FROM dbo.fEmpleadosActivos(@Active);



CREATE FUNCTION fEmpleadosActivos 
(	
	-- Add the parameters for the function here
	@Active as tinyint
	 
)
RETURNS TABLE 
AS
RETURN 
(

	Select * from sales.staffs
    WHERE active = @Active
)




SELECT * FROM production.products

SELECT Count(product_id)
FROM production.products
WHERE model_year = 2017

SELECT dbo.fContarProductos_Year(2017)
SELECT dbo.fContarProductos_Year(2018)

CREATE FUNCTION fContarProductos_Year
(
	@model_year smallint
)
RETURNS smallint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	
	SELECT @Result = Count(product_id)
    FROM production.products
    WHERE model_year = @model_year

	
	RETURN @Result

END


SELECT order_id, FORMAT (order_date, 'MMMM-dd-yyyy') AS Order_Date_USA 
FROM sales.orders



DECLARE @Active tinyint
SET @Active = 0

Select * from sales.staffs AS E
	INNER JOIN sales.stores AS S ON E.store_id = S.store_id
    WHERE E.active = @Active
	FOR JSON AUTO

	SELECT * FROM sales.stores

	--