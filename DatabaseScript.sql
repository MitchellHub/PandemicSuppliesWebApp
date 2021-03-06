USE [master]
GO
/****** Object:  Database [INFT3050]    Script Date: 21/10/2020 10:47:46 AM ******/
CREATE DATABASE [INFT3050]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'INFT3050', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.FROGSQL17\MSSQL\DATA\INFT3050.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'INFT3050_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.FROGSQL17\MSSQL\DATA\INFT3050_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [INFT3050] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [INFT3050].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [INFT3050] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [INFT3050] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [INFT3050] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [INFT3050] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [INFT3050] SET ARITHABORT OFF 
GO
ALTER DATABASE [INFT3050] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [INFT3050] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [INFT3050] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [INFT3050] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [INFT3050] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [INFT3050] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [INFT3050] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [INFT3050] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [INFT3050] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [INFT3050] SET  DISABLE_BROKER 
GO
ALTER DATABASE [INFT3050] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [INFT3050] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [INFT3050] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [INFT3050] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [INFT3050] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [INFT3050] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [INFT3050] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [INFT3050] SET RECOVERY FULL 
GO
ALTER DATABASE [INFT3050] SET  MULTI_USER 
GO
ALTER DATABASE [INFT3050] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [INFT3050] SET DB_CHAINING OFF 
GO
ALTER DATABASE [INFT3050] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [INFT3050] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [INFT3050] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'INFT3050', N'ON'
GO
ALTER DATABASE [INFT3050] SET QUERY_STORE = OFF
GO
USE [INFT3050]
GO
/****** Object:  User [INFT3050]    Script Date: 21/10/2020 10:47:46 AM ******/
CREATE USER [INFT3050] FOR LOGIN [INFT3050] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [INFT3050]
GO
/****** Object:  Table [dbo].[BillingAddresses]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingAddresses](
	[BillingAddressID] [int] IDENTITY(1000,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[UnitNo] [varchar](10) NULL,
	[StreetNo] [varchar](10) NOT NULL,
	[Street] [varchar](250) NOT NULL,
	[Suburb] [varchar](250) NOT NULL,
	[PostCode] [varchar](4) NOT NULL,
	[State] [varchar](3) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__BillingA__90BDB2D1433FB4E0] PRIMARY KEY CLUSTERED 
(
	[BillingAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartID] [int] IDENTITY(1000,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CartSold] [bit] NOT NULL,
 CONSTRAINT [PK__Carts__51BCD7974D10C256] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts_Products]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts_Products](
	[Carts_ProductsID] [int] IDENTITY(1000,1) NOT NULL,
	[CartID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductQuantity] [int] NOT NULL,
 CONSTRAINT [PK__Carts_Pr__E239E9CFE0865EBA] PRIMARY KEY CLUSTERED 
(
	[Carts_ProductsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1000,1) NOT NULL,
	[BillingAddressID] [int] NOT NULL,
	[MailingAddressID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[InvoiceTotal] [decimal](18, 2) NOT NULL,
	[PostageCost] [decimal](18, 2) NULL,
 CONSTRAINT [PK__Invoices__D796AAD5BE68550C] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices_Products]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices_Products](
	[Invoices_ProductsID] [int] IDENTITY(1000,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductQuantity] [int] NOT NULL,
	[ProductSellPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK__Invoices__C5A88ADFA161B321] PRIMARY KEY CLUSTERED 
(
	[Invoices_ProductsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailingAddresses]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailingAddresses](
	[MailingAddressID] [int] IDENTITY(1000,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[UnitNo] [varchar](10) NULL,
	[StreetNo] [varchar](10) NOT NULL,
	[Street] [varchar](250) NOT NULL,
	[Suburb] [varchar](250) NOT NULL,
	[PostCode] [varchar](4) NOT NULL,
	[State] [varchar](3) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__MailingA__90BDB2D1205916CE] PRIMARY KEY CLUSTERED 
(
	[MailingAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](250) NOT NULL,
	[ProductDesc] [varchar](max) NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[StockLevel] [int] NOT NULL,
	[ProductImage] [image] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__Products__B40CC6ED2C634D77] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(6969,1) NOT NULL,
	[Email] [varchar](254) NOT NULL,
	[Password] [varchar](50) NULL,
	[CreateDate] [date] NOT NULL,
	[IsSuperAdmin] [bit] NULL,
	[IsAdmin] [bit] NULL,
	[IsActive] [bit] NULL,
	[FirstName] [varchar](250) NULL,
 CONSTRAINT [PK__Users__1788CCAC0156691D] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invoices] ADD  CONSTRAINT [DF_Invoices_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users]
GO
ALTER TABLE [dbo].[Carts_Products]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Carts_Products] CHECK CONSTRAINT [FK_Carts_Products_Products]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_BillingAddresses] FOREIGN KEY([BillingAddressID])
REFERENCES [dbo].[BillingAddresses] ([BillingAddressID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_BillingAddresses]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_MailingAddresses] FOREIGN KEY([MailingAddressID])
REFERENCES [dbo].[MailingAddresses] ([MailingAddressID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_MailingAddresses]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Users]
GO
ALTER TABLE [dbo].[Invoices_Products]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Products_Invoices_Products1] FOREIGN KEY([Invoices_ProductsID])
REFERENCES [dbo].[Invoices_Products] ([Invoices_ProductsID])
GO
ALTER TABLE [dbo].[Invoices_Products] CHECK CONSTRAINT [FK_Invoices_Products_Invoices_Products1]
GO
ALTER TABLE [dbo].[Invoices_Products]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Products_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Invoices_Products] CHECK CONSTRAINT [FK_Invoices_Products_Products]
GO
/****** Object:  StoredProcedure [dbo].[BillingAddress_UspUpdateIsDefault]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 21.06.20
-- Description:	Updates IsDefault of a billing address to true
-- =============================================
CREATE PROCEDURE [dbo].[BillingAddress_UspUpdateIsDefault] 
	-- Add the parameters for the stored procedure here
	@BillingAddressID int
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE BillingAddresses
	SET IsDefault = 1
	WHERE BillingAddressID = @BillingAddressID
END
GO
/****** Object:  StoredProcedure [dbo].[BillingAddresses_UspInsertBillingAddress]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 21.06.20
-- Description:	Creates a billingaddress and associates to a userID
-- =============================================
CREATE PROCEDURE [dbo].[BillingAddresses_UspInsertBillingAddress] 
	-- Add the parameters for the stored procedure here
	@UserID int,
	@IsDefault bit,
	@Name varchar(250),
	@UnitNo varchar(10),
	@StreetNo varchar(10),
	@Street varchar(250),
	@Suburb varchar(250),
	@PostCode varchar(4),
	@State varchar(3),
	@Phone varchar(10) NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF(@UnitNo = 0)
		BEGIN
			SET @UnitNo = null
		END

	INSERT INTO BillingAddresses 
	(UserID, Name, UnitNo, StreetNo, Street, Suburb, PostCode, State, Phone, IsDefault, IsActive)
	VALUES 
	(@UserID, @Name, @UnitNo, @StreetNo, @Street, @Suburb, @PostCode, @State, @Phone, @IsDefault, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[BillingAddresses_UspSelectBillingAddresses]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 21.06.20
-- Description:	selects all billing addresses by UserID
-- =============================================
CREATE PROCEDURE [dbo].[BillingAddresses_UspSelectBillingAddresses] 
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * 
	FROM BillingAddresses
	WHERE UserID = @UserID AND IsActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[BillingAddresses_UspUpdateBillingAddressDefaults]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 21.06.20
-- Description:	Sets all addresses IsDefault = false where UserID = UserID
-- =============================================
CREATE PROCEDURE [dbo].[BillingAddresses_UspUpdateBillingAddressDefaults] 
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE BillingAddresses
	SET IsDefault = 0
	WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[BillingAddresses_UspUpdateIsActive]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 21.06.20
-- Description:	updates IsActive by BillingAddress
-- =============================================
CREATE PROCEDURE [dbo].[BillingAddresses_UspUpdateIsActive] 
	-- Add the parameters for the stored procedure here
	@BillingAddressID int,
	@IsActive bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE BillingAddresses
	SET IsActive = @IsActive
	WHERE BillingAddressID = @BillingAddressID
END
GO
/****** Object:  StoredProcedure [dbo].[Carts_Products_UspInsertProduct]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 19.06.20
-- Description:	Inserts product with quantity with cartID into cart_products
-- First checks if exists, Updates if true. If quantity given is 0, will set total quantity to 0
-- This should only be used when inserting products to carts that haven't been sold
-- =============================================
CREATE PROCEDURE [dbo].[Carts_Products_UspInsertProduct] 
	-- Add the parameters for the stored procedure here
	@CartID int,
	@ProductID int,
	@ProductQuantity int
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT * FROM Carts_Products WHERE CartID = @CartID AND ProductID = @ProductID)
		BEGIN
			IF (@ProductQuantity = 0)
				BEGIN
					UPDATE Carts_Products SET ProductQuantity = 0
					WHERE CartID = @CartID AND ProductID = @ProductID
				END
			ELSE
				BEGIN
					UPDATE Carts_Products SET ProductQuantity += @ProductQuantity
					WHERE CartID = @CartID AND ProductID = @ProductID
				END
		END
	ELSE
		BEGIN
			INSERT INTO Carts_Products (CartID, ProductID, ProductQuantity)
			VALUES (@CartID, @ProductID, @ProductQuantity) 
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Carts_Products_UspSelectProductQuantity]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 20.06.20
-- Description:	Selects the product quantity from Carts_Products where by CartID and ProductID
-- =============================================
CREATE PROCEDURE [dbo].[Carts_Products_UspSelectProductQuantity] 
	-- Add the parameters for the stored procedure here
	@CartID int,
	@ProductID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT ProductQuantity FROM Carts_Products WHERE CartID = @CartID AND ProductID = @ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[Carts_Products_UspSumCartProductsPrice]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 20.06.20
-- Description:	Sums the price of all products in a cart using inner join
-- =============================================
CREATE PROCEDURE [dbo].[Carts_Products_UspSumCartProductsPrice] 
	-- Add the parameters for the stored procedure here
	@CartID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT SUM(Products.ProductPrice * Carts_Products.ProductQuantity)
	FROM Products
	INNER JOIN Carts_Products ON Products.ProductID = Carts_Products.ProductID 
	WHERE Carts_Products.CartID = @CartID
END
GO
/****** Object:  StoredProcedure [dbo].[Carts_Products_UspSumProductQuantityOfCart]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 19.06.20
-- Description:	returns the total amount of products in a cart
-- =============================================
CREATE PROCEDURE [dbo].[Carts_Products_UspSumProductQuantityOfCart] 
	-- Add the parameters for the stored procedure here
	@CartID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT SUM(ProductQuantity)
	FROM Carts_Products
	WHERE CartID = @CartID
END
GO
/****** Object:  StoredProcedure [dbo].[Carts_UspInsertCart]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 19.06.20
-- Description:	Inserts a cart into cart table with UserID
-- =============================================
CREATE PROCEDURE [dbo].[Carts_UspInsertCart] 
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Carts (UserID, CartSold)
	VALUES(@UserID, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[Carts_UspSelectCartID]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 19.06.20
-- Description:	selects a cartID from carts by UserID
-- =============================================
CREATE PROCEDURE [dbo].[Carts_UspSelectCartID] 
	-- Add the parameters for the stored procedure here
	@UserID int,
	@ReturnValue int OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT @ReturnValue = CartID FROM Carts WHERE UserID = @UserID AND CartSold = 0
END
GO
/****** Object:  StoredProcedure [dbo].[Carts_UspSelectCartReturnBool]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 19.06.20
-- Description:	Selects a cart by UserID, returns true if exists, false if not
-- =============================================
CREATE PROCEDURE [dbo].[Carts_UspSelectCartReturnBool] 
	-- Add the parameters for the stored procedure here
	@UserID int,
	@ReturnValue bit NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT CartID FROM Carts WHERE UserID = @UserID AND CartSold = 0)
		BEGIN
			SET @ReturnValue = 1
		END
	ELSE
		BEGIN
			SET @ReturnValue = 0
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Carts_UspUpdateCartSold]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 28.06.20
-- Description:	sells a cart
-- =============================================
CREATE PROCEDURE [dbo].[Carts_UspUpdateCartSold] 
	-- Add the parameters for the stored procedure here
	@CartID int
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Carts
	SET CartSold = 1
	WHERE CartID = @CartID
END
GO
/****** Object:  StoredProcedure [dbo].[Invoices_Products_UspInsertInvoicesProducts]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 16.06.20
-- Description:	Inserts an Invoicce_Product relationship
-- =============================================
CREATE PROCEDURE [dbo].[Invoices_Products_UspInsertInvoicesProducts]
	-- Add the parameters for the stored procedure here
	@InvoiceID int, 
	@ProductID int,
	@ProductQuantity int,
	@ProductSellPrice decimal
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Invoices_Products (InvoiceID, ProductID, ProductQuantity, ProductSellPrice)
	VALUES (@InvoiceID, @ProductID, @ProductQuantity, @ProductSellPrice)
END
GO
/****** Object:  StoredProcedure [dbo].[Invoices_Products_UspReturnInvoicesProductsByInvoiceID]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 16.06.20
-- Description:	Selects Invoices_Products by InvoiceID
-- =============================================
CREATE PROCEDURE [dbo].[Invoices_Products_UspReturnInvoicesProductsByInvoiceID]
	-- Add the parameters for the stored procedure here
	@InvoiceID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Invoices_Products WHERE InvoiceID = @InvoiceID
END
GO
/****** Object:  StoredProcedure [dbo].[Invoices_UspInsertInvoiceReturnID]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 28.06.20
-- Description:	inserts an invoice, returns the ID
-- =============================================
CREATE PROCEDURE [dbo].[Invoices_UspInsertInvoiceReturnID] 
	@UserID int,
	@BillingAddressID int,
	@MailingAddressID int,
	@InvoiceTotal decimal,
	@PostageCost decimal,
	@ReturnValue int OUTPUT
	
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Invoices (UserID, BillingAddressID, MailingAddressID, InvoiceTotal, PostageCost)
	VALUES (@UserID, @BillingAddressID, @MailingAddressID, @InvoiceTotal, @PostageCost)
	SET @ReturnValue = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[Invoices_UspSelectInvoice]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 28.06.20
-- Description:	selects an invoice
-- =============================================
CREATE PROCEDURE [dbo].[Invoices_UspSelectInvoice] 
	-- Add the parameters for the stored procedure here
	@InvoiceID int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT * 
	FROM Invoices
	WHERE InvoiceID = @InvoiceID

END
GO
/****** Object:  StoredProcedure [dbo].[Invoices_UspSelectInvoices]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 28.06.20
-- Description:	selects invoices by userID
-- =============================================
CREATE PROCEDURE [dbo].[Invoices_UspSelectInvoices] 
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * 
	FROM Invoices
	WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[MailingAddress_UspUpdateIsDefault]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 21.06.20
-- Description:	Updates IsDefault of a Mailing address to true
-- =============================================
CREATE PROCEDURE [dbo].[MailingAddress_UspUpdateIsDefault] 
	-- Add the parameters for the stored procedure here
	@MailingAddressID int
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE MailingAddresses
	SET IsDefault = 1
	WHERE MailingAddressID = @MailingAddressID
END
GO
/****** Object:  StoredProcedure [dbo].[MailingAddresses_UspInsertMailingAddress]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 21.06.20
-- Description:	Inserts a mailing address
-- =============================================
CREATE PROCEDURE [dbo].[MailingAddresses_UspInsertMailingAddress] 
	-- Add the parameters for the stored procedure here
	@UserID int,
	@IsDefault bit,
	@Name varchar(250),
	@UnitNo varchar(10) NULL,
	@StreetNo varchar(10),
	@Street varchar(250),
	@Suburb varchar(250),
	@PostCode varchar(4),
	@State varchar(3),
	@Phone varchar(10) NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF(@UnitNo = 0)
		BEGIN
			SET @UnitNo = null
		END

	INSERT INTO MailingAddresses 
	(UserID, Name, UnitNo, StreetNo, Street, Suburb, PostCode, State, Phone, IsDefault, IsActive)
	VALUES 
	(@UserID, @Name, @UnitNo, @StreetNo, @Street, @Suburb, @PostCode, @State, @Phone, @IsDefault, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[MailingAddresses_UspSelectMailingAddresses]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 21.06.20
-- Description:	Selects mailing addresses by UserID
-- =============================================
CREATE PROCEDURE [dbo].[MailingAddresses_UspSelectMailingAddresses] 
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM MailingAddresses
	WHERE UserID = @UserID AND IsActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[MailingAddresses_UspUpdateIsActive]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 21.06.20
-- Description:	updates IsActive by MailingAddressID
-- =============================================
CREATE PROCEDURE [dbo].[MailingAddresses_UspUpdateIsActive] 
	-- Add the parameters for the stored procedure here
	@MailingAddressID int,
	@IsActive bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE MailingAddresses
	SET IsActive = @IsActive
	WHERE MailingAddressID = @MailingAddressID
END
GO
/****** Object:  StoredProcedure [dbo].[MailingAddresses_UspUpdateMailingAddressDefaults]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 21.06.20
-- Description:	Sets IsDefault to false for all addressess associated with UserID
-- =============================================
CREATE PROCEDURE [dbo].[MailingAddresses_UspUpdateMailingAddressDefaults] 
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE MailingAddresses
	SET IsDefault = 0
	WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[Products_UspInsertProductWithImage]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 18.06.20
-- Description:	Inserts a product into product table with an image
-- =============================================
CREATE PROCEDURE [dbo].[Products_UspInsertProductWithImage] 
	@ProductName varchar(250) NULL, 
	@ProductDesc varchar(MAX) NULL,
	@ProductPrice decimal(10, 2) NULL,
	@StockLevel int NULL,
	@ProductImage image NULL,
	@IsActive bit,
	@ProductID int OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO Products 
	(ProductName, ProductDesc, ProductPrice, StockLevel, ProductImage, IsActive)
	VALUES
	(@ProductName, @ProductDesc, @ProductPrice, @StockLevel, @ProductImage, @IsActive)
	SELECT @ProductID = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[Products_UspReturnActiveAndInStockProducts]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 19.06.20
-- Description:	Returns all active and in stock products from products
-- =============================================
CREATE PROCEDURE [dbo].[Products_UspReturnActiveAndInStockProducts]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Products WHERE IsActive = 1 AND StockLevel > 0
END
GO
/****** Object:  StoredProcedure [dbo].[Products_UspReturnActiveProducts]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 18.06.20
-- Description:	Returns all active products from products
-- =============================================
CREATE PROCEDURE [dbo].[Products_UspReturnActiveProducts]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT * FROM Products WHERE IsActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[Products_UspReturnImageById]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 18.06.20
-- Description:	Retrieves image data from products by productID
-- =============================================
CREATE PROCEDURE [dbo].[Products_UspReturnImageById]
	@ProductID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT ProductImage FROM Products WHERE ProductID = @ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[Products_UspReturnProductByID]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 4.06.20
-- Description:	Returns product by ProductID
-- =============================================
CREATE PROCEDURE [dbo].[Products_UspReturnProductByID] 
	-- Add the parameters for the stored procedure here
	@ProductID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Products WHERE ProductID = @ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[Products_UspReturnProducts]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 4.06.20
-- Description:	Returns all products from products
-- =============================================
CREATE PROCEDURE [dbo].[Products_UspReturnProducts] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Products
END
GO
/****** Object:  StoredProcedure [dbo].[Products_UspSelectBySearchTerm]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Products_UspSelectBySearchTerm] 
	-- Add the parameters for the stored procedure here
	@SearchTerm varchar(250)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM Products
	WHERE ProductName LIKE '%' + @SearchTerm + '%'

END
GO
/****** Object:  StoredProcedure [dbo].[Products_UspSelectProductsFromCart]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 20.06.20
-- Description:	Selects valid carts_products by CartID
-- =============================================
CREATE PROCEDURE [dbo].[Products_UspSelectProductsFromCart]
	-- Add the parameters for the stored procedure here
	@CartID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * 
	FROM Products
	INNER JOIN Carts_Products ON Products.ProductID = Carts_Products.ProductID
	WHERE Carts_Products.CartID = @CartID AND Carts_Products.ProductQuantity > 0
END
GO
/****** Object:  StoredProcedure [dbo].[Products_UspSelectProductsFromInvoice]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 28.06.20
-- Description:	returns products from an invoice
-- =============================================
CREATE PROCEDURE [dbo].[Products_UspSelectProductsFromInvoice] 
	-- Add the parameters for the stored procedure here
	@InvoiceID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM Products
	INNER JOIN Invoices_Products ON Products.ProductID = Invoices_Products.ProductID
	WHERE Invoices_Products.InvoiceID = @InvoiceID
END
GO
/****** Object:  StoredProcedure [dbo].[Products_UspUpdateProductByID]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 4.06.20
-- Description:	Updates a product by product ID
-- =============================================
CREATE PROCEDURE [dbo].[Products_UspUpdateProductByID] 
	-- Add the parameters for the stored procedure here
	@ProductID int,
	@ProductName varchar(250),
	@ProductDesc varchar(MAX),
	@ProductPrice decimal(10,2),
	@StockLevel int,
	@IsActive bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Products
	SET ProductName = @ProductName,
		ProductDesc = @ProductDesc,
		ProductPrice = @ProductPrice,
		StockLevel = @StockLevel,
		IsActive = @IsActive
	WHERE ProductID = @ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[Products_UspUpdateStockByAddition]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 28.06.20
-- Description:	updates stock by adding a value
-- =============================================
CREATE PROCEDURE [dbo].[Products_UspUpdateStockByAddition] 
	-- Add the parameters for the stored procedure here
	@ProductID int,
	@StockLevelAddition int
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Products
	SET StockLevel = StockLevel + @StockLevelAddition
	WHERE ProductID = @ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[Users_UspInsertUser]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 16.06.20
-- Description:	Inserts a User into Users
-- =============================================
CREATE PROCEDURE [dbo].[Users_UspInsertUser] 
	@Email varchar(254),
	@Password varchar(50),
	@IsAdmin bit,
	@IsActive bit,
	@FirstName varchar(250)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO Users (Email, Password, IsAdmin, IsActive, FirstName)
	VALUES (@Email, @Password, @IsAdmin, @IsActive, @FirstName)
END
GO
/****** Object:  StoredProcedure [dbo].[Users_UspInsertUserAfterEmailCheck]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 17.06.20
-- Description:	Inserts a user, returns -1 if Email already exists
-- =============================================
CREATE PROCEDURE [dbo].[Users_UspInsertUserAfterEmailCheck]
	@Email varchar(254),
	@FirstName varchar(250),
	@IsAdmin bit,
	@IsSuperAdmin bit,
	@Password varchar(50),
	@IsActive bit,
	@ReturnValue int OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

    IF NOT EXISTS(SELECT 1 FROM Users WHERE Email = @Email)
		BEGIN
			INSERT INTO Users (Email, Password, IsSuperAdmin, IsAdmin, FirstName, IsActive)
			VALUES (@Email, @Password, @IsSuperAdmin, @IsAdmin, @FirstName, @IsActive)
			SET @ReturnValue = 1
		END
	ELSE
		BEGIN
			SET @ReturnValue = -1
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Users_UspLoginAndReturnUser]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 27.05.20
-- Description:	Queries the User table by Email and Password, returns a user if found or -1, -2 if unsuccessful
-- =============================================
CREATE PROCEDURE [dbo].[Users_UspLoginAndReturnUser] 
	-- Add the parameters for the stored procedure here
	@Email varchar(254) = NULL, 
	@Password varchar(50) = NULL,
	@UserID int NULL OUTPUT,
	@FirstName varchar(250) = NULL OUTPUT,
	@IsActive bit NULL OUTPUT,
	@IsAdmin bit NULL OUTPUT,
	@ReturnValue int OUTPUT
	-- @ReturnValue int NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET @ReturnValue = -2 -- return -2 if stored proc worked, but didn't change the return value

	-- return -1 for email not found
	IF NOT EXISTS(SELECT UserID FROM Users WHERE Email = @Email)
		BEGIN
			SET @ReturnValue = -1
		END

	-- return 0 for email found, password not wrong
	ELSE IF NOT EXISTS(SELECT UserID FROM Users WHERE Email = @Email AND Password = @Password)
		BEGIN
			SET @ReturnValue = 0
		END

	ELSE
		BEGIN
			SELECT @UserID = UserID, @FirstName = FirstName, @IsActive = IsActive, @IsAdmin = IsAdmin FROM  Users WHERE Email = @Email AND Password = @Password
			SET @ReturnValue = 1
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Users_UspReturnNonAdminUsers]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 28.05.20
-- Description:	Returns all non-admin users from Users table
-- =============================================
CREATE PROCEDURE [dbo].[Users_UspReturnNonAdminUsers]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Users WHERE IsAdmin = 0
END
GO
/****** Object:  StoredProcedure [dbo].[Users_UspReturnNonAdminUsersByID]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 3.06.20
-- Description:	Return Non Admin user that matches ID
-- =============================================
CREATE PROCEDURE [dbo].[Users_UspReturnNonAdminUsersByID] 
	-- Add the parameters for the stored procedure here
	@UserID int NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Users WHERE IsAdmin = 0 AND UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[Users_UspReturnUserByID]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 3.06.20
-- Description:	Return Non Admin user that matches ID
-- =============================================
CREATE PROCEDURE [dbo].[Users_UspReturnUserByID] 
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Users WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[Users_UspReturnUsers]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 28.05.20
-- Description:	Returns all non-admin users from Users table
-- =============================================
CREATE PROCEDURE [dbo].[Users_UspReturnUsers]
	@Email varchar(254) = NULL,
	@UserID int NULL,
	@FirstName varchar(250) = NULL,
	@IsActive bit NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF(@Email != NULL)
	BEGIN
		SELECT * FROM Users WHERE @Email = Email
	END

END
GO
/****** Object:  StoredProcedure [dbo].[Users_UspUpdateIsActiveByUserID]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 15.06.20
-- Description:	Sets IsActive of a User by UserID
-- =============================================
CREATE PROCEDURE [dbo].[Users_UspUpdateIsActiveByUserID] 
	-- Add the parameters for the stored procedure here
	@UserID int,
	@IsActive bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE USERS
	SET IsActive = @IsActive
	WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[Users_UspUpdateName]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 27.06.20
-- Description:	Updates a user's name by ID
-- =============================================
CREATE PROCEDURE [dbo].[Users_UspUpdateName] 
	-- Add the parameters for the stored procedure here
	@FirstName varchar(250),
	@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Users
	SET FirstName = @FirstName
	WHERE UserID = @UserID

END
GO
/****** Object:  StoredProcedure [dbo].[Users_UspUpdateUserByID]    Script Date: 21/10/2020 10:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mitchell Hedges
-- Create date: 15.06.20
-- Description:	Edits a user account by UserID
-- =============================================
CREATE PROCEDURE [dbo].[Users_UspUpdateUserByID] 
	@UserID int,
	@Email varchar(254),
	@IsActive bit,
	@FirstName varchar(250)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Users
	SET Email = @Email,
		IsActive = @IsActive,
		FirstName = @FirstName
	WHERE UserID = @UserID
END
GO
USE [master]
GO
ALTER DATABASE [INFT3050] SET  READ_WRITE 
GO
