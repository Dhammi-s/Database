USE [ecommerce]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 23-11-2025 20:49:47 ******/
	 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemID] [uniqueidentifier] NOT NULL,
	[AppUserId] [uniqueidentifier] NOT NULL,
	[UsersId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderAddresses]    Script Date: 23-11-2025 20:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderAddresses](
	[OrderAddressId] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[AddressType] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Line1] [nvarchar](255) NOT NULL,
	[Line2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NOT NULL,
	[State] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](20) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 23-11-2025 20:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemId] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[UsersId] [uniqueidentifier] NULL,
	[AppUserId] [uniqueidentifier] NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPayments]    Script Date: 23-11-2025 20:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPayments](
	[PaymentId] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[PaymentProvider] [nvarchar](50) NOT NULL,
	[ProviderPaymentId] [nvarchar](255) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Currency] [nvarchar](10) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ResponseRaw] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 23-11-2025 20:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [uniqueidentifier] NOT NULL,
	[OrderNumber] [nvarchar](100) NULL,
	[AppUserId] [uniqueidentifier] NOT NULL,
	[UsersId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[CartItemId] [uniqueidentifier] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[SubTotalAmount] [decimal](18, 2) NOT NULL,
	[ShippingAmount] [decimal](18, 2) NOT NULL,
	[TaxAmount] [decimal](18, 2) NOT NULL,
	[PaymentStatus] [nvarchar](50) NOT NULL,
	[OrderStatus] [nvarchar](50) NOT NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatusHistory]    Script Date: 23-11-2025 20:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatusHistory](
	[HistoryId] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[FromStatus] [nvarchar](50) NULL,
	[ToStatus] [nvarchar](50) NOT NULL,
	[ChangedBy] [uniqueidentifier] NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 23-11-2025 20:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products] (
    [ProductId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(255) NOT NULL,
    [Description] NVARCHAR(MAX) NOT NULL,
    [Price] DECIMAL(18,2) NOT NULL,
    [Category] NVARCHAR(200) NOT NULL,
    [InStock] BIT NOT NULL,
    [ImageUrl] NVARCHAR(MAX) NULL,
    [Usersid] UNIQUEIDENTIFIER NOT NULL,
    [IsDeleted] BIT NOT NULL DEFAULT 0,
    [IsActive] BIT NOT NULL DEFAULT 1
);

PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Userr]    Script Date: 23-11-2025 20:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Userr](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[MobileNumber] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Userr_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 23-11-2025 20:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems] ADD  DEFAULT (newid()) FOR [CartItemID]
GO
ALTER TABLE [dbo].[CartItems] ADD  DEFAULT (sysutcdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[CartItems] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OrderAddresses] ADD  DEFAULT (newid()) FOR [OrderAddressId]
GO
ALTER TABLE [dbo].[OrderAddresses] ADD  DEFAULT ('Shipping') FOR [AddressType]
GO
ALTER TABLE [dbo].[OrderAddresses] ADD  DEFAULT ('India') FOR [Country]
GO
ALTER TABLE [dbo].[OrderAddresses] ADD  DEFAULT (sysdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT (newid()) FOR [OrderItemId]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT (sysdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[OrderPayments] ADD  DEFAULT (newid()) FOR [PaymentId]
GO
ALTER TABLE [dbo].[OrderPayments] ADD  DEFAULT ('COD') FOR [PaymentProvider]
GO
ALTER TABLE [dbo].[OrderPayments] ADD  DEFAULT ('INR') FOR [Currency]
GO
ALTER TABLE [dbo].[OrderPayments] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[OrderPayments] ADD  DEFAULT (sysdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (newid()) FOR [OrderId]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('Pending') FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('New') FOR [OrderStatus]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (sysdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[OrderStatusHistory] ADD  DEFAULT (newid()) FOR [HistoryId]
GO
ALTER TABLE [dbo].[OrderStatusHistory] ADD  DEFAULT ('New') FOR [ToStatus]
GO
ALTER TABLE [dbo].[OrderStatusHistory] ADD  DEFAULT (sysdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [InStock]
GO
ALTER TABLE [dbo].[Userr] ADD  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItem_Product]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_Userr] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[Userr] ([Id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItem_Userr]
GO
ALTER TABLE [dbo].[OrderAddresses]  WITH CHECK ADD  CONSTRAINT [FK_OrderAddress_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderAddresses] CHECK CONSTRAINT [FK_OrderAddress_Order]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[OrderPayments]  WITH CHECK ADD  CONSTRAINT [FK_OrderPayment_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderPayments] CHECK CONSTRAINT [FK_OrderPayment_Order]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_CartItems] FOREIGN KEY([CartItemId])
REFERENCES [dbo].[CartItems] ([CartItemID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_CartItems]
GO
ALTER TABLE [dbo].[OrderStatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatusHistory_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderStatusHistory] CHECK CONSTRAINT [FK_OrderStatusHistory_Order]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_Users] FOREIGN KEY([Usersid])
REFERENCES [dbo].[Userr] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_Users]
GO


