
USE [master]
GO
/****** Object:  Database [db43502]    Script Date: 23-05-2026 17:47:19 ******/
CREATE DATABASE [db43502]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db43502', FILENAME = N'D:\Services\MSSQL\Data\db43502.mdf' , SIZE = 8192KB , MAXSIZE = 1048576KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db43502_log', FILENAME = N'D:\Services\MSSQL\Data\db43502_log.ldf' , SIZE = 8192KB , MAXSIZE = 5242880KB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db43502] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db43502].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db43502] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db43502] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db43502] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db43502] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db43502] SET ARITHABORT OFF 
GO
ALTER DATABASE [db43502] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db43502] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db43502] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db43502] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db43502] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db43502] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db43502] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db43502] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db43502] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db43502] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db43502] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db43502] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db43502] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db43502] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db43502] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db43502] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db43502] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db43502] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db43502] SET  MULTI_USER 
GO
ALTER DATABASE [db43502] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db43502] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db43502] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db43502] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db43502] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db43502] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db43502] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [db43502] SET QUERY_STORE = ON
GO
ALTER DATABASE [db43502] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db43502]
GO
/****** Object:  FullTextCatalog [db43502]    Script Date: 23-05-2026 17:47:26 ******/
CREATE FULLTEXT CATALOG [db43502] WITH ACCENT_SENSITIVITY = ON
AS DEFAULT
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[FullAddress] [nvarchar](500) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[Pincode] [nvarchar](20) NULL,
	[Latitude] [decimal](10, 8) NULL,
	[Longitude] [decimal](11, 8) NULL,
	[GooglePlaceId] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
	[IsArchived] [bit] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingRescheduleHistory]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRescheduleHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingId] [uniqueidentifier] NULL,
	[OldDate] [date] NULL,
	[OldTimeSlotId] [uniqueidentifier] NULL,
	[NewDate] [date] NULL,
	[NewTimeSlotId] [uniqueidentifier] NULL,
	[ChangedBy] [uniqueidentifier] NULL,
	[ChangedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchived] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[ServiceId] [uniqueidentifier] NULL,
	[AddressId] [uniqueidentifier] NULL,
	[BookingDate] [date] NULL,
	[TimeSlotId] [uniqueidentifier] NULL,
	[Status] [nvarchar](50) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[StripePaymentIntentId] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
	[IsArchived] [bit] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingWorkers]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingWorkers](
	[Id] [uniqueidentifier] NOT NULL,
	[BookingId] [uniqueidentifier] NULL,
	[WorkerId] [uniqueidentifier] NULL,
	[AssignedAt] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchived] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareLogActivities]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareLogActivities](
	[ActivityId] [uniqueidentifier] NOT NULL,
	[CareLogId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Days] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CareLogs]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CareLogs](
	[CareLogId] [uniqueidentifier] NOT NULL,
	[ClientId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Status] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CareLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Icon] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[IsArchived] [bit] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientId] [uniqueidentifier] NOT NULL,
	[Office] [nvarchar](200) NULL,
	[Status] [bit] NULL,
	[FirstName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Gender] [nvarchar](20) NULL,
	[BirthDate] [date] NULL,
	[PhonePrefix] [nvarchar](10) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](150) NULL,
	[AddressLine] [nvarchar](250) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Country] [nvarchar](100) NULL,
	[EmergencyContactName] [nvarchar](150) NULL,
	[Relationship] [nvarchar](100) NULL,
	[ContactPhonePrefix] [nvarchar](10) NULL,
	[ContactPhone] [nvarchar](20) NULL,
	[ContactGender] [nvarchar](20) NULL,
	[ContactAddress] [nvarchar](250) NULL,
	[PreferredLanguage] [nvarchar](50) NULL,
	[IsPreferred] [bit] NULL,
	[IsClient] [bit] NULL,
	[IsActive] [bit] NULL,
	[IsArchived] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compliances]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compliances](
	[ComplianceId] [uniqueidentifier] NOT NULL,
	[ClientId] [uniqueidentifier] NOT NULL,
	[ComplianceType] [nvarchar](100) NULL,
	[OriginDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[LicenseNo] [nvarchar](100) NULL,
	[Notes] [nvarchar](500) NULL,
	[Status] [nvarchar](50) NULL,
	[FileData] [varbinary](max) NULL,
	[FileName] [nvarchar](200) NULL,
	[FileType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ComplianceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Email] [nvarchar](150) NULL,
	[Product] [nvarchar](100) NULL,
	[Message] [nvarchar](500) NULL,
	[CreatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employeeid] [uniqueidentifier] NOT NULL,
	[employeename] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[phone_number] [nvarchar](20) NULL,
	[hire_date] [datetime2](7) NULL,
	[job_title] [nvarchar](50) NULL,
	[role] [nvarchar](200) NULL,
	[isactive] [bit] NULL,
	[isarchived] [bit] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
	[employeeadress] [nvarchar](500) NULL,
	[AdharcardNumber] [nvarchar](20) NULL,
	[Profilepic] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[employeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [uniqueidentifier] NOT NULL,
	[BookingId] [uniqueidentifier] NULL,
	[BaseAmount] [decimal](10, 2) NULL,
	[GstAmount] [decimal](10, 2) NULL,
	[PlatformFee] [decimal](10, 2) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchived] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[PasswordHash] [nvarchar](200) NULL,
	[Role] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[Message] [nvarchar](max) NULL,
	[IsRead] [bit] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchived] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offices](
	[OfficeId] [uniqueidentifier] NOT NULL,
	[FranchiseId] [uniqueidentifier] NULL,
	[OfficeDisplayId] [nvarchar](50) NULL,
	[OfficeName] [nvarchar](200) NOT NULL,
	[OfficeInvoiceName] [nvarchar](200) NULL,
	[ContactName] [nvarchar](150) NULL,
	[Website] [nvarchar](200) NULL,
	[PhonePrefix] [nvarchar](10) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](150) NULL,
	[AddressLine] [nvarchar](250) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Country] [nvarchar](100) NULL,
	[TimeZoneId] [nvarchar](100) NULL,
	[DateEstablished] [date] NULL,
	[TaxRate] [decimal](5, 2) NULL,
	[IsActive] [bit] NULL,
	[IsArchived] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OfficeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [uniqueidentifier] NOT NULL,
	[BookingId] [uniqueidentifier] NULL,
	[Amount] [decimal](10, 2) NULL,
	[PaymentStatus] [nvarchar](50) NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[StripePaymentIntentId] [nvarchar](200) NULL,
	[StripeChargeId] [nvarchar](200) NULL,
	[PaidAt] [datetime2](7) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[IsArchived] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
	[PublicId] [nvarchar](200) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Category] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewId] [uniqueidentifier] NOT NULL,
	[BookingId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[WorkerId] [uniqueidentifier] NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchived] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[ScheduleId] [uniqueidentifier] NOT NULL,
	[ClientId] [uniqueidentifier] NOT NULL,
	[LocationId] [uniqueidentifier] NOT NULL,
	[CarePlanId] [uniqueidentifier] NULL,
	[TimeZone] [nvarchar](100) NULL,
	[RecurrenceType] [nvarchar](20) NULL,
	[Interval] [int] NULL,
	[MonthlyDayOfMonth] [int] NULL,
	[RepeatUntil] [datetime] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchived] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleSeries]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleSeries](
	[SeriesId] [uniqueidentifier] NOT NULL,
	[ScheduleId] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[PractitionerId] [uniqueidentifier] NULL,
	[Status] [nvarchar](50) NULL,
	[ServiceTypeId] [nvarchar](50) NULL,
	[BillRate] [decimal](10, 2) NULL,
	[PayRate] [decimal](10, 2) NULL,
	[BillTypeId] [uniqueidentifier] NULL,
	[PayTypeId] [uniqueidentifier] NULL,
	[TimeZone] [nvarchar](100) NULL,
	[WallClockStart] [nvarchar](10) NULL,
	[WallClockEnd] [nvarchar](10) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchived] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SeriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NULL,
	[ServiceName] [nvarchar](150) NULL,
	[Description] [nvarchar](max) NULL,
	[BasePrice] [decimal](10, 2) NULL,
	[Duration] [int] NULL,
	[IsActive] [bit] NULL,
	[IsArchived] [bit] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotBookings]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotBookings](
	[Id] [uniqueidentifier] NOT NULL,
	[WorkerId] [uniqueidentifier] NULL,
	[BookingDate] [date] NULL,
	[TimeSlotId] [uniqueidentifier] NULL,
	[BookingId] [uniqueidentifier] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchived] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenants]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[TenantKey] [nvarchar](100) NULL,
	[FrontendDomain] [nvarchar](200) NULL,
	[ConnectionString] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlots]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlots](
	[TimeSlotId] [uniqueidentifier] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[SlotLabel] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[IsArchived] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[TimeSlotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerAvailability]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerAvailability](
	[Id] [uniqueidentifier] NOT NULL,
	[WorkerId] [uniqueidentifier] NULL,
	[AvailableDate] [date] NULL,
	[TimeSlotId] [uniqueidentifier] NULL,
	[IsAvailable] [bit] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[IsArchived] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerCertificates]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerCertificates](
	[Id] [uniqueidentifier] NOT NULL,
	[WorkerId] [uniqueidentifier] NOT NULL,
	[CertificateName] [nvarchar](200) NOT NULL,
	[CertificateFileBase64] [nvarchar](max) NULL,
	[ExpiryDate] [date] NULL,
	[CreatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerProfiles]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerProfiles](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ProfileImageBase64] [nvarchar](max) NULL,
	[Bio] [nvarchar](max) NULL,
	[HourlyRate] [decimal](10, 2) NULL,
	[ExperienceYears] [int] NULL,
	[ServiceArea] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[IsAvailable] [bit] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerSkills]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerSkills](
	[Id] [uniqueidentifier] NOT NULL,
	[WorkerId] [uniqueidentifier] NOT NULL,
	[ServiceId] [uniqueidentifier] NOT NULL,
	[ExperienceYears] [int] NULL,
	[IsActive] [bit] NULL,
	[IsArchived] [bit] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Bookings_Status]    Script Date: 23-05-2026 17:47:26 ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_Status] ON [dbo].[Bookings]
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_UserId]    Script Date: 23-05-2026 17:47:26 ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_UserId] ON [dbo].[Bookings]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Payments_BookingId]    Script Date: 23-05-2026 17:47:26 ******/
CREATE NONCLUSTERED INDEX [IX_Payments_BookingId] ON [dbo].[Payments]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SlotBookings_WorkerId]    Script Date: 23-05-2026 17:47:26 ******/
CREATE NONCLUSTERED INDEX [IX_SlotBookings_WorkerId] ON [dbo].[SlotBookings]
(
	[WorkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (newsequentialid()) FOR [AddressId]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BookingRescheduleHistory] ADD  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[BookingRescheduleHistory] ADD  DEFAULT (getdate()) FOR [ChangedAt]
GO
ALTER TABLE [dbo].[BookingRescheduleHistory] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BookingRescheduleHistory] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[BookingRescheduleHistory] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT (newsequentialid()) FOR [BookingId]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BookingWorkers] ADD  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[BookingWorkers] ADD  DEFAULT (getdate()) FOR [AssignedAt]
GO
ALTER TABLE [dbo].[BookingWorkers] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BookingWorkers] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[BookingWorkers] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[CareLogActivities] ADD  DEFAULT (newid()) FOR [ActivityId]
GO
ALTER TABLE [dbo].[CareLogs] ADD  DEFAULT (newid()) FOR [CareLogId]
GO
ALTER TABLE [dbo].[CareLogs] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (newsequentialid()) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Clients] ADD  DEFAULT (newid()) FOR [ClientId]
GO
ALTER TABLE [dbo].[Clients] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Clients] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Clients] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Compliances] ADD  DEFAULT (newid()) FOR [ComplianceId]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT ((0)) FOR [isarchived]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (newsequentialid()) FOR [InvoiceId]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Offices] ADD  DEFAULT (newsequentialid()) FOR [OfficeId]
GO
ALTER TABLE [dbo].[Offices] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Offices] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Offices] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (newsequentialid()) FOR [PaymentId]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[ProductImages] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[ProductImages] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (newsequentialid()) FOR [ReviewId]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Schedules] ADD  DEFAULT (newid()) FOR [ScheduleId]
GO
ALTER TABLE [dbo].[Schedules] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Schedules] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Schedules] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[ScheduleSeries] ADD  DEFAULT (newid()) FOR [SeriesId]
GO
ALTER TABLE [dbo].[ScheduleSeries] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ScheduleSeries] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ScheduleSeries] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (newsequentialid()) FOR [ServiceId]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[SlotBookings] ADD  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[SlotBookings] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[SlotBookings] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SlotBookings] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[TimeSlots] ADD  DEFAULT (newsequentialid()) FOR [TimeSlotId]
GO
ALTER TABLE [dbo].[TimeSlots] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TimeSlots] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TimeSlots] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[WorkerAvailability] ADD  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[WorkerAvailability] ADD  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[WorkerAvailability] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[WorkerAvailability] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[WorkerCertificates] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[WorkerCertificates] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[WorkerProfiles] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[WorkerProfiles] ADD  DEFAULT ((1)) FOR [IsAvailable]
GO
ALTER TABLE [dbo].[WorkerProfiles] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[WorkerSkills] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[WorkerSkills] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[WorkerSkills] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[WorkerSkills] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[BookingRescheduleHistory]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([BookingId])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([ServiceId])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([TimeSlotId])
REFERENCES [dbo].[TimeSlots] ([TimeSlotId])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[BookingWorkers]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([BookingId])
GO
ALTER TABLE [dbo].[BookingWorkers]  WITH CHECK ADD FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CareLogActivities]  WITH CHECK ADD  CONSTRAINT [FK_CareLogActivities_CareLogs] FOREIGN KEY([CareLogId])
REFERENCES [dbo].[CareLogs] ([CareLogId])
GO
ALTER TABLE [dbo].[CareLogActivities] CHECK CONSTRAINT [FK_CareLogActivities_CareLogs]
GO
ALTER TABLE [dbo].[CareLogs]  WITH CHECK ADD  CONSTRAINT [FK_CareLogs_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientId])
GO
ALTER TABLE [dbo].[CareLogs] CHECK CONSTRAINT [FK_CareLogs_Clients]
GO
ALTER TABLE [dbo].[Compliances]  WITH CHECK ADD  CONSTRAINT [FK_Compliance_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientId])
GO
ALTER TABLE [dbo].[Compliances] CHECK CONSTRAINT [FK_Compliance_Client]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([BookingId])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([BookingId])
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Product]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([BookingId])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedules_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientId])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedules_Clients]
GO
ALTER TABLE [dbo].[ScheduleSeries]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleSeries_Schedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedules] ([ScheduleId])
GO
ALTER TABLE [dbo].[ScheduleSeries] CHECK CONSTRAINT [FK_ScheduleSeries_Schedule]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[SlotBookings]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([BookingId])
GO
ALTER TABLE [dbo].[SlotBookings]  WITH CHECK ADD FOREIGN KEY([TimeSlotId])
REFERENCES [dbo].[TimeSlots] ([TimeSlotId])
GO
ALTER TABLE [dbo].[SlotBookings]  WITH CHECK ADD FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[WorkerAvailability]  WITH CHECK ADD FOREIGN KEY([TimeSlotId])
REFERENCES [dbo].[TimeSlots] ([TimeSlotId])
GO
ALTER TABLE [dbo].[WorkerAvailability]  WITH CHECK ADD FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[WorkerCertificates]  WITH CHECK ADD FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[WorkerProfiles]  WITH CHECK ADD  CONSTRAINT [FK_WorkerProfiles_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[WorkerProfiles] CHECK CONSTRAINT [FK_WorkerProfiles_User]
GO
ALTER TABLE [dbo].[WorkerSkills]  WITH CHECK ADD FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([ServiceId])
GO
ALTER TABLE [dbo].[WorkerSkills]  WITH CHECK ADD FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
/****** Object:  StoredProcedure [dbo].[AddOffice]    Script Date: 23-05-2026 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddOffice]
(
    @OfficeName NVARCHAR(200),
    @OfficeInvoiceName NVARCHAR(200),
    @ContactName NVARCHAR(200),
    @Email NVARCHAR(200),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @PostalCode NVARCHAR(20),
    @Country NVARCHAR(100)
)
AS
BEGIN

INSERT INTO dbo.Offices
(
    OfficeId,
    OfficeDisplayId,
    OfficeName,
    OfficeInvoiceName,
    ContactName,
    Email,
    City,
    State,
    PostalCode,
    Country,
    IsActive,
    IsArchived,
    CreatedOn
)
VALUES
(
    NEWID(),
    'OFF' + RIGHT('000' + CAST((SELECT COUNT(*) + 1 FROM dbo.Offices) AS VARCHAR),3),
    @OfficeName,
    @OfficeInvoiceName,
    @ContactName,
    @Email,
    @City,
    @State,
    @PostalCode,
    @Country,
    1,
    0,
    GETDATE()
)

END
GO
/****** Object:  StoredProcedure [dbo].[GenerateInvoiceAndPayment]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GenerateInvoiceAndPayment]
    @BookingId UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -----------------------------------------
        -- 1. VALIDATION
        -----------------------------------------
        IF NOT EXISTS (SELECT 1 FROM Bookings WHERE BookingId = @BookingId)
        BEGIN
            RAISERROR('Invalid BookingId', 16, 1);
            ROLLBACK;
            RETURN;
        END

        IF EXISTS (SELECT 1 FROM Invoices WHERE BookingId = @BookingId AND IsArchived = 0)
        BEGIN
            RAISERROR('Invoice already generated', 16, 1);
            ROLLBACK;
            RETURN;
        END

        -----------------------------------------
        -- 2. TEMP TABLE
        -----------------------------------------
        CREATE TABLE #InvoiceData (
            BookingId UNIQUEIDENTIFIER,
            CustomerName NVARCHAR(150),
            Email NVARCHAR(150),
            Phone NVARCHAR(20),
            WorkerName NVARCHAR(150),
            ServiceName NVARCHAR(150),
            Hours INT,
            SlotLabel NVARCHAR(50),
            BookingDate DATE,
            BaseAmount DECIMAL(18,2),
            GstAmount DECIMAL(18,2),
            PlatformFee DECIMAL(18,2),
            TotalAmount DECIMAL(18,2)
        );

        -----------------------------------------
        -- 3. CTE (FULL DATA)
        -----------------------------------------
        ;WITH BookingCTE AS (
            SELECT 
                b.BookingId,

                u.Name AS CustomerName,
                u.Email,
                u.PhoneNUMBER,

                w.Name AS WorkerName,

                s.ServiceName,
                s.Duration AS Hours,

                t.SlotLabel,
                b.BookingDate,

                b.TotalAmount AS BaseAmount

            FROM Bookings b

            JOIN Users u ON b.UserId = u.Id

            LEFT JOIN BookingWorkers bw ON b.BookingId = bw.BookingId
            LEFT JOIN Users w ON bw.WorkerId = w.Id

            JOIN Services s ON b.ServiceId = s.ServiceId

            LEFT JOIN TimeSlots t ON b.TimeSlotId = t.TimeSlotId

            WHERE b.BookingId = @BookingId
        )

        -----------------------------------------
        -- 4. INSERT INTO TEMP
        -----------------------------------------
        INSERT INTO #InvoiceData
        SELECT 
            BookingId,
            CustomerName,
            Email,
            PhoneNUMBER,
            WorkerName,
            ServiceName,
            Hours,
            SlotLabel,
            BookingDate,
            BaseAmount,
            (BaseAmount * 18) / 100,
            (BaseAmount * 10) / 100,
            BaseAmount + ((BaseAmount * 18) / 100) + ((BaseAmount * 10) / 100)
        FROM BookingCTE;

        -----------------------------------------
        -- 5. INSERT INVOICE
        -----------------------------------------
        INSERT INTO Invoices (
            InvoiceId, BookingId, BaseAmount, GstAmount,
            PlatformFee, TotalAmount, Status,
            IsActive, IsArchived, CreatedAt
        )
        SELECT 
            NEWID(),
            BookingId,
            BaseAmount,
            GstAmount,
            PlatformFee,
            TotalAmount,
            'Pending',
            1,
            0,
            GETDATE()
        FROM #InvoiceData;

        -----------------------------------------
        -- 6. INSERT PAYMENT
        -----------------------------------------
        INSERT INTO Payments (
            PaymentId, BookingId, Amount,
            PaymentStatus, PaymentMethod,
            IsActive, IsArchived, CreatedAt
        )
        SELECT 
            NEWID(),
            BookingId,
            TotalAmount,
            'Pending',
            'Online',
            1,
            0,
            GETDATE()
        FROM #InvoiceData;

        -----------------------------------------
        -- 7. HTML INVOICE
        -----------------------------------------
        DECLARE @Html NVARCHAR(MAX);
DECLARE @InvoiceNo NVARCHAR(50) = 'INV-' + FORMAT(GETDATE(),'yyyyMMdd') + '-' + RIGHT(CAST(NEWID() AS NVARCHAR(36)),5);

SELECT @Html =
'<!DOCTYPE html>
<html>
<head>
<style>
body {
    font-family: "Segoe UI", Arial;
    background: #eef2f7;
    padding: 40px;
}

.card {
    max-width: 850px;
    margin: auto;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 15px 40px rgba(0,0,0,0.08);
    overflow: hidden;
}

.header {
    background: linear-gradient(135deg, #4CAF50, #2E7D32);
    color: white;
    padding: 25px 30px;
    display: flex;
    justify-content: space-between;
}

.header h1 {
    margin: 0;
    font-size: 28px;
}

.invoice-info {
    text-align: right;
    font-size: 14px;
}

.section {
    padding: 25px 30px;
}

.grid {
    display: flex;
    justify-content: space-between;
    gap: 20px;
}

.box {
    width: 48%;
}

.label {
    font-size: 12px;
    color: #888;
    text-transform: uppercase;
}

.value {
    font-size: 15px;
    font-weight: 600;
    margin-bottom: 10px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th {
    background: #f7f7f7;
    padding: 12px;
    text-align: left;
}

td {
    padding: 12px;
    border-bottom: 1px solid #eee;
}

.right {
    text-align: right;
}

.total {
    background: #4CAF50;
    color: white;
    font-size: 16px;
    font-weight: bold;
}

.footer {
    padding: 20px;
    text-align: center;
    font-size: 12px;
    color: #aaa;
}
</style>
</head>

<body>

<div class="card">

<div class="header">
    <div>
        <h1>INVOICE</h1>
        <div>#' + @InvoiceNo + '</div>
    </div>
    <div class="invoice-info">
        Date: ' + FORMAT(BookingDate,'dd MMM yyyy') + '<br/>
        Status: Paid
    </div>
</div>

<div class="section grid">

    <div class="box">
        <div class="label">Customer</div>
        <div class="value">' + CustomerName + '</div>

        <div class="label">Email</div>
        <div class="value">' + Email + '</div>

        <div class="label">Phone</div>
        <div class="value">' + Phone + '</div>
    </div>

    <div class="box">
        <div class="label">Service</div>
        <div class="value">' + ServiceName + '</div>

        <div class="label">Worker</div>
        <div class="value">' + ISNULL(WorkerName,'Not Assigned') + '</div>

        <div class="label">Time Slot</div>
        <div class="value">' + ISNULL(SlotLabel,'-') + '</div>

        <div class="label">Duration</div>
        <div class="value">' + CAST(Hours AS NVARCHAR) + ' Hours</div>
    </div>

</div>

<div class="section">

<table>
<tr>
    <th>Description</th>
    <th class="right">Amount (₹)</th>
</tr>

<tr>
    <td>Base Amount</td>
    <td class="right">' + FORMAT(BaseAmount,'N2') + '</td>
</tr>

<tr>
    <td>GST (18%)</td>
    <td class="right">' + FORMAT(GstAmount,'N2') + '</td>
</tr>

<tr>
    <td>Platform Fee (10%)</td>
    <td class="right">' + FORMAT(PlatformFee,'N2') + '</td>
</tr>

<tr class="total">
    <td>Total Amount</td>
    <td class="right">₹' + FORMAT(TotalAmount,'N2') + '</td>
</tr>

</table>

</div>

<div class="footer">
    Thank you for trusting our service ❤️ <br/>
    This is a system generated invoice.
</div>

</div>

</body>
</html>'
FROM #InvoiceData;
        -----------------------------------------
        -- 8. COMMIT
        -----------------------------------------
        COMMIT;

        -----------------------------------------
        -- 9. RETURN
        -----------------------------------------
        SELECT *, @Html AS InvoiceHtml FROM #InvoiceData;

        DROP TABLE #InvoiceData;

    END TRY
    BEGIN CATCH
        ROLLBACK;

        SELECT 
            ERROR_MESSAGE() AS ErrorMessage,
            ERROR_LINE() AS ErrorLine;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Category_Add]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Category_Add]
(
    @Action NVARCHAR(10),
    @CategoryId UNIQUEIDENTIFIER = NULL,
    @Name NVARCHAR(100) = NULL,
    @Icon NVARCHAR(255) = NULL,
    @IsActive BIT = NULL,
    @IsArchived BIT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT
  IF @Action = 'INSERT'
BEGIN
    INSERT INTO Categories (CategoryId, Name, Icon, IsActive, IsArchived, CreatedAt)
    VALUES (@CategoryId, @Name, @Icon, @IsActive, @IsArchived, GETDATE());
END

    -- UPDATE
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE Categories
        SET 
            Name = @Name,
            Icon = @Icon,
            IsActive = @IsActive,
            IsArchived = @IsArchived,
            UpdatedAt = GETDATE()
        WHERE CategoryId = @CategoryId;
    END

    -- DELETE
    ELSE IF @Action = 'DELETE'
    BEGIN
        UPDATE Categories
        SET IsArchived = 1
        WHERE CategoryId = @CategoryId;
    END

    -- GETALL
    ELSE IF @Action = 'GETALL'
    BEGIN
        SELECT * FROM Categories WHERE IsArchived = 0;
    END

    -- GETBYID
    ELSE IF @Action = 'GETBYID'
    BEGIN
        SELECT * FROM Categories WHERE CategoryId = @CategoryId;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateWorkerProfile]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_CreateWorkerProfile]
    @WorkerId             UNIQUEIDENTIFIER,
    @UserId               UNIQUEIDENTIFIER,
    @ProfileImageBase64   NVARCHAR(MAX)  = NULL,
    @Bio                  NVARCHAR(MAX)  = NULL,
    @HourlyRate           DECIMAL(18,2),
    @ExperienceYears      INT,
    @ServiceArea          NVARCHAR(500)  = NULL,
    @SkillsJson           NVARCHAR(MAX)  = '[]',
    @CertificatesJson     NVARCHAR(MAX)  = '[]',
    @AvailabilityJson     NVARCHAR(MAX)  = '[]'
AS
BEGIN
    SET NOCOUNT ON;

    -- Validate all ServiceIds exist
    IF EXISTS (
        SELECT 1 FROM OPENJSON(@SkillsJson)
        WITH (ServiceId NVARCHAR(50) '$.ServiceId') AS j
        WHERE NOT EXISTS (
            SELECT 1 FROM Services WHERE ServiceId = TRY_CAST(j.ServiceId AS UNIQUEIDENTIFIER)
        )
    )
    BEGIN
        RAISERROR('One or more ServiceId values do not exist in the Services table.', 16, 1);
        RETURN;
    END

    -- Validate all TimeSlotIds exist
    IF EXISTS (
        SELECT 1 FROM OPENJSON(@AvailabilityJson)
        WITH (TimeSlotId NVARCHAR(50) '$.TimeSlotId') AS j
        WHERE NOT EXISTS (
            SELECT 1 FROM TimeSlots WHERE TimeSlotId = TRY_CAST(j.TimeSlotId AS UNIQUEIDENTIFIER)
        )
    )
    BEGIN
        RAISERROR('One or more TimeSlotId values do not exist in the TimeSlots table.', 16, 1);
        RETURN;
    END

    -- 1. Insert Worker Profile
    INSERT INTO WorkerProfiles (Id, UserId, ProfileImageBase64, Bio, HourlyRate, ExperienceYears, ServiceArea, IsAvailable, CreatedAt)
    VALUES (@WorkerId, @UserId, @ProfileImageBase64, @Bio, @HourlyRate, @ExperienceYears, @ServiceArea, 1, GETUTCDATE());

    -- 2. Insert Skills
    INSERT INTO WorkerSkills (Id, WorkerId, ServiceId, ExperienceYears, IsActive, IsArchived, CreatedAt)
    SELECT
        NEWID(),
        @UserId,
        TRY_CAST(j.ServiceId AS UNIQUEIDENTIFIER),
        j.ExperienceYears,
        1, 0,
        GETUTCDATE()
    FROM OPENJSON(@SkillsJson)
    WITH (
        ServiceId       NVARCHAR(50) '$.ServiceId',
        ExperienceYears INT          '$.ExperienceYears'
    ) AS j;

    -- 3. Insert Certificates
    INSERT INTO WorkerCertificates (Id, WorkerId, CertificateName, CertificateFileBase64, ExpiryDate, CreatedAt)
    SELECT
        NEWID(),
        @UserId,
        j.CertificateName,
        j.CertificateFileBase64,
        j.ExpiryDate,
        GETUTCDATE()
    FROM OPENJSON(@CertificatesJson)
    WITH (
        CertificateName       NVARCHAR(200) '$.CertificateName',
        CertificateFileBase64 NVARCHAR(MAX) '$.CertificateFileBase64',
        ExpiryDate            DATETIME      '$.ExpiryDate'
    ) AS j;

    -- 4. Insert Availability
    INSERT INTO WorkerAvailability (Id, WorkerId, AvailableDate, TimeSlotId, IsAvailable)
    SELECT
        NEWID(),
        @UserId,
        j.AvailableDate,
        TRY_CAST(j.TimeSlotId AS UNIQUEIDENTIFIER),
        j.IsAvailable
    FROM OPENJSON(@AvailabilityJson)
    WITH (
        AvailableDate DATETIME     '$.AvailableDate',
        TimeSlotId    NVARCHAR(50) '$.TimeSlotId',
        IsAvailable   BIT          '$.IsAvailable'
    ) AS j;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllClients]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllClients]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Id,
        ClientId,
        Office,
        Status,
        FirstName,
        MiddleName,
        LastName,
        Gender,
        BirthDate,
        PhonePrefix,
        Phone,
        Email,
        AddressLine,
        City,
        State,
        PostalCode,
        Country,
        IsActive,
        IsArchived,
        CreatedDate,
        UpdatedDate
    FROM Clients
    WHERE IsArchived = 0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCarePlanByClientId]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetCarePlanByClientId]
    @ClientId UNIQUEIDENTIFIER
AS
BEGIN
    SELECT 
        cl.CareLogId,
        cl.ClientId,
        cl.Title,
        cl.Status,
        cl.StartDate,
        cl.EndDate,

        a.ActivityId,
        a.Type,
        a.Description,
        a.StartDate AS ActivityStartDate,
        a.EndDate AS ActivityEndDate,
        a.Days

    FROM CareLogs cl
    LEFT JOIN CareLogActivities a 
        ON cl.CareLogId = a.CareLogId

    WHERE cl.ClientId = @ClientId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCompliancesByClientId]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetCompliancesByClientId]  
    @ClientId UNIQUEIDENTIFIER ='47D90360-9F72-4806-FC4A-08DE8BD295BA' 
AS  
BEGIN  
    SELECT   
        ComplianceId,  
        ClientId,  
        ComplianceType,  
        OriginDate,  
        ExpirationDate,  
        LicenseNo,  
        Notes,  
        Status
    
    FROM Compliances  
    WHERE ClientId = @ClientId  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOfficeList]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetOfficeList]
AS
BEGIN

SELECT
    OfficeId,
    OfficeName,
    City,
    State,
    Country,
    IsActive
FROM Offices
WHERE IsArchived = 0 and IsActive = 1

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSimpleUsers]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetSimpleUsers]
AS
BEGIN
	SELECT Id, Name FROM Customers
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetWorkerProfile]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_GetWorkerProfile]
(
    @WorkerId UNIQUEIDENTIFIER
)
AS
BEGIN

    SET NOCOUNT ON;

    -----------------------------------
    -- Profile
    -----------------------------------

    SELECT
        U.Id AS UserId,
        U.Name,
        U.Email,
        U.PhoneNumber,

        WP.ProfileImageBase64,
        WP.Bio,
        WP.HourlyRate,
        WP.ExperienceYears,
        WP.ServiceArea

    FROM Users U

    LEFT JOIN WorkerProfiles WP
        ON U.Id = WP.UserId

    WHERE U.Id = @WorkerId;


    -----------------------------------
    -- Skills
    -----------------------------------

    SELECT
        WS.ServiceId,
        S.ServiceName,
        WS.ExperienceYears

    FROM WorkerSkills WS

    INNER JOIN Services S
        ON WS.ServiceId = S.ServiceId

    WHERE WS.WorkerId = @WorkerId
    AND WS.IsArchived = 0;


    -----------------------------------
    -- Certificates
    -----------------------------------

    SELECT
        Id,
        CertificateName,
        CertificateFileBase64,
        ExpiryDate

    FROM WorkerCertificates

    WHERE WorkerId = @WorkerId;


    -----------------------------------
    -- Availability
    -----------------------------------

    SELECT
        Id,
        AvailableDate,
        TimeSlotId,
        IsAvailable

    FROM WorkerAvailability

    WHERE WorkerId = @WorkerId
    AND IsArchived = 0;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUser]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LoginUser]
@Email NVARCHAR(150)
AS
BEGIN
	SELECT Id,Name,Email,PasswordHash,Role,PhoneNumber
	FROM Users
	WHERE Email=@Email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUsers]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LoginUsers]
@Username NVARCHAR(100),
@Password NVARCHAR(200)
AS
BEGIN
	SELECT UserId,Username,Role
	FROM login
	WHERE Username=@Username
	AND PasswordHash=@Password
	AND IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterUser]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegisterUser]
@Name NVARCHAR(100),
@Email NVARCHAR(150),
@PasswordHash NVARCHAR(255),
@PhoneNumber NVARCHAR(20),
@Role NVARCHAR(50)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Users WHERE Email=@Email)
	BEGIN
		RAISERROR('Email already exists',16,1)
		RETURN
	END

	INSERT INTO Users(Name,Email,PasswordHash,PhoneNumber,Role)
	VALUES(@Name,@Email,@PasswordHash,@PhoneNumber,@Role)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateClient]    Script Date: 23-05-2026 17:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateClient]
    @ClientId UNIQUEIDENTIFIER,

    @Office NVARCHAR(200),
    @Status BIT,

    @FirstName NVARCHAR(100),
    @MiddleName NVARCHAR(100),
    @LastName NVARCHAR(100),

    @Gender NVARCHAR(20),
    @BirthDate DATE,

    @PhonePrefix NVARCHAR(10),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(150),

    @AddressLine NVARCHAR(250),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @PostalCode NVARCHAR(20),
    @Country NVARCHAR(100),

    @EmergencyContactName NVARCHAR(150),
    @Relationship NVARCHAR(100),
    @ContactPhonePrefix NVARCHAR(10),
    @ContactPhone NVARCHAR(20),
    @ContactGender NVARCHAR(20),
    @ContactAddress NVARCHAR(250),

    @PreferredLanguage NVARCHAR(50),
    @IsPreferred BIT,

    @IsClient BIT
AS
BEGIN
    UPDATE Clients
    SET
        Office = @Office,
        Status = @Status,

        FirstName = @FirstName,
        MiddleName = @MiddleName,
        LastName = @LastName,

        Gender = @Gender,
        BirthDate = @BirthDate,

        PhonePrefix = @PhonePrefix,
        Phone = @Phone,
        Email = @Email,

        AddressLine = @AddressLine,
        City = @City,
        State = @State,
        PostalCode = @PostalCode,
        Country = @Country,

        EmergencyContactName = @EmergencyContactName,
        Relationship = @Relationship,
        ContactPhonePrefix = @ContactPhonePrefix,
        ContactPhone = @ContactPhone,
        ContactGender = @ContactGender,
        ContactAddress = @ContactAddress,

        PreferredLanguage = @PreferredLanguage,
        IsPreferred = @IsPreferred,

        IsClient = @IsClient,
        UpdatedDate = GETDATE()

    WHERE ClientId = @ClientId
END
GO
USE [master]
GO
ALTER DATABASE [db43502] SET  READ_WRITE 
GO
