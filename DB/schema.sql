USE [Apartment_brokerage_DB]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 22/02/2026 19:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartments]    Script Date: 22/02/2026 19:38:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Price] [decimal](12, 2) NOT NULL,
	[Rooms] [int] NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[StatusId] [int] NOT NULL,
	[AgentId] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentStatuses]    Script Date: 22/02/2026 19:38:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apartments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_Agent] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agents] ([Id])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_Agent]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApartmentStatuses] ([Id])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_Status]
GO
/****** Object:  StoredProcedure [dbo].[Apartments_ChangeStatus]    Script Date: 22/02/2026 19:38:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Apartments_ChangeStatus]
(
    @Id INT,
    @StatusId INT
)
AS
BEGIN
    UPDATE Apartments
    SET StatusId = @StatusId
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Apartments_Create]    Script Date: 22/02/2026 19:38:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Apartments_Create]
(
    @Title NVARCHAR(200),
    @Description NVARCHAR(MAX),
    @Price INT,
    @Rooms INT,
    @City NVARCHAR(100),
    @Address NVARCHAR(200),
    @StatusId INT,
    @AgentId INT
)
AS
BEGIN
    INSERT INTO Apartments
    (
        Title,
        Description,
        Price,
        Rooms,
        City,
        Address,
        StatusId,
        AgentId,
        CreatedAt
    )
    VALUES
    (
        @Title,
        @Description,
        @Price,
        @Rooms,
        @City,
        @Address,
        @StatusId,
        @AgentId,
        GETDATE()
    );
END
GO
/****** Object:  StoredProcedure [dbo].[Apartments_GetAll]    Script Date: 22/02/2026 19:38:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Apartments_GetAll]
(
    @Search NVARCHAR(100) = NULL
)
AS
BEGIN
    SELECT
        A.Id,
        A.Title,
        A.Price,
        A.Rooms,
        A.City,
        A.Address,
        S.Name      AS StatusName,
        AG.FullName AS AgentName,
        A.CreatedAt
    FROM Apartments A
    JOIN ApartmentStatuses S ON A.StatusId = S.Id
    JOIN Agents AG ON A.AgentId = AG.Id
    WHERE
        @Search IS NULL
        OR A.Title LIKE N'%' + @Search + N'%'
        OR A.City  LIKE N'%' + @Search + N'%'
        OR A.Address LIKE N'%' + @Search + N'%'
    ORDER BY A.CreatedAt DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[Apartments_GetById]    Script Date: 22/02/2026 19:38:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Apartments_GetById]
(
    @Id INT
)
AS
BEGIN
    SELECT
        A.Id,
        A.Title,
        A.Description,
        A.Price,
        A.Rooms,
        A.City,
        A.Address,
        S.Name     AS StatusName,
        AG.FullName AS AgentName,
        AG.Phone,
        AG.Email,
        A.CreatedAt
    FROM Apartments A
    JOIN ApartmentStatuses S ON A.StatusId = S.Id
    JOIN Agents AG ON A.AgentId = AG.Id
    WHERE A.Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Apartments_Update]    Script Date: 22/02/2026 19:38:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Apartments_Update]
(
    @Id INT,
    @Title NVARCHAR(200),
    @Description NVARCHAR(MAX),
    @Price INT,
    @Rooms INT,
    @City NVARCHAR(100),
    @Address NVARCHAR(200),
    @StatusId INT,
    @AgentId INT
)
AS
BEGIN
    UPDATE Apartments
    SET
        Title = @Title,
        Description = @Description,
        Price = @Price,
        Rooms = @Rooms,
        City = @City,
        Address = @Address,
        StatusId = @StatusId,
        AgentId = @AgentId
    WHERE Id = @Id;
END
GO