USE [AdministradorReportes]
GO
/****** Object:  Table [dbo].[Description]    Script Date: 4/10/2018 12:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Description](
	[Code] [nchar](13) NOT NULL,
	[Name] [nchar](50) NULL,
	[Report] [nchar](3) NULL,
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 4/10/2018 12:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[ID] [nchar](4) NOT NULL,
	[Name] [nchar](20) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Member]    Script Date: 4/10/2018 12:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[ID] [int] NOT NULL,
	[Username] [nchar](30) NULL,
	[Password] [nchar](20) NULL,
	[AccessLevel] [nchar](8) NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 4/10/2018 12:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[Code] [nchar](3) NOT NULL,
	[Name] [nchar](27) NULL,
	[Location] [nchar](4) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Spreadsheet]    Script Date: 4/10/2018 12:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Spreadsheet](
	[Code] [int] NOT NULL,
	[Archive] [varbinary](max) NULL,
	--[Generated] [date] NULL,
	[Generated] [nchar](10) NULL,
	[Hour] [time] (7) NULL,
	[Description] [nchar](13) NULL,
 CONSTRAINT [PK_Spreadsheet] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Description]  WITH CHECK ADD  CONSTRAINT [FK_Report_Description] FOREIGN KEY([Report])
REFERENCES [dbo].[Report] ([Code])
GO
ALTER TABLE [dbo].[Description] CHECK CONSTRAINT [FK_Report_Description]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Location_Report] FOREIGN KEY([Location])
REFERENCES [dbo].[Location] ([ID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Location_Report]
GO
ALTER TABLE [dbo].[Spreadsheet]  WITH CHECK ADD  CONSTRAINT [FK_Description_Spreadsheet] FOREIGN KEY([Description])
REFERENCES [dbo].[Description] ([Code])
GO
ALTER TABLE [dbo].[Spreadsheet] CHECK CONSTRAINT [FK_Description_Spreadsheet]
GO

--User
GO
INSERT [dbo].[Member] ([ID], [Username], [Password], [AccessLevel]) VALUES (123456, N'Avanzado', N'Arkavia123456', N'Advanced')
INSERT [dbo].[Member] ([ID], [Username], [Password], [AccessLevel]) VALUES (789456, N'Medio', N'Arkavia789456', N'Medium')
INSERT [dbo].[Member] ([ID], [Username], [Password], [AccessLevel]) VALUES (123789, N'Básico', N'Arkavia123798', N'Basic')
GO
--User

--Location
GO
INSERT [dbo].[Location] ([ID], [Name]) VALUES (N'CDLV', N'Ciudad de los Valles')
INSERT [dbo].[Location] ([ID], [Name]) VALUES (N'LGVL', N'Longovilo')
GO
--Location

--Report
GO
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'1a', N'My Email Reports', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'1b', N'My Email Reports', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'2a', N'Overview', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'2b', N'Overview', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'3a', N'Incoming Mails', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'3b', N'Incoming Mails', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'4a', N'Sender Groups', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'4b', N'Sender Groups', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'5a', N'Geo Distributions', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'5b', N'Geo Distributions', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'6a', N'Outgoing Destinations', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'6b', N'Outgoing Destinations', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'7a', N'Outgoing Senders', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'7b', N'Outgoing Senders', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'8a', N'Internal Users', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'8b', N'Internal Users', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'9a', N'DLP Incidents', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'9b', N'DLP Incidents', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'10a', N'Message Filters', N'CDVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'10b', N'Message Filters', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'11a', N'High Volume Mail', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'11b', N'High Volume Mail', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'12a', N'Content Filters', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'12b', N'Content Filters', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'13a', N'Macro Detection', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'13b', N'Macro Detection', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'14a', N'DMARC Verification', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'14b', N'DMARC Verification', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'15a', N'Virus Types', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'15b', N'Virus Types', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'16a', N'URL Filtering', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'16b', N'URL Filtering', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'17a', N'Web Interaction Tracking', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'17b', N'Web Interaction Tracking', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'18a', N'Forged Email Detection', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'18b', N'Forged Email Detection', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'19a', N'Advanced Malware Protection', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'19b', N'Advanced Malware Protection', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'20a', N'AMP File Analysis', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'20b', N'AMP File Analysis', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'21a', N'AMP Verdict Updates', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'21b', N'AMP Verdict Updates', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'22a', N'Mailbox Auto Remedation', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'22b', N'Mailbox Auto Remedation', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'23a', N'Outbreak Filters', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'23b', N'Outbreak Filters', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'24a', N'TLS Connections', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'24b', N'TLS Connections', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'25a', N'Inbound SMTP Authentication', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'25b', N'Inbound SMTP Authentication', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'26a', N'Rate Limits', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'26b', N'Rate Limits', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'27a', N'System Capacity', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'27b', N'System	Capacity', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'28a', N'Reporting Data Availability', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'28b', N'Reporting Data Availabity', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'29a', N'Scheduled Reports', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'29b', N'Scheduled Reports', N'LGVL')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'30a', N'Archived Reports', N'CDLV')
INSERT [dbo].[Report] ([Code], [Name], [Location]) VALUES (N'30b', N'Archived Reports', N'LGVL')
GO
--Report

--Description

--Overview
GO
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('1img', N'Incoming Mail Graph', N'2a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('1ims', N'Incoming Mail Summary', N'2a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('1omg', N'Outgoing Mail Graph', N'2a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('1oms', N'Outgoing Mail Summary', N'2a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('2img', N'Incoming Mail Graph', N'2b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('2ims', N'Incoming Mail Summary', N'2b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('2omg', N'Outgoing Mail Graph', N'2b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('2oms', N'Outgoing Mail Summary', N'2b')

--Overview

--Incoming Mail
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('3tsbttm', N'Top Senders By Total Threat Messages', N'3a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('3tsbcm', N'Top Senders By Clean Messages', N'3a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('3tsbgm', N'Top Senders By Graymail Messages', N'3a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('3imd', N'Incoming Mail Details', N'3a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('4tsbttm', N'Top Senders By Total Threat Messages', N'3b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('4tsbcm', N'Top Senders By Clean Messages', N'3b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('4tsbgm', N'Top Senders By Graymail Messages', N'3b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('4imd', N'Incoming Mail Details', N'3b')

--Incoming Mail

--Sender Group

INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('5cbsg', N'Connections By Sender Group', N'4a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('5cbmfpa', N'Connections By Mail Flow Policy Action', N'4a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('5mfbsg', N'Mail Flow By Sender Group', N'4a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('6cbsg', N'Connections By Sender Group', N'4b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('6cbmfpa', N'Connections By Mail Flow Policy Action', N'4b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('6mfbsg', N'Mail Flow By Sender Group', N'4b')

--Sender Group

--Geo Distribution

INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('7tpimcbc', N'Top Incoming Mail Connections By Country', N'5a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('7tlimcbc', N'Total Incoming Mail Connections By Country', N'5a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('8tpimcbc', N'Top Incoming Mail Connections By Country', N'5b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('8tlimcbc', N'Total Incoming Mail Connections By Country', N'5b')
--Geo Distribution

--Outgoing Destinations
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('9tdbttm', N'Top Destinations By Total Threat Messages', N'6a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('9tdbcm', N'Top Destinations By Clean Messages', N'6a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('9odd', N'Outgoing Destinations Detail', N'6a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('10tdbttm', N'Top Destinations By Total Threat Messages', N'6b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('10tdbcm', N'Top Destinations By Clean Messages', N'6b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('10odd', N'Outgoing Destinations Detail', N'6b')
--Outgoing Destinations

--Outgoing Senders: Domains
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('11tsbttm', N'Top Senders By Total Threat Messages', N'7a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('11tsbcm', N'Top Senders By Clean Messages', N'7a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('11sd', N'Sender Details', N'7a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('12tsbttm', N'Top Senders By Total Threat Messages', N'7b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('12tsbcm', N'Top Senders By Clean Messages', N'7b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('12sd', N'Sender Details', N'7b')
--Outgoing Senders: Domains

--Internal Users
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('13tubcim', N'Top Users By Clean Incoming Messages', N'8a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('13tubcom', N'Top Users By Clean Outgoing Messages', N'8a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('13tubg', N'Top Users By Graymail', N'8a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('13umfd', N'User Mail Flow Details', N'8a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('14tubcim', N'Top Users By Clean Incoming Messages', N'8b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('14tubcom', N'Top Users By Clean Outgoing Messages', N'8b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('14tubg', N'Top Users By Graymail', N'8b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('14umfd', N'User Mail Flow Details', N'8b')
--Internal Users

--DLP Incidents
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('15tibs', N'Top Incidents By Severity', N'9a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('15is', N'Incident Summary', N'9a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('15tdlppm', N'Top DLP Policy Matches', N'9a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('15dlpid', N'DLP Incidents Details', N'9a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('16tibs', N'Top Incidents By Severity', N'9b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('16is', N'Incident Summary', N'9b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('16tdlppm', N'Top DLP Policy Matches', N'9b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('16dlpid', N'DLP Incidents Details', N'9b')
--DLP Incidents

--Message Filters
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('17tmfbnom', N'Top Message Filters By Number Of Matches', N'10a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('17mfbnomd', N'Message Filters By Number Of Matches: Details', N'10a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('18tmfbnom', N'Top Message Filters By Number Of Matches', N'10b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('18mfbnomd', N'Message Filters By Number Of Matches: Details', N'10b')
--Message Filters

--High Volume Mail
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('19ts', N'Top Subjects', N'11a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('19tes', N'Top Evelope Senders', N'11a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('19tmfbnom', N'Top Message Filters By Number Of Matches', N'11a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('19mfbnomd', N'Message Filters By Number Of Matches: Details', N'11a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('20ts', N'Top Subjects', N'11b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('20tes', N'Top Evelope Senders', N'11b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('20tmfbnom', N'Top Message Filters By Number Of Matches', N'11b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('20mfbnomd', N'Message Filters By Number Of Matches: Details', N'11b')
--High Volume Mail

--Content Filters
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('21ticfm', N'Top Incoming Content Filter Matches', N'12a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('21tocfm', N'Top Outgoing Content Filter Matches ', N'12a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('21icfm', N'Incoming Content Filter Matches', N'12a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('21ocfm', N'Outgoing Content Filter Matches', N'12a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('22ticfm', N'Top Incoming Content Filter Matches', N'12b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('22tocfm', N'Top Outgoing Content Filter Matches ', N'12b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('22icfm', N'Incoming Content Filter Matches', N'12b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('22ocfm', N'Outgoing Content Filter Matches', N'12b')
--Content Filters

--Macro Detection
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('23timeabft', N'Top Incoming Macro Enabled Attachments By File Type', N'13a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('23soimeabft', N'Summary Of Incoming Macro Enabled Attachments By File Type', N'13a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('23tomeabft', N'Top Outgoing Macro Enabled Attachments By File Type', N'13a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('23soomeabft', N'Summary Of Outgoing Macro Enabled Attachments By File Type', N'13a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('24timeabft', N'Top Incoming Macro Enabled Attachments By File Type', N'13b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('24soimeabft', N'Summary Of Incoming Macro Enabled Attachments By File Type', N'13b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('24tomeabft', N'Top Outgoing Macro Enabled Attachments By File Type', N'13b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('24soomeabft', N'Summary Of Outgoing Macro Enabled Attachments By File Type', N'13b')
--Macro Detection

--DMARC Verification
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('25tdbdmarcvf', N'Top Domains By DMARC Verification Failures', N'14a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('25dbdmarcvd', N'Domains By DMARC Verification Details', N'14a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('26tdbdmarcvf', N'Top Domains By DMARC Verification Failures', N'14b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('26dbdmarcvd', N'Domains By DMARC Verification Details', N'14b')
--DMARC Verification

--Virus Type
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('27tivtd', N'Top Incoming Virus Types Detected', N'15a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('27tovtd', N'Top Outgoing Virus Types Detected', N'15a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('27vtd', N'Virus Types Detail', N'15a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('28tivtd', N'Top Incoming Virus Types Detected', N'15b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('28tovtd', N'Top Outgoing Virus Types Detected', N'15b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('28vtd', N'Virus Types Detail', N'15b')
--Virus Type

--URL Filtering
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('29turlciim', N'Top URL Categories In Incoming Messages', N'16a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('29soturlciim', N'Summary Of Top URL Categories In Incoming Messages', N'16a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('2turliism', N'Top URLs In Incoming Spam Messages', N'16a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('29soturlciism', N'Summary Of Top URL Categories In Incoming Spam Messages', N'16a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('29imcmanurl', N'Incoming Messages Containing Malicious And Neutral URLs', N'16a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('29soimcmanurl', N'Summary Of Incoming Messages Containing Malicious And Neutral URLs', N'16a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('30turlciim', N'Top URL Categories In Incoming Messages', N'16b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('30soturlciim', N'Summary Of Top URL Categories In Incoming Messages', N'16b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('30turliism', N'Top URLs In Incoming Spam Messages', N'16b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('30soturlciism', N'Summary Of Top URL Categories In Incoming Spam Messages', N'16b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('30imcmanurl', N'Incoming Messages Containing Malicious And Neutral URLs', N'16b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('30soimcmanurl', N'Summary Of Incoming Messages Containing Malicious And Neutral URLs', N'16b')
--URL Filtering

--Web Interaction Tracking
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('31tmurlcbeu', N'Top Malicious URLs Clicked By End Users ', N'17a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('31tuwcomurl', N'Top Users Who Clicked On Malicious URLs ', N'17a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('31witd', N'Web Interaction Tracking Details', N'17a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('32tmurlcbeu', N'Top Malicious URLs Clicked By End Users ', N'17b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('32tuwcomurl', N'Top Users Who Clicked On Malicious URLs ', N'17b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('32witd', N'Web Interaction Tracking Details', N'17b')
--Web Interaction Tracking


--Forged Email Detection
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('33tfed', N'Top Forged Email Detection', N'18a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('33fedd', N'Forged Email Detection: Details', N'18a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('34tfed', N'Top Forged Email Detection', N'18b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('34fedd', N'Forged Email Detection: Details', N'18b')
--Forged Email Detection

--Advanced Malware Protection
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('35ifhbamp', N'Incoming Files Handled By AMP', N'19a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('35soifhbamp', N'Summary Of Incoming Files Handled By AMP', N'19a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('35timtf', N'Top Incoming Malware Threat Files', N'19a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('35timtf', N'Trend: Incoming Malware Threat Files', N'19a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('35timfbt', N'Top Incoming Malware Files By Type', N'19a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('35imtf', N'Incoming Malware Threat Files', N'19a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('36ifhbamp', N'Incoming Files Handled By AMP', N'19b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('36soifhbamp', N'Summary Of Incoming Files Handled By AMP', N'19b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('36timtf', N'Top Incoming Malware Threat Files', N'19b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('36timtf', N'Trend: Incoming Malware Threat Files', N'19b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('36timfbt', N'Top Incoming Malware Files By Type', N'19b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('36imtf', N'Incoming Malware Threat Files', N'19b')
--Advanced Malware Protection

--AMP File Analysis
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('37sffad', N'Search For File Analysis Data', N'20a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('37fufa', N'Files Uploaded For Analysis ', N'20a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('37car', N'Completed Analysis Requests', N'20a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('37par', N'Pending Analysis Requests', N'20a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('38sffad', N'Search For File Analysis Data', N'20b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('38fufa', N'Files Uploaded For Analysis ', N'20b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('38car', N'Completed Analysis Requests', N'20b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('38par', N'Pending Analysis Requests', N'20b')
--AMP File Analysis

--AMP Verdict Updates
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('39fwrvc', N'Files With Restrospective Verdict Changes', N'21a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('40fwrvc', N'Files With Restrospective Verdict Changes', N'21b')
--AMP Verdict Updates

--Mailbox Auto Remediation
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('41amprs', N'Advanced Malware Protection Retrospective Security', N'22a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('42amprs', N'Advanced Malware Protection Retrospective Security', N'22b')
--Mailbox Auto Remediation

--Outbreak Filters
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('44tbt', N'Threats By Type', N'23a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('44ts', N'Threat Summary', N'23a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('44td', N'Threat Details', N'23a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('44pyvos', N'Past Year Virus Outbreak Summary', N'23a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('44pyvo', N'Past Year Virus Outbreaks', N'23a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('44hmfim', N'Hit Messages From Incoming Messages', N'23a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('44hmbtl', N'Hit Messages By Threat Level', N'23a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('44mrioq', N'Messages Resided In Outbreak Quarantine', N'23a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('44turlr', N'Top URLs Rewritten', N'23a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('45tbt', N'Threats By Type', N'23b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('45ts', N'Threat Summary', N'23b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('45td', N'Threat Details', N'23b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('45pyvos', N'Past Year Virus Outbreak Summary', N'23b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('45pyvo', N'Past Year Virus Outbreaks', N'23b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('45hmfim', N'Hit Messages From Incoming Messages', N'23b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('45hmbtl', N'Hit Messages By Threat Level', N'23b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('45mrioq', N'Messages Resided In Outbreak Quarantine', N'23b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('45turlrr', N'Top URLs Rewritten', N'23b')
--Outbreak Filters

--TLS Connections
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('46itlscg', N'Incoming TLS Connections Graph', N'24a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('46itlscs', N'Incoming TLS Connections Summary', N'24a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('46itlsms', N'Incoming TLS Messages Summary', N'24a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('46itlscd', N'Incoming TLS Connections Details', N'24a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('46otlscg', N'Outgoing TLS Connections Graph', N'24a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('46otlscs', N'Outgoing TLS Connections Summary', N'24a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('46otlsms', N'Outgoing TLS Messages Summary', N'24a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('46otlscd', N'Outgoing TLS Connections Details', N'24a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('47itlscg', N'Incoming TLS Connections Graph', N'24b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('47itlscs', N'Incoming TLS Connections Summary', N'24b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('47itlsms', N'Incoming TLS Messages Summary', N'24b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('47itlscd', N'Incoming TLS Connections Details', N'24b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('47otlscg', N'Outgoing TLS Connections Graph', N'24b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('47otlscs', N'Outgoing TLS Connections Summary', N'24b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('47otlsms', N'Outgoing TLS Messages Summary', N'24b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('47otlscd', N'Outgoing TLS Connections Details', N'24b')
--TLS Connections

--Inbound SMTP Authentication 
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('48rc', N'Received Connections', N'25a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('48rr', N'Received Recipients', N'25a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('48smtpadbdn', N'SMTP Authentication Details By Domain Name', N'25a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('49rc', N'Received Connections', N'25b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('49rr', N'Received Recipients', N'25b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('49smtpadbdn', N'SMTP Authentication Details By Domain Name', N'25b')
--Inbound SMTP Authentication

--Rate Limits
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('50tobi', N'Top Offenders By Incident', N'26a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('50tobrr', N'Top Offenders By Rejected Recipients', N'26a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('51tobi', N'Top Offenders By Incident', N'26b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('51tobrr', N'Top Offenders By Rejected Recipients', N'26b')
--Rate Limits

--System Capacity
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('52atsiwq', N'Average Time Spent In Work Queue', N'27a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('52amiwq', N'Average Messages In Work Queue', N'27a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('52mmiwq', N'Maximum Messages In Work Queue', N'27a')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('53atsiwq', N'Average Time Spent In Work Queue', N'27b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('53amiwq', N'Average Messages In Work Queue', N'27b')
INSERT [dbo].[Description] ([Code], [Name], [Report]) VALUES ('53mmiwq', N'Maximum Messages In Work Queue', N'27b')
--System Capacity
GO
--Description