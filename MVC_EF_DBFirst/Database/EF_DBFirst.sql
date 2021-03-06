USE [master]
GO
/****** Object:  Database [EF_DBFirst]    Script Date: 7/10/2018 1:12:06 PM ******/
CREATE DATABASE [EF_DBFirst]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EF_DBFirst', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EF_DBFirst.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EF_DBFirst_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EF_DBFirst_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EF_DBFirst] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EF_DBFirst].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EF_DBFirst] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EF_DBFirst] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EF_DBFirst] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EF_DBFirst] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EF_DBFirst] SET ARITHABORT OFF 
GO
ALTER DATABASE [EF_DBFirst] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EF_DBFirst] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EF_DBFirst] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EF_DBFirst] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EF_DBFirst] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EF_DBFirst] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EF_DBFirst] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EF_DBFirst] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EF_DBFirst] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EF_DBFirst] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EF_DBFirst] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EF_DBFirst] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EF_DBFirst] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EF_DBFirst] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EF_DBFirst] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EF_DBFirst] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EF_DBFirst] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EF_DBFirst] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EF_DBFirst] SET  MULTI_USER 
GO
ALTER DATABASE [EF_DBFirst] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EF_DBFirst] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EF_DBFirst] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EF_DBFirst] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EF_DBFirst] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EF_DBFirst] SET QUERY_STORE = OFF
GO
USE [EF_DBFirst]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EF_DBFirst]
GO
/****** Object:  Table [dbo].[ContractTPTEmployees]    Script Date: 7/10/2018 1:12:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractTPTEmployees](
	[EmployeeID] [int] NOT NULL,
	[HourlyPay] [int] NULL,
	[HoursWorked] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/10/2018 1:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[ContactNo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/10/2018 1:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/10/2018 1:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[CustomerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermanentTPTEmployees]    Script Date: 7/10/2018 1:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermanentTPTEmployees](
	[EmployeeID] [int] NOT NULL,
	[AnnualSalary] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TPTEmployees]    Script Date: 7/10/2018 1:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TPTEmployees](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ContractTPTEmployees] ([EmployeeID], [HourlyPay], [HoursWorked]) VALUES (2, 50, 160)
INSERT [dbo].[ContractTPTEmployees] ([EmployeeID], [HourlyPay], [HoursWorked]) VALUES (5, 40, 120)
INSERT [dbo].[ContractTPTEmployees] ([EmployeeID], [HourlyPay], [HoursWorked]) VALUES (6, 30, 140)
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [ContactNo]) VALUES (1, N'Shishir', N'9821166272')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [ContactNo]) VALUES (2, N'Gaurav', N'9898785454')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [ContactNo]) VALUES (3, N'Shubham', N'9897854544')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [ContactNo]) VALUES (4, N'Tushar', N'9888785151')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [ContactNo]) VALUES (5, N'Digambar', N'9887878445')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [ContactNo]) VALUES (6, N'Ankit', N'9878745441')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [ContactNo]) VALUES (7, N'Abhinandan', N'9887845454')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [ContactNo]) VALUES (8, N'Suraj', N'9887854541')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [Name], [Gender], [Salary]) VALUES (1, N'Mark', N'Male', 60000)
INSERT [dbo].[Employees] ([ID], [Name], [Gender], [Salary]) VALUES (2, N'Steve', N'Male', 45001)
INSERT [dbo].[Employees] ([ID], [Name], [Gender], [Salary]) VALUES (3, N'Ben', N'Male', 70000)
INSERT [dbo].[Employees] ([ID], [Name], [Gender], [Salary]) VALUES (4, N'Philip', N'Male', 45001)
INSERT [dbo].[Employees] ([ID], [Name], [Gender], [Salary]) VALUES (5, N'Mary', N'Female', 40000)
INSERT [dbo].[Employees] ([ID], [Name], [Gender], [Salary]) VALUES (6, N'Valarie', N'Female', 35000)
INSERT [dbo].[Employees] ([ID], [Name], [Gender], [Salary]) VALUES (7, N'John', N'Male', 80000)
INSERT [dbo].[Employees] ([ID], [Name], [Gender], [Salary]) VALUES (10, N'Gaurav', N'male', 500000)
INSERT [dbo].[Employees] ([ID], [Name], [Gender], [Salary]) VALUES (11, N'Shubham', N'male', 550000)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrderDate], [CustomerID]) VALUES (1, CAST(N'2018-04-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [CustomerID]) VALUES (2, CAST(N'2018-04-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [CustomerID]) VALUES (3, CAST(N'2018-05-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [CustomerID]) VALUES (4, CAST(N'2018-03-14T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [CustomerID]) VALUES (6, CAST(N'2018-12-25T00:00:00.000' AS DateTime), 8)
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[PermanentTPTEmployees] ([EmployeeID], [AnnualSalary]) VALUES (1, 60000)
INSERT [dbo].[PermanentTPTEmployees] ([EmployeeID], [AnnualSalary]) VALUES (3, 45000)
INSERT [dbo].[PermanentTPTEmployees] ([EmployeeID], [AnnualSalary]) VALUES (4, 30000)
INSERT [dbo].[PermanentTPTEmployees] ([EmployeeID], [AnnualSalary]) VALUES (7, 80000)
INSERT [dbo].[TPTEmployees] ([EmployeeID], [FirstName], [LastName], [Gender]) VALUES (1, N'Mark', N'Hastings', N'Male')
INSERT [dbo].[TPTEmployees] ([EmployeeID], [FirstName], [LastName], [Gender]) VALUES (2, N'Steve', N'Pound', N'Male')
INSERT [dbo].[TPTEmployees] ([EmployeeID], [FirstName], [LastName], [Gender]) VALUES (3, N'Ben', N'Hoskins', N'Male')
INSERT [dbo].[TPTEmployees] ([EmployeeID], [FirstName], [LastName], [Gender]) VALUES (4, N'Philip', N'Hastings', N'Male')
INSERT [dbo].[TPTEmployees] ([EmployeeID], [FirstName], [LastName], [Gender]) VALUES (5, N'Mary', N'Lambeth', N'Female')
INSERT [dbo].[TPTEmployees] ([EmployeeID], [FirstName], [LastName], [Gender]) VALUES (6, N'Valarie', N'Vikings', N'Female')
INSERT [dbo].[TPTEmployees] ([EmployeeID], [FirstName], [LastName], [Gender]) VALUES (7, N'John', N'Stanmore', N'Male')
ALTER TABLE [dbo].[ContractTPTEmployees]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TPTEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[PermanentTPTEmployees]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TPTEmployees] ([EmployeeID])
GO
/****** Object:  StoredProcedure [dbo].[spDeleteEmployees]    Script Date: 7/10/2018 1:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spDeleteEmployees]
@ID int
as
Begin
     Delete from Employees where ID = @ID
End
GO
/****** Object:  StoredProcedure [dbo].[spInsertEmployee]    Script Date: 7/10/2018 1:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spInsertEmployee]
@Name varchar(50),
@Gender varchar(10),
@Salary int	
as
BEGIN
	Insert INTO dbo.Employees Values(@Name,@Gender,@Salary)

END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEmployee]    Script Date: 7/10/2018 1:12:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spUpdateEmployee]
@EmployeeId int,
@Name varchar(50),
@Gender varchar(10),
@Salary int
as
BEGIN
	Update dbo.Employees
	Set 
		dbo.Employees.Name = @Name,
		dbo.Employees.Gender = @Gender,
		dbo.Employees.Salary =@Salary
	WHERE 
		dbo.Employees.ID = @EmployeeId
END
GO
USE [master]
GO
ALTER DATABASE [EF_DBFirst] SET  READ_WRITE 
GO
