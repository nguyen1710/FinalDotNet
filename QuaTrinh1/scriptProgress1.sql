USE [QuaTrinh1DB]
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_GenerateOrderDetailID]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Fun_GenerateOrderDetailID]()
RETURNS VARCHAR(255)
AS
BEGIN
    DECLARE @OrderDetailCount INT
    DECLARE @OrderDetailID VARCHAR(255)

    -- Lấy số thứ tự tiếp theo dựa trên số phần tử hiện có trong bảng OrderDetail
    SELECT @OrderDetailCount = ISNULL(MAX(CAST(SUBSTRING(ID, 4, 6) AS INT)), 0) + 1 FROM OrderDetail

    -- Tạo OrderDetailID theo mẫu "OTD" + 6 số thứ tự
    SET @OrderDetailID = 'OTD' + RIGHT('000000' + CAST(@OrderDetailCount AS VARCHAR(6)), 6)

    RETURN @OrderDetailID
END
GO
/****** Object:  UserDefinedFunction [dbo].[Fun_GenerateOrderID]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Fun_GenerateOrderID]()
RETURNS VARCHAR(255)
AS
BEGIN
    DECLARE @OrderCount INT
    DECLARE @OrderID VARCHAR(255)

    -- Lấy số thứ tự tiếp theo dựa trên số phần tử hiện có trong bảng Order
    SELECT @OrderCount = ISNULL(MAX(CAST(SUBSTRING(OrderID, 4, 6) AS INT)), 0) + 1 FROM [Order]

    -- Tạo OrderID theo mẫu "OID" + 6 số thứ tự
    SET @OrderID = 'OID' + RIGHT('000000' + CAST(@OrderCount AS VARCHAR(6)), 6)

    RETURN @OrderID
END
GO
/****** Object:  Table [dbo].[AdminAccount]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminAccount](
	[UserName] [varchar](20) NULL,
	[UserPwd] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustID] [varchar](255) NOT NULL,
	[CustName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [varchar](255) NOT NULL,
	[ItemName] [nvarchar](255) NULL,
	[Price] [int] NULL,
	[Size] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [varchar](255) NOT NULL,
	[OrderDate] [date] NULL,
	[CustID] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [varchar](255) NOT NULL,
	[OrderID] [varchar](255) NULL,
	[ItemID] [varchar](255) NULL,
	[Quantity] [int] NULL,
	[UnitAmount] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AdminAccount] ([UserName], [UserPwd]) VALUES (N'admin', N'123')
GO
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'521H0468', N'Nguyễn Thanh Nguyên', N'Long An')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000001', N'Nguyễn Văn A', N'Cần Đước')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000002', N'Trần Thị B', N'Q4, TPHCM')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000003', N'Lê Hồng C', N'Q5, TPHCM')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000004', N'Phạm Minh Đức', N'Bình Thạnh, TPHCM')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000005', N'Hoàng Thị D', N'Tân Phú, TPHCM')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000006', N'Đinh Xuân Hưng', N'Q8, TPHCM')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000007', N'Bùi Ngọc Anh', N'Q7, TPHCM')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000008', N'Vũ Quốc Huy', N'Sóc Trăng')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000009', N'Lý Thanh Tùng', N'Q4, TPHCM')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000010', N'Hồ Thị Ngân', N'Q4, TPHCM')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000011', N'Nguyễn Văn Thuận', N'Long An')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000012', N'Nguy?n Van Tèo', N'Cao B?ng')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000013', N'Nguy?n Van Tám', N'Cao B?ng')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000014', N'Nguyễn Thanh Bình', N'Long An')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000015', N'John', N'Washington')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000016', N'Jack', N'Bến Tre')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000017', N'Lý Hải', N'Bến Tre')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000018', N'Nguyễn Thái Tùng', N'Bình Thuận')
INSERT [dbo].[Customer] ([CustID], [CustName], [Address]) VALUES (N'CID0000019', N'Nguyễn Phụng Tiên', N'Hà Tiên')
GO
INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Size]) VALUES (N'A0000001', N'Iphone 11', 13000000, 50)
INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Size]) VALUES (N'A0000002', N'Iphone 11 Pro', 14000000, 50)
INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Size]) VALUES (N'A0000003', N'Iphone 11 Pro Max', 15000000, 50)
INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Size]) VALUES (N'A0000004', N'Iphone 12', 16000000, 50)
INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Size]) VALUES (N'A0000005', N'Iphone 12 Pro', 17000000, 50)
INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Size]) VALUES (N'A0000006', N'Iphone 12 Pro Max', 18000000, 50)
INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Size]) VALUES (N'A0000007', N'Iphone 13', 19000000, 50)
INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Size]) VALUES (N'A0000008', N'Iphone 13 Pro', 20000000, 50)
INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Size]) VALUES (N'A0000009', N'Iphone 11 Pro Max', 21000000, 50)
INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Size]) VALUES (N'A0000010', N'Iphone 14 Pro', 23000000, 20)
INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Size]) VALUES (N'A0000011', N'Iphone 15 Pro Max', 40000000, 32)
GO
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000001', CAST(N'2023-12-23' AS Date), N'521H0468')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000002', CAST(N'2023-09-24' AS Date), N'CID0000001')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000003', CAST(N'2023-05-25' AS Date), N'CID0000002')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000004', CAST(N'2023-11-09' AS Date), N'CID0000003')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000005', CAST(N'2023-03-27' AS Date), N'CID0000004')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000006', CAST(N'2023-04-28' AS Date), N'CID0000005')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000007', CAST(N'2023-07-21' AS Date), N'CID0000006')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000008', CAST(N'2023-05-12' AS Date), N'CID0000007')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000009', CAST(N'2023-01-13' AS Date), N'CID0000008')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000010', CAST(N'2023-12-05' AS Date), N'CID0000009')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000011', CAST(N'2023-07-17' AS Date), N'CID0000010')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000012', CAST(N'2023-10-21' AS Date), N'CID0000012')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000013', CAST(N'2023-10-21' AS Date), N'CID0000013')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000015', CAST(N'2023-10-21' AS Date), NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000017', CAST(N'2023-10-21' AS Date), NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000018', CAST(N'2023-10-21' AS Date), N'CID0000014')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000019', CAST(N'2023-10-21' AS Date), N'CID0000015')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000020', CAST(N'2023-10-21' AS Date), N'CID0000016')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000021', CAST(N'2023-10-21' AS Date), N'CID0000017')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustID]) VALUES (N'OID000022', CAST(N'2023-10-21' AS Date), N'CID0000019')
GO
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000001', N'OID000001', N'A0000001', 2, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000002', N'OID000001', N'A0000002', 1, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000003', N'OID000002', N'A0000003', 2, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000004', N'OID000003', N'A0000004', 1, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000005', N'OID000004', N'A0000005', 3, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000006', N'OID000004', N'A0000006', 2, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000007', N'OID000005', N'A0000007', 1, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000008', N'OID000006', N'A0000008', 3, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000009', N'OID000006', N'A0000009', 2, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000010', N'OID000007', N'A0000007', 1, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000011', N'OID000008', N'A0000008', 2, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'ODT000012', N'OID000009', N'A0000009', 3, N'Đồng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000013', N'OID000012', N'A0000008', 1, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000014', N'OID000013', N'A0000008', 1, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000016', NULL, N'A0000002', 4, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000017', N'OID000018', N'A0000004', 3, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000018', N'OID000018', N'A0000006', 2, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000019', N'OID000019', N'A0000004', 3, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000020', N'OID000019', N'A0000007', 2, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000021', N'OID000020', N'A0000001', 3, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000022', N'OID000020', N'A0000006', 2, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000023', N'OID000021', N'A0000005', 2, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000024', N'OID000021', N'A0000007', 3, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000025', N'OID000022', N'A0000003', 3, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000026', N'OID000022', N'A0000005', 2, N'Ð?ng')
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ItemID], [Quantity], [UnitAmount]) VALUES (N'OTD000027', N'OID000022', N'A0000008', 1, N'Ð?ng')
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([CustID])
REFERENCES [dbo].[Customer] ([CustID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
/****** Object:  StoredProcedure [dbo].[P_AddOrderAndGetID]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_AddOrderAndGetID]
    @CustName NVARCHAR(255),
	@CustAddress NVARCHAR(255)
AS
BEGIN
	DECLARE @NewOrderID VARCHAR(255)
	DECLARE @CustID VARCHAR(255)

    -- Tạo một bản ghi mới trong bảng Customer
    EXEC P_InsertCustomer @CustName, @CustAddress
	    -- Lấy CustID của bản ghi mới thêm vào
    SET @CustID = (SELECT CustID FROM Customer WHERE CustName = @CustName)
        -- Tạo một bản ghi mới trong bảng Order
	SET @NewOrderID = dbo.Fun_GenerateOrderID()
    INSERT INTO [Order] (OrderID, OrderDate, CustID)
    VALUES (@NewOrderID, GETDATE(), @CustID)
END
GO
/****** Object:  StoredProcedure [dbo].[P_AddOrderAndOrderDetail]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_AddOrderAndOrderDetail]
    @CustName NVARCHAR(255),
    @CustAddress NVARCHAR(255),
    @ItemID VARCHAR(255),
    @ItemName NVARCHAR(255),
    @Quantity INT
AS
BEGIN
    -- Tạo một biến để lưu trữ OrderID
    DECLARE @OrderID VARCHAR(255)
	DECLARE @CustID VARCHAR(255)
	DECLARE @NewOrdetDetailID VARCHAR(255)

	SET @CustID = (SELECT CustID FROM Customer WHERE CustName = @CustName)
    -- Lấy OrderID của bản ghi mới thêm vào
    SET @OrderID = (SELECT OrderID FROM [Order] WHERE CustID = @CustID)

    -- Tạo một bản ghi mới trong bảng OrderDetail
	SET @NewOrdetDetailID = dbo.Fun_GenerateOrderDetailID()
    INSERT INTO OrderDetail (ID, OrderID, ItemID, Quantity, UnitAmount)
    VALUES (@NewOrdetDetailID, @OrderID, @ItemID, @Quantity, 'Đồng')
END
GO
/****** Object:  StoredProcedure [dbo].[P_DeleteCustomer]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_DeleteCustomer]
    @CustID VARCHAR(255)
AS
BEGIN
	DECLARE @OrderID VARCHAR(255)

	SET @OrderID = (SELECT OrderID from [Order] Where CustID = @CustID);
	DELETE FROM OrderDetail WHERE OrderID = @OrderID;
	DELETE FROM [Order] WHERE CustID = @CustID;
    DELETE FROM Customer WHERE CustID = @CustID;
		
	DECLARE @NewID INT;

    -- Trích xuất phần số từ CustID và chuyển đổi thành INT
    SELECT @NewID = CAST(SUBSTRING(CustID, 4, LEN(CustID) - 3) AS INT)
    FROM Customer
    WHERE CustID > @CustID;

    -- Cập nhật các CustID sau hàng bị xóa
    UPDATE Customer
    SET @NewID = @NewID - 1, CustID = 'CID' + RIGHT('0000000' + CAST(@NewID AS VARCHAR(10)), 7)
    WHERE CustID > @CustID;
END;
GO
/****** Object:  StoredProcedure [dbo].[P_DeleteItem]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_DeleteItem]
    @ItemID VARCHAR(255)
AS
BEGIN
    -- Xóa item từ bảng "Item" dựa trên ItemID
    DELETE FROM Item WHERE ItemID = @ItemID;
	DECLARE @NewID INT;

    -- Lấy ItemID mới cho các bản ghi còn lại
    SELECT @NewID = CAST(RIGHT(ItemID, LEN(ItemID) - 1) AS INT)
    FROM Item
    WHERE ItemID > @ItemID;

    -- Cập nhật các ItemID sau hàng bị xóa
    UPDATE Item
    SET @NewID = @NewID - 1, ItemID = 'A' + RIGHT('0000000' + CAST(@NewID AS VARCHAR(10)), 7)
    WHERE ItemID > @ItemID;
END;
GO
/****** Object:  StoredProcedure [dbo].[P_GetReport]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_GetReport]
	@OrderID VARCHAR(255)
AS
BEGIN
	SELECT
    O.OrderDate,
    C.CustName,
    C.Address,
    OD.ItemID,
    I.ItemName,
    I.Price,
    OD.Quantity
	FROM [Order] O
	INNER JOIN Customer C ON O.CustID = C.CustID
	INNER JOIN OrderDetail OD ON O.OrderID = OD.OrderID
	INNER JOIN Item I ON OD.ItemID = I.ItemID
	WHERE O.OrderID = @OrderID;
END;
GO
/****** Object:  StoredProcedure [dbo].[P_GetTotalQuantitySold]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_GetTotalQuantitySold]
AS
BEGIN
    SELECT 
        I.ItemID,
        I.ItemName,
        SUM(OD.Quantity) AS TotalQuantitySold
    FROM 
        Item I
    INNER JOIN 
        OrderDetail OD ON I.ItemID = OD.ItemID
    GROUP BY 
        I.ItemID, I.ItemName
END
GO
/****** Object:  StoredProcedure [dbo].[P_GetTotalRevenueOfItem]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[P_GetTotalRevenueOfItem]
AS
BEGIN
	SELECT 
			I.ItemName,
			SUM(I.Price * OD.Quantity) AS Revenue
		FROM 
			Item I
		INNER JOIN 
			OrderDetail OD ON I.ItemID = OD.ItemID
		GROUP BY 
			I.ItemName
END;
GO
/****** Object:  StoredProcedure [dbo].[P_InsertCustomer]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_InsertCustomer]
    @CustName NVARCHAR(255),
    @Address NVARCHAR(50)
AS
BEGIN
    -- Tạo một biến để lưu ItemID
    DECLARE @NewCustID VARCHAR(255)

    -- Tạo ItemID mới dựa trên số lượng bản ghi hiện có
    SELECT @NewCustID = 'CID' + RIGHT('0000000' + CAST((SELECT COUNT(*) FROM Customer) AS VARCHAR(7)), 7)

    -- Chèn dữ liệu mới vào bảng "Item"
    INSERT INTO Customer(CustID, CustName, Address)
    VALUES (@NewCustID, @CustName, @Address)
END;
GO
/****** Object:  StoredProcedure [dbo].[P_InsertItem]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_InsertItem]
    @ItemName NVARCHAR(255),
    @Price INT,
    @Size NVARCHAR(50)
AS
BEGIN
    -- Tạo một biến để lưu ItemID
    DECLARE @NewItemID VARCHAR(255)

    -- Tạo ItemID mới dựa trên số lượng bản ghi hiện có
    SELECT @NewItemID = 'A' + RIGHT('0000000' + CAST((SELECT COUNT(*) FROM Item) + 1 AS VARCHAR(7)), 7)

    -- Chèn dữ liệu mới vào bảng "Item"
    INSERT INTO Item (ItemID, ItemName, Price, Size)
    VALUES (@NewItemID, @ItemName, @Price, @Size)
END;
GO
/****** Object:  StoredProcedure [dbo].[P_UpdateCustomer]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_UpdateCustomer]
    @CustID VARCHAR(255),
    @CustName NVARCHAR(255),
    @Address  NVARCHAR(255)
AS
BEGIN
    UPDATE Customer
    SET CustName = @CustName,
        Address = @Address
    WHERE CustID = @CustID;
END;
GO
/****** Object:  StoredProcedure [dbo].[P_UpdateItem]    Script Date: 10/21/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_UpdateItem]
    @ItemID VARCHAR(255),
    @ItemName NVARCHAR(255),
    @Price INT,
    @Size int
AS
BEGIN
    UPDATE Item
    SET ItemName = @ItemName,
        Price = @Price,
        Size = @Size
    WHERE ItemID = @ItemID;
END;
GO
