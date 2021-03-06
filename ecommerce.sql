USE [master]
GO
/****** Object:  Database [ecommerce]    Script Date: 05/05/2019 10:28:09 ******/
CREATE DATABASE [ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSEVER\MSSQL\DATA\ecommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ecommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSEVER\MSSQL\DATA\ecommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ecommerce] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ecommerce] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ecommerce', N'ON'
GO
ALTER DATABASE [ecommerce] SET QUERY_STORE = OFF
GO
USE [ecommerce]
GO
/****** Object:  Table [dbo].[tb_admin_user]    Script Date: 05/05/2019 10:28:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_admin_user](
	[id_admin] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[apelido] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[palavra_passe] [varchar](50) NOT NULL,
	[nif] [varchar](9) NOT NULL,
	[telemovel] [varchar](25) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_admin-user] PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_categoria]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[tipo_categoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_categoria] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_cliente]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nome_cliente] [varchar](50) NOT NULL,
	[apelido_cliente] [varchar](50) NOT NULL,
	[nif_cliente] [varchar](9) NOT NULL,
	[morada_cliente] [varchar](50) NULL,
	[email_cliente] [varchar](50) NOT NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_tb_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fornecedor]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fornecedor](
	[id_fornecedor] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Morada] [varchar](50) NULL,
	[País] [varchar](50) NOT NULL,
	[Cidade] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](50) NOT NULL,
	[Nif] [varchar](9) NULL,
 CONSTRAINT [PK_tb_supplier] PRIMARY KEY CLUSTERED 
(
	[id_fornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_item_vendas]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_item_vendas](
	[id_item] [int] IDENTITY(1,1) NOT NULL,
	[valor] [decimal](15, 2) NOT NULL,
	[id_venda] [int] NOT NULL,
	[id_produto] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
 CONSTRAINT [PK_tb_vendas] PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_produto]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_produto](
	[id_produto] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[preco] [money] NOT NULL,
	[descricao] [varchar](250) NOT NULL,
	[REF] [int] NULL,
	[id_categoria] [int] NULL,
	[imagem] [varchar](max) NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK_tb_produto] PRIMARY KEY CLUSTERED 
(
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_user]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_user](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[apelido] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[nif] [varchar](9) NOT NULL,
	[palavra_passe] [varchar](50) NOT NULL,
	[morada] [varchar](50) NOT NULL,
	[telemovel] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_venda]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_venda](
	[id_venda] [int] IDENTITY(1,1) NOT NULL,
	[valor] [decimal](15, 2) NULL,
	[desconto] [decimal](15, 2) NULL,
	[valor_pago] [decimal](15, 2) NULL,
	[id_user] [int] NULL,
 CONSTRAINT [PK_tb_venda] PRIMARY KEY CLUSTERED 
(
	[id_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_admin_user] ON 

INSERT [dbo].[tb_admin_user] ([id_admin], [nome], [apelido], [email], [palavra_passe], [nif], [telemovel], [estado]) VALUES (1, N'leonardo', N'ferreira', N'leonardoguimaraes28@gmail.com', N'oi', N'123456789', N'961058348', 1)
INSERT [dbo].[tb_admin_user] ([id_admin], [nome], [apelido], [email], [palavra_passe], [nif], [telemovel], [estado]) VALUES (2, N'admin', N'teste', N'oi@oi.com', N'oi', N'123456790', N'961058348', 1)
SET IDENTITY_INSERT [dbo].[tb_admin_user] OFF
SET IDENTITY_INSERT [dbo].[tb_categoria] ON 

INSERT [dbo].[tb_categoria] ([id_categoria], [tipo_categoria]) VALUES (11, N'Filmes')
INSERT [dbo].[tb_categoria] ([id_categoria], [tipo_categoria]) VALUES (12, N'Filmes')
INSERT [dbo].[tb_categoria] ([id_categoria], [tipo_categoria]) VALUES (16, N'teste')
SET IDENTITY_INSERT [dbo].[tb_categoria] OFF
SET IDENTITY_INSERT [dbo].[tb_cliente] ON 

INSERT [dbo].[tb_cliente] ([id_cliente], [nome_cliente], [apelido_cliente], [nif_cliente], [morada_cliente], [email_cliente], [id_user]) VALUES (1, N'leonardo', N'ferreira', N'123456789', N'rua das laranjeiras', N'leonardo@gmail.com', 2)
INSERT [dbo].[tb_cliente] ([id_cliente], [nome_cliente], [apelido_cliente], [nif_cliente], [morada_cliente], [email_cliente], [id_user]) VALUES (2, N'oi', N'oi', N'oi', N'oi', N'oi', 1)
SET IDENTITY_INSERT [dbo].[tb_cliente] OFF
SET IDENTITY_INSERT [dbo].[tb_produto] ON 

INSERT [dbo].[tb_produto] ([id_produto], [nome], [preco], [descricao], [REF], [id_categoria], [imagem], [stock]) VALUES (29, N'oi', 22.0000, N'oi', 123, 11, N'oi', 1)
INSERT [dbo].[tb_produto] ([id_produto], [nome], [preco], [descricao], [REF], [id_categoria], [imagem], [stock]) VALUES (30, N'Coleção Cd - Salvador Sobral', 12.9900, N'Cd Salvador Sobral', 12345, 11, N'cd_salvador.jpg', 11)
INSERT [dbo].[tb_produto] ([id_produto], [nome], [preco], [descricao], [REF], [id_categoria], [imagem], [stock]) VALUES (31, N'Imagine - Box John Lennon', 74.9900, N'Imagine - Box - 4CD + 2Blu-ray ', 54789, 11, N'john_lennon.jpg', 10)
INSERT [dbo].[tb_produto] ([id_produto], [nome], [preco], [descricao], [REF], [id_categoria], [imagem], [stock]) VALUES (32, N'Greatest Hits II Queen ', 33.9000, N'Greatest Hits II (2LP)', 8900, 11, N'Greatest-Hits-II-2LP.jpg', 11)
INSERT [dbo].[tb_produto] ([id_produto], [nome], [preco], [descricao], [REF], [id_categoria], [imagem], [stock]) VALUES (33, N'Master Of Puppets', 17.9000, N'Master Of Puppets Mettalica', 8900, 11, N'Master-Of-Puppets.jpg', 20)
INSERT [dbo].[tb_produto] ([id_produto], [nome], [preco], [descricao], [REF], [id_categoria], [imagem], [stock]) VALUES (34, N'Eu Tiro e Onda', 11.8000, N'Eu Tiro e Onda Marcelo D2', 89300, 11, N'Eu-Tiro-e-Onda.jpg', 20)
INSERT [dbo].[tb_produto] ([id_produto], [nome], [preco], [descricao], [REF], [id_categoria], [imagem], [stock]) VALUES (35, N'Os Vingadores', 17.9000, N'Os Vingadores Zona 2 - DVD', 578789, 12, N'Os-Vingadores.jpg', 20)
INSERT [dbo].[tb_produto] ([id_produto], [nome], [preco], [descricao], [REF], [id_categoria], [imagem], [stock]) VALUES (36, N'Vingadores: Guerra do Infinito ', 10.0000, N'Vingadores: Guerra do Infinito - DVD', 238900, 12, N'VingadoresGuerradoInfinito.jpg', 20)
INSERT [dbo].[tb_produto] ([id_produto], [nome], [preco], [descricao], [REF], [id_categoria], [imagem], [stock]) VALUES (37, N'teste', 22.0000, N'teste', 222, NULL, NULL, 222)
SET IDENTITY_INSERT [dbo].[tb_produto] OFF
SET IDENTITY_INSERT [dbo].[tb_user] ON 

INSERT [dbo].[tb_user] ([id_user], [nome], [apelido], [email], [nif], [palavra_passe], [morada], [telemovel], [estado]) VALUES (1, N'leonardo', N'ferreira', N'leonardo@gmail.com', N'123', N'oi', N'oi', N'2333', 1)
INSERT [dbo].[tb_user] ([id_user], [nome], [apelido], [email], [nif], [palavra_passe], [morada], [telemovel], [estado]) VALUES (2, N'leonardo', N'ferreira', N'leonguimaraes28@gmail.com', N'123456000', N'AKKKKKKhrbWWzvebq1Ljj0VTrA==', N'rua da beira , 33', N'962012346', 1)
INSERT [dbo].[tb_user] ([id_user], [nome], [apelido], [email], [nif], [palavra_passe], [morada], [telemovel], [estado]) VALUES (3, N'leonardo', N'teste', N'leonardoguimaraes28@gmail.com', N'5555', N'AKKKKKKhrbWWzvebq1Ljj0VTrA==', N'rua do oi,32', N'9898989898', 1)
INSERT [dbo].[tb_user] ([id_user], [nome], [apelido], [email], [nif], [palavra_passe], [morada], [telemovel], [estado]) VALUES (4, N'leonardo', N'ferreira teste 2', N'leandr19@live.com', N'123456789', N'AKKKKKKhrbWWzvebq1Ljj0VTrA==', N'rua da beira , 33', N'36646465', 0)
SET IDENTITY_INSERT [dbo].[tb_user] OFF
ALTER TABLE [dbo].[tb_cliente]  WITH CHECK ADD  CONSTRAINT [FK_tb_cliente_tb_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[tb_user] ([id_user])
GO
ALTER TABLE [dbo].[tb_cliente] CHECK CONSTRAINT [FK_tb_cliente_tb_user]
GO
ALTER TABLE [dbo].[tb_item_vendas]  WITH CHECK ADD  CONSTRAINT [FK_tb_item_vendas_tb_produto] FOREIGN KEY([id_produto])
REFERENCES [dbo].[tb_produto] ([id_produto])
GO
ALTER TABLE [dbo].[tb_item_vendas] CHECK CONSTRAINT [FK_tb_item_vendas_tb_produto]
GO
ALTER TABLE [dbo].[tb_item_vendas]  WITH CHECK ADD  CONSTRAINT [FK_tb_item_vendas_tb_produto1] FOREIGN KEY([id_produto])
REFERENCES [dbo].[tb_produto] ([id_produto])
GO
ALTER TABLE [dbo].[tb_item_vendas] CHECK CONSTRAINT [FK_tb_item_vendas_tb_produto1]
GO
ALTER TABLE [dbo].[tb_item_vendas]  WITH CHECK ADD  CONSTRAINT [FK_tb_item_vendas_tb_venda] FOREIGN KEY([id_venda])
REFERENCES [dbo].[tb_venda] ([id_venda])
GO
ALTER TABLE [dbo].[tb_item_vendas] CHECK CONSTRAINT [FK_tb_item_vendas_tb_venda]
GO
ALTER TABLE [dbo].[tb_produto]  WITH CHECK ADD  CONSTRAINT [FK_tb_produto_tb_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[tb_categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[tb_produto] CHECK CONSTRAINT [FK_tb_produto_tb_categoria]
GO
ALTER TABLE [dbo].[tb_venda]  WITH CHECK ADD  CONSTRAINT [FK_tb_venda_tb_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[tb_user] ([id_user])
GO
ALTER TABLE [dbo].[tb_venda] CHECK CONSTRAINT [FK_tb_venda_tb_user]
GO
/****** Object:  StoredProcedure [dbo].[admin_insere]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [dbo].[admin_insere]

		(	@nome varchar(50),
			@preco money,
			@descricao varchar(250),
			@tipo_categoria varchar(50),
			@stock int,
			@ref int,
			@imagem varchar(max)
		--	@retorno int output
			--estado=1 conta ativa
		)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	--select * from tb_produto where ref=@ref
		--	if not exists (select * from tb_produto where ref=@ref)
  
	
	begin
			

			declare @status as bit
			set @status=1
			
			insert into tb_produto(nome,preco,descricao, tipo_categoria, stock, ref, imagem, status) values (@nome,@preco,@descricao, @tipo_categoria, @stock,@ref, @imagem, @status)
			--set @retorno=0--dados corretos

	end

	--else if exists (select * from tb_produto where ref=@ref)

	--begin

		--	set @retorno=2

		--	end

	

	

		
			

END
GO
/****** Object:  StoredProcedure [dbo].[admin_insere_categoria]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[admin_insere_categoria]

		(	@nome varchar(50),
			@imagem varchar(max)
		
		)

AS
BEGIN
	
	SET NOCOUNT ON;



  
	
	begin
			

		
			
			insert into tb_subcategoria(sub_categoria,imagem, id_categoria) values (@nome, @imagem, 1)
			

	end

	

	

	

		
			

END
GO
/****** Object:  StoredProcedure [dbo].[admin_login]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create procedure [dbo].[admin_login]

		(
			@email varchar(50),
			@palavra_passe varchar(50),
			@retorno int output
			
		)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select * from tb_admin_user where email=@email and palavra_passe=@palavra_passe and estado=1

  if exists (select * from tb_admin_user where email=@email and palavra_passe=@palavra_passe and estado=1)

	begin
		
			set @retorno=0--dados corretos

	end

	else if exists (select * from tb_admin_user where email=@email and palavra_passe=@palavra_passe and estado!=1)

				begin
					set @retorno=1 --conta inativa
				end

	
					else if exists(select * from tb_admin_user where email=@email and palavra_passe!=@palavra_passe and estado=1)

					begin
					set @retorno=2--palavra-passe errada
					end

			else if not exists (select * from tb_admin_user where email=@email )
				begin
					set @retorno=3--utilizador não existe
					end

			

END
GO
/****** Object:  StoredProcedure [dbo].[criar_conta]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [dbo].[criar_conta]

		(	@nome varchar(50),
			@apelido varchar(50),
			@email varchar(50),
			@palavra_passe varchar(50),
			@morada varchar(50),
			@telemovel varchar(50),
			@nif varchar(9),
			@retorno int output
			--estado=1 conta ativa
		)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select * from tb_user where email=@email or @nif=nif and estado=1

  if not exists (select * from tb_user where email=@email or @nif=nif and estado=1)
	
	begin
			declare @estado as bit
			set @estado=0
			
			insert into tb_user(nome,apelido, email, palavra_passe,morada,telemovel, nif, estado) values (@nome, @apelido, @email,@palavra_passe,@morada,@telemovel, @nif, @estado)
			set @retorno=0--dados corretos

	end

	else if exists (select * from tb_user where email=@email and estado!=1)

				begin
					set @retorno=1 --email ja cadastrado
				end

	
					else if exists(select * from tb_user where nif=@nif and estado=1)

					begin
					set @retorno=2--nif ja cadastrado no sistema
					end

		
			

END
GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [dbo].[login]

		(
			@email varchar(50),
			@palavra_passe varchar(50),
			@retorno int output
			--estado=1 conta ativa
		)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select * from tb_user where email=@email and palavra_passe=@palavra_passe and estado=1

  if exists (select * from tb_user where email=@email and palavra_passe=@palavra_passe and estado=1)

	begin
		
			set @retorno=0--dados corretos

	end

	else if exists (select * from tb_user where email=@email and palavra_passe=@palavra_passe and estado!=1)

				begin
					set @retorno=1 --conta inativa
				end

	
					else if exists(select * from tb_user where email=@email and palavra_passe!=@palavra_passe and estado=1)

					begin
					set @retorno=2--palavra-passe errada
					end

			else if not exists (select * from tb_user where email=@email )
				begin
					set @retorno=3--utilizador não existe
					end

			

END
GO
/****** Object:  StoredProcedure [dbo].[max_id]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create procedure [dbo].[max_id]

		(		@retorno int output
			
		)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	--select * from tb_produto where ref=@ref
		--	if not exists (select * from tb_produto where ref=@ref)
  
	
	begin
			

			set @retorno =(select max(id_produto) from tb_produto)
	
	end

	--else if exists (select * from tb_produto where ref=@ref)

	--begin

		--	set @retorno=2

		--	end

	

	

		
			

END
GO
/****** Object:  StoredProcedure [dbo].[recuperar_pass_email]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [dbo].[recuperar_pass_email]

		(	
			@email varchar(50),
			@retorno varchar(50) output--retorna a palavra-passe
			--estado=1 conta ativa
		)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select * from tb_user where email=@email and estado=1

  if exists (select * from tb_user where email=@email and estado=1)
	
	begin
			
			set @retorno=(select palavra_passe from tb_user where email=@email and estado=1 )

	end

	else if exists (select * from tb_user where email=@email and estado!=1)

				begin
					set @retorno='1' --conta inativa
				end

	
					else if  not exists(select * from tb_user where email=@email)

					begin
					set @retorno='2'--email nao cadastrado no sistema
					end

		
			

END
GO
/****** Object:  StoredProcedure [dbo].[recuperar_password]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create procedure [dbo].[recuperar_password]

		(	
			@email varchar(50),
			@retorno int output
			--estado=1 conta ativa
		)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select * from tb_user where email=@email and estado=1

  if exists (select * from tb_user where email=@email and estado=1)
	
	begin
			select nome, apelido, email from tb_user where email=@email and estado=1
			set @retorno=0--dados corretos

	end

	else if exists (select * from tb_user where email=@email and estado!=1)

				begin
					set @retorno=1 --conta inativa
				end

	
					else if  not exists(select * from tb_user where email=@email)

					begin
					set @retorno=2--email nao cadastrado no sistema
					end

		
			

END
GO
/****** Object:  StoredProcedure [dbo].[validar_conta]    Script Date: 05/05/2019 10:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [dbo].[validar_conta]

		(	
			@token varchar(50),
			@retorno int output--retorna a palavra-passe
			--estado=1 conta ativa
		)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select * from tb_user where  palavra_passe=@token and estado!=1

  if exists (select * from tb_user where  palavra_passe=@token and estado!=1)
	
	begin
			update tb_user set estado=1
			where palavra_passe=@token and estado!=1
			set @retorno=0--conta avitada

	end

	else 
				begin
					set @retorno=1 --erro na validação
				end

	
							

END
GO
USE [master]
GO
ALTER DATABASE [ecommerce] SET  READ_WRITE 
GO
