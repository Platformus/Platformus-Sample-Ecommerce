BEGIN TRANSACTION;
CREATE TABLE "Variables" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Variable" PRIMARY KEY AUTOINCREMENT,
	"ConfigurationId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Value" TEXT NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Variable_Configuration_ConfigurationId" FOREIGN KEY("ConfigurationId") REFERENCES "Configurations" ("Id")
);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (1,1,'SmtpServer','SMTP server','test',1);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (2,1,'SmtpPort','SMTP port','25',2);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (3,1,'SmtpUseSsl','SMTP use SSL','no',3);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (4,1,'SmtpLogin','SMTP login','test',4);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (5,1,'SmtpPassword','SMTP password','test',5);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (6,1,'SmtpSenderEmail','SMTP sender email','test',6);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (7,1,'SmtpSenderName','SMTP sender name','test',7);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (8,2,'SpecifyCultureInUrl','Specify culture in URL','yes',1);
CREATE TABLE "Users" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_User" PRIMARY KEY AUTOINCREMENT,
	"Name" TEXT NOT NULL,
	"Created" TEXT NOT NULL
);
INSERT INTO `Users` (Id,Name,Created) VALUES (1,'Administrator','2017-01-01 00:00:00.0000000');
CREATE TABLE "UserRoles" (
	"UserId" INTEGER NOT NULL,
	"RoleId" INTEGER NOT NULL,
	CONSTRAINT "PK_UserRole" PRIMARY KEY ("UserId", "RoleId"),
	CONSTRAINT "FK_UserRole_User_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id"),
	CONSTRAINT "FK_UserRole_Role_RoleId" FOREIGN KEY ("RoleId") REFERENCES "Roles" ("Id")
);
INSERT INTO `UserRoles` (UserId,RoleId) VALUES (1,1);
INSERT INTO `UserRoles` (UserId,RoleId) VALUES (1,2);
CREATE TABLE "Tabs" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Tab" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Tab_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `Tabs` (Id,ClassId,Name,Position) VALUES (1,1,'SEO',100);
CREATE TABLE "SerializedProducts" (
	"CultureId" INTEGER NOT NULL,
	"ProductId" INTEGER NOT NULL,
	"CategoryId" INTEGER NOT NULL,
	"Url" TEXT NOT NULL,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Description" TEXT,
	"Price" REAL NOT NULL,
	"Title" TEXT,
	"MetaDescription" TEXT,
	"MetaKeywords" TEXT,
	"SerializedAttributes" TEXT,
	"SerializedPhotos" TEXT,
	CONSTRAINT "PK_SerializedProduct" PRIMARY KEY("CultureId","ProductId"),
	CONSTRAINT "FK_SerializedProduct_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id"),
	CONSTRAINT "FK_SerializedProduct_Product_ProductId" FOREIGN KEY("ProductId") REFERENCES "Products"("Id"),
	CONSTRAINT "FK_SerializedProduct_Category_CategoryId" FOREIGN KEY("CategoryId") REFERENCES "Categories"("Id")
);
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,1,1,'/pizza/pizza-1','pizza-1','Pizza 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 1','','',NULL,'[{"Filename":"pizza1.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,1,1,'/pizza/pizza-1','pizza-1','Pizza 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 1','','',NULL,'[{"Filename":"pizza1.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,1,1,'/pizza/pizza-1','pizza-1','Pizza 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 1','','',NULL,'[{"Filename":"pizza1.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,2,1,'/pizza/pizza-2','pizza-2','Pizza 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 2','','',NULL,'[{"Filename":"pizza2.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,2,1,'/pizza/pizza-2','pizza-2','Pizza 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 2','','',NULL,'[{"Filename":"pizza2.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,2,1,'/pizza/pizza-2','pizza-2','Pizza 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 2','','',NULL,'[{"Filename":"pizza2.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,3,1,'/pizza/pizza-3','pizza-3','Pizza 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',170.0,'Pizza 3','','',NULL,'[{"Filename":"pizza3.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,3,1,'/pizza/pizza-3','pizza-3','Pizza 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',170.0,'Pizza 3','','',NULL,'[{"Filename":"pizza3.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,3,1,'/pizza/pizza-3','pizza-3','Pizza 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',170.0,'Pizza 3','','',NULL,'[{"Filename":"pizza3.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,4,1,'/pizza/pizza-4','pizza-4','Pizza 4','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',180.0,'Pizza 4','','',NULL,'[{"Filename":"pizza4.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,4,1,'/pizza/pizza-4','pizza-4','Pizza 4','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',180.0,'Pizza 4','','',NULL,'[{"Filename":"pizza4.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,4,1,'/pizza/pizza-4','pizza-4','Pizza 4','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',180.0,'Pizza 4','','',NULL,'[{"Filename":"pizza4.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,5,1,'/pizza/pizza-5','pizza-5','Pizza 5','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',110.0,'Pizza 5','','',NULL,'[{"Filename":"pizza5.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,5,1,'/pizza/pizza-5','pizza-5','Pizza 5','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',110.0,'Pizza 5','','',NULL,'[{"Filename":"pizza5.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,5,1,'/pizza/pizza-5','pizza-5','Pizza 5','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',110.0,'Pizza 5','','',NULL,'[{"Filename":"pizza5.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,6,1,'/pizza/pizza-6','pizza-6','Pizza 6','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',120.0,'Pizza 6','','',NULL,'[{"Filename":"pizza6.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,6,1,'/pizza/pizza-6','pizza-6','Pizza 6','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',120.0,'Pizza 6','','',NULL,'[{"Filename":"pizza6.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,6,1,'/pizza/pizza-6','pizza-6','Pizza 6','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',120.0,'Pizza 6','','',NULL,'[{"Filename":"pizza6.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,7,1,'/pizza/pizza-7','pizza-7','Pizza 7','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 7','','',NULL,'[{"Filename":"pizza7.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,7,1,'/pizza/pizza-7','pizza-7','Pizza 7','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 7','','',NULL,'[{"Filename":"pizza7.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,7,1,'/pizza/pizza-7','pizza-7','Pizza 7','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 7','','',NULL,'[{"Filename":"pizza7.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,8,1,'/pizza/pizza-8','pizza-8','Pizza 8','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',110.0,'Pizza 8','','',NULL,'[{"Filename":"pizza8.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,8,1,'/pizza/pizza-8','pizza-8','Pizza 8','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',110.0,'Pizza 8','','',NULL,'[{"Filename":"pizza8.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,8,1,'/pizza/pizza-8','pizza-8','Pizza 8','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',110.0,'Pizza 8','','',NULL,'[{"Filename":"pizza8.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,9,1,'/pizza/pizza-9','pizza-9','Pizza 9','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 9','','',NULL,'[{"Filename":"pizza9.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,9,1,'/pizza/pizza-9','pizza-9','Pizza 9','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 9','','',NULL,'[{"Filename":"pizza9.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,9,1,'/pizza/pizza-9','pizza-9','Pizza 9','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',150.0,'Pizza 9','','',NULL,'[{"Filename":"pizza9.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,10,2,'/panini/panini-1','panini-1','Panini 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',70.0,'Panini 1','','',NULL,'[{"Filename":"panini1.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,10,2,'/panini/panini-1','panini-1','Panini 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',70.0,'Panini 1','','',NULL,'[{"Filename":"panini1.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,10,2,'/panini/panini-1','panini-1','Panini 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',70.0,'Panini 1','','',NULL,'[{"Filename":"panini1.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,11,2,'/panini/panini-2','panini-2','Panini 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',40.0,'Panini 2','','',NULL,'[{"Filename":"panini2.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,11,2,'/panini/panini-2','panini-2','Panini 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',40.0,'Panini 2','','',NULL,'[{"Filename":"panini2.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,11,2,'/panini/panini-2','panini-2','Panini 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',40.0,'Panini 2','','',NULL,'[{"Filename":"panini2.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,12,2,'/panini/panini-3','panini-3','Panini 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',60.0,'Panini 3','','',NULL,'[{"Filename":"panini3.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,12,2,'/panini/panini-3','panini-3','Panini 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',60.0,'Panini 3','','',NULL,'[{"Filename":"panini3.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,12,2,'/panini/panini-3','panini-3','Panini 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',60.0,'Panini 3','','',NULL,'[{"Filename":"panini3.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,13,3,'/pizza/drinks-1','drinks-1','Drinks 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',10.0,'Drinks 1','','',NULL,'[{"Filename":"drinks1.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,13,3,'/pizza/drinks-1','drinks-1','Drinks 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',10.0,'Drinks 1','','',NULL,'[{"Filename":"drinks1.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,13,3,'/pizza/drinks-1','drinks-1','Drinks 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',10.0,'Drinks 1','','',NULL,'[{"Filename":"drinks1.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,14,3,'/pizza/drinks-2','drinks-2','Drinks 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',20.0,'Drinks 2','','',NULL,'[{"Filename":"drinks2.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,14,3,'/pizza/drinks-2','drinks-2','Drinks 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',20.0,'Drinks 2','','',NULL,'[{"Filename":"drinks2.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,14,3,'/pizza/drinks-2','drinks-2','Drinks 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',20.0,'Drinks 2','','',NULL,'[{"Filename":"drinks2.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (2,15,3,'/pizza/drinks-3','drinks-3','Drinks 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',40.0,'Drinks 3','','',NULL,'[{"Filename":"drinks3.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (3,15,3,'/pizza/drinks-3','drinks-3','Drinks 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',40.0,'Drinks 3','','',NULL,'[{"Filename":"drinks3.jpg","IsCover":true,"Position":1}]');
INSERT INTO `SerializedProducts` (CultureId,ProductId,CategoryId,Url,Code,Name,Description,Price,Title,MetaDescription,MetaKeywords,SerializedAttributes,SerializedPhotos) VALUES (4,15,3,'/pizza/drinks-3','drinks-3','Drinks 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',40.0,'Drinks 3','','',NULL,'[{"Filename":"drinks3.jpg","IsCover":true,"Position":1}]');
CREATE TABLE "SerializedObjects" (
	"CultureId" INTEGER NOT NULL,
	"ObjectId" INTEGER NOT NULL,
	"ClassId" INTEGER NOT NULL,
	"UrlPropertyStringValue" TEXT,
	"SerializedProperties" TEXT,
	CONSTRAINT "PK_SerializedObject" PRIMARY KEY("CultureId","ObjectId"),
	CONSTRAINT "FK_SerializedObject_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id"),
	CONSTRAINT "FK_SerializedObject_Object_ObjectId" FOREIGN KEY("ObjectId") REFERENCES "Objects"("Id"),
	CONSTRAINT "FK_SerializedObject_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id")
);
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,1,2,'/','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Your Ecommerce Website</h1><p>Hello! This is your ecommerce website, it is based on the <a href=\"http://platformus.net/\" target=\"_blank\" rel=\"noopener\">Platformus</a> content management system. You can manage it (create pages, menu items, forms and so on) using the <a href=\"/backend\">backend</a>. Please use the username and password specified during the installation to sign in (it is &ldquo;admin@platformus.net&rdquo; and &ldquo;admin&rdquo; by default).</p><p>Please use the <a href=\"http://docs.platformus.net/\" target=\"_blank\" rel=\"noopener\">documentation</a> to learn more about Platformus and how to use it. There are several examples that could be useful for the beginners. Also, you can get help in our <a href=\"https://gitter.im/Platformus/Platformus\" target=\"_blank\" rel=\"noopener\">chat</a>.</p><p>Have a nice work!</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Your Ecommerce Website","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,1,2,'/','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Ваш веб-сайт электронной коммерции</h1><p>Здравствуйте! Это ваш веб-сайт электронной коммерции, он работает на базе системы управления содержимым &laquo;<a href=\"http://platformus.net/\" target=\"_blank\" rel=\"noopener\">Платформус</a>&raquo;. Вы можете управлять им (создавать страницы, элементы меню, формы и так далее) с помощью <a href=\"/backend\">бекенда</a>. Для входа используйте, пожалуйста, имя пользователя и пароль, указанные при установке (по умолчанию это &laquo;admin@platformus.net&raquo; и &laquo;admin&raquo; соответственно).</p><p>Чтобы узнать больше о Платформусе и о том, как им пользоваться, пожалуйста, воспользуйтесь <a href=\"http://docs.platformus.net/\" target=\"_blank\" rel=\"noopener\">документацией</a>, там есть несколько примеров, которые пригодятся начинающим. При возникновении сложностей или вопросов вы можете обратиться в наш <a href=\"https://gitter.im/Platformus/Platformus\" target=\"_blank\" rel=\"noopener\">чат</a>, где вам обязательно помогут.</p><p>Приятной работы!</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Ваш веб-сайт электронной коммерции","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,1,2,'/','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Ваш веб-сайт електронної комерції</h1><p>Вітаємо! Це ваш веб-сайт електронної комерції, він працює на базі системи керування вмістом &laquo;<a href=\"http://platformus.net/\" target=\"_blank\" rel=\"noopener\">Платформус</a>&raquo;. Ви можете керувати ним (створювати сторінки, елементи меню, форми і так далі) за допомогою <a href=\"/backend\">бекенду</a>. Для входу використовуйте, будь ласка, ім&rsquo;я користувача і пароль, вказані під час установки (за замовчуванням це &laquo;admin@platformus.net&raquo; і &laquo;admin&raquo; відповідно).</p><p>Щоб дізнатися більше про Платформус і про те, як ним користуватися, будь ласка, скористайтеся <a href=\"http://docs.platformus.net/\" target=\"_blank\" rel=\"noopener\">документацією</a>, там є декілька прикладів, що стануть у нагоді початківцям. При виникненні труднощів або питань ви можете звернутися в наш <a href=\"https://gitter.im/Platformus/Platformus\" target=\"_blank\" rel=\"noopener\">чат</a>, де вам обов&rsquo;язково допоможуть.</p><p>Приємної роботи!</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Ваш веб-сайт електронної комерції","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,2,2,'/about-us','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/about-us","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>About Us</h1><p>Tell us about your ecommerce website. You can add photos or videos here.</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"About Us","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,2,2,'/about-us','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/about-us","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>О нас</h1><p>Расскажите о вашем веб-сайте электронной коммерции. Вы можете добавить сюда фотографии или видео.</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"О нас","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,2,2,'/about-us','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/about-us","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Про нас</h1><p>Розкажіть про ваш веб-сайт електронної комерції. Ви можете додати сюди фотографії або відео.</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Про нас","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,3,2,'/contacts','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/contacts","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Contacts</h1><p>Add your contacts on this page. Phone number, messengers, social links. The feedback form below (by the way, you can edit or move it to a different place) allows your visitors to write you directly from the website, just don&rsquo;t forget to specify the email address for the messages.</p><h2>Feedback from</h2>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Contacts","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,3,2,'/contacts','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/contacts","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Контакты</h1><p>Добавьте свои контакты на этой странице. Телефонный номер, мессенджеры, ссылки на социальные сети. Форма обратной связи, расположенная ниже (кстати, вы можете ее изменить или перенести в другое место), поможет посетителям написать вам сообщение прямо с сайта, лишь укажите для этого адрес, на который нужно присылать сообщения.</p><h2>Форма обратной связи</h2>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Контакты","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,3,2,'/contacts','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/contacts","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Контакти</h1><p>Додайте свої контакти на цій сторінці. Номер телефону, месенджери, посилання на соціальні мережі. Форма зворотного зв&rsquo;язку, розташована нижче (до речі, ви можете її змінити або перенести в інше місце), допоможе відвідувачам написати вам повідомлення прямо з сайту, лише вкажіть для цього адресу, на яку потрібно надсилати повідомлення.</p><h2>Форма зворотного зв&rsquo;язку</h2>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Контакти","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
CREATE TABLE "SerializedMenus" (
	"CultureId" INTEGER NOT NULL,
	"MenuId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"SerializedMenuItems" TEXT,
	CONSTRAINT "PK_SerializedMenu" PRIMARY KEY("CultureId","MenuId"),
	CONSTRAINT "FK_SerializedMenu_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id"),
	CONSTRAINT "FK_SerializedMenu_Menu_MenuId" FOREIGN KEY("MenuId") REFERENCES "Menus"("Id")
);
INSERT INTO `SerializedMenus` (CultureId,MenuId,Code,SerializedMenuItems) VALUES (2,1,'Main','[{"MenuItemId":1,"Name":"Home","Url":"/","Position":10,"SerializedMenuItems":null},{"MenuItemId":2,"Name":"About us","Url":"/about-us","Position":20,"SerializedMenuItems":null},{"MenuItemId":3,"Name":"Contacts","Url":"/contacts","Position":30,"SerializedMenuItems":null},{"MenuItemId":4,"Name":"Cart","Url":"/ecommerce/cart","Position":40,"SerializedMenuItems":null}]');
INSERT INTO `SerializedMenus` (CultureId,MenuId,Code,SerializedMenuItems) VALUES (3,1,'Main','[{"MenuItemId":1,"Name":"Главная","Url":"/","Position":10,"SerializedMenuItems":null},{"MenuItemId":2,"Name":"О нас","Url":"/about-us","Position":20,"SerializedMenuItems":null},{"MenuItemId":3,"Name":"Контакты","Url":"/contacts","Position":30,"SerializedMenuItems":null},{"MenuItemId":4,"Name":"Корзина","Url":"/ecommerce/cart","Position":40,"SerializedMenuItems":null}]');
INSERT INTO `SerializedMenus` (CultureId,MenuId,Code,SerializedMenuItems) VALUES (4,1,'Main','[{"MenuItemId":1,"Name":"Головна","Url":"/","Position":10,"SerializedMenuItems":null},{"MenuItemId":2,"Name":"Про нас","Url":"/about-us","Position":20,"SerializedMenuItems":null},{"MenuItemId":3,"Name":"Контакти","Url":"/contacts","Position":30,"SerializedMenuItems":null},{"MenuItemId":4,"Name":"Корзина","Url":"/ecommerce/cart","Position":40,"SerializedMenuItems":null}]');
CREATE TABLE "SerializedForms" (
	"CultureId" INTEGER NOT NULL,
	"FormId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"SubmitButtonTitle" TEXT NOT NULL,
	"SerializedFields" TEXT,
	CONSTRAINT "PK_SerializedForm" PRIMARY KEY("CultureId","FormId"),
	CONSTRAINT "FK_SerializedForm_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id"),
	CONSTRAINT "FK_SerializedForm_Form_FormId" FOREIGN KEY("FormId") REFERENCES "Forms"("Id")
);
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SubmitButtonTitle,SerializedFields) VALUES (2,1,'Feedback','Feedback','Submit','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Your name","IsRequired":true,"MaxLength":null,"Position":10,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Email","Name":"Your email","IsRequired":true,"MaxLength":null,"Position":20,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Your message","IsRequired":true,"MaxLength":null,"Position":30,"SerializedFieldOptions":null}]');
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SubmitButtonTitle,SerializedFields) VALUES (3,1,'Feedback','Обратная связь','Отправить','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Ваше имя","IsRequired":true,"MaxLength":null,"Position":10,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Email","Name":"Ваша электронная почта","IsRequired":true,"MaxLength":null,"Position":20,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Ваше сообщение","IsRequired":true,"MaxLength":null,"Position":30,"SerializedFieldOptions":null}]');
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SubmitButtonTitle,SerializedFields) VALUES (4,1,'Feedback','Зворотний зв’язок','Надіслати','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Ваше ім’я","IsRequired":true,"MaxLength":null,"Position":10,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Email","Name":"Ваша електронна пошта","IsRequired":true,"MaxLength":null,"Position":20,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Ваше повідомлення","IsRequired":true,"MaxLength":null,"Position":30,"SerializedFieldOptions":null}]');
CREATE TABLE "Roles" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Role" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `Roles` (Id,Code,Name,Position) VALUES (1,'Administrator','Administrator',100);
INSERT INTO `Roles` (Id,Code,Name,Position) VALUES (2,'ApplicationOwner','Application owner',200);
INSERT INTO `Roles` (Id,Code,Name,Position) VALUES (3,'ContentManager','Content manager',300);
CREATE TABLE "RolePermissions" (
	"RoleId" INTEGER NOT NULL,
	"PermissionId" INTEGER NOT NULL,
	CONSTRAINT "PK_RolePermission" PRIMARY KEY ("RoleId", "PermissionId"),
	CONSTRAINT "FK_RolePermission_Role_RoleId" FOREIGN KEY ("RoleId") REFERENCES "Roles" ("Id"),
	CONSTRAINT "FK_RolePermission_Permission_PermissionId" FOREIGN KEY ("PermissionId") REFERENCES "Permissions" ("Id")
);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (1,1);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (2,2);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,9);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,12);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,13);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,14);
CREATE TABLE "Relations" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Relation" PRIMARY KEY AUTOINCREMENT,
	"MemberId" INTEGER NOT NULL,
	"PrimaryId" INTEGER NOT NULL,
	"ForeignId" INTEGER NOT NULL,
	CONSTRAINT "FK_Relation_Member_MemberId" FOREIGN KEY ("MemberId") REFERENCES "Members" ("Id"),
	CONSTRAINT "FK_Relation_Object_PrimaryId" FOREIGN KEY ("PrimaryId") REFERENCES "Objects" ("Id"),
	CONSTRAINT "FK_Relation_Object_ForeignId" FOREIGN KEY ("ForeignId") REFERENCES "Objects" ("Id")
);
CREATE TABLE "Properties" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Property" PRIMARY KEY AUTOINCREMENT,
	"ObjectId" INTEGER NOT NULL,
	"MemberId" INTEGER NOT NULL,
	"IntegerValue" INTEGER,
	"DecimalValue" REAL,
	"StringValueId" INTEGER,
	"DateTimeValue" TEXT,
	CONSTRAINT "FK_Property_Object_ObjectId" FOREIGN KEY("ObjectId") REFERENCES "Objects"("Id"),
	CONSTRAINT "FK_Property_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id"),
	CONSTRAINT "FK_Property_Dictionary_StringValueId" FOREIGN KEY("StringValueId") REFERENCES "Dictionaries"("Id")
);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (1,1,1,NULL,NULL,104,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (2,1,2,NULL,NULL,105,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (3,1,3,NULL,NULL,106,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (4,1,4,NULL,NULL,107,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (5,1,5,NULL,NULL,108,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (6,2,1,NULL,NULL,109,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (7,2,2,NULL,NULL,110,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (8,2,3,NULL,NULL,111,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (9,2,4,NULL,NULL,112,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (10,2,5,NULL,NULL,113,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (11,3,1,NULL,NULL,114,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (12,3,2,NULL,NULL,115,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (13,3,3,NULL,NULL,116,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (14,3,4,NULL,NULL,117,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (15,3,5,NULL,NULL,118,NULL);
CREATE TABLE "Products" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Product" PRIMARY KEY AUTOINCREMENT,
	"CategoryId" INTEGER NOT NULL,
	"Url" TEXT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"DescriptionId" INTEGER NOT NULL,
	"Price" REAL NOT NULL,
	"TitleId" INTEGER NOT NULL,
	"MetaDescriptionId" INTEGER NOT NULL,
	"MetaKeywordsId" INTEGER NOT NULL,
	CONSTRAINT "FK_Product_Category_CategoryId" FOREIGN KEY("CategoryId") REFERENCES "Categories" ("Id"),
	CONSTRAINT "FK_Product_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Product_Dictionary_DescriptionId" FOREIGN KEY("DescriptionId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Product_Dictionary_TitleId" FOREIGN KEY("TitleId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Product_Dictionary_MetaDescriptionId" FOREIGN KEY("MetaDescriptionId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Product_Dictionary_MetaKeywordsId" FOREIGN KEY("MetaKeywordsId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (1,1,'/pizza/pizza-1','pizza-1',20,17,150.0,21,18,19);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (2,1,'/pizza/pizza-2','pizza-2',25,22,150.0,26,23,24);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (3,1,'/pizza/pizza-3','pizza-3',30,27,170.0,31,28,29);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (4,1,'/pizza/pizza-4','pizza-4',35,32,180.0,36,33,34);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (5,1,'/pizza/pizza-5','pizza-5',40,37,110.0,41,38,39);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (6,1,'/pizza/pizza-6','pizza-6',45,42,120.0,46,43,44);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (7,1,'/pizza/pizza-7','pizza-7',50,47,150.0,51,48,49);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (8,1,'/pizza/pizza-8','pizza-8',55,52,110.0,56,53,54);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (9,1,'/pizza/pizza-9','pizza-9',60,57,150.0,61,58,59);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (10,2,'/panini/panini-1','panini-1',65,62,70.0,66,63,64);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (11,2,'/panini/panini-2','panini-2',70,67,40.0,71,68,69);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (12,2,'/panini/panini-3','panini-3',75,72,60.0,76,73,74);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (13,3,'/pizza/drinks-1','drinks-1',80,77,10.0,81,78,79);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (14,3,'/pizza/drinks-2','drinks-2',85,82,20.0,86,83,84);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (15,3,'/pizza/drinks-3','drinks-3',90,87,40.0,91,88,89);
CREATE TABLE "ProductAttributes" (
	"ProductId" INTEGER NOT NULL,
	"AttributeId" INTEGER NOT NULL,
	CONSTRAINT "PK_ProductAttribute" PRIMARY KEY ("ProductId", "AttributeId"),
	CONSTRAINT "FK_ProductAttribute_Product_ProductId" FOREIGN KEY ("ProductId") REFERENCES "Products" ("Id"),
	CONSTRAINT "FK_ProductAttribute_Attribute_AttributeId" FOREIGN KEY ("AttributeId") REFERENCES "Attributes" ("Id")
);
CREATE TABLE "Positions" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Position" PRIMARY KEY AUTOINCREMENT,
	"CartId" INTEGER NOT NULL,
	"ProductId" INTEGER NOT NULL,
	CONSTRAINT "FK_Position_Cart_CartId" FOREIGN KEY("CartId") REFERENCES "Carts" ("Id"),
	CONSTRAINT "FK_Position_Product_ProductId" FOREIGN KEY("ProductId") REFERENCES "Products" ("Id")
);
CREATE TABLE "Photos" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Photo" PRIMARY KEY AUTOINCREMENT,
	"ProductId" INTEGER NOT NULL,
	"Filename" TEXT NOT NULL,
	"IsCover" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Photo_Product_ProductId" FOREIGN KEY("ProductId") REFERENCES "Products" ("Id")
);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (1,1,'pizza1.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (2,2,'pizza2.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (3,3,'pizza3.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (4,4,'pizza4.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (5,5,'pizza5.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (6,6,'pizza6.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (7,7,'pizza7.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (8,8,'pizza8.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (9,9,'pizza9.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (10,10,'panini1.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (11,11,'panini2.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (12,12,'panini3.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (13,13,'drinks1.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (14,14,'drinks2.jpg',1,1);
INSERT INTO `Photos` (Id,ProductId,Filename,IsCover,Position) VALUES (15,15,'drinks3.jpg',1,1);
CREATE TABLE "Permissions" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Permission" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (1,'BrowseBackend','Browse backend',1);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (2,'DoEverything','Do everything',100);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (3,'BrowsePermissions','Browse permissions',200);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (4,'BrowseRoles','Browse roles',210);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (5,'BrowseUsers','Browse users',220);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (6,'BrowseConfigurations','Browse configurations',300);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (7,'BrowseCultures','Browse cultures',400);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (8,'BrowseEndpoints','Browse endpoints',500);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (9,'BrowseObjects','Browse objects',600);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (10,'BrowseDataTypes','Browse data types',610);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (11,'BrowseClasses','Browse classes',620);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (12,'BrowseMenus','Browse menus',700);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (13,'BrowseForms','Browse forms',800);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (14,'BrowseFileManager','Browse file manager',900);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (15,'BrowseViews','Browse views',1000);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (16,'BrowseStyles','Browse styles',1010);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (17,'BrowseScripts','Browse scripts',1020);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (18,'BrowseBundles','Browse bundles',1030);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (19,'BrowseCatalogs','Browse catalogs',1100);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (20,'BrowseCategories','Browse categories',1110);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (21,'BrowseProducts','Browse products',1120);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (22,'BrowseCarts','Browse carts',1130);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (23,'BrowseOrderStates','Browse order states',1140);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (24,'BrowsePaymentMethods','Browse payment methods',1150);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (25,'BrowseDeliveryMethods','Browse delivery methods',1160);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (26,'BrowseOrders','Browse orders',1170);
CREATE TABLE "PaymentMethods" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_PaymentMethod" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_PaymentMethod_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `PaymentMethods` (Id,Code,NameId,Position) VALUES (1,'NotSet',99,10);
INSERT INTO `PaymentMethods` (Id,Code,NameId,Position) VALUES (2,'Cash',100,20);
CREATE TABLE "Orders" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Order" PRIMARY KEY AUTOINCREMENT,
	"OrderStateId" INTEGER NOT NULL,
	"PaymentMethodId" INTEGER NOT NULL,
	"DeliveryMethodId" INTEGER NOT NULL,
	"CustomerFirstName" TEXT NOT NULL,
	"CustomerLastName" TEXT,
	"CustomerPhone" TEXT NOT NULL,
	"CustomerEmail" TEXT,
	"CustomerAddress" TEXT,
	"Note" TEXT,
	"Created" TEXT NOT NULL,
	CONSTRAINT "FK_Order_OrderState_OrderStateId" FOREIGN KEY("OrderStateId") REFERENCES "OrderStates" ("Id"),
	CONSTRAINT "FK_Order_PaymentMethod_PaymentMethodId" FOREIGN KEY("PaymentMethodId") REFERENCES "PaymentMethods" ("Id"),
	CONSTRAINT "FK_Order_DeliveryMethod_DeliveryMethodId" FOREIGN KEY("DeliveryMethodId") REFERENCES "DeliveryMethods" ("Id")
);
CREATE TABLE "OrderStates" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_OrderState" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_OrderState_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (1,'New',92,10);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (2,'Confirmed',93,20);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (3,'Scheduled',94,30);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (4,'BeingDelivered',95,40);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (5,'Delivered',96,50);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (6,'Closed',97,60);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (7,'Canceled',98,70);
CREATE TABLE "Objects" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Object" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER NOT NULL,
	CONSTRAINT "FK_Object_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `Objects` (Id,ClassId) VALUES (1,2);
INSERT INTO `Objects` (Id,ClassId) VALUES (2,2);
INSERT INTO `Objects` (Id,ClassId) VALUES (3,2);
CREATE TABLE "Menus" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Menu" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	CONSTRAINT "FK_Menu_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Menus` (Id,Code,NameId) VALUES (1,'Main',1);
CREATE TABLE "MenuItems" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_MenuItem" PRIMARY KEY AUTOINCREMENT,
	"MenuId" INTEGER,
	"MenuItemId" INTEGER,
	"NameId" INTEGER NOT NULL,
	"Url" TEXT,
	"Position" INTEGER,
	CONSTRAINT "FK_MenuItem_Menu_MenuId" FOREIGN KEY("MenuId") REFERENCES "Menus" ("Id"),
	CONSTRAINT "FK_MenuItem_MenuItem_MenuItemId" FOREIGN KEY("MenuItemId") REFERENCES "MenuItems" ("Id"),
	CONSTRAINT "FK_MenuItem_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `MenuItems` (Id,MenuId,MenuItemId,NameId,Url,Position) VALUES (1,1,NULL,2,'/',10);
INSERT INTO `MenuItems` (Id,MenuId,MenuItemId,NameId,Url,Position) VALUES (2,1,NULL,3,'/about-us',20);
INSERT INTO `MenuItems` (Id,MenuId,MenuItemId,NameId,Url,Position) VALUES (3,1,NULL,4,'/contacts',30);
INSERT INTO `MenuItems` (Id,MenuId,MenuItemId,NameId,Url,Position) VALUES (4,1,NULL,5,'/ecommerce/cart',40);
CREATE TABLE "Members" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Member" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER NOT NULL,
	"TabId" INTEGER,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER,
	"PropertyDataTypeId" INTEGER,
	"IsPropertyLocalizable" INTEGER,
	"IsPropertyVisibleInList" INTEGER,
	"RelationClassId" INTEGER,
	"IsRelationSingleParent" INTEGER,
  "MinRelatedObjectsNumber" INTEGER,
  "MaxRelatedObjectsNumber" INTEGER,
	CONSTRAINT "FK_Member_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes" ("Id"),
	CONSTRAINT "FK_Member_Tab_TabId" FOREIGN KEY("TabId") REFERENCES "Tabs" ("Id"),
	CONSTRAINT "FK_Member_DataType_PropertyDataTypeId" FOREIGN KEY("PropertyDataTypeId") REFERENCES "DataTypes" ("Id"),
	CONSTRAINT "FK_Member_Class_RelationClassId" FOREIGN KEY("RelationClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (1,1,NULL,'Url','URL',1,1,0,1,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (2,1,NULL,'Content','Content',10,3,1,0,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (3,1,1,'Title','Title',1000,1,1,0,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (4,1,1,'MetaDescription','META description',1010,1,1,0,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (5,1,1,'MetaKeywords','META keywords',1020,1,1,0,NULL,NULL,NULL,NULL);
CREATE TABLE "Localizations" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Localization" PRIMARY KEY AUTOINCREMENT,
	"DictionaryId" INTEGER NOT NULL,
	"CultureId" INTEGER NOT NULL,
	"Value" TEXT,
	CONSTRAINT "FK_Localization_Dictionary_DictionaryId" FOREIGN KEY ("DictionaryId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Localization_Culture_CultureId" FOREIGN KEY ("CultureId") REFERENCES "Cultures" ("Id")
);
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (1,1,2,'Main');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (2,1,3,'Главное');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (3,1,4,'Головне');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (4,2,2,'Home');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (5,2,3,'Главная');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (6,2,4,'Головна');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (7,3,2,'About us');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (8,3,3,'О нас');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (9,3,4,'Про нас');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (10,4,2,'Contacts');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (11,4,3,'Контакты');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (12,4,4,'Контакти');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (13,5,2,'Cart');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (14,5,3,'Корзина');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (15,5,4,'Корзина');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (16,6,2,'Feedback');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (17,6,3,'Обратная связь');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (18,6,4,'Зворотний зв’язок');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (19,7,2,'Submit');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (20,7,3,'Отправить');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (21,7,4,'Надіслати');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (22,8,2,'Your name');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (23,8,3,'Ваше имя');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (24,8,4,'Ваше ім’я');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (25,9,2,'Your email');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (26,9,3,'Ваша электронная почта');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (27,9,4,'Ваша електронна пошта');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (28,10,2,'Your message');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (29,10,3,'Ваше сообщение');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (30,10,4,'Ваше повідомлення');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (31,11,2,'Pizza');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (32,11,3,'Пицца');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (33,11,4,'Піца');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (34,12,2,'Panini');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (35,12,3,'Панини');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (36,12,4,'Паніні');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (37,13,2,'Drinks');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (38,13,3,'Напитки');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (39,13,4,'Напої');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (43,15,2,'Panini');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (44,15,3,'Панини');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (45,15,4,'Паніні');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (46,16,2,'Drinks');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (47,16,3,'Напитки');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (48,16,4,'Напої');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (274,92,2,'New');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (275,92,3,'Новый');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (276,92,4,'Новий');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (277,93,2,'Confirmed');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (278,93,3,'Подтвержден');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (279,93,4,'Підтверджений');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (280,94,2,'Scheduled');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (281,94,3,'Запланирован');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (282,94,4,'Запланований');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (283,95,2,'Being delivered');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (284,95,3,'Доставляется');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (285,95,4,'Доставляється');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (286,96,2,'Delivered');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (287,96,3,'Доставлен');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (288,96,4,'Доставлений');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (289,97,2,'Closed');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (290,97,3,'Закрыт');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (291,97,4,'Закритий');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (292,98,2,'Canceled');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (293,98,3,'Отменен');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (294,98,4,'Скасований');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (295,99,2,'Not set');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (296,99,3,'Не указан');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (297,99,4,'Не вказано');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (298,100,2,'Cash');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (299,100,3,'Наличные');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (300,100,4,'Готівка');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (301,101,2,'Not set');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (302,101,3,'Не указан');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (303,101,4,'Не вказано');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (304,102,2,'Pickup');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (305,102,3,'Самовывоз');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (306,102,4,'Самовивіз');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (307,103,2,'Courier');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (308,103,3,'Курьер');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (309,103,4,'Кур’єр');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (310,104,1,'/');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (311,105,2,'<h1>Your Ecommerce Website</h1><p>Hello! This is your ecommerce website, it is based on the <a href="http://platformus.net/" target="_blank" rel="noopener">Platformus</a> content management system. You can manage it (create pages, menu items, forms and so on) using the <a href="/backend">backend</a>. Please use the username and password specified during the installation to sign in (it is &ldquo;admin@platformus.net&rdquo; and &ldquo;admin&rdquo; by default).</p><p>Please use the <a href="http://docs.platformus.net/" target="_blank" rel="noopener">documentation</a> to learn more about Platformus and how to use it. There are several examples that could be useful for the beginners. Also, you can get help in our <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">chat</a>.</p><p>Have a nice work!</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (312,105,3,'<h1>Ваш веб-сайт электронной коммерции</h1><p>Здравствуйте! Это ваш веб-сайт электронной коммерции, он работает на базе системы управления содержимым &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Вы можете управлять им (создавать страницы, элементы меню, формы и так далее) с помощью <a href="/backend">бекенда</a>. Для входа используйте, пожалуйста, имя пользователя и пароль, указанные при установке (по умолчанию это &laquo;admin@platformus.net&raquo; и &laquo;admin&raquo; соответственно).</p><p>Чтобы узнать больше о Платформусе и о том, как им пользоваться, пожалуйста, воспользуйтесь <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацией</a>, там есть несколько примеров, которые пригодятся начинающим. При возникновении сложностей или вопросов вы можете обратиться в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, где вам обязательно помогут.</p><p>Приятной работы!</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (313,105,4,'<h1>Ваш веб-сайт електронної комерції</h1><p>Вітаємо! Це ваш веб-сайт електронної комерції, він працює на базі системи керування вмістом &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Ви можете керувати ним (створювати сторінки, елементи меню, форми і так далі) за допомогою <a href="/backend">бекенду</a>. Для входу використовуйте, будь ласка, ім&rsquo;я користувача і пароль, вказані під час установки (за замовчуванням це &laquo;admin@platformus.net&raquo; і &laquo;admin&raquo; відповідно).</p><p>Щоб дізнатися більше про Платформус і про те, як ним користуватися, будь ласка, скористайтеся <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацією</a>, там є декілька прикладів, що стануть у нагоді початківцям. При виникненні труднощів або питань ви можете звернутися в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, де вам обов&rsquo;язково допоможуть.</p><p>Приємної роботи!</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (314,106,2,'Your Ecommerce Website');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (315,106,3,'Ваш веб-сайт электронной коммерции');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (316,106,4,'Ваш веб-сайт електронної комерції');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (317,107,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (318,107,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (319,107,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (320,108,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (321,108,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (322,108,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (323,109,1,'/about-us');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (324,110,2,'<h1>About Us</h1><p>Tell us about your ecommerce website. You can add photos or videos here.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (325,110,3,'<h1>О нас</h1><p>Расскажите о вашем веб-сайте электронной коммерции. Вы можете добавить сюда фотографии или видео.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (326,110,4,'<h1>Про нас</h1><p>Розкажіть про ваш веб-сайт електронної комерції. Ви можете додати сюди фотографії або відео.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (327,111,2,'About Us');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (328,111,3,'О нас');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (329,111,4,'Про нас');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (330,112,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (331,112,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (332,112,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (333,113,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (334,113,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (335,113,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (336,114,1,'/contacts');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (337,115,2,'<h1>Contacts</h1><p>Add your contacts on this page. Phone number, messengers, social links. The feedback form below (by the way, you can edit or move it to a different place) allows your visitors to write you directly from the website, just don&rsquo;t forget to specify the email address for the messages.</p><h2>Feedback from</h2>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (338,115,3,'<h1>Контакты</h1><p>Добавьте свои контакты на этой странице. Телефонный номер, мессенджеры, ссылки на социальные сети. Форма обратной связи, расположенная ниже (кстати, вы можете ее изменить или перенести в другое место), поможет посетителям написать вам сообщение прямо с сайта, лишь укажите для этого адрес, на который нужно присылать сообщения.</p><h2>Форма обратной связи</h2>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (339,115,4,'<h1>Контакти</h1><p>Додайте свої контакти на цій сторінці. Номер телефону, месенджери, посилання на соціальні мережі. Форма зворотного зв&rsquo;язку, розташована нижче (до речі, ви можете її змінити або перенести в інше місце), допоможе відвідувачам написати вам повідомлення прямо з сайту, лише вкажіть для цього адресу, на яку потрібно надсилати повідомлення.</p><h2>Форма зворотного зв&rsquo;язку</h2>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (340,116,2,'Contacts');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (341,116,3,'Контакты');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (342,116,4,'Контакти');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (343,117,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (344,117,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (345,117,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (346,118,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (347,118,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (348,118,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (349,14,4,'Піца');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (350,14,3,'Пицца');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (351,14,2,'Pizza');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (352,20,4,'Піца 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (353,20,3,'Пицца 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (354,20,2,'Pizza 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (355,17,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (356,17,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (357,17,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (358,21,4,'Піца 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (359,21,3,'Пицца 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (360,21,2,'Pizza 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (361,18,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (362,18,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (363,18,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (364,19,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (365,19,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (366,19,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (367,25,4,'Піца 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (368,25,3,'Пицца 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (369,25,2,'Pizza 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (370,22,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (371,22,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (372,22,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (373,26,4,'Піца 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (374,26,3,'Пицца 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (375,26,2,'Pizza 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (376,23,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (377,23,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (378,23,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (379,24,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (380,24,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (381,24,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (382,30,4,'Піца 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (383,30,3,'Пицца 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (384,30,2,'Pizza 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (385,27,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (386,27,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (387,27,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (388,31,4,'Піца 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (389,31,3,'Пицца 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (390,31,2,'Pizza 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (391,28,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (392,28,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (393,28,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (394,29,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (395,29,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (396,29,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (397,35,4,'Піца 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (398,35,3,'Пицца 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (399,35,2,'Pizza 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (400,32,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (401,32,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (402,32,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (403,36,4,'Піца 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (404,36,3,'Пицца 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (405,36,2,'Pizza 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (406,33,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (407,33,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (408,33,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (409,34,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (410,34,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (411,34,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (412,40,4,'Піца 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (413,40,3,'Пицца 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (414,40,2,'Pizza 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (415,37,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (416,37,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (417,37,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (418,41,4,'Піца 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (419,41,3,'Пицца 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (420,41,2,'Pizza 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (421,38,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (422,38,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (423,38,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (424,39,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (425,39,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (426,39,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (427,45,4,'Піца 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (428,45,3,'Пицца 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (429,45,2,'Pizza 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (430,42,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (431,42,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (432,42,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (433,46,4,'Піца 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (434,46,3,'Пицца 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (435,46,2,'Pizza 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (436,43,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (437,43,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (438,43,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (439,44,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (440,44,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (441,44,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (442,50,4,'Піца 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (443,50,3,'Пицца 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (444,50,2,'Pizza 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (445,47,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (446,47,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (447,47,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (448,51,4,'Піца 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (449,51,3,'Пицца 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (450,51,2,'Pizza 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (451,48,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (452,48,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (453,48,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (454,49,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (455,49,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (456,49,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (457,55,4,'Піца 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (458,55,3,'Пицца 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (459,55,2,'Pizza 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (460,52,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (461,52,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (462,52,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (463,56,4,'Піца 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (464,56,3,'Пицца 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (465,56,2,'Pizza 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (466,53,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (467,53,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (468,53,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (469,54,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (470,54,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (471,54,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (472,60,4,'Піца 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (473,60,3,'Пицца 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (474,60,2,'Pizza 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (475,57,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (476,57,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (477,57,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (478,61,4,'Піца 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (479,61,3,'Пицца 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (480,61,2,'Pizza 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (481,58,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (482,58,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (483,58,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (484,59,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (485,59,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (486,59,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (487,65,4,'Паніні 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (488,65,3,'Панини 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (489,65,2,'Panini 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (490,62,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (491,62,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (492,62,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (493,66,4,'Паніні 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (494,66,3,'Панини 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (495,66,2,'Panini 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (496,63,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (497,63,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (498,63,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (499,64,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (500,64,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (501,64,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (502,70,4,'Паніні 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (503,70,3,'Панини 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (504,70,2,'Panini 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (505,67,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (506,67,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (507,67,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (508,71,4,'Паніні 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (509,71,3,'Панини 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (510,71,2,'Panini 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (511,68,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (512,68,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (513,68,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (514,69,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (515,69,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (516,69,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (517,75,4,'Паніні 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (518,75,3,'Панини 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (519,75,2,'Panini 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (520,72,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (521,72,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (522,72,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (523,76,4,'Паніні 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (524,76,3,'Панини 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (525,76,2,'Panini 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (526,73,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (527,73,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (528,73,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (529,74,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (530,74,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (531,74,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (532,80,4,'Напої 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (533,80,3,'Напитки 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (534,80,2,'Drinks 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (535,77,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (536,77,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (537,77,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (538,81,4,'Напої 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (539,81,3,'Напитки 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (540,81,2,'Drinks 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (541,78,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (542,78,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (543,78,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (544,79,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (545,79,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (546,79,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (547,85,4,'Напої 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (548,85,3,'Напитки 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (549,85,2,'Drinks 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (550,82,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (551,82,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (552,82,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (553,86,4,'Напої 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (554,86,3,'Напитки 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (555,86,2,'Drinks 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (556,83,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (557,83,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (558,83,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (559,84,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (560,84,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (561,84,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (562,90,4,'Напої 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (563,90,3,'Напитки 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (564,90,2,'Drinks 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (565,87,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (566,87,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (567,87,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (568,91,4,'Напої 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (569,91,3,'Напитки 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (570,91,2,'Drinks 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (571,88,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (572,88,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (573,88,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (574,89,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (575,89,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (576,89,2,'');
CREATE TABLE "Forms" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Form" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"SubmitButtonTitleId" INTEGER NOT NULL,
	"ProduceCompletedForms" INTEGER NOT NULL,
	"CSharpClassName" TEXT NOT NULL,
	"Parameters" TEXT,
	CONSTRAINT "FK_Form_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Form_Dictionary_SubmitButtonTitleId" FOREIGN KEY ("SubmitButtonTitleId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Forms` (Id,Code,NameId,SubmitButtonTitleId,ProduceCompletedForms,CSharpClassName,Parameters) VALUES (1,'Feedback',6,7,1,'Platformus.Forms.Frontend.FormHandlers.EmailFormHandler','RecipientEmails=test@test.com;RedirectUrl=/contacts');
CREATE TABLE "Files" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_File" PRIMARY KEY AUTOINCREMENT,
	"Name" TEXT NOT NULL,
	"Size" INTEGER NOT NULL
);
CREATE TABLE "Fields" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Field" PRIMARY KEY AUTOINCREMENT,
	"FormId" INTEGER NOT NULL,
	"FieldTypeId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"IsRequired" INTEGER NOT NULL,
	"MaxLength" INTEGER,
	"Position" INTEGER,
	CONSTRAINT "FK_Field_Form_FormId" FOREIGN KEY ("FormId") REFERENCES "Forms" ("Id"),
	CONSTRAINT "FK_Field_FieldType_FieldTypeId" FOREIGN KEY ("FieldTypeId") REFERENCES "FieldTypes" ("Id"),
	CONSTRAINT "FK_Field_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (1,1,1,'Name',8,1,NULL,10);
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (2,1,1,'Email',9,1,NULL,20);
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (3,1,2,'Message',10,1,NULL,30);
CREATE TABLE "FieldTypes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_FieldType" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (1,'TextBox','Text box',1);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (2,'TextArea','Text area',2);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (3,'Checkbox','Checkbox',3);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (4,'RadioButtonList','Radio button list',4);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (5,'DropDownList','Drop down list',5);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (6,'FileUpload','File upload',6);
CREATE TABLE "FieldOptions" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_FieldOption" PRIMARY KEY AUTOINCREMENT,
	"FieldId" INTEGER NOT NULL,
	"ValueId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_FieldOption_Field_FieldId" FOREIGN KEY ("FieldId") REFERENCES "Fields" ("Id"),
	CONSTRAINT "FK_FieldOption_Dictionary_ValueId" FOREIGN KEY ("ValueId") REFERENCES "Dictionaries" ("Id")
);
CREATE TABLE "Features" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Feature" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Feature_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
CREATE TABLE "Endpoints" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Endpoint" PRIMARY KEY AUTOINCREMENT,
	"Name" TEXT NOT NULL,
	"UrlTemplate" TEXT,
	"Position" INTEGER,
	"DisallowAnonymous" INTEGER NOT NULL,
	"SignInUrl" TEXT,
	"CSharpClassName" TEXT NOT NULL,
	"Parameters" TEXT
);
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (1,'Default','{*url}',1000,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=RegularPage;UseCaching=true');
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (2,'Contacts','about-us',10,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=RegularPage;UseCaching=true');
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (3,'Contacts','contacts',20,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=ContactsPage;UseCaching=true');
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (4,'Catalog','{catalog}',30,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=CatalogPage;UseCaching=false');
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (5,'Product','{catalog}/{product}',40,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=ProductPage;UseCaching=false');
CREATE TABLE "EndpointPermissions" (
	"EndpointId" INTEGER NOT NULL,
	"PermissionId" INTEGER NOT NULL,
	CONSTRAINT "PK_EndpointPermission" PRIMARY KEY ("EndpointId", "PermissionId"),
	CONSTRAINT "FK_EndpointPermission_Endpoint_EndpointId" FOREIGN KEY ("EndpointId") REFERENCES "Endpoints" ("Id"),
	CONSTRAINT "FK_EndpointPermission_Permission_PermissionId" FOREIGN KEY ("PermissionId") REFERENCES "Permissions" ("Id")
);
CREATE TABLE "Dictionaries" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Dictionary" PRIMARY KEY AUTOINCREMENT
);
INSERT INTO `Dictionaries` (Id) VALUES (1);
INSERT INTO `Dictionaries` (Id) VALUES (2);
INSERT INTO `Dictionaries` (Id) VALUES (3);
INSERT INTO `Dictionaries` (Id) VALUES (4);
INSERT INTO `Dictionaries` (Id) VALUES (5);
INSERT INTO `Dictionaries` (Id) VALUES (6);
INSERT INTO `Dictionaries` (Id) VALUES (7);
INSERT INTO `Dictionaries` (Id) VALUES (8);
INSERT INTO `Dictionaries` (Id) VALUES (9);
INSERT INTO `Dictionaries` (Id) VALUES (10);
INSERT INTO `Dictionaries` (Id) VALUES (11);
INSERT INTO `Dictionaries` (Id) VALUES (12);
INSERT INTO `Dictionaries` (Id) VALUES (13);
INSERT INTO `Dictionaries` (Id) VALUES (14);
INSERT INTO `Dictionaries` (Id) VALUES (15);
INSERT INTO `Dictionaries` (Id) VALUES (16);
INSERT INTO `Dictionaries` (Id) VALUES (17);
INSERT INTO `Dictionaries` (Id) VALUES (18);
INSERT INTO `Dictionaries` (Id) VALUES (19);
INSERT INTO `Dictionaries` (Id) VALUES (20);
INSERT INTO `Dictionaries` (Id) VALUES (21);
INSERT INTO `Dictionaries` (Id) VALUES (22);
INSERT INTO `Dictionaries` (Id) VALUES (23);
INSERT INTO `Dictionaries` (Id) VALUES (24);
INSERT INTO `Dictionaries` (Id) VALUES (25);
INSERT INTO `Dictionaries` (Id) VALUES (26);
INSERT INTO `Dictionaries` (Id) VALUES (27);
INSERT INTO `Dictionaries` (Id) VALUES (28);
INSERT INTO `Dictionaries` (Id) VALUES (29);
INSERT INTO `Dictionaries` (Id) VALUES (30);
INSERT INTO `Dictionaries` (Id) VALUES (31);
INSERT INTO `Dictionaries` (Id) VALUES (32);
INSERT INTO `Dictionaries` (Id) VALUES (33);
INSERT INTO `Dictionaries` (Id) VALUES (34);
INSERT INTO `Dictionaries` (Id) VALUES (35);
INSERT INTO `Dictionaries` (Id) VALUES (36);
INSERT INTO `Dictionaries` (Id) VALUES (37);
INSERT INTO `Dictionaries` (Id) VALUES (38);
INSERT INTO `Dictionaries` (Id) VALUES (39);
INSERT INTO `Dictionaries` (Id) VALUES (40);
INSERT INTO `Dictionaries` (Id) VALUES (41);
INSERT INTO `Dictionaries` (Id) VALUES (42);
INSERT INTO `Dictionaries` (Id) VALUES (43);
INSERT INTO `Dictionaries` (Id) VALUES (44);
INSERT INTO `Dictionaries` (Id) VALUES (45);
INSERT INTO `Dictionaries` (Id) VALUES (46);
INSERT INTO `Dictionaries` (Id) VALUES (47);
INSERT INTO `Dictionaries` (Id) VALUES (48);
INSERT INTO `Dictionaries` (Id) VALUES (49);
INSERT INTO `Dictionaries` (Id) VALUES (50);
INSERT INTO `Dictionaries` (Id) VALUES (51);
INSERT INTO `Dictionaries` (Id) VALUES (52);
INSERT INTO `Dictionaries` (Id) VALUES (53);
INSERT INTO `Dictionaries` (Id) VALUES (54);
INSERT INTO `Dictionaries` (Id) VALUES (55);
INSERT INTO `Dictionaries` (Id) VALUES (56);
INSERT INTO `Dictionaries` (Id) VALUES (57);
INSERT INTO `Dictionaries` (Id) VALUES (58);
INSERT INTO `Dictionaries` (Id) VALUES (59);
INSERT INTO `Dictionaries` (Id) VALUES (60);
INSERT INTO `Dictionaries` (Id) VALUES (61);
INSERT INTO `Dictionaries` (Id) VALUES (62);
INSERT INTO `Dictionaries` (Id) VALUES (63);
INSERT INTO `Dictionaries` (Id) VALUES (64);
INSERT INTO `Dictionaries` (Id) VALUES (65);
INSERT INTO `Dictionaries` (Id) VALUES (66);
INSERT INTO `Dictionaries` (Id) VALUES (67);
INSERT INTO `Dictionaries` (Id) VALUES (68);
INSERT INTO `Dictionaries` (Id) VALUES (69);
INSERT INTO `Dictionaries` (Id) VALUES (70);
INSERT INTO `Dictionaries` (Id) VALUES (71);
INSERT INTO `Dictionaries` (Id) VALUES (72);
INSERT INTO `Dictionaries` (Id) VALUES (73);
INSERT INTO `Dictionaries` (Id) VALUES (74);
INSERT INTO `Dictionaries` (Id) VALUES (75);
INSERT INTO `Dictionaries` (Id) VALUES (76);
INSERT INTO `Dictionaries` (Id) VALUES (77);
INSERT INTO `Dictionaries` (Id) VALUES (78);
INSERT INTO `Dictionaries` (Id) VALUES (79);
INSERT INTO `Dictionaries` (Id) VALUES (80);
INSERT INTO `Dictionaries` (Id) VALUES (81);
INSERT INTO `Dictionaries` (Id) VALUES (82);
INSERT INTO `Dictionaries` (Id) VALUES (83);
INSERT INTO `Dictionaries` (Id) VALUES (84);
INSERT INTO `Dictionaries` (Id) VALUES (85);
INSERT INTO `Dictionaries` (Id) VALUES (86);
INSERT INTO `Dictionaries` (Id) VALUES (87);
INSERT INTO `Dictionaries` (Id) VALUES (88);
INSERT INTO `Dictionaries` (Id) VALUES (89);
INSERT INTO `Dictionaries` (Id) VALUES (90);
INSERT INTO `Dictionaries` (Id) VALUES (91);
INSERT INTO `Dictionaries` (Id) VALUES (92);
INSERT INTO `Dictionaries` (Id) VALUES (93);
INSERT INTO `Dictionaries` (Id) VALUES (94);
INSERT INTO `Dictionaries` (Id) VALUES (95);
INSERT INTO `Dictionaries` (Id) VALUES (96);
INSERT INTO `Dictionaries` (Id) VALUES (97);
INSERT INTO `Dictionaries` (Id) VALUES (98);
INSERT INTO `Dictionaries` (Id) VALUES (99);
INSERT INTO `Dictionaries` (Id) VALUES (100);
INSERT INTO `Dictionaries` (Id) VALUES (101);
INSERT INTO `Dictionaries` (Id) VALUES (102);
INSERT INTO `Dictionaries` (Id) VALUES (103);
INSERT INTO `Dictionaries` (Id) VALUES (104);
INSERT INTO `Dictionaries` (Id) VALUES (105);
INSERT INTO `Dictionaries` (Id) VALUES (106);
INSERT INTO `Dictionaries` (Id) VALUES (107);
INSERT INTO `Dictionaries` (Id) VALUES (108);
INSERT INTO `Dictionaries` (Id) VALUES (109);
INSERT INTO `Dictionaries` (Id) VALUES (110);
INSERT INTO `Dictionaries` (Id) VALUES (111);
INSERT INTO `Dictionaries` (Id) VALUES (112);
INSERT INTO `Dictionaries` (Id) VALUES (113);
INSERT INTO `Dictionaries` (Id) VALUES (114);
INSERT INTO `Dictionaries` (Id) VALUES (115);
INSERT INTO `Dictionaries` (Id) VALUES (116);
INSERT INTO `Dictionaries` (Id) VALUES (117);
INSERT INTO `Dictionaries` (Id) VALUES (118);
CREATE TABLE "DeliveryMethods" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DeliveryMethod" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_DeliveryMethod_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `DeliveryMethods` (Id,Code,NameId,Position) VALUES (1,'NotSet',101,10);
INSERT INTO `DeliveryMethods` (Id,Code,NameId,Position) VALUES (2,'Pickup',102,20);
INSERT INTO `DeliveryMethods` (Id,Code,NameId,Position) VALUES (3,'Courier',103,30);
CREATE TABLE "DataTypes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataType" PRIMARY KEY AUTOINCREMENT,
	"StorageDataType" TEXT NOT NULL,
	"JavaScriptEditorClassName" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (1,'string','singleLinePlainText','Single line plain text',1);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (2,'string','multilinePlainText','Multiline plain text',2);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (3,'string','html','Html',3);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (4,'integer','integerNumber','Integer number',4);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (5,'decimal','decimalNumber','Decimal number',5);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (6,'integer','booleanFlag','Boolean flag',6);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (7,'datetime','date','Date',7);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (8,'string','image','Image',8);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (9,'string','sourceCode','Source code',9);
CREATE TABLE "DataTypeParameters" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataTypeParameter" PRIMARY KEY AUTOINCREMENT,
	"DataTypeId" INT NOT NULL,
	"JavaScriptEditorClassName" TEXT NOT NULL,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	CONSTRAINT "FK_DataTypeParameter_DataType_DataTypeId" FOREIGN KEY("DataTypeId") REFERENCES "DataTypes" ("Id")
);
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (1,1,'checkbox','IsRequired','Is required');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (2,1,'numericTextBox','MaxLength','Max length');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (3,2,'checkbox','IsRequired','Is required');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (4,2,'numericTextBox','MaxLength','Max length');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (5,7,'checkbox','IsRequired','Is required');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (6,8,'numericTextBox','Width','Width');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (7,8,'numericTextBox','Height','Height');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (8,9,'textBox','Mode','Mode');
CREATE TABLE "DataTypeParameterValues" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataTypeParameterValue" PRIMARY KEY AUTOINCREMENT,
	"DataTypeParameterId" INT NOT NULL,
	"MemberId" INT NOT NULL,
	"Value" TEXT NOT NULL,
	CONSTRAINT "FK_DataTypeParameterValue_DataTypeParameter_DataTypeParameterId" FOREIGN KEY("DataTypeParameterId") REFERENCES "DataTypeParameters" ("Id"),
	CONSTRAINT "FK_DataTypeParameterValue_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members" ("Id")
);
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (1,1,1,'true');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (2,2,1,'128');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (3,1,3,'false');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (4,2,3,'128');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (5,1,4,'false');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (6,2,4,'512');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (7,1,5,'false');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (8,2,5,'256');
CREATE TABLE "DataSources" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataSource" PRIMARY KEY AUTOINCREMENT,
	"EndpointId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"CSharpClassName" TEXT NOT NULL,
	"Parameters" TEXT,
	CONSTRAINT "FK_DataSource_Endpoint_EndpointId" FOREIGN KEY("EndpointId") REFERENCES "Endpoints"("Id")
);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (1,1,'Page','Platformus.Domain.Frontend.DataSources.PageObjectDataSource',NULL);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (2,2,'Page','Platformus.Domain.Frontend.DataSources.PageObjectDataSource',NULL);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (3,3,'Page','Platformus.Domain.Frontend.DataSources.PageObjectDataSource',NULL);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (4,4,'Catalog','Platformus.ECommerce.Frontend.DataSources.CatalogDataSource',NULL);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (5,5,'Product','Platformus.ECommerce.Frontend.DataSources.ProductDataSource',NULL);
CREATE TABLE "Cultures" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Culture" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"IsNeutral" INTEGER NOT NULL,
	"IsFrontendDefault" INTEGER NOT NULL,
	"IsBackendDefault" INTEGER NOT NULL
);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsFrontendDefault,IsBackendDefault) VALUES (1,'__','Neutral',1,0,0);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsFrontendDefault,IsBackendDefault) VALUES (2,'en','English',0,1,1);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsFrontendDefault,IsBackendDefault) VALUES (3,'ru','Русский',0,0,0);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsFrontendDefault,IsBackendDefault) VALUES (4,'uk','Українська',0,0,0);
CREATE TABLE "Credentials" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Credential" PRIMARY KEY AUTOINCREMENT,
	"UserId" INTEGER NOT NULL,
	"CredentialTypeId" INTEGER NOT NULL,
	"Identifier" TEXT NOT NULL,
	"Secret" TEXT,
	"Extra" TEXT,
	CONSTRAINT "FK_Credential_User_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id"),
	CONSTRAINT "FK_Credential_CredentialType_CredentialTypeId" FOREIGN KEY ("CredentialTypeId") REFERENCES "CredentialTypes" ("Id")
);
INSERT INTO `Credentials` (Id,UserId,CredentialTypeId,Identifier,Secret,Extra) VALUES (1,1,1,'admin@platformus.net','8lE3xN2Ijiv/Y/aIGwaZLrbcqrt/1jDmzPTdudKbVD0=','0O/ZGwhScZRGbsmiUEckOg==');
CREATE TABLE "CredentialTypes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_CredentialType" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `CredentialTypes` (Id,Code,Name,Position) VALUES (1,'Email','Email',1);
CREATE TABLE "Configurations" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Configuration" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL
);
INSERT INTO `Configurations` (Id,Code,Name) VALUES (1,'Email','Email');
INSERT INTO `Configurations` (Id,Code,Name) VALUES (2,'Globalization','Globalization');
CREATE TABLE "CompletedForms" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_CompletedForm" PRIMARY KEY AUTOINCREMENT,
	"FormId" INTEGER NOT NULL,
	"Created" TEXT NOT NULL,
	CONSTRAINT "FK_CompletedForm_Form_FormId" FOREIGN KEY ("FormId") REFERENCES "Forms" ("Id")
);
CREATE TABLE "CompletedFields" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_CompletedField" PRIMARY KEY AUTOINCREMENT,
	"CompletedFormId" INTEGER NOT NULL,
	"FieldId" INTEGER NOT NULL,
	"Value" TEXT,
	CONSTRAINT "FK_CompletedField_CompletedForm_CompletedFormId" FOREIGN KEY ("CompletedFormId") REFERENCES "CompletedForms" ("Id")
	CONSTRAINT "FK_CompletedField_Field_FieldId" FOREIGN KEY ("FieldId") REFERENCES "Fields" ("Id")
);
CREATE TABLE "Classes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Class" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"PluralizedName" TEXT NOT NULL,
	"IsAbstract" INTEGER NOT NULL,
	CONSTRAINT "FK_Class_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `Classes` (Id,ClassId,Code,Name,PluralizedName,IsAbstract) VALUES (1,NULL,'Page','Page','Pages',1);
INSERT INTO `Classes` (Id,ClassId,Code,Name,PluralizedName,IsAbstract) VALUES (2,1,'RegularPage','Regular Page','Regular Pages',0);
CREATE TABLE "Categories" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Category" PRIMARY KEY AUTOINCREMENT,
	"CategoryId" INTEGER,
	"NameId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Category_Category_CategoryId" FOREIGN KEY("CategoryId") REFERENCES "Categories" ("Id"),
	CONSTRAINT "FK_Category_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Categories` (Id,CategoryId,NameId,Position) VALUES (1,NULL,11,10);
INSERT INTO `Categories` (Id,CategoryId,NameId,Position) VALUES (2,NULL,12,20);
INSERT INTO `Categories` (Id,CategoryId,NameId,Position) VALUES (3,NULL,13,30);
CREATE TABLE "Catalogs" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Catalog" PRIMARY KEY AUTOINCREMENT,
	"CatalogId" INTEGER,
	"Url" TEXT,
	"NameId" INTEGER NOT NULL,
	"CSharpClassName" TEXT NOT NULL,
  "Parameters" TEXT,
	"Position" INTEGER,
	CONSTRAINT "FK_Catalog_Catalog_CatalogId" FOREIGN KEY("CatalogId") REFERENCES "Catalogs" ("Id"),
	CONSTRAINT "FK_Catalog_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Catalogs` (Id,CatalogId,Url,NameId,CSharpClassName,Parameters,Position) VALUES (1,NULL,'/pizza',14,'Platformus.ECommerce.ProductProviders.CategoryProductProvider','CategoryId=1',10);
INSERT INTO `Catalogs` (Id,CatalogId,Url,NameId,CSharpClassName,Parameters,Position) VALUES (2,NULL,'/panini',15,'Platformus.ECommerce.ProductProviders.CategoryProductProvider','CategoryId=2',20);
INSERT INTO `Catalogs` (Id,CatalogId,Url,NameId,CSharpClassName,Parameters,Position) VALUES (3,NULL,'/drinks',16,'Platformus.ECommerce.ProductProviders.CategoryProductProvider','CategoryId=3',30);
CREATE TABLE "Carts" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Cart" PRIMARY KEY AUTOINCREMENT,
	"OrderId" INTEGER,
	"ClientSideId" TEXT NOT NULL,
	"Created" TEXT NOT NULL,
	CONSTRAINT "FK_Cart_Order_OrderId" FOREIGN KEY("OrderId") REFERENCES "Orders" ("Id")
);
CREATE TABLE "Attributes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Attribute" PRIMARY KEY AUTOINCREMENT,
	"FeatureId" INTEGER NOT NULL,
	"ValueId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Attribute_Feature_FeatureId" FOREIGN KEY("FeatureId") REFERENCES "Features" ("Id"),
	CONSTRAINT "FK_Attribute_Dictionary_NameId" FOREIGN KEY("ValueId") REFERENCES "Dictionaries" ("Id")
);
COMMIT;
