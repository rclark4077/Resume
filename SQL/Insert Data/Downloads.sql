USE [Resumes]
GO
--SET IDENTITY_INSERT [dbo].[Module] ON 
--GO
--INSERT [dbo].[Module] ([ModuleId], [ModuleDescription], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [MaterialIcon], [Status]) VALUES (1, N'home', 1, N'Home', N'Index', 70, N'home', 1)
--GO
--INSERT [dbo].[Module] ([ModuleId], [ModuleDescription], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [MaterialIcon], [Status]) VALUES (2, N'qualifications', 2, N'Qualifications', N'Index', 70, N'beenhere', 1)
--GO
--INSERT [dbo].[Module] ([ModuleId], [ModuleDescription], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [MaterialIcon], [Status]) VALUES (3, N'education', 3, N'Education', N'Index', 70, N'school', 1)
--GO
--INSERT [dbo].[Module] ([ModuleId], [ModuleDescription], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [MaterialIcon], [Status]) VALUES (4, N'professiona history', 4, N'CareerHistory', N'Index', 70, N'history', 1)
--GO
--INSERT [dbo].[Module] ([ModuleId], [ModuleDescription], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [MaterialIcon], [Status]) VALUES (5, N'projects', 5, N'Projects', N'Index', 100, N'engineering', 1)
--GO
--INSERT [dbo].[Module] ([ModuleId], [ModuleDescription], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [MaterialIcon], [Status]) VALUES (6, N'downloads', 6, N'Downloads', N'Index', 100, N'get_app', 1)
--GO
--INSERT [dbo].[Module] ([ModuleId], [ModuleDescription], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [MaterialIcon], [Status]) VALUES (7, N'administration', 7, N'Administration', N'Index', 10, N'settings', 0)
--GO
--SET IDENTITY_INSERT [dbo].[Module] OFF
--GO
--SET IDENTITY_INSERT [dbo].[Submodule] ON 
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (1, N'personal skills', 2, 1, NULL, NULL, 70, NULL, NULL, 0)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (2, N'programming languages', 2, 2, NULL, NULL, 70, NULL, NULL, 0)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (3, N'database systems', 2, 3, NULL, NULL, 70, NULL, NULL, 0)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (4, N'software', 2, 4, NULL, NULL, 70, NULL, NULL, 0)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (5, N'davenport university', 3, 1, NULL, NULL, 70, NULL, NULL, 0)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (6, N'kalamazoo community college', 3, 2, NULL, NULL, 70, NULL, NULL, 0)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (7, N'cisco systems', 3, 3, NULL, NULL, 70, NULL, NULL, 0)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (8, N'new horizons learning center', 3, 4, NULL, NULL, 70, NULL, NULL, 0)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (9, N'uniform color co', 4, 1, NULL, NULL, 70, 4, NULL, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (10, N'kendall electric co', 4, 2, NULL, NULL, 70, 3, NULL, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (11, N'stafford-smith inc', 4, 3, NULL, NULL, 70, 2, NULL, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (12, N'spx corporation', 4, 4, NULL, NULL, 70, 1, NULL, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (13, N'tech discussion board', 5, 1, NULL, NULL, 70, 1, 1, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (14, N'baan-2-web', 5, 2, NULL, NULL, 70, 1, 2, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (15, N'ssi intranet', 5, 3, NULL, NULL, 70, 2, 3, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (16, N'rebates accrual tracking', 5, 4, NULL, NULL, 70, 2, 4, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (17, N'rebates reconciliation', 5, 5, NULL, NULL, 70, 2, 5, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (18, N'purchase analysis', 5, 6, NULL, NULL, 70, 2, 6, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (19, N'cpg llc web services', 5, 7, NULL, NULL, 70, 2, 7, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (20, N'mykdw.com csr intranet', 5, 8, NULL, NULL, 70, 3, 8, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (21, N'Bid-to-sale notification system', 5, 9, NULL, NULL, 70, 3, 9, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (22, N'primos erp system', 5, 10, NULL, NULL, 70, 4, 10, 1)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (23, N'asp.net mvc code', 6, 1, NULL, NULL, 70, NULL, NULL, 0)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (24, N'database scripts', 6, 2, NULL, NULL, 70, NULL, NULL, 0)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (25, N'database diagram', 6, 3, NULL, NULL, 70, NULL, NULL, 0)
--GO
--INSERT [dbo].[Submodule] ([SubmoduleId], [SubmoduleDescription], [ModuleId], [SortOrder], [ControllerName], [ActionName], [SecurityLevel], [CompanyId], [ProjectId], [Status]) VALUES (26, N'resume', 6, 4, NULL, NULL, 70, NULL, NULL, 0)
--GO
--SET IDENTITY_INSERT [dbo].[Submodule] OFF
--GO
SET IDENTITY_INSERT [dbo].[Downloads] ON 
GO
INSERT [dbo].[Downloads] ([DownloadId], [SubmoduleId], [ProfileId], [DownloadDescription], [DownloadUrl], [UrlSourceTypeId], [Status]) VALUES (1, 23, 1, N'asp.net mvc code', N'https://github.com/rclark4077/Resume', 1, 1)
GO													   		  
INSERT [dbo].[Downloads] ([DownloadId], [SubmoduleId], [ProfileId], [DownloadDescription], [DownloadUrl], [UrlSourceTypeId], [Status]) VALUES (2, 24, 1, N'database scripts', N'https://github.com/rclark4077/ResumeTSQLScripts', 1, 1)
GO													   		  
INSERT [dbo].[Downloads] ([DownloadId], [SubmoduleId], [ProfileId], [DownloadDescription], [DownloadUrl], [UrlSourceTypeId], [Status]) VALUES (3, 25, 1, N'web app database diagram', N'/Downloads/DatabaseDiagram.doc', 2, 1)
GO													   		  
INSERT [dbo].[Downloads] ([DownloadId], [SubmoduleId], [ProfileId], [DownloadDescription], [DownloadUrl], [UrlSourceTypeId], [Status]) VALUES (4, 26, 1, N'resume of randy clark', N'/Downloads/Resume_of_RandyClark.doc', 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Downloads] OFF
GO
