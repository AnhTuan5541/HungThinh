USE [eSIGN]
GO
/****** Object:  Table [dbo].[application]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_type] [int] NULL,
	[id_card_user_require] [varchar](100) NULL,
	[name_user_require] [varchar](100) NULL,
	[id_card_user_create] [varchar](100) NULL,
	[id_system] [int] NULL,
	[id_card_system_owner] [varchar](100) NULL,
	[bussiness_justification] [nvarchar](max) NULL,
	[additional_comments] [nvarchar](max) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[id_card_manager] [varchar](100) NULL,
	[name_manager] [varchar](100) NULL,
	[value_sign] [int] NULL,
	[file] [nvarchar](max) NULL,
	[application_no] [varchar](100) NULL,
	[id_severity] [int] NULL,
	[file_name] [nvarchar](500) NULL,
	[id_factory] [int] NULL,
	[user_rate_value] [varchar](50) NULL,
	[user_rate_comment] [nvarchar](max) NULL,
	[id_sub_system] [int] NULL,
 CONSTRAINT [application_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factory]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[factory] [nvarchar](50) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_banner]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_banner](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](500) NULL,
	[content] [nvarchar](max) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_ht_banner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_banner_image]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_banner_image](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[id_banner] [tinyint] NULL,
	[image_name] [nvarchar](50) NULL,
	[file_url] [nvarchar](max) NULL,
	[file_name] [nvarchar](50) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_ht_banner_image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_footer]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_footer](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[x] [nvarchar](200) NULL,
	[facebook] [nvarchar](200) NULL,
	[instagram] [nvarchar](200) NULL,
	[linkedlin] [nvarchar](200) NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_ht_footer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ho_so_nang_luc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ho_so_nang_luc](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[file_name] [nvarchar](200) NULL,
	[file_url] [nvarchar](max) NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_ht_ho_so_nang_luc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_lien_he]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_lien_he](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[dia_chi] [nvarchar](150) NULL,
	[dien_thoai] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[dia_chi_google_map] [nvarchar](500) NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_ht_lien_he] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_linh_vuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_linh_vuc](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[linh_vuc] [nvarchar](100) NULL,
	[detail] [nvarchar](max) NULL,
	[icon] [nvarchar](200) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_ht_linh_vuc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_nang_luc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_nang_luc](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[nang_luc] [nvarchar](50) NULL,
	[detail] [nvarchar](50) NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_ht_nang_luc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_project]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_project](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project] [nvarchar](500) NULL,
	[detail] [nvarchar](max) NULL,
	[file_url] [nvarchar](max) NULL,
	[file_name] [nvarchar](200) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_ht_project] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_role]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_role](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_ht_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_tin_tuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_tin_tuc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tin_tuc] [nvarchar](500) NULL,
	[detail] [nvarchar](max) NULL,
	[file_url] [nvarchar](max) NULL,
	[file_name] [nvarchar](200) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_ht_tin_tuc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_user]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_user](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](max) NULL,
	[email] [nvarchar](100) NULL,
	[fullname] [nvarchar](100) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[id_role] [tinyint] NULL,
 CONSTRAINT [PK_ht_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ht_ve_chung_toi]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ht_ve_chung_toi](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](500) NULL,
	[detail] [nvarchar](max) NULL,
	[file_url] [nvarchar](max) NULL,
	[file_name] [nvarchar](100) NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_ht_ve_chung_toi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[log_info]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log_info](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[id_card] [varchar](100) NULL,
	[info] [nvarchar](1000) NULL,
	[type_log] [varchar](100) NULL,
	[function] [varchar](100) NULL,
 CONSTRAINT [log_info_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[note]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[note](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_card] [varchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[note] [varchar](100) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[email] [varchar](100) NULL,
 CONSTRAINT [PK_note] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[owner]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[owner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_card] [varchar](100) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [owner_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [role_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[severity]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[severity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[severity] [varchar](100) NULL,
	[description] [varchar](1000) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [severity_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sign_flow]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sign_flow](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_application] [int] NULL,
	[id_card] [varchar](100) NULL,
	[sequence] [int] NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[value_sign] [int] NULL,
	[comment] [varchar](100) NULL,
	[file] [nvarchar](max) NULL,
	[sign_at] [datetime] NULL,
	[file_name] [nvarchar](500) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [sign_flow_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[system]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[system] [varchar](100) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [system_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[system_owner]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_owner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_system] [int] NULL,
	[id_card] [varchar](100) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [system_owner_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](100) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [type_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_card] [varchar](100) NULL,
	[password] [nvarchar](max) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[name] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[title] [varchar](100) NULL,
	[department] [nvarchar](100) NULL,
	[company] [varchar](100) NULL,
	[display_name] [varchar](100) NULL,
	[id_card_manager] [varchar](100) NULL,
 CONSTRAINT [User_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_role] [int] NULL,
	[id_user] [int] NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [user_role_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[value_sign]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[value_sign](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value_sign] [varchar](100) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [value_sign_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[application] ADD  CONSTRAINT [DF__applicati__creat__38996AB5]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[application] ADD  CONSTRAINT [DF__applicati__updat__398D8EEE]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[factory] ADD  CONSTRAINT [DF_factory_create_at]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[factory] ADD  CONSTRAINT [DF_factory_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[ht_banner] ADD  CONSTRAINT [DF_ht_banner_create_at]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[ht_banner] ADD  CONSTRAINT [DF_ht_banner_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[ht_banner_image] ADD  CONSTRAINT [DF_ht_banner_image_create_at]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[ht_banner_image] ADD  CONSTRAINT [DF_ht_banner_image_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[ht_footer] ADD  CONSTRAINT [DF_ht_footer_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[ht_ho_so_nang_luc] ADD  CONSTRAINT [DF_ht_ho_so_nang_luc_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[ht_lien_he] ADD  CONSTRAINT [DF_ht_lien_he_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[ht_linh_vuc] ADD  CONSTRAINT [DF_ht_linh_vuc_create_at]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[ht_linh_vuc] ADD  CONSTRAINT [DF_ht_linh_vuc_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[ht_nang_luc] ADD  CONSTRAINT [DF_ht_nang_luc_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[ht_project] ADD  CONSTRAINT [DF_ht_project_create_at]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[ht_project] ADD  CONSTRAINT [DF_ht_project_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[ht_tin_tuc] ADD  CONSTRAINT [DF_ht_tin_tuc_create_at]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[ht_tin_tuc] ADD  CONSTRAINT [DF_ht_tin_tuc_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[ht_user] ADD  CONSTRAINT [DF_ht_user_create_at]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[ht_user] ADD  CONSTRAINT [DF_ht_user_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[ht_ve_chung_toi] ADD  CONSTRAINT [DF_ht_ve_chung_toi_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[log_info] ADD  CONSTRAINT [DF__log_info__create__36B12243]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[log_info] ADD  CONSTRAINT [DF__log_info__update__37A5467C]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[note] ADD  CONSTRAINT [DF_note_create_at]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[note] ADD  CONSTRAINT [DF_note_update_at]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[owner] ADD  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[owner] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[severity] ADD  CONSTRAINT [DF__severity__create__60A75C0F]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[severity] ADD  CONSTRAINT [DF__severity__update__619B8048]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[sign_flow] ADD  CONSTRAINT [DF__sign_flow__creat__4BAC3F29]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[sign_flow] ADD  CONSTRAINT [DF__sign_flow__updat__4CA06362]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[system] ADD  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[system] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[system_owner] ADD  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[system_owner] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[type] ADD  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[type] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__create_at__239E4DCF]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__update_at__24927208]  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[user_role] ADD  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[user_role] ADD  DEFAULT (getdate()) FOR [update_at]
GO
ALTER TABLE [dbo].[value_sign] ADD  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[value_sign] ADD  DEFAULT (getdate()) FOR [update_at]
GO
/****** Object:  StoredProcedure [dbo].[AddLogInfo]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLogInfo]
@idCard varchar(100),
@info nvarchar(1000),
@typeLog varchar(100),
@function varchar(100)
AS 
BEGIN
	INSERT INTO eSIGN.dbo.log_info
	(create_at, update_at, id_card, info, type_log, [function])
	VALUES(getdate(), getdate(), @idCard, @info, @typeLog, @function);
END
GO
/****** Object:  StoredProcedure [dbo].[AddUserInfo]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUserInfo]
	@idCard VARCHAR(100),
	@name	NVARCHAR(100) = '',
	@email NVARCHAR(100) = '',
	@title NVARCHAR(100) = '',
	@department nvarchar(100) = '',
	@company NVARCHAR(100) = '',
	@password NVARCHAR(100) = '',
	@note NVARCHAR(100) = '',
	@displayName NVARCHAR(100) = '',
	@id_card_manager NVARCHAR(100) = '',
	@display_name_manager NVARCHAR(100) = '',
	@email_manager NVARCHAR(100) = '',
	@department_manager NVARCHAR(100) = ''
AS 
BEGIN
	-- Kiểm tra xem user đã tồn tại hay chưa
	IF EXISTS (SELECT 1 FROM [user] WHERE id_card = @idCard)
	
    BEGIN
        -- User tồn tại, thực hiện update
        UPDATE [user] SET update_at = getdate()
        , name = @name
        , email = @email
        , title = @title
        , department = @department 
       	, company = @company
       	, display_name = @displayName
		, [password] = @password
		--, id_card_manager = @id_card_manager
        WHERE id_card = @idCard;

		-- Insert manager cua user neu ko ton tai
		IF NOT EXISTS (SELECT 1 FROM [user] WHERE id_card = @id_card_manager)
		BEGIN
			INSERT INTO eSIGN.dbo.[User]
			(id_card, create_at, update_at, name, email, title, department, company, display_name)
			VALUES(@id_card_manager, getdate(), getdate(), @display_name_manager, @email_manager, '', @department_manager, '', @display_name_manager);

			DECLARE @userManageridTwo INT;
			SELECT @userManageridTwo = SCOPE_IDENTITY();

			INSERT INTO eSIGN.dbo.user_role
			(id_role, id_user)
			VALUES(1, @userManageridTwo)
		END
    END
    ELSE
    BEGIN
        -- User không tồn tại, thực hiện insert
        INSERT INTO eSIGN.dbo.[User]
		(id_card, create_at, update_at, name, email, title, department, company, display_name, id_card_manager, [password])
		VALUES(@idCard, getdate(), getdate(), @name, @email, @title, @department, @company, @displayName, @id_card_manager, @password);

		DECLARE @userid INT;
		SELECT @userid = SCOPE_IDENTITY();

		INSERT INTO eSIGN.dbo.user_role
		(id_role, id_user)
		VALUES(1, @userid)

		-- Insert manager cua user neu ko ton tai
		IF NOT EXISTS (SELECT 1 FROM [user] WHERE id_card = @id_card_manager)
		BEGIN
			INSERT INTO eSIGN.dbo.[User]
			(id_card, create_at, update_at, name, email, title, department, company, display_name)
			VALUES(@id_card_manager, getdate(), getdate(), @display_name_manager, @email_manager, '', @department_manager, '', @display_name_manager);

			DECLARE @userManagerid INT;
			SELECT @userManagerid = SCOPE_IDENTITY();

			INSERT INTO eSIGN.dbo.user_role
			(id_role, id_user)
			VALUES(1, @userManagerid)
		END
    END

	IF EXISTS (SELECT 1 FROM note WHERE id_card = @idCard)
	BEGIN
		UPDATE note SET update_at = getdate()
        , name = @name
        , email = @email
		, note = @note
        WHERE id_card = @idCard;
	END
	ELSE
	BEGIN
		 -- User không tồn tại, thực hiện insert
        INSERT INTO note
		(id_card, create_at, update_at, name, email, note)
		VALUES(@idCard, getdate(), getdate(), @name, @email, @note);
	END
--    Log info
--    BEGIN
--		IF @@ERROR <> 0
--	    BEGIN
--		    INSERT INTO eSIGN.dbo.log_info ([function], info, create_at, update_at, id_card, type_log)
--		    VALUES(Concat ('proc-',OBJECT_NAME(@@PROCID)), @@ERROR, getdate(), getdate(), @idCard, 'ERROR');
--	    END
--		ELSE
--		BEGIN
--	    	INSERT INTO eSIGN.dbo.log_info
--			([function], info, create_at, update_at, id_card, type_log)
--			VALUES(Concat ('proc-',OBJECT_NAME(@@PROCID)), 'SUCCESS', getdate(), getdate(), @idCard, 'SUCCESS');
--		END
--    END
   
END
GO
/****** Object:  StoredProcedure [dbo].[CheckManagerSign]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckManagerSign]
@idApp int
AS 
BEGIN
	Select app.*, sys.[system], owner.display_name
	From application app
	Inner Join sign_flow sf On app.id = sf.id_application 
	Inner Join [system] sys On sys.id = app.id_system
	Inner Join [system_owner] so On so.id_card = app.id_card_system_owner
	Inner Join [user] owner On owner.id_card = so.id_card
	Where sf.[sequence] = 1
	And sf.value_sign = 3
	And app.id = @idApp
	Order By id Desc
END
GO
/****** Object:  StoredProcedure [dbo].[CheckSequence1Sign]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CheckSequence1Sign]
@applicationNo varchar(100)
AS 
BEGIN
	Select app.*
	From application app
	Inner Join sign_flow sf On app.id = sf.id_application 
	Where sf.[sequence] = 1
	And sf.value_sign = 1
	And app.application_no = @applicationNo
	Order By id Desc
END
GO
/****** Object:  StoredProcedure [dbo].[CheckUserInfo]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CheckUserInfo]
	@idCard VARCHAR(100)
AS 
BEGIN
	SELECT * FROM [user] WHERE id_card = @idCard
   
END


GO
/****** Object:  StoredProcedure [dbo].[CountApplication]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountApplication]
@idCard varchar(100)
AS 
BEGIN
	Declare @waiting int, @research int, @success int, @reject int, @publish int, @develop int, @uat int;
	
	Select @waiting = Count(*) From application Where value_sign = 1 and id_type <> 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @research = Count(*) From application Where value_sign = 2 and id_type <> 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @success = Count(*) From application Where value_sign = 3 and id_type <> 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @reject = Count(*) From application Where value_sign = 4 and id_type <> 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @publish = Count(*) From application Where value_sign = 5 and id_type <> 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @develop = Count(*) From application Where value_sign = 7 and id_type <> 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @uat = Count(*) From application Where value_sign = 8 and id_type <> 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	
	SELECT @waiting AS waiting, @research AS research, @success As success, @reject As reject, @publish As publish, @develop As develop, @uat As uat;
END
GO
/****** Object:  StoredProcedure [dbo].[CountApplicationAll]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountApplicationAll]
@idCard varchar(100)
AS 
BEGIN
	Declare @waiting int, @research int, @success int, @reject int, @publish int, @develop int, @uat int, @resolved int;
	
	Select @waiting = Count(*) From application Where value_sign = 1;
	Select @research = Count(*) From application Where value_sign = 2;
	Select @success = Count(*) From application Where value_sign = 3;
	Select @reject = Count(*) From application Where value_sign = 4;
	Select @publish = Count(*) From application Where value_sign = 5;
	Select @develop = Count(*) From application Where value_sign = 7;
	Select @uat = Count(*) From application Where value_sign = 8;
	Select @resolved = Count(*) From application Where value_sign = 9;
	
	SELECT @waiting AS waiting, @research AS research, @success As success, @reject As reject, @publish As publish, @develop As develop, @uat As uat, @resolved As resolved;
END
GO
/****** Object:  StoredProcedure [dbo].[CountApplicationSupport]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountApplicationSupport]
@idCard varchar(100)
AS 
BEGIN
	Declare @waiting int, @research int, @success int, @reject int, @publish int, @develop int, @uat int, @resolved int;
	
	Select @waiting = Count(*) From application Where value_sign = 1 and id_type = 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @research = Count(*) From application Where value_sign = 2 and id_type = 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @success = Count(*) From application Where value_sign = 3 and id_type = 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @reject = Count(*) From application Where value_sign = 4 and id_type = 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @publish = Count(*) From application Where value_sign = 5 and id_type = 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @develop = Count(*) From application Where value_sign = 7 and id_type = 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @uat = Count(*) From application Where value_sign = 8 and id_type = 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	Select @resolved = Count(*) From application Where value_sign = 9 and id_type = 3 and (application.id_card_user_create = @idCard Or application.id_card_user_require = @idCard);
	
	SELECT @waiting AS waiting, @research AS research, @success As success, @reject As reject, @publish As publish, @develop As develop, @uat As uat, @resolved As resolved;
END
GO
/****** Object:  StoredProcedure [dbo].[CreateApplication]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateApplication]
@id_type int,
@id_card_user_require varchar(100),
@name_user_require varchar(100),
@id_card_manager varchar(100),
@name_manager varchar(100),
@id_card_user_create varchar(100),
@id_system int,
@id_severity int,
@id_factory int,
@id_card_system_owner varchar(100),
@bussiness_justification nvarchar(MAX),
@additional_comments nvarchar(MAX),
@application_no varchar(100),
@fileUrl nvarchar(MAX),
@fileName nvarchar(500)
AS 
BEGIN
	INSERT INTO eSIGN.dbo.application
	(id_type, id_card_user_require, name_user_require, id_card_user_create, id_system, id_severity, id_factory, 
	id_card_system_owner, bussiness_justification, additional_comments, 
	create_at, update_at, id_card_manager, name_manager, value_sign, [file], application_no, [file_name])
	VALUES(@id_type, @id_card_user_require, @name_user_require, @id_card_user_create, @id_system, @id_severity, @id_factory, 
	@id_card_system_owner, @bussiness_justification, @additional_comments, 
	getdate(), getdate(), @id_card_manager, @name_manager, 1, @fileUrl, @application_no, @fileName);

	DECLARE @applicationId INT;
	SELECT @applicationId = SCOPE_IDENTITY();

	-- Send mail
	Declare @body_cnt nvarchar(max);
	Declare @mail_manager varchar(100), @mail_owner varchar(100), @name_owner varchar(100), @mail_require varchar(100), @mail_creator varchar(100), @name_creator varchar(100);
	Declare @mail_cc nvarchar(max);

	IF @id_type = 3
	BEGIN
	   --Insert sign flow 
	   --Neu id_type = 3 (đơn support) thì ko thêm manager kí
	   --Manager sign
  -- 		INSERT INTO eSIGN.dbo.sign_flow
		--(id_application, id_card, [sequence], create_at, update_at, value_sign, comment, [file])
		--VALUES(@applicationId, @id_card_manager, 1, getdate(), getdate(), 1, '', '');

		-- Dev sign
		INSERT INTO eSIGN.dbo.sign_flow
		(id_application, id_card, [sequence], create_at, update_at, value_sign, comment, [file])
		VALUES(@applicationId, @id_card_system_owner, 1, getdate(), getdate(), 1, '', '');

		-- Send mail
		SELECT
			@mail_owner = u1.email,
			@mail_require = u2.email,
			@mail_creator = u3.email,
			@name_owner = u1.display_name,
			@name_creator = u3.display_name,
			@mail_cc = CASE
				WHEN u2.email = u3.email THEN CONCAT(u1.email, ';', u2.email)
				ELSE CONCAT(u1.email, ';', u2.email, ';', u3.email)
			END
		FROM [user] u1
		JOIN [user] u2 ON u1.id_card = @id_card_system_owner AND u2.id_card = @id_card_user_require
		JOIN [user] u3 ON u3.id_card = @id_card_user_create;

		set @body_cnt = '
				<body>
					<p>Dear Mr/Mrs: '+ @name_owner +'!</p>
					<p>You have a request that needs confirm!</p>
					<p>Application No: '+ @application_no +'</p>
					<p>Requestor: '+ concat(@name_user_require,' (',@id_card_user_require,')') +'</p>
					<p>Application creator: '+ concat(@name_creator,' (',@id_card_user_create,')') +'</p>
					<p>Please click <a href="http://10.201.12.31:8005/admin/detail?sign=1&sequence=1&no='+ @application_no +'">here</a> to review this request.</p>
					<p>Thank you!</p>
				</body>
			'

		exec eSIGN.dbo.SendEmail 'eSign System(Confirm)', @mail_owner, @mail_cc, @body_cnt --subject, to, cc, body
	END
	ELSE
	BEGIN
	   --Insert sign flow 
	   --Manager sign
   		INSERT INTO eSIGN.dbo.sign_flow
		(id_application, id_card, [sequence], create_at, update_at, value_sign, comment, [file])
		VALUES(@applicationId, @id_card_manager, 1, getdate(), getdate(), 1, '', '');

		-- Dev sign
		INSERT INTO eSIGN.dbo.sign_flow
		(id_application, id_card, [sequence], create_at, update_at, value_sign, comment, [file])
		VALUES(@applicationId, @id_card_system_owner, 2, getdate(), getdate(), 1, '', '');

		-- Send mail
		SELECT
			@mail_manager = u1.email,
			@mail_require = u2.email,
			@mail_creator = u3.email,
			--@name_owner = u1.display_name,
			@name_creator = u3.display_name,
			@mail_cc = CASE
				WHEN u2.email = u3.email THEN CONCAT(u1.email, ';', u2.email)
				ELSE CONCAT(u1.email, ';', u2.email, ';', u3.email)
			END
		FROM [user] u1
		JOIN [user] u2 ON u1.id_card = @id_card_manager AND u2.id_card = @id_card_user_require
		JOIN [user] u3 ON u3.id_card = @id_card_user_create;

		set @body_cnt = '
				<body>
					<p>Dear Mr/Mrs: '+ @name_manager +'!</p>
					<p>You have a request that needs confirm!</p>
					<p>Application No: '+ @application_no +'</p>
					<p>Requestor: '+ concat(@name_user_require,' (',@id_card_user_require,')') +'</p>
					<p>Application creator: '+ concat(@name_creator,' (',@id_card_user_create,')') +'</p>
					<p>Please click <a href="http://10.201.12.31:8005/application/detail?sign=1&no='+ @application_no +'">here</a> to review this request.</p>
					<p>Thank you!</p>
				</body>
			'

		exec eSIGN.dbo.SendEmail 'eSign System(Confirm)', @mail_manager, @mail_cc, @body_cnt --subject, to, cc, body
	END
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteApplication]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[DeleteApplication]
@applicationNo varchar(100)
AS 
BEGIN
	Delete from [application] Where application_no = @applicationNo
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdminApplication]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminApplication]
@idCard varchar(100)
AS 
BEGIN
	
With lastValueSign As(
Select app.[id]
      ,app.[id_type]
      ,app.[id_card_user_require]
      ,app.[name_user_require]
      ,app.[id_card_user_create]
      ,app.[id_system]
      ,app.id_sub_system
      ,app.[id_card_system_owner]
      ,app.[bussiness_justification]
      ,app.[additional_comments]
      ,app.[create_at]
      ,app.[update_at]
      ,app.[id_card_manager]
      ,app.[name_manager]
      ,app.[value_sign]
      ,app.[application_no]
      ,app.[id_severity]
      ,app.[file_name]
      ,sys.[system]
      ,sub_sys.[system] as sub_system
      ,owner.display_name
	  ,sf.value_sign as 'sf_value_sign'
      ,value_sign.value_sign as name_value_sign
	  ,sf.[sequence]
	  ,sf.id as sf_id
	  , sf.sign_at as sf_sign_at
	  ,Row_number() Over (Partition By app.[id] Order By sf.[sequence] Desc) as row_num 
	From application app
	Inner Join sign_flow sf On app.id = sf.id_application
	Inner Join [system] sys On sys.id = app.id_system
	Left Join [system] sub_sys On sub_sys.id = app.id_sub_system
	Inner Join [system_owner] so On so.id_card = app.id_card_system_owner
	Inner Join [user] owner On owner.id_card = so.id_card
	Inner Join value_sign On value_sign.id = app.value_sign
	Where sf.id_card = @idCard 
	--And sf.[sequence] <> 1
)
Select * From lastValueSign Where row_num = 1 And sf_value_sign In (1,2,3,7,8,9) Order by id desc

END
GO
/****** Object:  StoredProcedure [dbo].[GetAdminApplicationByIdCard]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminApplicationByIdCard]
@idCard varchar(100)
AS 
BEGIN
With lastValueSign As (
	Select app.[id]
      ,app.[id_type]
      ,app.[id_card_user_require]
      ,app.[name_user_require]
      ,app.[id_card_user_create]
      ,app.[id_system]
	  ,app.id_sub_system
      ,app.[id_card_system_owner]
      ,app.[bussiness_justification]
      ,app.[additional_comments]
      ,app.[create_at]
      ,app.[update_at]
      ,app.[id_card_manager]
      ,app.[name_manager]
      ,app.[value_sign]
      ,app.[application_no]
      ,app.[id_severity]
      ,app.[file_name]
	, sys.[system]
	, sub_sys.[system] as sub_system
	, owner.display_name
	, value_sign.value_sign as name_value_sign
	, sf.[sequence]
	, sf.sign_at as sf_sign_at
	,Row_number() Over (Partition By app.[id] Order By sf.[sequence] Desc) as row_num 
	From application app
	Inner Join sign_flow sf On app.id = sf.id_application 
	Inner Join [system] sys On sys.id = app.id_system
	Left Join [system] sub_sys On sub_sys.id = app.id_sub_system
	Inner Join [system_owner] so On so.id_card = app.id_card_system_owner
	Inner Join [user] owner On owner.id_card = so.id_card
	Inner Join value_sign On value_sign.id = app.value_sign
	Where sf.id_card = @idCard 
	And sf.[sequence] <> 1
)
Select * 
From lastValueSign 
Where row_num = 1 
Order by id desc

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUser]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllUser]

AS 
Begin
	
Select u.*
, manager.display_name as manager_name
--, role.id as id_role
--, role.name as role_name 
From [user] u
--Left Join user_role ul On ul.id_user = u.id
--Left Join role On role.id = ul.id_role
Left Join [user] manager On u.id_card_manager = manager.id_card
Order by u.display_name ASC

End
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationByIdCard]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetApplicationByIdCard]
@idCard varchar(100),
@valueSign int
AS 
BEGIN
With lastValueSign As(
	Select app.id 
	, app.id_type
	, app.id_card_user_require
	, app.name_user_require
	, app.id_card_user_create
	, app.id_system
	, app.id_sub_system
	, app.id_card_system_owner
	, app.bussiness_justification
	, app.additional_comments
	, app.create_at
	, app.update_at
	, app.id_card_manager
	, app.name_manager
	, app.value_sign
	, app.application_no
	, app.id_severity
	, sys.[system]
	, sub_sys.[system] as sub_system
	, owner.display_name
	,sf.value_sign as 'sf_value_sign'
	, value_sign.value_sign as name_value_sign
	,sf.[sequence]
	,sf.id as sf_id
	, sf.sign_at as sf_sign_at
	,Row_number() Over (Partition By app.[id] Order By sf.[sequence] Desc) as row_num 
	From application app 
	Inner Join sign_flow sf On app.id = sf.id_application
	Inner Join [system] sys On sys.id = app.id_system
	Left Join [system] sub_sys On sub_sys.id = app.id_sub_system
	Inner Join [system_owner] so On so.id_card = app.id_card_system_owner
	Inner Join [user] owner On owner.id_card = so.id_card
	Inner Join value_sign On value_sign.id = app.value_sign
	--Inner Join sign_flow sf On sf.id_application = app.id
	Where (app.id_card_user_create = @idCard Or app.id_card_user_require = @idCard)
	And ( 0 = @valueSign Or app.value_sign = @valueSign)
	And app.id_type <> 3
	--Group By app.id 
	--, app.id_type
	--, app.id_card_user_require
	--, app.name_user_require
	--, app.id_card_user_create
	--, app.id_system
	--, app.id_sub_system
	--, app.id_card_system_owner
	--, app.bussiness_justification
	--, app.additional_comments
	--, app.create_at
	--, app.update_at
	--, app.id_card_manager
	--, app.name_manager
	--, app.value_sign
	--, app.application_no
	--, app.id_severity
	--, sys.[system]
	--, sub_sys.[system]
	--, owner.display_name
	--, value_sign.value_sign
	--Order By app.id Desc
)

Select * 
From lastValueSign 
Where row_num = 1 
Order by id desc

END
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationByValueSign]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetApplicationByValueSign]
@idValueSign int,
@startDate datetime,
@endDate datetime
AS 
BEGIN
	--Select app.id 
	--, app.id_type
	--, app.id_card_user_require
	--, app.name_user_require
	--, app.id_card_user_create
	--, app.id_system
	--, app.id_sub_system
	--, app.id_card_system_owner
	--, app.bussiness_justification
	--, app.additional_comments
	--, app.create_at
	--, app.update_at
	--, app.id_card_manager
	--, app.name_manager
	--, app.value_sign
	--, app.application_no
	--, app.id_severity
	--, sys.[system]
	--, sub_sys.[system] as sub_system
	--, owner.display_name
	--, value_sign.value_sign as name_value_sign
	--From application app 
	--Inner Join [system] sys On sys.id = app.id_system
	--Left Join [system] sub_sys On sub_sys.id = app.id_sub_system
	--Inner Join [system_owner] so On so.id_card = app.id_card_system_owner
	--Inner Join [user] owner On owner.id_card = so.id_card
	--Inner Join value_sign On value_sign.id = app.value_sign
	--Where (0 = @idValueSign Or app.value_sign = @idValueSign)
	--Order By app.id Desc

	With lastValueSign As (
	Select app.[id]
      ,app.[id_type]
      ,app.[id_card_user_require]
      ,app.[name_user_require]
      ,app.[id_card_user_create]
      ,app.[id_system]
	  ,app.id_sub_system
      ,app.[id_card_system_owner]
      ,app.[bussiness_justification]
      ,app.[additional_comments]
      ,app.[create_at]
      ,app.[update_at]
      ,app.[id_card_manager]
      ,app.[name_manager]
      ,app.[value_sign]
      ,app.[application_no]
      ,app.[id_severity]
      ,app.[file_name]
	, sys.[system]
	, sub_sys.[system] as sub_system
	, owner.display_name
	, value_sign.value_sign as name_value_sign
	, sf.[sequence]
	, sf.sign_at as sf_sign_at
	,Row_number() Over (Partition By app.[id] Order By sf.[sequence] Desc) as row_num 
	From application app
	Inner Join sign_flow sf On app.id = sf.id_application 
	Inner Join [system] sys On sys.id = app.id_system
	Left Join [system] sub_sys On sub_sys.id = app.id_sub_system
	Inner Join [system_owner] so On so.id_card = app.id_card_system_owner
	Inner Join [user] owner On owner.id_card = so.id_card
	Inner Join value_sign On value_sign.id = app.value_sign
	Where (0 = @idValueSign Or app.value_sign = @idValueSign)
	--And sf.[sequence] <> 1
	)
	Select * 
	From lastValueSign 
	Where row_num = 1 
	And ((sf_sign_at Between @startDate And @endDate) Or sf_sign_at is null)
	Order by id desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationSupportByIdCard]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetApplicationSupportByIdCard]
@idCard varchar(100),
@valueSign int
AS 
BEGIN
	Select app.id 
	, app.id_type
	, app.id_card_user_require
	, app.name_user_require
	, app.id_card_user_create
	, app.id_system
	, app.id_sub_system
	, app.id_card_system_owner
	, app.bussiness_justification
	, app.additional_comments
	, app.create_at
	, app.update_at
	, app.id_card_manager
	, app.name_manager
	, app.value_sign
	, app.application_no
	, app.id_severity
	, sys.[system]
	, sub_sys.[system] as sub_system
	, owner.display_name
	, value_sign.value_sign as name_value_sign
	From application app 
	Inner Join [system] sys On sys.id = app.id_system
	Left Join [system] sub_sys On sub_sys.id = app.id_sub_system
	Inner Join [system_owner] so On so.id_card = app.id_card_system_owner
	Inner Join [user] owner On owner.id_card = so.id_card
	Inner Join value_sign On value_sign.id = app.value_sign
	--Inner Join sign_flow sf On sf.id_application = app.id
	Where (app.id_card_user_create = @idCard Or app.id_card_user_require = @idCard)
	And ( 0 = @valueSign Or app.value_sign = @valueSign)
	And app.id_type = 3
	Group By app.id 
	, app.id_type
	, app.id_card_user_require
	, app.name_user_require
	, app.id_card_user_create
	, app.id_system
	, app.id_sub_system
	, app.id_card_system_owner
	, app.bussiness_justification
	, app.additional_comments
	, app.create_at
	, app.update_at
	, app.id_card_manager
	, app.name_manager
	, app.value_sign
	, app.application_no
	, app.id_severity
	, sys.[system]
	, sub_sys.[system]
	, owner.display_name
	, value_sign.value_sign
	Order By app.id Desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetFactory]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetFactory]
AS 
BEGIN
	Select * From factory Order By id Asc
END
GO
/****** Object:  StoredProcedure [dbo].[GetOwnerBySystem]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOwnerBySystem]
@idSystem int
AS 
BEGIN
	Select u.*, sys.[system]
	From [system] sys
	Inner Join system_owner so On so.id_system = sys.id
	Inner Join owner On owner.id_card = so.id_card
	Inner Join [user] u On u.id_card = owner.id_card
	Where sys.id = @idSystem
END
GO
/****** Object:  StoredProcedure [dbo].[GetRoleByIdCard]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetRoleByIdCard]
@idCard varchar(100)
AS 
Begin
	
Select role.id as id_role
, role.name as role_name 
From [user] u
Left Join user_role ul On ul.id_user = u.id
Left Join role On role.id = ul.id_role
Where u.id_card = @idCard

End
GO
/****** Object:  StoredProcedure [dbo].[GetSeverity]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSeverity]
AS 
BEGIN
	Select * From severity Order By id Asc
END
GO
/****** Object:  StoredProcedure [dbo].[GetSignAppByApplicationNo]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSignAppByApplicationNo]
@applicationNo varchar(100)
AS 
BEGIN
	Select app.[id]
      ,app.[id_type]
      ,app.[id_card_user_require]
      ,app.[name_user_require]
      ,app.[id_card_user_create]
      ,app.[id_system]
      ,app.[id_sub_system]
      ,app.[id_card_system_owner]
      ,app.[bussiness_justification]
      ,app.[additional_comments]
      ,app.[create_at]
      ,app.[update_at]
      ,app.[id_card_manager]
      ,app.[name_manager]
      ,app.[value_sign]
      ,app.[application_no]
      ,app.[id_severity]
      ,app.[file_name]
	  ,app.[file]
	  ,app.user_rate_value
	  ,app.user_rate_comment
	, sys.[system]
	, sub_sys.[system] as sub_system
	, owner.display_name as name_owner
	, user_create.display_name as name_user_create
	, type.type
	, sf.id as id_sign_flow
	, severity.severity
	, severity.description
	, factory.factory
	From application app
	Inner Join sign_flow sf On app.id = sf.id_application 
	Inner Join [system] sys On sys.id = app.id_system
	Left Join [system] sub_sys On sub_sys.id = app.id_sub_system
	Inner Join [system_owner] so On so.id_card = app.id_card_system_owner
	Inner Join [user] owner On owner.id_card = so.id_card
	Inner Join [user] user_create On user_create.id_card = app.id_card_user_create
	Inner Join [type] On type.id = app.id_type
	Inner Join [severity] On severity.id = app.id_severity
	Inner Join factory On factory.id = app.id_factory
	Where app.application_no = @applicationNo
	And sf.[sequence] = 1
	Order By id Desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetSignAppByApplicationNoAdmin]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSignAppByApplicationNoAdmin]
@applicationNo varchar(100), @sequence int
AS 
BEGIN
	Select app.[id]
      ,app.[id_type]
      ,app.[id_card_user_require]
      ,app.[name_user_require]
      ,app.[id_card_user_create]
      ,app.[id_system]
      ,app.[id_sub_system]
      ,app.[id_card_system_owner]
      ,app.[bussiness_justification]
      ,app.[additional_comments]
      ,app.[create_at]
      ,app.[update_at]
      ,app.[id_card_manager]
      ,app.[name_manager]
      ,app.[value_sign]
      ,app.[application_no]
      ,app.[id_severity]
      ,app.[file_name]
	  ,app.[file]
	  ,app.user_rate_value
	  ,app.user_rate_comment
	, sys.[system]
	, sub_sys.[system] as sub_system
	, owner.display_name as name_owner
	, user_create.display_name as name_user_create
	, type.type
	, sf.id as id_sign_flow
	, severity.severity
	, severity.description
	, factory.factory
	From application app
	Inner Join sign_flow sf On app.id = sf.id_application 
	Inner Join [system] sys On sys.id = app.id_system
	Left Join [system] sub_sys On sub_sys.id = app.id_sub_system
	Inner Join [system_owner] so On so.id_card = app.id_card_system_owner
	Inner Join [user] owner On owner.id_card = so.id_card
	Inner Join [user] user_create On user_create.id_card = app.id_card_user_create
	Inner Join [type] On type.id = app.id_type
	Inner Join [severity] On severity.id = app.id_severity
	Inner Join factory On factory.id = app.id_factory
	Where app.application_no = @applicationNo
	And sf.[sequence] = @sequence
	Order By id Desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetSignAppByIdCard]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSignAppByIdCard]
@idCard varchar(100)
AS 
BEGIN
	Select app.[id]
      ,app.[id_type]
      ,app.[id_card_user_require]
      ,app.[name_user_require]
      ,app.[id_card_user_create]
      ,app.[id_system]
	  , app.id_sub_system
      ,app.[id_card_system_owner]
      ,app.[bussiness_justification]
      ,app.[additional_comments]
      ,app.[create_at]
      ,app.[update_at]
      ,app.[id_card_manager]
      ,app.[name_manager]
      ,app.[value_sign]
      ,app.[application_no]
      ,app.[id_severity]
      ,app.[file_name]
	, sys.[system]
	, sub_sys.[system] as sub_system
	, owner.display_name
	, sf.sequence
	, sf.sign_at as sf_sign_at
	, value_sign.value_sign as name_value_sign
	From application app
	Inner Join sign_flow sf On app.id = sf.id_application 
	Inner Join [system] sys On sys.id = app.id_system
	Left Join [system] sub_sys On sub_sys.id = app.id_sub_system
	Inner Join [system_owner] so On so.id_card = app.id_card_system_owner
	Inner Join [user] owner On owner.id_card = so.id_card
	Inner Join value_sign On value_sign.id = app.value_sign
	Where sf.id_card = @idCard 
	And sf.[sequence] = 1
	And sf.value_sign = 1
	Group By app.[id]
      ,app.[id_type]
      ,app.[id_card_user_require]
      ,app.[name_user_require]
      ,app.[id_card_user_create]
      ,app.[id_system]
	  , app.id_sub_system
      ,app.[id_card_system_owner]
      ,app.[bussiness_justification]
      ,app.[additional_comments]
      ,app.[create_at]
      ,app.[update_at]
      ,app.[id_card_manager]
      ,app.[name_manager]
      ,app.[value_sign]
      ,app.[application_no]
      ,app.[id_severity]
      ,app.[file_name]
	, sys.[system]
	, sub_sys.[system]
	, owner.display_name
	, sf.sequence
	, sf.sign_at
	, value_sign.value_sign
	Order By id Desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetSignFlowByIdApplication]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSignFlowByIdApplication]
@idApp int
AS 
BEGIN
	SELECT app.application_no
	, app.id as app_id
	, vs.id as id_value_sign
	, vs.value_sign
	, sl.comment
	, sl.id_card 
	, sl.[sequence]
	, sl.[file]
	, sl.file_name
	, sl.sign_at
	, sl.start_date
	, sl.end_date
	, u.display_name
	From application app
	Inner Join sign_flow sl On app.id = sl.id_application
	Left Join [user] u On u.id_card = sl.id_card
	Inner Join value_sign vs On vs.id = sl.value_sign
	Where app.id = @idApp
	Order By sl.[sequence] Asc
END
GO
/****** Object:  StoredProcedure [dbo].[GetSignHistory]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSignHistory]
@idCard varchar(100)
AS 
BEGIN
	Select app.id 
	, app.id_type
	, app.id_card_user_require
	, app.name_user_require
	, app.id_card_user_create
	, app.id_system
	, app.id_sub_system
	, app.id_card_system_owner
	, app.bussiness_justification
	, app.additional_comments
	, app.create_at
	, app.update_at
	, app.id_card_manager
	, app.name_manager
	, app.value_sign
	, app.application_no
	, app.id_severity
	, sys.[system]
	, sub_sys.[system] as sub_system
	, owner.display_name
	, value_sign.value_sign as name_value_sign
	, sf.sign_at as sf_sign_at
	From application app 
	Inner Join [system] sys On sys.id = app.id_system
	Left Join [system] sub_sys On sub_sys.id = app.id_sub_system
	Inner Join [system_owner] so On so.id_card = app.id_card_system_owner
	Inner Join [user] owner On owner.id_card = so.id_card
	Inner Join value_sign On value_sign.id = app.value_sign
	Inner Join sign_flow sf On sf.id_application = app.id
	Where sf.id_card = @idCard
	And sf.sequence = 1
	Group By app.id 
	, app.id_type
	, app.id_card_user_require
	, app.name_user_require
	, app.id_card_user_create
	, app.id_system
	, app.id_sub_system
	, app.id_card_system_owner
	, app.bussiness_justification
	, app.additional_comments
	, app.create_at
	, app.update_at
	, app.id_card_manager
	, app.name_manager
	, app.value_sign
	, app.application_no
	, app.id_severity
	, sys.[system]
	, sub_sys.[system]
	, owner.display_name
	, value_sign.value_sign
	, sf.sign_at
	Order By app.id Desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetSystem]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSystem]
AS 
BEGIN
	Select * From [system] Order by system ASC
END
GO
/****** Object:  StoredProcedure [dbo].[GetSystemOwner]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSystemOwner]
AS 
BEGIN
	Select Distinct u.*
	From system_owner so
	Inner Join [user] u On u.id_card = so.id_card
END
GO
/****** Object:  StoredProcedure [dbo].[GetType]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetType]
AS 
BEGIN
	Select * From type
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByIdCard]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserByIdCard]
@idCard varchar(100)
AS 
Begin
	
Select u.*
, manager.display_name as manager_name
, role.id as id_role
, role.name as role_name 
From [user] u
Left Join user_role ul On ul.id_user = u.id
Left Join role On role.id = ul.id_role
Left Join [user] manager On u.id_card_manager = manager.id_card
Where u.id_card = @idCard
Order by u.display_name ASC

End
GO
/****** Object:  StoredProcedure [dbo].[HT_AddLinhVuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_AddLinhVuc]
	@linh_vuc nvarchar(100),
	@detail nvarchar(MAX),
	@icon nvarchar(200)
AS 
BEGIN
    INSERT INTO ht_linh_vuc (linh_vuc, detail, icon)
    VALUES (@linh_vuc, @detail, @icon)

END
GO
/****** Object:  StoredProcedure [dbo].[HT_AddProject]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_AddProject]
	@project nvarchar(500),
	@detail nvarchar(MAX),
	@file_url nvarchar(MAX),
	@file_name nvarchar(50)
AS 
BEGIN
    INSERT INTO ht_project (project, detail, file_url, [file_name])
    VALUES (@project, @detail, @file_url, @file_name)

END
GO
/****** Object:  StoredProcedure [dbo].[HT_AddRole]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_AddRole]
	@role nvarchar(100)
AS 
BEGIN
    INSERT INTO ht_role (role)
    VALUES (@role)

END
GO
/****** Object:  StoredProcedure [dbo].[HT_AddTinTuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_AddTinTuc]
	@tin_tuc nvarchar(500),
	@detail nvarchar(MAX),
	@file_url nvarchar(MAX),
	@file_name nvarchar(50)
AS 
BEGIN
    INSERT INTO ht_tin_tuc (tin_tuc, detail, file_url, [file_name])
    VALUES (@tin_tuc, @detail, @file_url, @file_name)

END
GO
/****** Object:  StoredProcedure [dbo].[HT_AddUser]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_AddUser]
	@username NVARCHAR(100),
	@email NVARCHAR(100),
	@fullname nvarchar(100),
	@password NVARCHAR(100),
	@id_role tinyint
AS 
BEGIN
    INSERT INTO ht_user (username, email, fullname, password, id_role)
    VALUES (@username, @email, @fullname, @password, @id_role)

END
GO
/****** Object:  StoredProcedure [dbo].[HT_CheckUserInfo]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_CheckUserInfo]
@username NVARCHAR(100)
AS 
BEGIN
	Select u.username, u.email, u.fullname, u.password, u.id_role, r.role
	FROM ht_user u
	Left join ht_role r On u.id_role = r.id
	WHERE u.username = @username
   
END


GO
/****** Object:  StoredProcedure [dbo].[HT_DeleteFileBanner]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_DeleteFileBanner]
@id_image tinyint
AS 
BEGIN
    Delete from ht_banner_image
	WHERE id = @id_image;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_DeleteLinhVuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_DeleteLinhVuc]
	@id tinyint
AS 
BEGIN
    Delete from ht_linh_vuc 
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_DeleteProject]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_DeleteProject]
	@id int
AS 
BEGIN
    Delete from ht_project
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_DeleteRole]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_DeleteRole]
@id_role tinyint
AS 
BEGIN
	Delete From ht_role where id = @id_role
    
END
GO
/****** Object:  StoredProcedure [dbo].[HT_DeleteTinTuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_DeleteTinTuc]
	@id int
AS 
BEGIN
    Delete from ht_tin_tuc
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_DeleteUser]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_DeleteUser]
@username NVARCHAR(100)
AS 
BEGIN
	IF @username <> 'tuannd' AND @username <> 'duannd'
	BEGIN
		DELETE FROM ht_user WHERE username = @username;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[HT_FrontGetBanner]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_FrontGetBanner]
	--@username NVARCHAR(100)
AS 
BEGIN
	Select b.title, b.content, bi.image_name, bi.file_url, bi.file_name 
	From ht_banner_image bi
	Left Join ht_banner b On b.id = bi.id_banner
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetBanner]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_GetBanner]
	--@username NVARCHAR(100)
AS 
BEGIN
	Select * From ht_banner
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetBannerImage]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetBannerImage]
	--@username NVARCHAR(100)
AS 
BEGIN
	Select * From ht_banner_image
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetFooter]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetFooter]
	--@id tinyint
AS 
BEGIN
    Select * from ht_footer
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetHoSoNangLuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetHoSoNangLuc]
	--@username NVARCHAR(100)
AS 
BEGIN
	Select * From ht_ho_so_nang_luc
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetLienHe]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetLienHe]
	--@id tinyint
AS 
BEGIN
    Select * from ht_lien_he
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetLinhVuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetLinhVuc]
	--@id tinyint
AS 
BEGIN
    Select * from ht_linh_vuc 
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetLinhVucChiTiet]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetLinhVucChiTiet]
	@id tinyint
AS 
BEGIN
    Select * from ht_linh_vuc 
	Where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetNangLuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetNangLuc]
	--@id tinyint
AS 
BEGIN
    Select * from ht_nang_luc 
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetProject]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_GetProject]
	--@id tinyint
AS 
BEGIN
    Select * from ht_project 
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetProjectChiTiet]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetProjectChiTiet]
	@id tinyint
AS 
BEGIN
    Select * from ht_project
	Where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetRole]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetRole]
	--@username NVARCHAR(100)
AS 
BEGIN
	Select * From ht_role
	Order by id desc
    
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetRoleByUsername]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetRoleByUsername]
@username varchar(100)
AS 
Begin
	
Select ht_role.id as id_role
, ht_role.role as role_name 
From ht_user u
Left Join ht_user_role ul On ul.id_user = u.id
Left Join ht_role On ht_role.id = ul.id_role
Where u.username = @username

End
GO
/****** Object:  StoredProcedure [dbo].[HT_GetTinTuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_GetTinTuc]
	--@id tinyint
AS 
BEGIN
    Select * from ht_tin_tuc
	Order by id desc
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetTinTucChiTiet]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetTinTucChiTiet]
	@id tinyint
AS 
BEGIN
    Select * from ht_tin_tuc
	Where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetTop5Project]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetTop5Project]
	--@id tinyint
AS 
BEGIN
    Select Top 5 * from ht_project
	Order by id desc
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetTop5TinTuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetTop5TinTuc]
	--@id tinyint
AS 
BEGIN
    Select Top 5 * from ht_tin_tuc
	Order by id desc
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetUser]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_GetUser]
	--@username NVARCHAR(100)
AS 
BEGIN
	Select u.username, u.email, u.fullname, u.create_at, u.update_at, u.id_role, r.role
	From ht_user u
	Left Join ht_role r On r.id = u.id_role
	where username <> 'admintuannd'
    
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetUserInfo]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetUserInfo]
	@username NVARCHAR(100)
AS 
BEGIN
	Select username, email, fullname
	From ht_user
	where username = @username
    
END
GO
/****** Object:  StoredProcedure [dbo].[HT_GetVeChungToi]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_GetVeChungToi]
	--@id tinyint
AS 
BEGIN
    Select * from ht_ve_chung_toi
	Order by id desc
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateBanner]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_UpdateBanner]
	@title nvarchar(100),
	@content nvarchar(MAX)
AS 
BEGIN
    UPDATE ht_banner 
	SET title = @title,
	content = @content,
	update_at = GETDATE()
	WHERE id = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateFileBanner]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_UpdateFileBanner]
@id_image tinyint,
@image_name nvarchar(50),
@file_url nvarchar(MAX),
@file_name nvarchar(50)
AS 
BEGIN
    UPDATE ht_banner_image
	SET image_name = @image_name,
	file_url = @file_url,
	[file_name] = @file_name,
	update_at = getdate()
	WHERE id = @id_image;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateFooter]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_UpdateFooter]
	@id tinyint,
	@x nvarchar(200),
	@facebook nvarchar(200),
	@instagram nvarchar(200),
	@linkedlin nvarchar(200)
AS 
BEGIN
    UPDATE ht_footer
	SET x = @x,
	facebook = @facebook,
	instagram = @instagram,
	linkedlin = @linkedlin,
	update_at = getdate()
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateHoSoNangLuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_UpdateHoSoNangLuc]
	@id tinyint,
	@file_url nvarchar(MAX),
	@file_name nvarchar(200)
AS 
BEGIN
    UPDATE ht_ho_so_nang_luc
	SET 
	file_url = CASE WHEN @file_url IS NOT NULL AND @file_url <> '' THEN @file_url ELSE file_url END,
    [file_name] = CASE WHEN @file_name IS NOT NULL AND @file_name <> '' THEN @file_name ELSE [file_name] END,
	update_at = getdate()
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateLienHe]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_UpdateLienHe]
	@id tinyint,
	@dia_chi nvarchar(150),
	@dien_thoai nvarchar(50),
	@email nvarchar(100),
	@dia_chi_google_map nvarchar(500)
AS 
BEGIN
    UPDATE ht_lien_he 
	SET dia_chi = @dia_chi,
	dien_thoai = @dien_thoai,
	email = @email,
	dia_chi_google_map = @dia_chi_google_map,
	update_at = getdate()
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateLinhVuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_UpdateLinhVuc]
	@id tinyint,
	@linh_vuc nvarchar(100),
	@detail nvarchar(MAX),
	@icon nvarchar(200)
AS 
BEGIN
    UPDATE ht_linh_vuc 
	SET linh_vuc = @linh_vuc,
	detail = @detail,
	icon = @icon,
	update_at = getdate()
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateNangLuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_UpdateNangLuc]
	@id tinyint,
	@nang_luc nvarchar(50),
	@detail nvarchar(50)
AS 
BEGIN
    UPDATE ht_nang_luc 
	SET nang_luc = @nang_luc,
	detail = @detail,
	update_at = getdate()
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateProject]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_UpdateProject]
	@id int,
	@project nvarchar(500),
	@detail nvarchar(MAX),
	@file_url nvarchar(MAX),
	@file_name nvarchar(500)
AS 
BEGIN
    UPDATE ht_project 
	SET project = @project,
	detail = @detail,
	file_url = CASE WHEN @file_url IS NOT NULL AND @file_url <> '' THEN @file_url ELSE file_url END,
    [file_name] = CASE WHEN @file_name IS NOT NULL AND @file_name <> '' THEN @file_name ELSE [file_name] END,
	update_at = getdate()
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateRole]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_UpdateRole]
	@id_role tinyint,
	@role nvarchar(100)
AS 
BEGIN
    UPDATE ht_role 
	SET role = @role
	WHERE id = @id_role;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateTinTuc]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_UpdateTinTuc]
	@id int,
	@tin_tuc nvarchar(500),
	@detail nvarchar(MAX),
	@file_url nvarchar(MAX),
	@file_name nvarchar(500)
AS 
BEGIN
    UPDATE ht_tin_tuc
	SET tin_tuc = @tin_tuc,
	detail = @detail,
	file_url = CASE WHEN @file_url IS NOT NULL AND @file_url <> '' THEN @file_url ELSE file_url END,
    [file_name] = CASE WHEN @file_name IS NOT NULL AND @file_name <> '' THEN @file_name ELSE [file_name] END,
	update_at = getdate()
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateUserInfo]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_UpdateUserInfo]
	@username NVARCHAR(100),
	@email NVARCHAR(100),
	@fullname nvarchar(100),
	@id_role tinyint
AS 
BEGIN
	-- Kiểm tra xem user đã tồn tại hay chưa
	IF EXISTS (SELECT 1 FROM ht_user WHERE username = @username)
	
    BEGIN
        -- User tồn tại, thực hiện update
        UPDATE ht_user SET update_at = getdate()
        , email = @email
        , fullname = @fullname
		, id_role = @id_role
        WHERE username = @username;
		
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateUserInfoWithPwd]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HT_UpdateUserInfoWithPwd]
	@username NVARCHAR(100),
	@email NVARCHAR(100),
	@fullname nvarchar(100),
	@password NVARCHAR(100),
	@id_role tinyint
AS 
BEGIN
	-- Kiểm tra xem user đã tồn tại hay chưa
	IF EXISTS (SELECT 1 FROM ht_user WHERE username = @username)
	
    BEGIN
        -- User tồn tại, thực hiện update
        UPDATE ht_user SET update_at = getdate()
        , email = @email
        , fullname = @fullname
		, [password] = @password
		, id_role = @id_role
        WHERE username = @username;
		
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UpdateVeChungToi]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_UpdateVeChungToi]
	@id int,
	@title nvarchar(500),
	@detail nvarchar(MAX),
	@file_url nvarchar(MAX),
	@file_name nvarchar(500)
AS 
BEGIN
    UPDATE ht_ve_chung_toi
	SET title = @title,
	detail = @detail,
	file_url = CASE WHEN @file_url IS NOT NULL AND @file_url <> '' THEN @file_url ELSE file_url END,
    [file_name] = CASE WHEN @file_name IS NOT NULL AND @file_name <> '' THEN @file_name ELSE [file_name] END,
	update_at = getdate()
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[HT_UploadFileBanner]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[HT_UploadFileBanner]
	@image_name nvarchar(50),
	@file_url nvarchar(MAX),
	@file_name nvarchar(50)
AS 
BEGIN
    INSERT INTO ht_banner_image(id_banner, image_name, file_url, [file_name])
    VALUES (1, @image_name, @file_url, @file_name)

END
GO
/****** Object:  StoredProcedure [dbo].[RateApplication]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RateApplication]
@idApp int,
@userid int,
@rateValue varchar(50),
@rateComment nvarchar(MAX)
AS 
BEGIN
	Update application
	Set user_rate_value = @rateValue,
	user_rate_comment = @rateComment
	Where id = @idApp
	And id_card_user_require = @userid

	--Send mail
	Declare @body_cnt nvarchar(MAX), @title varchar(100), @name_owner nvarchar(100), @application_no varchar(100), @mail_owner varchar(100)
	
	Select @application_no = app.application_no 
	, @name_owner = u.display_name
	, @mail_owner = u.email
	From application app 
	Inner Join [user] u On u.id_card = app.id_card_system_owner
	Where app.id = @idApp

	set @body_cnt = '
					<body>
						<p>Dear Mr/Mrs: '+ @name_owner +'</p>
						<p>Your application has been rated by user!</p>
						<p>Application No: '+ @application_no +'</p>
						<p>Please click <a href="http://10.201.12.31:8005/application/detail?sign=0&no='+ @application_no +'">here</a> to see detail application.</p>
						<p>Thank you!</p>
					</body>
				'

				Set @title = 'eSign System(User rate)'

				exec eSIGN.dbo.SendEmail @title, @mail_owner, '', @body_cnt --subject, to, cc, body
END
GO
/****** Object:  StoredProcedure [dbo].[SendEmail]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SendEmail]
	@Subject nvarchar(256) = '',
	@to nvarchar(256) = '',
	@cc nvarchar(256) = '',
	@body_content nvarchar(max) = '',
	@attachmentBase64 nvarchar(max) = NULL, -- Thêm tham số cho base64
    @attachmentFileName nvarchar(256) = NULL -- Thêm tham số cho tên file
AS
BEGIN
	--select @Subject
	--select *from msdb.dbo.sysmail_unsentitems
	--SELECT * FROM msdb.dbo.sysmail_sentitems order by sent_date desc
	--SELECT * FROM msdb.dbo.sysmail_faileditems
	--SELECT * FROM msdb.dbo.sysmail_profile

	-- Kiểm tra xem có file đính kèm không
    IF @attachmentBase64 IS NOT NULL
    BEGIN
        -- Tạo HTML để nhúng file
        SET @body_content = @body_content + '<br /><br />'
        SET @body_content = @body_content + '<strong>Attached file:</strong><br />'
        SET @body_content = @body_content + '<a href="data:application/octet-stream;base64,' + @attachmentBase64 + '" download="' + @attachmentFileName + '">' + @attachmentFileName + '</a>'
    END

	declare @bcc nvarchar(256) = 'tuan.nguyenduc@amkor.com' 
	EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'TFA_NOTICE',
    @recipients = @to,
    @copy_recipients = @cc,
	@blind_copy_recipients = @bcc,
    @subject = @Subject,
    @body = @body_content,
    @body_format = 'HTML';

END
GO
/****** Object:  StoredProcedure [dbo].[SignApplication]    Script Date: 3/8/2025 4:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SignApplication]
@signFlowId int,
@idType int,
@valueSign int,
@userId varchar(100),
@userIdForward varchar(100),
@comment varchar(100),
@fileUrl nvarchar(MAX),
@fileName nvarchar(500),
@startDate datetime,
@endDate datetime,
@subSystem varchar(100)
AS 
BEGIN
	IF EXISTS (SELECT 1 FROM sign_flow WHERE id = @signFlowId And id_card = @userId)
	BEGIN 
		Declare @sqUser int, @idApp int, @application_no varchar(100), @nextSqUser int
		--Lay application 
		SELECT @idApp = id_application FROM sign_flow WHERE id = @signFlowId And id_card = @userId

		--Lay application no
		SELECT @application_no = application_no FROM application WHERE id = @idApp

		--Lay sequence cua user hien tai
		SELECT @sqUser = [sequence] FROM sign_flow WHERE id = @signFlowId And id_card = @userId
		-- Set next sequence user = sequence cua user hien tai + 1
		Select @nextSqUser = @sqUser + 1

		--Declare for mail
		Declare @body_cnt nvarchar(max);
		Declare @title nvarchar(max);

		Declare @mail_require varchar(100), @name_user_require varchar(100), @id_card_user_require varchar(100)
			, @mail_creator varchar(100), @name_creator varchar(100), @id_card_user_create varchar(100)
			, @mail_signer varchar(100), @name_signer varchar(100), @id_card_user_signer varchar(100);
		Declare @mail_cc nvarchar(max);

		Select @mail_require = u.email, @name_user_require = u.display_name, @id_card_user_require = u.id_card From [user] u
								Inner Join application app On app.id_card_user_require = u.id_card
								Where app.id = @idApp

		Select @mail_creator = u.email, @name_creator = u.display_name, @id_card_user_create = u.id_card From [user] u
								Inner Join application app On app.id_card_user_create = u.id_card
								Where app.id = @idApp

		Select @mail_signer = u.email, @name_signer = u.display_name, @id_card_user_signer = u.id_card From [user] u
								Where u.id_card = @userId
		-- Ki don
		Declare @currentValueSign int
		--Lay value sign hien tai cua sign_flow
		SELECT @currentValueSign = value_sign FROM sign_flow WHERE id = @signFlowId And id_card = @userId
		IF @currentValueSign = 1 --Neu current value_sign la 1 (waiting) thi update
		BEGIN
			UPDATE eSIGN.dbo.sign_flow
			SET value_sign = @valueSign
			, sign_at = getdate()
			, comment = @comment
			, [file] = @fileUrl
			, file_name = @fileName
			, start_date = @startDate
			, end_date = @endDate
			WHERE id = @signFlowId
		END
		ELSE IF @currentValueSign IN (2, 3, 7, 8, 9) --Neu @currentValueSign IN (2, 3, 7, 8, 9) thi them sign_flow(de luu lai lich su ki)
		BEGIN
			INSERT INTO eSIGN.dbo.sign_flow
			(id_application, id_card, [sequence], create_at, update_at, value_sign, comment, [file], file_name, sign_at, start_date, end_date)
			VALUES(@idApp, @userId, @nextSqUser, getdate(), getdate(), @valueSign, @comment, @fileUrl, @fileName, getdate(), @startDate, @endDate);
		END

		-- Check neu sign_flow ko co next sq và kp đơn support
		IF @sqUser = 1 And @idType <> 3
		BEGIN
			-- Send mail
			declare @name_next_signer varchar(100), @mail_next_signer varchar(100)
			select @mail_next_signer = u.email, @name_next_signer = u.display_name
			From [user] u 
			Inner Join sign_flow sl On sl.id_card = u.id_card
			Where sl.id_application = @idApp And sl.sequence = @nextSqUser

			IF @valueSign = 3 --approval
			BEGIN
				Select @mail_cc = Concat(@mail_signer, ';', @mail_require, ';', @mail_creator)
				set @body_cnt = '
					<body>
						<p>Dear Mr/Mrs: '+ @name_next_signer +'</p>
						<p>You have a request that needs confirm!</p>
						<p>Application No: '+ @application_no +'</p>
						<p>Requestor: '+ concat(@name_user_require,' (',@id_card_user_require,')') +'</p>
						<p>Application creator: '+ concat(@name_creator,' (',@id_card_user_create,')') +'</p>
						<p>Please click <a href="http://10.201.12.31:8005/admin/detail?sign=1&sequence='+ CAST(@nextSqUser AS VARCHAR) +'&no='+ @application_no +'">here</a> to review this request.</p>
						<p>Thank you!</p>
					</body>
				'
				Set @title = 'eSign System(Approval)'

				Select 'SUCCESS' as status, 'Sign successfully' as message

				exec SendEmail @title, @mail_next_signer, @mail_cc, @body_cnt --subject, to, cc, body
			END
			ELSE IF @valueSign = 4 --rejected
			BEGIN
				UPDATE eSIGN.dbo.application 
				SET value_sign = @valueSign
				WHERE id = @idApp

				set @body_cnt = '
					<body>
						<p>Dear Mr/Mrs: '+ @name_user_require +'</p>
						<p>Your application is rejected!</p>
						<p>Application No: '+ @application_no +'</p>
						<p>Requestor: '+ concat(@name_user_require,' (',@id_card_user_require,')') +'</p>
						<p>Application creator: '+ concat(@name_creator,' (',@id_card_user_create,')') +'</p>
						<p>Please click <a href="http://10.201.12.31:8005/application/detail?sign=0&no='+ @application_no +'">here</a> to see detail application.</p>
						<p>Thank you!</p>
					</body>
				'

				Set @title = 'eSign System(Reject)'

				Select 'SUCCESS' as status, 'Sign successfully' as message
				exec SendEmail @title, @mail_require, @mail_signer, @body_cnt --subject, to, cc, body
			END
		END
		ELSE
		BEGIN
			-- Neu la don forward
			IF @valueSign = 6
			BEGIN
				--Them vao sign_flow mot nguoi ki moi
				Declare @lastSequence int
				Select @lastSequence = Max([sequence]) FROM sign_flow WHERE id_application = @idApp

				INSERT INTO eSIGN.dbo.sign_flow
				(id_application, id_card, [sequence], create_at, update_at, value_sign, comment, [file], file_name, sign_at)
				VALUES(@idApp, @userIdForward, @lastSequence + 1, getdate(), getdate(), 1, '', '', '', null);
		
				-- Check xem co assign cho system moi khong?
				Declare @idSubSystem int
				Set @idSubSystem = 0
				--Them sub_system neu forward có 
				IF @subSystem <> ''
				BEGIN
					--Kiem tra nếu đã có system trong bảng
					IF EXISTS (SELECT 1 FROM system WHERE system = @subSystem)
					BEGIN
						Select @idSubSystem = id From system Where system = @subSystem
					END
					ELSE --Nếu chưa có system thì thêm
					BEGIN
						INSERT INTO eSIGN.dbo.system
						(system)
						VALUES(@subSystem)

						Select @idSubSystem = SCOPE_IDENTITY();
					END
				END

				--Update lai status cua don la cho ky
				IF @idSubSystem = 0 
					BEGIN
						UPDATE eSIGN.dbo.application 
						SET value_sign = 1, id_card_system_owner = @userIdForward
						WHERE id = @idApp 	
					END
				ELSE
					BEGIN
						UPDATE eSIGN.dbo.application 
						SET value_sign = 1, id_sub_system = @idSubSystem, id_card_system_owner = @userIdForward
						WHERE id = @idApp 	
					END


				-- Send mail
				Declare @name_forwarded varchar(100), @name_forwarder varchar(100)
				, @mail_forwarded varchar(100), @mail_forwarder varchar(100)

				Select @name_forwarded = display_name From [user] where id_card = @userIdForward
				Select @name_forwarder = display_name From [user] where id_card = @userId
				Select @mail_forwarded = email From [user] where id_card = @userIdForward
				Select @mail_forwarder = email From [user] where id_card = @userId

				Select @mail_cc = Concat(@mail_forwarder, ';', @mail_require, ';', @mail_creator)
				set @body_cnt = '
						<body>
							<p>Dear Mr/Mrs: '+ @name_forwarded +'</p>
							<p>You have a request that forwarded by '+ @name_forwarder +'!</p>
							<p>Application No: '+ @application_no +'</p>
							<p>Requestor: '+ concat(@name_user_require,' (',@id_card_user_require,')') +'</p>
							<p>Application creator: '+ concat(@name_creator,' (',@id_card_user_create,')') +'</p>
							<p>Please click <a href="http://10.201.12.31:8005/admin/detail?sign=1&sequence='+ CAST(@nextSqUser AS VARCHAR) +'&no='+ @application_no +'">here</a> to review this request.</p>
							<p>Thank you!</p>
						</body>
					'
				Set @title = 'eSign System(Forward)'

				Select 'SUCCESS' as status, 'Sign successfully' as message
				exec SendEmail @title, @mail_forwarded, @mail_cc, @body_cnt --subject, to, cc, body
			END
			ELSE --Neu ko phai value_sign = 6 (Foward)
			BEGIN
				UPDATE eSIGN.dbo.application 
				SET value_sign = @valueSign
				WHERE id = @idApp
				Declare @value_sign_name varchar(100)
				Select @value_sign_name = value_sign From value_sign Where id = @valueSign

				-- Send mail
				set @body_cnt = '
						<body>
							<p>Dear Mr/Mrs: '+ @name_user_require +'</p>
							<p>Your application is '+ @value_sign_name +'!</p>
							<p>Application No: '+ @application_no +'</p>
							<p>Requestor: '+ concat(@name_user_require,' (',@id_card_user_require,')') +'</p>
							<p>Application creator: '+ concat(@name_creator,' (',@id_card_user_create,')') +'</p>
							<p>Please click <a href="http://10.201.12.31:8005/application/detail?sign=0&no='+ @application_no +'">here</a> to see detail application.</p>
							<p>Thank you!</p>
						</body>
					'
				set @title = 'eSign System('+ @value_sign_name +')'

				select 'SUCCESS' as status, 'Sign successfully' as message
				exec SendEmail @title, @mail_require, @mail_signer, @body_cnt --subject, to, cc, body
			END
			
		END
		
	END
	ELSE
	BEGIN
		Select 'FAIL' as status, 'User has not permission' as message
	END
	
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'loai don: Improvement, New development' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'application', @level2type=N'COLUMN',@level2name=N'id_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User danh gia application Tot/Pass : Ko tot/Not Good' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'application', @level2type=N'COLUMN',@level2name=N'user_rate_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User comment danh gia ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'application', @level2type=N'COLUMN',@level2name=N'user_rate_comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loai user yeu cau' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'type'
GO
