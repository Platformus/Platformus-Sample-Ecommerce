BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Users" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	"Created"	TEXT NOT NULL,
	CONSTRAINT "PK_User" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "CredentialTypes" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_CredentialType" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Credentials" (
	"Id"	INTEGER NOT NULL,
	"UserId"	INTEGER NOT NULL,
	"CredentialTypeId"	INTEGER NOT NULL,
	"Identifier"	TEXT NOT NULL,
	"Secret"	TEXT,
	"Extra"	TEXT,
	CONSTRAINT "PK_Credential" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Credential_User_UserId" FOREIGN KEY("UserId") REFERENCES "Users"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Credential_CredentialType_CredentialTypeId" FOREIGN KEY("CredentialTypeId") REFERENCES "CredentialTypes"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Roles" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_Role" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "UserRoles" (
	"UserId"	INTEGER NOT NULL,
	"RoleId"	INTEGER NOT NULL,
	CONSTRAINT "PK_UserRole" PRIMARY KEY("UserId","RoleId"),
	CONSTRAINT "FK_UserRole_User_UserId" FOREIGN KEY("UserId") REFERENCES "Users"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_UserRole_Role_RoleId" FOREIGN KEY("RoleId") REFERENCES "Roles"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Permissions" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_Permission" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "RolePermissions" (
	"RoleId"	INTEGER NOT NULL,
	"PermissionId"	INTEGER NOT NULL,
	CONSTRAINT "PK_RolePermission" PRIMARY KEY("RoleId","PermissionId"),
	CONSTRAINT "FK_RolePermission_Role_RoleId" FOREIGN KEY("RoleId") REFERENCES "Roles"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_RolePermission_Permission_PermissionId" FOREIGN KEY("PermissionId") REFERENCES "Permissions"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Configurations" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	CONSTRAINT "PK_Configuration" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Variables" (
	"Id"	INTEGER NOT NULL,
	"ConfigurationId"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Value"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_Variable" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Variable_Configuration_ConfigurationId" FOREIGN KEY("ConfigurationId") REFERENCES "Configurations"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Cultures" (
	"Id"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"IsNeutral"	INTEGER NOT NULL,
	"IsFrontendDefault"	INTEGER NOT NULL,
	"IsBackendDefault"	INTEGER NOT NULL,
	CONSTRAINT "PK_Culture" PRIMARY KEY("Id")
);
CREATE TABLE IF NOT EXISTS "Dictionaries" (
	"Id"	INTEGER NOT NULL,
	CONSTRAINT "PK_Dictionary" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Localizations" (
	"Id"	INTEGER NOT NULL,
	"DictionaryId"	INTEGER NOT NULL,
	"CultureId"	TEXT NOT NULL,
	"Value"	TEXT,
	CONSTRAINT "PK_Localization" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Localization_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Localization_Dictionary_DictionaryId" FOREIGN KEY("DictionaryId") REFERENCES "Dictionaries"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Endpoints" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	"UrlTemplate"	TEXT,
	"Position"	INTEGER,
	"DisallowAnonymous"	INTEGER NOT NULL,
	"SignInUrl"	TEXT,
	"ResponseCacheCSharpClassName"	TEXT,
	"CSharpClassName"	TEXT NOT NULL,
	"Parameters"	TEXT,
	CONSTRAINT "PK_Endpoint" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "EndpointPermissions" (
	"EndpointId"	INTEGER NOT NULL,
	"PermissionId"	INTEGER NOT NULL,
	CONSTRAINT "PK_EndpointPermission" PRIMARY KEY("EndpointId","PermissionId"),
	CONSTRAINT "FK_EndpointPermission_Permission_PermissionId" FOREIGN KEY("PermissionId") REFERENCES "Permissions"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_EndpointPermission_Endpoint_EndpointId" FOREIGN KEY("EndpointId") REFERENCES "Endpoints"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "DataSources" (
	"Id"	INTEGER NOT NULL,
	"EndpointId"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"CSharpClassName"	TEXT NOT NULL,
	"Parameters"	TEXT,
	CONSTRAINT "PK_DataSource" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_DataSource_Endpoint_EndpointId" FOREIGN KEY("EndpointId") REFERENCES "Endpoints"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Classes" (
	"Id"	INTEGER NOT NULL,
	"ClassId"	INTEGER,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"PluralizedName"	TEXT NOT NULL,
	"IsAbstract"	INTEGER NOT NULL,
	CONSTRAINT "PK_Class" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Class_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS "Tabs" (
	"Id"	INTEGER NOT NULL,
	"ClassId"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_Tab" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Tab_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "DataTypes" (
	"Id"	INTEGER NOT NULL,
	"StorageDataType"	TEXT NOT NULL,
	"JavaScriptEditorClassName"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_DataType" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DataTypeParameters" (
	"Id"	INTEGER NOT NULL,
	"DataTypeId"	INT NOT NULL,
	"JavaScriptEditorClassName"	TEXT NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	CONSTRAINT "PK_DataTypeParameter" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_DataTypeParameter_DataType_DataTypeId" FOREIGN KEY("DataTypeId") REFERENCES "DataTypes"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Members" (
	"Id"	INTEGER NOT NULL,
	"ClassId"	INTEGER NOT NULL,
	"TabId"	INTEGER,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	"PropertyDataTypeId"	INTEGER,
	"IsPropertyLocalizable"	INTEGER,
	"IsPropertyVisibleInList"	INTEGER,
	"RelationClassId"	INTEGER,
	"IsRelationSingleParent"	INTEGER,
	"MinRelatedObjectsNumber"	INTEGER,
	"MaxRelatedObjectsNumber"	INTEGER,
	CONSTRAINT "PK_Member" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Member_Class_RelationClassId" FOREIGN KEY("RelationClassId") REFERENCES "Classes"("Id") ON DELETE SET NULL,
	CONSTRAINT "FK_Member_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Member_Tab_TabId" FOREIGN KEY("TabId") REFERENCES "Tabs"("Id") ON DELETE SET NULL,
	CONSTRAINT "FK_Member_DataType_PropertyDataTypeId" FOREIGN KEY("PropertyDataTypeId") REFERENCES "DataTypes"("Id") ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS "DataTypeParameterValues" (
	"Id"	INTEGER NOT NULL,
	"DataTypeParameterId"	INT NOT NULL,
	"MemberId"	INT NOT NULL,
	"Value"	TEXT NOT NULL,
	CONSTRAINT "PK_DataTypeParameterValue" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_DataTypeParameterValue_DataTypeParameter_DataTypeParameterId" FOREIGN KEY("DataTypeParameterId") REFERENCES "DataTypeParameters"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_DataTypeParameterValue_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Objects" (
	"Id"	INTEGER NOT NULL,
	"ClassId"	INTEGER NOT NULL,
	CONSTRAINT "PK_Object" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Object_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Properties" (
	"Id"	INTEGER NOT NULL,
	"ObjectId"	INTEGER NOT NULL,
	"MemberId"	INTEGER NOT NULL,
	"IntegerValue"	INTEGER,
	"DecimalValue"	REAL,
	"StringValueId"	INTEGER,
	"DateTimeValue"	TEXT,
	CONSTRAINT "PK_Property" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Property_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Property_Dictionary_StringValueId" FOREIGN KEY("StringValueId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Property_Object_ObjectId" FOREIGN KEY("ObjectId") REFERENCES "Objects"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Relations" (
	"Id"	INTEGER NOT NULL,
	"MemberId"	INTEGER NOT NULL,
	"PrimaryId"	INTEGER NOT NULL,
	"ForeignId"	INTEGER NOT NULL,
	CONSTRAINT "PK_Relation" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Relation_Object_PrimaryId" FOREIGN KEY("PrimaryId") REFERENCES "Objects"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Relation_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Relation_Object_ForeignId" FOREIGN KEY("ForeignId") REFERENCES "Objects"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Menus" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	CONSTRAINT "PK_Menu" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Menu_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id")
);
CREATE TABLE IF NOT EXISTS "MenuItems" (
	"Id"	INTEGER NOT NULL,
	"MenuId"	INTEGER,
	"MenuItemId"	INTEGER,
	"NameId"	INTEGER NOT NULL,
	"Url"	TEXT,
	"Position"	INTEGER,
	CONSTRAINT "PK_MenuItem" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_MenuItem_Menu_MenuId" FOREIGN KEY("MenuId") REFERENCES "Menus"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_MenuItem_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_MenuItem_MenuItem_MenuItemId" FOREIGN KEY("MenuItemId") REFERENCES "MenuItems"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Forms" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"SubmitButtonTitleId"	INTEGER NOT NULL,
	"ProduceCompletedForms"	INTEGER NOT NULL,
	"CSharpClassName"	TEXT NOT NULL,
	"Parameters"	TEXT,
	CONSTRAINT "PK_Form" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Form_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Form_Dictionary_SubmitButtonTitleId" FOREIGN KEY("SubmitButtonTitleId") REFERENCES "Dictionaries"("Id")
);
CREATE TABLE IF NOT EXISTS "FieldTypes" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	"ValidatorCSharpClassName"	TEXT,
	CONSTRAINT "PK_FieldType" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Fields" (
	"Id"	INTEGER NOT NULL,
	"FormId"	INTEGER NOT NULL,
	"FieldTypeId"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"IsRequired"	INTEGER NOT NULL,
	"MaxLength"	INTEGER,
	"Position"	INTEGER,
	CONSTRAINT "PK_Field" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Field_Form_FormId" FOREIGN KEY("FormId") REFERENCES "Forms"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Field_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Field_FieldType_FieldTypeId" FOREIGN KEY("FieldTypeId") REFERENCES "FieldTypes"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "FieldOptions" (
	"Id"	INTEGER NOT NULL,
	"FieldId"	INTEGER NOT NULL,
	"ValueId"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_FieldOption" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_FieldOption_Field_FieldId" FOREIGN KEY("FieldId") REFERENCES "Fields"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_FieldOption_Dictionary_ValueId" FOREIGN KEY("ValueId") REFERENCES "Dictionaries"("Id")
);
CREATE TABLE IF NOT EXISTS "CompletedForms" (
	"Id"	INTEGER NOT NULL,
	"FormId"	INTEGER NOT NULL,
	"Created"	TEXT NOT NULL,
	CONSTRAINT "PK_CompletedForm" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_CompletedForm_Form_FormId" FOREIGN KEY("FormId") REFERENCES "Forms"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "CompletedFields" (
	"Id"	INTEGER NOT NULL,
	"CompletedFormId"	INTEGER NOT NULL,
	"FieldId"	INTEGER NOT NULL,
	"Value"	TEXT,
	CONSTRAINT "PK_CompletedField" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_CompletedField_CompletedForm_CompletedFormId" FOREIGN KEY("CompletedFormId") REFERENCES "CompletedForms"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_CompletedField_Field_FieldId" FOREIGN KEY("FieldId") REFERENCES "Fields"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Files" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	"Size"	INTEGER NOT NULL,
	CONSTRAINT "PK_File" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Categories" (
	"Id"	INTEGER NOT NULL,
	"CategoryId"	INTEGER,
	"Url"	TEXT,
	"NameId"	INTEGER NOT NULL,
	"CSharpClassName"	TEXT NOT NULL,
	"Parameters"	TEXT,
	"Position"	INTEGER,
	CONSTRAINT "PK_Category" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Category_Category_CategoryId" FOREIGN KEY("CategoryId") REFERENCES "Categories"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Category_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id")
);
CREATE TABLE IF NOT EXISTS "Products" (
	"Id"	INTEGER NOT NULL,
	"CategoryId"	INTEGER NOT NULL,
	"Url"	TEXT,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"DescriptionId"	INTEGER NOT NULL,
	"UnitsId"	INTEGER NOT NULL,
	"Price"	REAL NOT NULL,
	"TitleId"	INTEGER NOT NULL,
	"MetaDescriptionId"	INTEGER NOT NULL,
	"MetaKeywordsId"	INTEGER NOT NULL,
	CONSTRAINT "PK_Product" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Product_Dictionary_MetaKeywordsId" FOREIGN KEY("MetaKeywordsId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Category_CategoryId" FOREIGN KEY("CategoryId") REFERENCES "Categories"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Product_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_TitleId" FOREIGN KEY("TitleId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_UnitsId" FOREIGN KEY("UnitsId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_MetaDescriptionId" FOREIGN KEY("MetaDescriptionId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_DescriptionId" FOREIGN KEY("DescriptionId") REFERENCES "Dictionaries"("Id")
);
CREATE TABLE IF NOT EXISTS "Photos" (
	"Id"	INTEGER NOT NULL,
	"ProductId"	INTEGER NOT NULL,
	"Filename"	TEXT NOT NULL,
	"IsCover"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_Photo" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Photo_Product_ProductId" FOREIGN KEY("ProductId") REFERENCES "Products"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "OrderStates" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_OrderState" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_OrderState_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id")
);
CREATE TABLE IF NOT EXISTS "PaymentMethods" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_PaymentMethod" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_PaymentMethod_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id")
);
CREATE TABLE IF NOT EXISTS "DeliveryMethods" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_DeliveryMethod" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_DeliveryMethod_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id")
);
CREATE TABLE IF NOT EXISTS "Carts" (
	"Id"	INTEGER NOT NULL,
	"ClientSideId"	TEXT NOT NULL,
	"Created"	TEXT NOT NULL,
	CONSTRAINT "PK_Cart" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Orders" (
	"Id"	INTEGER NOT NULL,
	"OrderStateId"	INTEGER NOT NULL,
	"PaymentMethodId"	INTEGER NOT NULL,
	"DeliveryMethodId"	INTEGER NOT NULL,
	"CustomerFirstName"	TEXT NOT NULL,
	"CustomerLastName"	TEXT,
	"CustomerPhone"	TEXT NOT NULL,
	"CustomerEmail"	TEXT,
	"CustomerAddress"	TEXT,
	"Note"	TEXT,
	"Created"	TEXT NOT NULL,
	CONSTRAINT "PK_Order" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Order_DeliveryMethod_DeliveryMethodId" FOREIGN KEY("DeliveryMethodId") REFERENCES "DeliveryMethods"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Order_PaymentMethod_PaymentMethodId" FOREIGN KEY("PaymentMethodId") REFERENCES "PaymentMethods"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Order_OrderState_OrderStateId" FOREIGN KEY("OrderStateId") REFERENCES "OrderStates"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Positions" (
	"Id"	INTEGER NOT NULL,
	"CartId"	INTEGER,
	"OrderId"	INTEGER,
	"ProductId"	INTEGER NOT NULL,
	"Price"	REAL NOT NULL,
	"Quantity"	REAL NOT NULL,
	"Subtotal"	REAL NOT NULL,
	CONSTRAINT "PK_Position" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Position_Order_OrderId" FOREIGN KEY("OrderId") REFERENCES "Orders"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Position_Cart_CartId" FOREIGN KEY("CartId") REFERENCES "Carts"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Position_Product_ProductId" FOREIGN KEY("ProductId") REFERENCES "Products"("Id") ON DELETE CASCADE
);
INSERT INTO "Users" VALUES (1,'Administrator','2017-01-01 00:00:00.0000000');
INSERT INTO "CredentialTypes" VALUES (1,'Email','Email',1);
INSERT INTO "Credentials" VALUES (1,1,1,'admin@platformus.net','8lE3xN2Ijiv/Y/aIGwaZLrbcqrt/1jDmzPTdudKbVD0=','0O/ZGwhScZRGbsmiUEckOg==');
INSERT INTO "Roles" VALUES (1,'Developer','Developer',100);
INSERT INTO "Roles" VALUES (2,'Administrator','Administrator',200);
INSERT INTO "Roles" VALUES (3,'ContentManager','Content manager',300);
INSERT INTO "UserRoles" VALUES (1,1);
INSERT INTO "UserRoles" VALUES (1,2);
INSERT INTO "Permissions" VALUES (1,'DoAnything','Do anything',100);
INSERT INTO "Permissions" VALUES (2,'ManagePermissions','Manage permissions',200);
INSERT INTO "Permissions" VALUES (3,'ManageRoles','Manage roles',300);
INSERT INTO "Permissions" VALUES (4,'ManageUsers','Manage users',400);
INSERT INTO "Permissions" VALUES (5,'ManageConfigurations','Manage configurations',500);
INSERT INTO "Permissions" VALUES (6,'ManageCultures','Manage cultures',600);
INSERT INTO "Permissions" VALUES (7,'ManageEndpoints','Manage endpoints',700);
INSERT INTO "Permissions" VALUES (8,'ManageObjects','Manage objects',800);
INSERT INTO "Permissions" VALUES (9,'ManageDataTypes','Manage data types',900);
INSERT INTO "Permissions" VALUES (10,'ManageClasses','Manage classes',1000);
INSERT INTO "Permissions" VALUES (11,'ManageMenus','Manage menus',1100);
INSERT INTO "Permissions" VALUES (12,'ManageForms','Manage forms',1200);
INSERT INTO "Permissions" VALUES (13,'ManageFileManager','Manage file manager',1300);
INSERT INTO "Permissions" VALUES (14,'ManageCategories','Manage categories',1400);
INSERT INTO "Permissions" VALUES (15,'ManageProducts','Manage products',1500);
INSERT INTO "Permissions" VALUES (16,'ManageOrderStates','Manage order states',1600);
INSERT INTO "Permissions" VALUES (17,'ManagePaymentMethods','Manage payment methods',1700);
INSERT INTO "Permissions" VALUES (18,'ManageDeliveryMethods','Manage delivery methods',1800);
INSERT INTO "Permissions" VALUES (19,'ManageCarts','Manage carts',1900);
INSERT INTO "Permissions" VALUES (20,'ManageOrders','Manage orders',2000);
INSERT INTO "RolePermissions" VALUES (1,1);
INSERT INTO "RolePermissions" VALUES (2,1);
INSERT INTO "RolePermissions" VALUES (3,8);
INSERT INTO "RolePermissions" VALUES (3,11);
INSERT INTO "RolePermissions" VALUES (3,12);
INSERT INTO "RolePermissions" VALUES (3,13);
INSERT INTO "Configurations" VALUES (1,'Email','Email');
INSERT INTO "Configurations" VALUES (2,'Globalization','Globalization');
INSERT INTO "Variables" VALUES (1,1,'SmtpServer','SMTP server','test',1);
INSERT INTO "Variables" VALUES (2,1,'SmtpPort','SMTP port','25',2);
INSERT INTO "Variables" VALUES (3,1,'SmtpUseSsl','SMTP use SSL','no',3);
INSERT INTO "Variables" VALUES (4,1,'SmtpLogin','SMTP login','test',4);
INSERT INTO "Variables" VALUES (5,1,'SmtpPassword','SMTP password','test',5);
INSERT INTO "Variables" VALUES (6,1,'SmtpSenderEmail','SMTP sender email','test',6);
INSERT INTO "Variables" VALUES (7,1,'SmtpSenderName','SMTP sender name','test',7);
INSERT INTO "Variables" VALUES (8,2,'SpecifyCultureInUrl','Specify culture in URL','yes',1);
INSERT INTO "Cultures" VALUES ('__','Neutral',1,0,0);
INSERT INTO "Cultures" VALUES ('en','English',0,1,1);
INSERT INTO "Cultures" VALUES ('ru','Русский',0,0,0);
INSERT INTO "Cultures" VALUES ('uk','Українська',0,0,0);
INSERT INTO "Dictionaries" VALUES (1);
INSERT INTO "Dictionaries" VALUES (2);
INSERT INTO "Dictionaries" VALUES (3);
INSERT INTO "Dictionaries" VALUES (4);
INSERT INTO "Dictionaries" VALUES (5);
INSERT INTO "Dictionaries" VALUES (6);
INSERT INTO "Dictionaries" VALUES (7);
INSERT INTO "Dictionaries" VALUES (8);
INSERT INTO "Dictionaries" VALUES (9);
INSERT INTO "Dictionaries" VALUES (10);
INSERT INTO "Dictionaries" VALUES (11);
INSERT INTO "Dictionaries" VALUES (12);
INSERT INTO "Dictionaries" VALUES (13);
INSERT INTO "Dictionaries" VALUES (14);
INSERT INTO "Dictionaries" VALUES (15);
INSERT INTO "Dictionaries" VALUES (16);
INSERT INTO "Dictionaries" VALUES (17);
INSERT INTO "Dictionaries" VALUES (18);
INSERT INTO "Dictionaries" VALUES (19);
INSERT INTO "Dictionaries" VALUES (20);
INSERT INTO "Dictionaries" VALUES (21);
INSERT INTO "Dictionaries" VALUES (22);
INSERT INTO "Dictionaries" VALUES (23);
INSERT INTO "Dictionaries" VALUES (24);
INSERT INTO "Dictionaries" VALUES (25);
INSERT INTO "Dictionaries" VALUES (26);
INSERT INTO "Dictionaries" VALUES (27);
INSERT INTO "Dictionaries" VALUES (28);
INSERT INTO "Dictionaries" VALUES (29);
INSERT INTO "Dictionaries" VALUES (30);
INSERT INTO "Dictionaries" VALUES (31);
INSERT INTO "Dictionaries" VALUES (32);
INSERT INTO "Dictionaries" VALUES (33);
INSERT INTO "Dictionaries" VALUES (34);
INSERT INTO "Dictionaries" VALUES (35);
INSERT INTO "Dictionaries" VALUES (36);
INSERT INTO "Dictionaries" VALUES (37);
INSERT INTO "Dictionaries" VALUES (38);
INSERT INTO "Dictionaries" VALUES (39);
INSERT INTO "Dictionaries" VALUES (40);
INSERT INTO "Dictionaries" VALUES (41);
INSERT INTO "Dictionaries" VALUES (42);
INSERT INTO "Dictionaries" VALUES (43);
INSERT INTO "Dictionaries" VALUES (44);
INSERT INTO "Dictionaries" VALUES (45);
INSERT INTO "Dictionaries" VALUES (46);
INSERT INTO "Dictionaries" VALUES (47);
INSERT INTO "Dictionaries" VALUES (48);
INSERT INTO "Dictionaries" VALUES (49);
INSERT INTO "Dictionaries" VALUES (50);
INSERT INTO "Dictionaries" VALUES (51);
INSERT INTO "Dictionaries" VALUES (52);
INSERT INTO "Dictionaries" VALUES (53);
INSERT INTO "Dictionaries" VALUES (54);
INSERT INTO "Dictionaries" VALUES (55);
INSERT INTO "Dictionaries" VALUES (56);
INSERT INTO "Dictionaries" VALUES (57);
INSERT INTO "Dictionaries" VALUES (58);
INSERT INTO "Dictionaries" VALUES (59);
INSERT INTO "Dictionaries" VALUES (60);
INSERT INTO "Dictionaries" VALUES (61);
INSERT INTO "Dictionaries" VALUES (62);
INSERT INTO "Dictionaries" VALUES (63);
INSERT INTO "Dictionaries" VALUES (64);
INSERT INTO "Dictionaries" VALUES (65);
INSERT INTO "Dictionaries" VALUES (66);
INSERT INTO "Dictionaries" VALUES (67);
INSERT INTO "Dictionaries" VALUES (68);
INSERT INTO "Dictionaries" VALUES (69);
INSERT INTO "Dictionaries" VALUES (70);
INSERT INTO "Dictionaries" VALUES (71);
INSERT INTO "Dictionaries" VALUES (72);
INSERT INTO "Dictionaries" VALUES (73);
INSERT INTO "Dictionaries" VALUES (74);
INSERT INTO "Dictionaries" VALUES (75);
INSERT INTO "Dictionaries" VALUES (76);
INSERT INTO "Dictionaries" VALUES (77);
INSERT INTO "Dictionaries" VALUES (78);
INSERT INTO "Dictionaries" VALUES (79);
INSERT INTO "Dictionaries" VALUES (80);
INSERT INTO "Dictionaries" VALUES (81);
INSERT INTO "Dictionaries" VALUES (82);
INSERT INTO "Dictionaries" VALUES (83);
INSERT INTO "Dictionaries" VALUES (84);
INSERT INTO "Dictionaries" VALUES (85);
INSERT INTO "Dictionaries" VALUES (86);
INSERT INTO "Dictionaries" VALUES (87);
INSERT INTO "Dictionaries" VALUES (88);
INSERT INTO "Dictionaries" VALUES (89);
INSERT INTO "Dictionaries" VALUES (90);
INSERT INTO "Dictionaries" VALUES (91);
INSERT INTO "Dictionaries" VALUES (92);
INSERT INTO "Dictionaries" VALUES (93);
INSERT INTO "Dictionaries" VALUES (94);
INSERT INTO "Dictionaries" VALUES (95);
INSERT INTO "Dictionaries" VALUES (96);
INSERT INTO "Dictionaries" VALUES (97);
INSERT INTO "Dictionaries" VALUES (98);
INSERT INTO "Dictionaries" VALUES (99);
INSERT INTO "Dictionaries" VALUES (100);
INSERT INTO "Dictionaries" VALUES (101);
INSERT INTO "Dictionaries" VALUES (102);
INSERT INTO "Dictionaries" VALUES (103);
INSERT INTO "Dictionaries" VALUES (104);
INSERT INTO "Dictionaries" VALUES (105);
INSERT INTO "Dictionaries" VALUES (106);
INSERT INTO "Dictionaries" VALUES (107);
INSERT INTO "Dictionaries" VALUES (108);
INSERT INTO "Dictionaries" VALUES (109);
INSERT INTO "Dictionaries" VALUES (110);
INSERT INTO "Dictionaries" VALUES (111);
INSERT INTO "Dictionaries" VALUES (112);
INSERT INTO "Dictionaries" VALUES (113);
INSERT INTO "Dictionaries" VALUES (114);
INSERT INTO "Dictionaries" VALUES (115);
INSERT INTO "Dictionaries" VALUES (116);
INSERT INTO "Dictionaries" VALUES (117);
INSERT INTO "Dictionaries" VALUES (118);
INSERT INTO "Dictionaries" VALUES (119);
INSERT INTO "Dictionaries" VALUES (120);
INSERT INTO "Dictionaries" VALUES (121);
INSERT INTO "Dictionaries" VALUES (122);
INSERT INTO "Dictionaries" VALUES (123);
INSERT INTO "Dictionaries" VALUES (124);
INSERT INTO "Dictionaries" VALUES (125);
INSERT INTO "Dictionaries" VALUES (126);
INSERT INTO "Dictionaries" VALUES (127);
INSERT INTO "Dictionaries" VALUES (128);
INSERT INTO "Dictionaries" VALUES (129);
INSERT INTO "Dictionaries" VALUES (130);
INSERT INTO "Dictionaries" VALUES (131);
INSERT INTO "Dictionaries" VALUES (132);
INSERT INTO "Dictionaries" VALUES (133);
INSERT INTO "Dictionaries" VALUES (134);
INSERT INTO "Dictionaries" VALUES (135);
INSERT INTO "Localizations" VALUES (1,1,'en','Main');
INSERT INTO "Localizations" VALUES (2,1,'ru','Главное');
INSERT INTO "Localizations" VALUES (3,1,'uk','Головне');
INSERT INTO "Localizations" VALUES (4,2,'uk','Головна');
INSERT INTO "Localizations" VALUES (5,2,'ru','Главная');
INSERT INTO "Localizations" VALUES (6,2,'en','Home');
INSERT INTO "Localizations" VALUES (7,3,'uk','Про нас');
INSERT INTO "Localizations" VALUES (8,3,'ru','О нас');
INSERT INTO "Localizations" VALUES (9,3,'en','About us');
INSERT INTO "Localizations" VALUES (10,4,'uk','Контакти');
INSERT INTO "Localizations" VALUES (11,4,'ru','Контакты');
INSERT INTO "Localizations" VALUES (12,4,'en','Contacts');
INSERT INTO "Localizations" VALUES (13,5,'uk','Кошик');
INSERT INTO "Localizations" VALUES (14,5,'ru','Корзина');
INSERT INTO "Localizations" VALUES (15,5,'en','Cart');
INSERT INTO "Localizations" VALUES (16,6,'uk','Зворотний зв’язок');
INSERT INTO "Localizations" VALUES (17,6,'ru','Обратная связь');
INSERT INTO "Localizations" VALUES (18,6,'en','Feedback');
INSERT INTO "Localizations" VALUES (19,7,'en','Submit');
INSERT INTO "Localizations" VALUES (20,7,'ru','Отправить');
INSERT INTO "Localizations" VALUES (21,7,'uk','Надіслати');
INSERT INTO "Localizations" VALUES (22,8,'uk','Ваше ім’я');
INSERT INTO "Localizations" VALUES (23,8,'ru','Ваше имя');
INSERT INTO "Localizations" VALUES (24,8,'en','Your name');
INSERT INTO "Localizations" VALUES (25,9,'uk','Ваша електронна пошта');
INSERT INTO "Localizations" VALUES (26,9,'ru','Ваша электронная почта');
INSERT INTO "Localizations" VALUES (27,9,'en','Your email');
INSERT INTO "Localizations" VALUES (28,10,'uk','Ваше повідомлення');
INSERT INTO "Localizations" VALUES (29,10,'ru','Ваше сообщение');
INSERT INTO "Localizations" VALUES (30,10,'en','Your message');
INSERT INTO "Localizations" VALUES (31,11,'uk','Піца');
INSERT INTO "Localizations" VALUES (32,11,'ru','Пицца');
INSERT INTO "Localizations" VALUES (33,11,'en','Pizza');
INSERT INTO "Localizations" VALUES (34,12,'uk','Паніні');
INSERT INTO "Localizations" VALUES (35,12,'ru','Панини');
INSERT INTO "Localizations" VALUES (36,12,'en','Panini');
INSERT INTO "Localizations" VALUES (37,13,'uk','Напої');
INSERT INTO "Localizations" VALUES (38,13,'ru','Напитки');
INSERT INTO "Localizations" VALUES (39,13,'en','Drinks');
INSERT INTO "Localizations" VALUES (40,14,'uk','');
INSERT INTO "Localizations" VALUES (41,19,'en','420 g');
INSERT INTO "Localizations" VALUES (42,18,'uk','Піца 1');
INSERT INTO "Localizations" VALUES (43,18,'ru','Пицца 1');
INSERT INTO "Localizations" VALUES (44,18,'en','Pizza 1');
INSERT INTO "Localizations" VALUES (45,17,'uk','Піца 1');
INSERT INTO "Localizations" VALUES (46,17,'ru','Пицца 1');
INSERT INTO "Localizations" VALUES (47,19,'ru','420 г');
INSERT INTO "Localizations" VALUES (48,17,'en','Pizza 1');
INSERT INTO "Localizations" VALUES (49,16,'ru','');
INSERT INTO "Localizations" VALUES (50,16,'en','');
INSERT INTO "Localizations" VALUES (51,15,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (52,15,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (53,15,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (54,14,'en','');
INSERT INTO "Localizations" VALUES (55,14,'ru','');
INSERT INTO "Localizations" VALUES (56,16,'uk','');
INSERT INTO "Localizations" VALUES (57,19,'uk','420 г');
INSERT INTO "Localizations" VALUES (58,20,'uk','480 г');
INSERT INTO "Localizations" VALUES (59,25,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (60,25,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (61,24,'en','');
INSERT INTO "Localizations" VALUES (62,24,'ru','');
INSERT INTO "Localizations" VALUES (63,24,'uk','');
INSERT INTO "Localizations" VALUES (64,23,'en','');
INSERT INTO "Localizations" VALUES (65,23,'ru','');
INSERT INTO "Localizations" VALUES (66,25,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (67,23,'uk','');
INSERT INTO "Localizations" VALUES (68,22,'ru','Пицца 2');
INSERT INTO "Localizations" VALUES (69,22,'uk','Піца 2');
INSERT INTO "Localizations" VALUES (70,21,'en','Pizza 2');
INSERT INTO "Localizations" VALUES (71,21,'ru','Пицца 2');
INSERT INTO "Localizations" VALUES (72,21,'uk','Піца 2');
INSERT INTO "Localizations" VALUES (73,20,'en','480 g');
INSERT INTO "Localizations" VALUES (74,20,'ru','480 г');
INSERT INTO "Localizations" VALUES (75,22,'en','Pizza 2');
INSERT INTO "Localizations" VALUES (76,26,'uk','440 г');
INSERT INTO "Localizations" VALUES (77,31,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (78,31,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (79,30,'en','');
INSERT INTO "Localizations" VALUES (80,30,'ru','');
INSERT INTO "Localizations" VALUES (81,30,'uk','');
INSERT INTO "Localizations" VALUES (82,29,'en','');
INSERT INTO "Localizations" VALUES (83,29,'ru','');
INSERT INTO "Localizations" VALUES (84,31,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (85,29,'uk','');
INSERT INTO "Localizations" VALUES (86,28,'ru','Пицца 3');
INSERT INTO "Localizations" VALUES (87,28,'uk','Піца 3');
INSERT INTO "Localizations" VALUES (88,27,'en','Pizza 3');
INSERT INTO "Localizations" VALUES (89,27,'ru','Пицца 3');
INSERT INTO "Localizations" VALUES (90,27,'uk','Піца 3');
INSERT INTO "Localizations" VALUES (91,26,'en','440 g');
INSERT INTO "Localizations" VALUES (92,26,'ru','440 г');
INSERT INTO "Localizations" VALUES (93,28,'en','Pizza 3');
INSERT INTO "Localizations" VALUES (94,32,'uk','420 г');
INSERT INTO "Localizations" VALUES (95,37,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (96,37,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (97,36,'en','');
INSERT INTO "Localizations" VALUES (98,36,'ru','');
INSERT INTO "Localizations" VALUES (99,36,'uk','');
INSERT INTO "Localizations" VALUES (100,35,'en','');
INSERT INTO "Localizations" VALUES (101,35,'ru','');
INSERT INTO "Localizations" VALUES (102,37,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (103,35,'uk','');
INSERT INTO "Localizations" VALUES (104,34,'ru','Пицца 4');
INSERT INTO "Localizations" VALUES (105,34,'uk','Піца 4');
INSERT INTO "Localizations" VALUES (106,33,'en','Pizza 4');
INSERT INTO "Localizations" VALUES (107,33,'ru','Пицца 4');
INSERT INTO "Localizations" VALUES (108,33,'uk','Піца 4');
INSERT INTO "Localizations" VALUES (109,32,'en','420 g');
INSERT INTO "Localizations" VALUES (110,32,'ru','420 г');
INSERT INTO "Localizations" VALUES (111,34,'en','Pizza 4');
INSERT INTO "Localizations" VALUES (112,38,'uk','470 г');
INSERT INTO "Localizations" VALUES (113,43,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (114,43,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (115,42,'en','');
INSERT INTO "Localizations" VALUES (116,42,'ru','');
INSERT INTO "Localizations" VALUES (117,42,'uk','');
INSERT INTO "Localizations" VALUES (118,41,'en','');
INSERT INTO "Localizations" VALUES (119,41,'ru','');
INSERT INTO "Localizations" VALUES (120,43,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (121,41,'uk','');
INSERT INTO "Localizations" VALUES (122,40,'ru','Пицца 5');
INSERT INTO "Localizations" VALUES (123,40,'uk','Піца 5');
INSERT INTO "Localizations" VALUES (124,39,'en','Pizza 5');
INSERT INTO "Localizations" VALUES (125,39,'ru','Пицца 5');
INSERT INTO "Localizations" VALUES (126,39,'uk','Піца 5');
INSERT INTO "Localizations" VALUES (127,38,'en','470 g');
INSERT INTO "Localizations" VALUES (128,38,'ru','470 г');
INSERT INTO "Localizations" VALUES (129,40,'en','Pizza 5');
INSERT INTO "Localizations" VALUES (130,44,'uk','420 г');
INSERT INTO "Localizations" VALUES (131,49,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (132,49,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (133,48,'en','');
INSERT INTO "Localizations" VALUES (134,48,'ru','');
INSERT INTO "Localizations" VALUES (135,48,'uk','');
INSERT INTO "Localizations" VALUES (136,47,'en','');
INSERT INTO "Localizations" VALUES (137,47,'ru','');
INSERT INTO "Localizations" VALUES (138,49,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (139,47,'uk','');
INSERT INTO "Localizations" VALUES (140,46,'ru','Пицца 6');
INSERT INTO "Localizations" VALUES (141,46,'uk','Піца 6');
INSERT INTO "Localizations" VALUES (142,45,'en','Pizza 6');
INSERT INTO "Localizations" VALUES (143,45,'ru','Пицца 6');
INSERT INTO "Localizations" VALUES (144,45,'uk','Піца 6');
INSERT INTO "Localizations" VALUES (145,44,'en','420 g');
INSERT INTO "Localizations" VALUES (146,44,'ru','420 г');
INSERT INTO "Localizations" VALUES (147,46,'en','Pizza 6');
INSERT INTO "Localizations" VALUES (148,50,'uk','410 г');
INSERT INTO "Localizations" VALUES (149,55,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (150,55,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (151,54,'en','');
INSERT INTO "Localizations" VALUES (152,54,'ru','');
INSERT INTO "Localizations" VALUES (153,54,'uk','');
INSERT INTO "Localizations" VALUES (154,53,'en','');
INSERT INTO "Localizations" VALUES (155,53,'ru','');
INSERT INTO "Localizations" VALUES (156,55,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (157,53,'uk','');
INSERT INTO "Localizations" VALUES (158,52,'ru','Пицца 7');
INSERT INTO "Localizations" VALUES (159,52,'uk','Піца 7');
INSERT INTO "Localizations" VALUES (160,51,'en','Pizza 7');
INSERT INTO "Localizations" VALUES (161,51,'ru','Пицца 7');
INSERT INTO "Localizations" VALUES (162,51,'uk','Піца 7');
INSERT INTO "Localizations" VALUES (163,50,'en','410 g');
INSERT INTO "Localizations" VALUES (164,50,'ru','410 г');
INSERT INTO "Localizations" VALUES (165,52,'en','Pizza 7');
INSERT INTO "Localizations" VALUES (166,56,'uk','470 г');
INSERT INTO "Localizations" VALUES (167,61,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (168,61,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (169,60,'en','');
INSERT INTO "Localizations" VALUES (170,60,'ru','');
INSERT INTO "Localizations" VALUES (171,60,'uk','');
INSERT INTO "Localizations" VALUES (172,59,'en','');
INSERT INTO "Localizations" VALUES (173,59,'ru','');
INSERT INTO "Localizations" VALUES (174,61,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (175,59,'uk','');
INSERT INTO "Localizations" VALUES (176,58,'ru','Пицца 8');
INSERT INTO "Localizations" VALUES (177,58,'uk','Піца 8');
INSERT INTO "Localizations" VALUES (178,57,'en','Pizza 8');
INSERT INTO "Localizations" VALUES (179,57,'ru','Пицца 8');
INSERT INTO "Localizations" VALUES (180,57,'uk','Піца 8');
INSERT INTO "Localizations" VALUES (181,56,'en','470 g');
INSERT INTO "Localizations" VALUES (182,56,'ru','470 г');
INSERT INTO "Localizations" VALUES (183,58,'en','Pizza 8');
INSERT INTO "Localizations" VALUES (184,62,'uk','430 г');
INSERT INTO "Localizations" VALUES (185,67,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (186,67,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (187,66,'en','');
INSERT INTO "Localizations" VALUES (188,66,'ru','');
INSERT INTO "Localizations" VALUES (189,66,'uk','');
INSERT INTO "Localizations" VALUES (190,65,'en','');
INSERT INTO "Localizations" VALUES (191,65,'ru','');
INSERT INTO "Localizations" VALUES (192,67,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (193,65,'uk','');
INSERT INTO "Localizations" VALUES (194,64,'ru','Пицца 9');
INSERT INTO "Localizations" VALUES (195,64,'uk','Піца 9');
INSERT INTO "Localizations" VALUES (196,63,'en','Pizza 9');
INSERT INTO "Localizations" VALUES (197,63,'ru','Пицца 9');
INSERT INTO "Localizations" VALUES (198,63,'uk','Піца 9');
INSERT INTO "Localizations" VALUES (199,62,'en','430 g');
INSERT INTO "Localizations" VALUES (200,62,'ru','430 г');
INSERT INTO "Localizations" VALUES (201,64,'en','Pizza 9');
INSERT INTO "Localizations" VALUES (202,68,'uk','140 г');
INSERT INTO "Localizations" VALUES (203,73,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (204,73,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (205,72,'en','');
INSERT INTO "Localizations" VALUES (206,72,'ru','');
INSERT INTO "Localizations" VALUES (207,72,'uk','');
INSERT INTO "Localizations" VALUES (208,71,'en','');
INSERT INTO "Localizations" VALUES (209,71,'ru','');
INSERT INTO "Localizations" VALUES (210,73,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (211,71,'uk','');
INSERT INTO "Localizations" VALUES (212,70,'ru','Панини 1');
INSERT INTO "Localizations" VALUES (213,70,'uk','Паніні 1');
INSERT INTO "Localizations" VALUES (214,69,'en','Panini 1');
INSERT INTO "Localizations" VALUES (215,69,'ru','Панини 1');
INSERT INTO "Localizations" VALUES (216,69,'uk','Паніні 1');
INSERT INTO "Localizations" VALUES (217,68,'en','140 g');
INSERT INTO "Localizations" VALUES (218,68,'ru','140 г');
INSERT INTO "Localizations" VALUES (219,70,'en','Panini 1');
INSERT INTO "Localizations" VALUES (220,74,'uk','150 г');
INSERT INTO "Localizations" VALUES (221,79,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (222,79,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (223,78,'en','');
INSERT INTO "Localizations" VALUES (224,78,'ru','');
INSERT INTO "Localizations" VALUES (225,78,'uk','');
INSERT INTO "Localizations" VALUES (226,77,'en','');
INSERT INTO "Localizations" VALUES (227,77,'ru','');
INSERT INTO "Localizations" VALUES (228,79,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (229,77,'uk','');
INSERT INTO "Localizations" VALUES (230,76,'ru','Панини 2');
INSERT INTO "Localizations" VALUES (231,76,'uk','Паніні 2');
INSERT INTO "Localizations" VALUES (232,75,'en','Panini 2');
INSERT INTO "Localizations" VALUES (233,75,'ru','Панини 2');
INSERT INTO "Localizations" VALUES (234,75,'uk','Паніні 2');
INSERT INTO "Localizations" VALUES (235,74,'en','150 g');
INSERT INTO "Localizations" VALUES (236,74,'ru','150 г');
INSERT INTO "Localizations" VALUES (237,76,'en','Panini 2');
INSERT INTO "Localizations" VALUES (238,80,'uk','130 г');
INSERT INTO "Localizations" VALUES (239,85,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (240,85,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (241,84,'en','');
INSERT INTO "Localizations" VALUES (242,84,'ru','');
INSERT INTO "Localizations" VALUES (243,84,'uk','');
INSERT INTO "Localizations" VALUES (244,83,'en','');
INSERT INTO "Localizations" VALUES (245,83,'ru','');
INSERT INTO "Localizations" VALUES (246,85,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (247,83,'uk','');
INSERT INTO "Localizations" VALUES (248,82,'ru','Панини 3');
INSERT INTO "Localizations" VALUES (249,82,'uk','Паніні 3');
INSERT INTO "Localizations" VALUES (250,81,'en','Panini 3');
INSERT INTO "Localizations" VALUES (251,81,'ru','Панини 3');
INSERT INTO "Localizations" VALUES (252,81,'uk','Паніні 3');
INSERT INTO "Localizations" VALUES (253,80,'en','130 g');
INSERT INTO "Localizations" VALUES (254,80,'ru','130 г');
INSERT INTO "Localizations" VALUES (255,82,'en','Panini 3');
INSERT INTO "Localizations" VALUES (256,86,'uk','1 л');
INSERT INTO "Localizations" VALUES (257,91,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (258,91,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (259,90,'en','');
INSERT INTO "Localizations" VALUES (260,90,'ru','');
INSERT INTO "Localizations" VALUES (261,90,'uk','');
INSERT INTO "Localizations" VALUES (262,89,'en','');
INSERT INTO "Localizations" VALUES (263,89,'ru','');
INSERT INTO "Localizations" VALUES (264,91,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (265,89,'uk','');
INSERT INTO "Localizations" VALUES (266,88,'ru','Напитки 1');
INSERT INTO "Localizations" VALUES (267,88,'uk','Напої 1');
INSERT INTO "Localizations" VALUES (268,87,'en','Drinks 1');
INSERT INTO "Localizations" VALUES (269,87,'ru','Напитки 1');
INSERT INTO "Localizations" VALUES (270,87,'uk','Напої 1');
INSERT INTO "Localizations" VALUES (271,86,'en','1 l');
INSERT INTO "Localizations" VALUES (272,86,'ru','1 л');
INSERT INTO "Localizations" VALUES (273,88,'en','Drinks 1');
INSERT INTO "Localizations" VALUES (274,92,'uk','1 л');
INSERT INTO "Localizations" VALUES (275,97,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (276,97,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (277,96,'en','');
INSERT INTO "Localizations" VALUES (278,96,'ru','');
INSERT INTO "Localizations" VALUES (279,96,'uk','');
INSERT INTO "Localizations" VALUES (280,95,'en','');
INSERT INTO "Localizations" VALUES (281,95,'ru','');
INSERT INTO "Localizations" VALUES (282,97,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (283,95,'uk','');
INSERT INTO "Localizations" VALUES (284,94,'ru','Напитки 2');
INSERT INTO "Localizations" VALUES (285,94,'uk','Напої 2');
INSERT INTO "Localizations" VALUES (286,93,'en','Drinks 2');
INSERT INTO "Localizations" VALUES (287,93,'ru','Напитки 2');
INSERT INTO "Localizations" VALUES (288,93,'uk','Напої 2');
INSERT INTO "Localizations" VALUES (289,92,'en','1 l');
INSERT INTO "Localizations" VALUES (290,92,'ru','1 л');
INSERT INTO "Localizations" VALUES (291,94,'en','Drinks 2');
INSERT INTO "Localizations" VALUES (292,98,'uk','1 л');
INSERT INTO "Localizations" VALUES (293,103,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (294,103,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (295,102,'en','');
INSERT INTO "Localizations" VALUES (296,102,'ru','');
INSERT INTO "Localizations" VALUES (297,102,'uk','');
INSERT INTO "Localizations" VALUES (298,101,'en','');
INSERT INTO "Localizations" VALUES (299,101,'ru','');
INSERT INTO "Localizations" VALUES (300,103,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (301,101,'uk','');
INSERT INTO "Localizations" VALUES (302,100,'ru','Напитки 3');
INSERT INTO "Localizations" VALUES (303,100,'uk','Напої 3');
INSERT INTO "Localizations" VALUES (304,99,'en','Drinks 3');
INSERT INTO "Localizations" VALUES (305,99,'ru','Напитки 3');
INSERT INTO "Localizations" VALUES (306,99,'uk','Напої 3');
INSERT INTO "Localizations" VALUES (307,98,'en','1 l');
INSERT INTO "Localizations" VALUES (308,98,'ru','1 л');
INSERT INTO "Localizations" VALUES (309,100,'en','Drinks 3');
INSERT INTO "Localizations" VALUES (310,104,'uk','Новий');
INSERT INTO "Localizations" VALUES (311,104,'ru','Новый');
INSERT INTO "Localizations" VALUES (312,104,'en','New');
INSERT INTO "Localizations" VALUES (313,105,'uk','Підтверджений');
INSERT INTO "Localizations" VALUES (314,105,'ru','Подтвержден');
INSERT INTO "Localizations" VALUES (315,105,'en','Confirmed');
INSERT INTO "Localizations" VALUES (316,106,'uk','Запланований');
INSERT INTO "Localizations" VALUES (317,106,'ru','Запланирован');
INSERT INTO "Localizations" VALUES (318,106,'en','Scheduled');
INSERT INTO "Localizations" VALUES (319,107,'uk','Доставляється');
INSERT INTO "Localizations" VALUES (320,107,'ru','Доставляется');
INSERT INTO "Localizations" VALUES (321,107,'en','Being delivered');
INSERT INTO "Localizations" VALUES (322,108,'uk','Доставлений');
INSERT INTO "Localizations" VALUES (323,108,'ru','Доставлен');
INSERT INTO "Localizations" VALUES (324,108,'en','Delivered');
INSERT INTO "Localizations" VALUES (325,109,'uk','Закритий');
INSERT INTO "Localizations" VALUES (326,109,'ru','Закрыт');
INSERT INTO "Localizations" VALUES (327,109,'en','Closed');
INSERT INTO "Localizations" VALUES (328,110,'uk','Скасований');
INSERT INTO "Localizations" VALUES (329,110,'ru','Отменен');
INSERT INTO "Localizations" VALUES (330,110,'en','Canceled');
INSERT INTO "Localizations" VALUES (331,111,'uk','Не вказано');
INSERT INTO "Localizations" VALUES (332,111,'ru','Не указан');
INSERT INTO "Localizations" VALUES (333,111,'en','Not set');
INSERT INTO "Localizations" VALUES (334,112,'uk','Готівка');
INSERT INTO "Localizations" VALUES (335,112,'ru','Наличные');
INSERT INTO "Localizations" VALUES (336,112,'en','Cash');
INSERT INTO "Localizations" VALUES (337,113,'uk','Не вказано');
INSERT INTO "Localizations" VALUES (338,113,'ru','Не указан');
INSERT INTO "Localizations" VALUES (339,113,'en','Not set');
INSERT INTO "Localizations" VALUES (340,114,'uk','Самовивіз');
INSERT INTO "Localizations" VALUES (341,114,'ru','Самовывоз');
INSERT INTO "Localizations" VALUES (342,114,'en','Pickup');
INSERT INTO "Localizations" VALUES (343,115,'uk','Кур’єр');
INSERT INTO "Localizations" VALUES (344,115,'ru','Курьер');
INSERT INTO "Localizations" VALUES (345,115,'en','Courier');
INSERT INTO "Localizations" VALUES (346,116,'__','/');
INSERT INTO "Localizations" VALUES (347,117,'uk','<h1>Ваш веб-сайт електронної комерції</h1><p>Вітаємо! Це ваш веб-сайт електронної комерції, він працює на базі системи керування вмістом &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Ви можете керувати ним (створювати сторінки, елементи меню, форми і так далі) за допомогою <a href="/backend">бекенду</a>. Для входу використовуйте, будь ласка, ім&rsquo;я користувача і пароль, вказані під час установки (за замовчуванням це &laquo;admin@platformus.net&raquo; і &laquo;admin&raquo; відповідно).</p><p>Щоб дізнатися більше про Платформус і про те, як ним користуватися, будь ласка, скористайтеся <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацією</a>, там є декілька прикладів, що стануть у нагоді початківцям. При виникненні труднощів або питань ви можете звернутися в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, де вам обов&rsquo;язково допоможуть.</p><p>Приємної роботи!</p>');
INSERT INTO "Localizations" VALUES (348,117,'ru','<h1>Ваш веб-сайт электронной коммерции</h1><p>Здравствуйте! Это ваш веб-сайт электронной коммерции, он работает на базе системы управления содержимым &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Вы можете управлять им (создавать страницы, элементы меню, формы и так далее) с помощью <a href="/backend">бекенда</a>. Для входа используйте, пожалуйста, имя пользователя и пароль, указанные при установке (по умолчанию это &laquo;admin@platformus.net&raquo; и &laquo;admin&raquo; соответственно).</p><p>Чтобы узнать больше о Платформусе и о том, как им пользоваться, пожалуйста, воспользуйтесь <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацией</a>, там есть несколько примеров, которые пригодятся начинающим. При возникновении сложностей или вопросов вы можете обратиться в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, где вам обязательно помогут.</p><p>Приятной работы!</p>');
INSERT INTO "Localizations" VALUES (349,117,'en','<h1>Your Ecommerce Website</h1><p>Hello! This is your ecommerce website, it is based on the <a href="http://platformus.net/" target="_blank" rel="noopener">Platformus</a> content management system. You can manage it (create pages, menu items, forms and so on) using the <a href="/backend">backend</a>. Please use the username and password specified during the installation to sign in (it is &ldquo;admin@platformus.net&rdquo; and &ldquo;admin&rdquo; by default).</p><p>Please use the <a href="http://docs.platformus.net/" target="_blank" rel="noopener">documentation</a> to learn more about Platformus and how to use it. There are several examples that could be useful for the beginners. Also, you can get help in our <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">chat</a>.</p><p>Have a nice work!</p>');
INSERT INTO "Localizations" VALUES (350,118,'uk','Ваш веб-сайт електронної комерції');
INSERT INTO "Localizations" VALUES (351,118,'ru','Ваш веб-сайт электронной коммерции');
INSERT INTO "Localizations" VALUES (352,118,'en','Your Ecommerce Website');
INSERT INTO "Localizations" VALUES (353,119,'uk','');
INSERT INTO "Localizations" VALUES (354,119,'ru','');
INSERT INTO "Localizations" VALUES (355,119,'en','');
INSERT INTO "Localizations" VALUES (356,120,'uk','');
INSERT INTO "Localizations" VALUES (357,120,'ru','');
INSERT INTO "Localizations" VALUES (358,120,'en','');
INSERT INTO "Localizations" VALUES (359,121,'__','/about-us');
INSERT INTO "Localizations" VALUES (360,122,'uk','<h1>Про нас</h1><p>Розкажіть про ваш веб-сайт електронної комерції. Ви можете додати сюди фотографії або відео.</p>');
INSERT INTO "Localizations" VALUES (361,122,'ru','<h1>О нас</h1><p>Расскажите о вашем веб-сайте электронной коммерции. Вы можете добавить сюда фотографии или видео.</p>');
INSERT INTO "Localizations" VALUES (362,122,'en','<h1>About Us</h1><p>Tell us about your ecommerce website. You can add photos or videos here.</p>');
INSERT INTO "Localizations" VALUES (363,123,'uk','Про нас');
INSERT INTO "Localizations" VALUES (364,123,'ru','О нас');
INSERT INTO "Localizations" VALUES (365,123,'en','About Us');
INSERT INTO "Localizations" VALUES (366,124,'uk','');
INSERT INTO "Localizations" VALUES (367,124,'ru','');
INSERT INTO "Localizations" VALUES (368,124,'en','');
INSERT INTO "Localizations" VALUES (369,125,'uk','');
INSERT INTO "Localizations" VALUES (370,125,'ru','');
INSERT INTO "Localizations" VALUES (371,125,'en','');
INSERT INTO "Localizations" VALUES (372,126,'__','/contacts');
INSERT INTO "Localizations" VALUES (373,127,'uk','<h1>Контакти</h1><p>Додайте свої контакти на цій сторінці. Номер телефону, месенджери, посилання на соціальні мережі. Форма зворотного зв&rsquo;язку, розташована нижче (до речі, ви можете її змінити або перенести в інше місце), допоможе відвідувачам написати вам повідомлення прямо з сайту, лише вкажіть для цього адресу, на яку потрібно надсилати повідомлення.</p><h2>Форма зворотного зв&rsquo;язку</h2>');
INSERT INTO "Localizations" VALUES (374,127,'ru','<h1>Контакты</h1><p>Добавьте свои контакты на этой странице. Телефонный номер, мессенджеры, ссылки на социальные сети. Форма обратной связи, расположенная ниже (кстати, вы можете ее изменить или перенести в другое место), поможет посетителям написать вам сообщение прямо с сайта, лишь укажите для этого адрес, на который нужно присылать сообщения.</p><h2>Форма обратной связи</h2>');
INSERT INTO "Localizations" VALUES (375,127,'en','<h1>Contacts</h1><p>Add your contacts on this page. Phone number, messengers, social links. The feedback form below (by the way, you can edit or move it to a different place) allows your visitors to write you directly from the website, just don&rsquo;t forget to specify the email address for the messages.</p><h2>Feedback from</h2>');
INSERT INTO "Localizations" VALUES (376,128,'uk','Контакти');
INSERT INTO "Localizations" VALUES (377,128,'ru','Контакты');
INSERT INTO "Localizations" VALUES (378,128,'en','Contacts');
INSERT INTO "Localizations" VALUES (379,129,'uk','');
INSERT INTO "Localizations" VALUES (380,129,'ru','');
INSERT INTO "Localizations" VALUES (381,129,'en','');
INSERT INTO "Localizations" VALUES (382,130,'uk','');
INSERT INTO "Localizations" VALUES (383,130,'ru','');
INSERT INTO "Localizations" VALUES (384,130,'en','');
INSERT INTO "Localizations" VALUES (385,131,'__','/cart');
INSERT INTO "Localizations" VALUES (386,132,'uk','<h1>Кошик</h1>');
INSERT INTO "Localizations" VALUES (387,132,'ru','<h1>Корзина</h1>');
INSERT INTO "Localizations" VALUES (388,132,'en','<h1>Cart</h1>');
INSERT INTO "Localizations" VALUES (389,133,'uk','Кошик');
INSERT INTO "Localizations" VALUES (390,133,'ru','Корзина');
INSERT INTO "Localizations" VALUES (391,133,'en','Cart');
INSERT INTO "Localizations" VALUES (392,134,'uk','');
INSERT INTO "Localizations" VALUES (393,134,'ru','');
INSERT INTO "Localizations" VALUES (394,134,'en','');
INSERT INTO "Localizations" VALUES (395,135,'uk','');
INSERT INTO "Localizations" VALUES (396,135,'ru','');
INSERT INTO "Localizations" VALUES (397,135,'en','');
INSERT INTO "Endpoints" VALUES (1,'Default','{*url}',1000,0,NULL,NULL,'Platformus.Website.Frontend.DefaultEndpoint','ViewName=RegularPage');
INSERT INTO "Endpoints" VALUES (2,'Contacts','about-us',10,0,NULL,NULL,'Platformus.Website.Frontend.DefaultEndpoint','ViewName=RegularPage');
INSERT INTO "Endpoints" VALUES (3,'Contacts','contacts',20,0,NULL,NULL,'Platformus.Website.Frontend.DefaultEndpoint','ViewName=ContactsPage');
INSERT INTO "Endpoints" VALUES (4,'Cart','cart',20,0,NULL,NULL,'Platformus.Website.Frontend.DefaultEndpoint','ViewName=CartPage');
INSERT INTO "DataSources" VALUES (1,1,'Page','Platformus.Website.Frontend.DataSources.PageObjectDataSource',NULL);
INSERT INTO "DataSources" VALUES (2,2,'Page','Platformus.Website.Frontend.DataSources.PageObjectDataSource',NULL);
INSERT INTO "DataSources" VALUES (3,3,'Page','Platformus.Website.Frontend.DataSources.PageObjectDataSource',NULL);
INSERT INTO "DataSources" VALUES (4,4,'Page','Platformus.Website.Frontend.DataSources.PageObjectDataSource',NULL);
INSERT INTO "Classes" VALUES (1,NULL,'Page','Page','Pages',1);
INSERT INTO "Classes" VALUES (2,1,'RegularPage','Regular Page','Regular Pages',0);
INSERT INTO "Tabs" VALUES (1,1,'SEO',100);
INSERT INTO "DataTypes" VALUES (1,'string','singleLinePlainText','Single line plain text',1);
INSERT INTO "DataTypes" VALUES (2,'string','multilinePlainText','Multiline plain text',2);
INSERT INTO "DataTypes" VALUES (3,'string','html','Html',3);
INSERT INTO "DataTypes" VALUES (4,'integer','integerNumber','Integer number',4);
INSERT INTO "DataTypes" VALUES (5,'decimal','decimalNumber','Decimal number',5);
INSERT INTO "DataTypes" VALUES (6,'integer','booleanFlag','Boolean flag',6);
INSERT INTO "DataTypes" VALUES (7,'datetime','date','Date',7);
INSERT INTO "DataTypes" VALUES (8,'string','image','Image',8);
INSERT INTO "DataTypes" VALUES (9,'string','sourceCode','Source code',9);
INSERT INTO "DataTypeParameters" VALUES (1,1,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (2,1,'numericTextBox','MaxLength','Max length');
INSERT INTO "DataTypeParameters" VALUES (3,2,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (4,2,'numericTextBox','MaxLength','Max length');
INSERT INTO "DataTypeParameters" VALUES (5,7,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (6,8,'numericTextBox','Width','Width');
INSERT INTO "DataTypeParameters" VALUES (7,8,'numericTextBox','Height','Height');
INSERT INTO "DataTypeParameters" VALUES (8,9,'textBox','Mode','Mode');
INSERT INTO "Members" VALUES (1,1,NULL,'Url','URL',1,1,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (2,1,NULL,'Content','Content',10,3,1,0,NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (3,1,1,'Title','Title',1000,1,1,0,NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (4,1,1,'MetaDescription','META description',1010,1,1,0,NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (5,1,1,'MetaKeywords','META keywords',1020,1,1,0,NULL,NULL,NULL,NULL);
INSERT INTO "DataTypeParameterValues" VALUES (1,1,1,'true');
INSERT INTO "DataTypeParameterValues" VALUES (2,2,1,'128');
INSERT INTO "DataTypeParameterValues" VALUES (3,1,3,'false');
INSERT INTO "DataTypeParameterValues" VALUES (4,2,3,'128');
INSERT INTO "DataTypeParameterValues" VALUES (5,1,4,'false');
INSERT INTO "DataTypeParameterValues" VALUES (6,2,4,'512');
INSERT INTO "DataTypeParameterValues" VALUES (7,1,5,'false');
INSERT INTO "DataTypeParameterValues" VALUES (8,2,5,'256');
INSERT INTO "Objects" VALUES (1,2);
INSERT INTO "Objects" VALUES (2,2);
INSERT INTO "Objects" VALUES (3,2);
INSERT INTO "Objects" VALUES (4,2);
INSERT INTO "Properties" VALUES (1,1,1,NULL,NULL,116,NULL);
INSERT INTO "Properties" VALUES (2,1,2,NULL,NULL,117,NULL);
INSERT INTO "Properties" VALUES (3,1,3,NULL,NULL,118,NULL);
INSERT INTO "Properties" VALUES (4,1,4,NULL,NULL,119,NULL);
INSERT INTO "Properties" VALUES (5,1,5,NULL,NULL,120,NULL);
INSERT INTO "Properties" VALUES (6,2,1,NULL,NULL,121,NULL);
INSERT INTO "Properties" VALUES (7,2,2,NULL,NULL,122,NULL);
INSERT INTO "Properties" VALUES (8,2,3,NULL,NULL,123,NULL);
INSERT INTO "Properties" VALUES (9,2,4,NULL,NULL,124,NULL);
INSERT INTO "Properties" VALUES (10,2,5,NULL,NULL,125,NULL);
INSERT INTO "Properties" VALUES (11,3,1,NULL,NULL,126,NULL);
INSERT INTO "Properties" VALUES (12,3,2,NULL,NULL,127,NULL);
INSERT INTO "Properties" VALUES (13,3,3,NULL,NULL,128,NULL);
INSERT INTO "Properties" VALUES (14,3,4,NULL,NULL,129,NULL);
INSERT INTO "Properties" VALUES (15,3,5,NULL,NULL,130,NULL);
INSERT INTO "Properties" VALUES (16,4,1,NULL,NULL,131,NULL);
INSERT INTO "Properties" VALUES (17,4,2,NULL,NULL,132,NULL);
INSERT INTO "Properties" VALUES (18,4,3,NULL,NULL,133,NULL);
INSERT INTO "Properties" VALUES (19,4,4,NULL,NULL,134,NULL);
INSERT INTO "Properties" VALUES (20,4,5,NULL,NULL,135,NULL);
INSERT INTO "Menus" VALUES (1,'Main',1);
INSERT INTO "MenuItems" VALUES (1,1,NULL,2,'/',10);
INSERT INTO "MenuItems" VALUES (2,1,NULL,3,'/about-us',20);
INSERT INTO "MenuItems" VALUES (3,1,NULL,4,'/contacts',30);
INSERT INTO "MenuItems" VALUES (4,1,NULL,5,'/cart',40);
INSERT INTO "Forms" VALUES (1,'Feedback',6,7,1,'Platformus.Website.Frontend.FormHandlers.EmailFormHandler','RecipientEmails=test@test.com;RedirectUrl=/contacts');
INSERT INTO "FieldTypes" VALUES (1,'TextBox','Text box',1,NULL);
INSERT INTO "FieldTypes" VALUES (2,'TextArea','Text area',2,NULL);
INSERT INTO "FieldTypes" VALUES (3,'Checkbox','Checkbox',3,NULL);
INSERT INTO "FieldTypes" VALUES (4,'RadioButtonList','Radio button list',4,NULL);
INSERT INTO "FieldTypes" VALUES (5,'DropDownList','Drop down list',5,NULL);
INSERT INTO "FieldTypes" VALUES (6,'FileUpload','File upload',6,NULL);
INSERT INTO "FieldTypes" VALUES (7,'ReCAPTCHA','ReCAPTCHA',7,'Platformus.Website.Frontend.FormHandlers.ReCaptchaFieldValidator');
INSERT INTO "Fields" VALUES (1,1,1,'Name',8,1,NULL,10);
INSERT INTO "Fields" VALUES (2,1,1,'Email',9,1,NULL,20);
INSERT INTO "Fields" VALUES (3,1,2,'Message',10,1,NULL,30);
INSERT INTO "Categories" VALUES (1,NULL,'/pizza',11,'Platformus.ECommerce.ProductProviders.DefaultProductProvider',NULL,10);
INSERT INTO "Categories" VALUES (2,NULL,'/panini',12,'Platformus.ECommerce.ProductProviders.DefaultProductProvider',NULL,20);
INSERT INTO "Categories" VALUES (3,NULL,'/drinks',13,'Platformus.ECommerce.ProductProviders.DefaultProductProvider',NULL,30);
INSERT INTO "Products" VALUES (1,1,'/pizza/pizza-1','pizza-1',17,15,19,110.0,18,14,16);
INSERT INTO "Products" VALUES (2,1,'/pizza/pizza-2','pizza-2',22,25,20,180.0,21,24,23);
INSERT INTO "Products" VALUES (3,1,'/pizza/pizza-3','pizza-3',28,31,26,140.0,27,30,29);
INSERT INTO "Products" VALUES (4,1,'/pizza/pizza-4','pizza-4',34,37,32,150.0,33,36,35);
INSERT INTO "Products" VALUES (5,1,'/pizza/pizza-5','pizza-5',40,43,38,170.0,39,42,41);
INSERT INTO "Products" VALUES (6,1,'/pizza/pizza-6','pizza-6',46,49,44,170.0,45,48,47);
INSERT INTO "Products" VALUES (7,1,'/pizza/pizza-7','pizza-7',52,55,50,150.0,51,54,53);
INSERT INTO "Products" VALUES (8,1,'/pizza/pizza-8','pizza-8',58,61,56,140.0,57,60,59);
INSERT INTO "Products" VALUES (9,1,'/pizza/pizza-9','pizza-9',64,67,62,160.0,63,66,65);
INSERT INTO "Products" VALUES (10,2,'/panini/panini-1','panini-1',70,73,68,40.0,69,72,71);
INSERT INTO "Products" VALUES (11,2,'/panini/panini-2','panini-2',76,79,74,80.0,75,78,77);
INSERT INTO "Products" VALUES (12,2,'/panini/panini-3','panini-3',82,85,80,40.0,81,84,83);
INSERT INTO "Products" VALUES (13,3,'/pizza/drinks-1','drinks-1',88,91,86,10.0,87,90,89);
INSERT INTO "Products" VALUES (14,3,'/pizza/drinks-2','drinks-2',94,97,92,30.0,93,96,95);
INSERT INTO "Products" VALUES (15,3,'/pizza/drinks-3','drinks-3',100,103,98,10.0,99,102,101);
INSERT INTO "Photos" VALUES (1,1,'pizza1.jpg',1,1);
INSERT INTO "Photos" VALUES (2,2,'pizza2.jpg',1,1);
INSERT INTO "Photos" VALUES (3,3,'pizza3.jpg',1,1);
INSERT INTO "Photos" VALUES (4,4,'pizza4.jpg',1,1);
INSERT INTO "Photos" VALUES (5,5,'pizza5.jpg',1,1);
INSERT INTO "Photos" VALUES (6,6,'pizza6.jpg',1,1);
INSERT INTO "Photos" VALUES (7,7,'pizza7.jpg',1,1);
INSERT INTO "Photos" VALUES (8,8,'pizza8.jpg',1,1);
INSERT INTO "Photos" VALUES (9,9,'pizza9.jpg',1,1);
INSERT INTO "Photos" VALUES (10,10,'panini1.jpg',1,1);
INSERT INTO "Photos" VALUES (11,11,'panini2.jpg',1,1);
INSERT INTO "Photos" VALUES (12,12,'panini3.jpg',1,1);
INSERT INTO "Photos" VALUES (13,13,'drinks1.jpg',1,1);
INSERT INTO "Photos" VALUES (14,14,'drinks2.jpg',1,1);
INSERT INTO "Photos" VALUES (15,15,'drinks3.jpg',1,1);
INSERT INTO "OrderStates" VALUES (1,'New',104,10);
INSERT INTO "OrderStates" VALUES (2,'Confirmed',105,20);
INSERT INTO "OrderStates" VALUES (3,'Scheduled',106,30);
INSERT INTO "OrderStates" VALUES (4,'BeingDelivered',107,40);
INSERT INTO "OrderStates" VALUES (5,'Delivered',108,50);
INSERT INTO "OrderStates" VALUES (6,'Closed',109,60);
INSERT INTO "OrderStates" VALUES (7,'Canceled',110,70);
INSERT INTO "PaymentMethods" VALUES (1,'NotSet',111,10);
INSERT INTO "PaymentMethods" VALUES (2,'Cash',112,20);
INSERT INTO "DeliveryMethods" VALUES (1,'NotSet',113,10);
INSERT INTO "DeliveryMethods" VALUES (2,'Pickup',114,20);
INSERT INTO "DeliveryMethods" VALUES (3,'Courier',115,30);
COMMIT;
