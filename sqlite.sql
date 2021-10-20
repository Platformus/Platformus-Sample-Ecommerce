BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "ModelStates" (
	"Id"	TEXT NOT NULL,
	"Value"	TEXT NOT NULL,
	"Created"	TEXT NOT NULL,
	CONSTRAINT "PK_ModelState" PRIMARY KEY("Id")
);
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
	CONSTRAINT "FK_UserRole_Role_RoleId" FOREIGN KEY("RoleId") REFERENCES "Roles"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_UserRole_User_UserId" FOREIGN KEY("UserId") REFERENCES "Users"("Id") ON DELETE CASCADE
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
	CONSTRAINT "FK_Localization_Dictionary_DictionaryId" FOREIGN KEY("DictionaryId") REFERENCES "Dictionaries"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Localization_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Endpoints" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	"UrlTemplate"	TEXT,
	"Position"	INTEGER,
	"DisallowAnonymous"	INTEGER NOT NULL,
	"SignInUrl"	TEXT,
	"RequestProcessorCSharpClassName"	TEXT NOT NULL,
	"RequestProcessorParameters"	TEXT,
	"ResponseCacheCSharpClassName"	TEXT,
	"ResponseCacheParameters"	TEXT,
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
	"DataProviderCSharpClassName"	TEXT NOT NULL,
	"DataProviderParameters"	TEXT,
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
	CONSTRAINT "FK_Member_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Member_Class_RelationClassId" FOREIGN KEY("RelationClassId") REFERENCES "Classes"("Id") ON DELETE SET NULL,
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
	CONSTRAINT "FK_Property_Object_ObjectId" FOREIGN KEY("ObjectId") REFERENCES "Objects"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Property_Dictionary_StringValueId" FOREIGN KEY("StringValueId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Property_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Relations" (
	"Id"	INTEGER NOT NULL,
	"MemberId"	INTEGER NOT NULL,
	"PrimaryId"	INTEGER NOT NULL,
	"ForeignId"	INTEGER NOT NULL,
	CONSTRAINT "PK_Relation" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Relation_Object_ForeignId" FOREIGN KEY("ForeignId") REFERENCES "Objects"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Relation_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Relation_Object_PrimaryId" FOREIGN KEY("PrimaryId") REFERENCES "Objects"("Id") ON DELETE CASCADE
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
	CONSTRAINT "FK_MenuItem_MenuItem_MenuItemId" FOREIGN KEY("MenuItemId") REFERENCES "MenuItems"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_MenuItem_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_MenuItem_Menu_MenuId" FOREIGN KEY("MenuId") REFERENCES "Menus"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Forms" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"SubmitButtonTitleId"	INTEGER NOT NULL,
	"ProduceCompletedForms"	INTEGER NOT NULL,
	"FormHandlerCSharpClassName"	TEXT NOT NULL,
	"FormHandlerParameters"	TEXT,
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
	CONSTRAINT "FK_Field_FieldType_FieldTypeId" FOREIGN KEY("FieldTypeId") REFERENCES "FieldTypes"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Field_Form_FormId" FOREIGN KEY("FormId") REFERENCES "Forms"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Field_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id")
);
CREATE TABLE IF NOT EXISTS "FieldOptions" (
	"Id"	INTEGER NOT NULL,
	"FieldId"	INTEGER NOT NULL,
	"ValueId"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_FieldOption" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_FieldOption_Dictionary_ValueId" FOREIGN KEY("ValueId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_FieldOption_Field_FieldId" FOREIGN KEY("FieldId") REFERENCES "Fields"("Id") ON DELETE CASCADE
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
	"DescriptionId"	INTEGER NOT NULL,
	"Position"	INTEGER,
	"TitleId"	INTEGER NOT NULL,
	"MetaDescriptionId"	INTEGER NOT NULL,
	"MetaKeywordsId"	INTEGER NOT NULL,
	"ProductProviderCSharpClassName"	TEXT NOT NULL,
	"ProductProviderParameters"	TEXT,
	CONSTRAINT "PK_Category" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Category_Dictionary_MetaDescriptionId" FOREIGN KEY("MetaDescriptionId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Category_Dictionary_MetaKeywordsId" FOREIGN KEY("MetaKeywordsId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Category_Category_CategoryId" FOREIGN KEY("CategoryId") REFERENCES "Categories"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Category_Dictionary_DescriptionId" FOREIGN KEY("DescriptionId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Category_Dictionary_TitleId" FOREIGN KEY("TitleId") REFERENCES "Dictionaries"("Id"),
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
	CONSTRAINT "FK_Product_Category_CategoryId" FOREIGN KEY("CategoryId") REFERENCES "Categories"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Product_Dictionary_MetaKeywordsId" FOREIGN KEY("MetaKeywordsId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_TitleId" FOREIGN KEY("TitleId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_MetaDescriptionId" FOREIGN KEY("MetaDescriptionId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_DescriptionId" FOREIGN KEY("DescriptionId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_UnitsId" FOREIGN KEY("UnitsId") REFERENCES "Dictionaries"("Id")
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
	CONSTRAINT "FK_Order_PaymentMethod_PaymentMethodId" FOREIGN KEY("PaymentMethodId") REFERENCES "PaymentMethods"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Order_DeliveryMethod_DeliveryMethodId" FOREIGN KEY("DeliveryMethodId") REFERENCES "DeliveryMethods"("Id") ON DELETE CASCADE,
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
	CONSTRAINT "FK_Position_Cart_CartId" FOREIGN KEY("CartId") REFERENCES "Carts"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Position_Order_OrderId" FOREIGN KEY("OrderId") REFERENCES "Orders"("Id") ON DELETE CASCADE,
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
INSERT INTO "Localizations" VALUES (4,2,'uk','Про нас');
INSERT INTO "Localizations" VALUES (5,2,'ru','О нас');
INSERT INTO "Localizations" VALUES (6,2,'en','About us');
INSERT INTO "Localizations" VALUES (7,3,'uk','Контакти');
INSERT INTO "Localizations" VALUES (8,3,'ru','Контакты');
INSERT INTO "Localizations" VALUES (9,3,'en','Contacts');
INSERT INTO "Localizations" VALUES (10,4,'uk','Зворотний зв’язок');
INSERT INTO "Localizations" VALUES (11,4,'ru','Обратная связь');
INSERT INTO "Localizations" VALUES (12,4,'en','Feedback');
INSERT INTO "Localizations" VALUES (13,5,'en','Submit');
INSERT INTO "Localizations" VALUES (14,5,'ru','Отправить');
INSERT INTO "Localizations" VALUES (15,5,'uk','Надіслати');
INSERT INTO "Localizations" VALUES (16,6,'uk','Ваше ім’я');
INSERT INTO "Localizations" VALUES (17,6,'ru','Ваше имя');
INSERT INTO "Localizations" VALUES (18,6,'en','Your name');
INSERT INTO "Localizations" VALUES (19,7,'uk','Ваша електронна пошта');
INSERT INTO "Localizations" VALUES (20,7,'ru','Ваша электронная почта');
INSERT INTO "Localizations" VALUES (21,7,'en','Your email');
INSERT INTO "Localizations" VALUES (22,8,'uk','Ваше повідомлення');
INSERT INTO "Localizations" VALUES (23,8,'ru','Ваше сообщение');
INSERT INTO "Localizations" VALUES (24,8,'en','Your message');
INSERT INTO "Localizations" VALUES (25,9,'uk','');
INSERT INTO "Localizations" VALUES (26,9,'ru','');
INSERT INTO "Localizations" VALUES (27,9,'en','');
INSERT INTO "Localizations" VALUES (28,10,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (29,10,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (30,10,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (31,11,'en','');
INSERT INTO "Localizations" VALUES (32,11,'ru','');
INSERT INTO "Localizations" VALUES (33,11,'uk','');
INSERT INTO "Localizations" VALUES (34,12,'en','Pizza');
INSERT INTO "Localizations" VALUES (35,12,'ru','Пицца');
INSERT INTO "Localizations" VALUES (36,12,'uk','Піца');
INSERT INTO "Localizations" VALUES (37,13,'en','Pizza');
INSERT INTO "Localizations" VALUES (38,13,'ru','Пицца');
INSERT INTO "Localizations" VALUES (39,13,'uk','Піца');
INSERT INTO "Localizations" VALUES (40,14,'uk','Паніні');
INSERT INTO "Localizations" VALUES (41,14,'ru','Панини');
INSERT INTO "Localizations" VALUES (42,14,'en','Panini');
INSERT INTO "Localizations" VALUES (43,15,'uk','Паніні');
INSERT INTO "Localizations" VALUES (44,15,'ru','Панини');
INSERT INTO "Localizations" VALUES (45,15,'en','Panini');
INSERT INTO "Localizations" VALUES (46,16,'uk','');
INSERT INTO "Localizations" VALUES (47,16,'ru','');
INSERT INTO "Localizations" VALUES (48,16,'en','');
INSERT INTO "Localizations" VALUES (49,17,'uk','');
INSERT INTO "Localizations" VALUES (50,17,'ru','');
INSERT INTO "Localizations" VALUES (51,17,'en','');
INSERT INTO "Localizations" VALUES (52,18,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (53,18,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (54,18,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (55,19,'uk','Напої');
INSERT INTO "Localizations" VALUES (56,19,'ru','Напитки');
INSERT INTO "Localizations" VALUES (57,19,'en','Drinks');
INSERT INTO "Localizations" VALUES (58,20,'uk','Напої');
INSERT INTO "Localizations" VALUES (59,20,'ru','Напитки');
INSERT INTO "Localizations" VALUES (60,20,'en','Drinks');
INSERT INTO "Localizations" VALUES (61,21,'uk','');
INSERT INTO "Localizations" VALUES (62,21,'ru','');
INSERT INTO "Localizations" VALUES (63,21,'en','');
INSERT INTO "Localizations" VALUES (64,22,'uk','');
INSERT INTO "Localizations" VALUES (65,22,'ru','');
INSERT INTO "Localizations" VALUES (66,22,'en','');
INSERT INTO "Localizations" VALUES (67,23,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (68,23,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (69,23,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (70,24,'uk','Піца 1');
INSERT INTO "Localizations" VALUES (71,29,'en','420 g');
INSERT INTO "Localizations" VALUES (72,28,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (73,28,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (74,28,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (75,27,'en','');
INSERT INTO "Localizations" VALUES (76,27,'ru','');
INSERT INTO "Localizations" VALUES (77,29,'ru','420 г');
INSERT INTO "Localizations" VALUES (78,27,'uk','');
INSERT INTO "Localizations" VALUES (79,26,'ru','');
INSERT INTO "Localizations" VALUES (80,26,'uk','');
INSERT INTO "Localizations" VALUES (81,25,'en','Pizza 1');
INSERT INTO "Localizations" VALUES (82,25,'ru','Пицца 1');
INSERT INTO "Localizations" VALUES (83,25,'uk','Піца 1');
INSERT INTO "Localizations" VALUES (84,24,'en','Pizza 1');
INSERT INTO "Localizations" VALUES (85,24,'ru','Пицца 1');
INSERT INTO "Localizations" VALUES (86,26,'en','');
INSERT INTO "Localizations" VALUES (87,29,'uk','420 г');
INSERT INTO "Localizations" VALUES (88,30,'uk','410 г');
INSERT INTO "Localizations" VALUES (89,35,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (90,35,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (91,34,'en','');
INSERT INTO "Localizations" VALUES (92,34,'ru','');
INSERT INTO "Localizations" VALUES (93,34,'uk','');
INSERT INTO "Localizations" VALUES (94,33,'en','');
INSERT INTO "Localizations" VALUES (95,33,'ru','');
INSERT INTO "Localizations" VALUES (96,35,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (97,33,'uk','');
INSERT INTO "Localizations" VALUES (98,32,'ru','Пицца 2');
INSERT INTO "Localizations" VALUES (99,32,'uk','Піца 2');
INSERT INTO "Localizations" VALUES (100,31,'en','Pizza 2');
INSERT INTO "Localizations" VALUES (101,31,'ru','Пицца 2');
INSERT INTO "Localizations" VALUES (102,31,'uk','Піца 2');
INSERT INTO "Localizations" VALUES (103,30,'en','410 g');
INSERT INTO "Localizations" VALUES (104,30,'ru','410 г');
INSERT INTO "Localizations" VALUES (105,32,'en','Pizza 2');
INSERT INTO "Localizations" VALUES (106,36,'uk','440 г');
INSERT INTO "Localizations" VALUES (107,41,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (108,41,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (109,40,'en','');
INSERT INTO "Localizations" VALUES (110,40,'ru','');
INSERT INTO "Localizations" VALUES (111,40,'uk','');
INSERT INTO "Localizations" VALUES (112,39,'en','');
INSERT INTO "Localizations" VALUES (113,39,'ru','');
INSERT INTO "Localizations" VALUES (114,41,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (115,39,'uk','');
INSERT INTO "Localizations" VALUES (116,38,'ru','Пицца 3');
INSERT INTO "Localizations" VALUES (117,38,'uk','Піца 3');
INSERT INTO "Localizations" VALUES (118,37,'en','Pizza 3');
INSERT INTO "Localizations" VALUES (119,37,'ru','Пицца 3');
INSERT INTO "Localizations" VALUES (120,37,'uk','Піца 3');
INSERT INTO "Localizations" VALUES (121,36,'en','440 g');
INSERT INTO "Localizations" VALUES (122,36,'ru','440 г');
INSERT INTO "Localizations" VALUES (123,38,'en','Pizza 3');
INSERT INTO "Localizations" VALUES (124,42,'uk','420 г');
INSERT INTO "Localizations" VALUES (125,47,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (126,47,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (127,46,'en','');
INSERT INTO "Localizations" VALUES (128,46,'ru','');
INSERT INTO "Localizations" VALUES (129,46,'uk','');
INSERT INTO "Localizations" VALUES (130,45,'en','');
INSERT INTO "Localizations" VALUES (131,45,'ru','');
INSERT INTO "Localizations" VALUES (132,47,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (133,45,'uk','');
INSERT INTO "Localizations" VALUES (134,44,'ru','Пицца 4');
INSERT INTO "Localizations" VALUES (135,44,'uk','Піца 4');
INSERT INTO "Localizations" VALUES (136,43,'en','Pizza 4');
INSERT INTO "Localizations" VALUES (137,43,'ru','Пицца 4');
INSERT INTO "Localizations" VALUES (138,43,'uk','Піца 4');
INSERT INTO "Localizations" VALUES (139,42,'en','420 g');
INSERT INTO "Localizations" VALUES (140,42,'ru','420 г');
INSERT INTO "Localizations" VALUES (141,44,'en','Pizza 4');
INSERT INTO "Localizations" VALUES (142,48,'uk','410 г');
INSERT INTO "Localizations" VALUES (143,53,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (144,53,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (145,52,'en','');
INSERT INTO "Localizations" VALUES (146,52,'ru','');
INSERT INTO "Localizations" VALUES (147,52,'uk','');
INSERT INTO "Localizations" VALUES (148,51,'en','');
INSERT INTO "Localizations" VALUES (149,51,'ru','');
INSERT INTO "Localizations" VALUES (150,53,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (151,51,'uk','');
INSERT INTO "Localizations" VALUES (152,50,'ru','Пицца 5');
INSERT INTO "Localizations" VALUES (153,50,'uk','Піца 5');
INSERT INTO "Localizations" VALUES (154,49,'en','Pizza 5');
INSERT INTO "Localizations" VALUES (155,49,'ru','Пицца 5');
INSERT INTO "Localizations" VALUES (156,49,'uk','Піца 5');
INSERT INTO "Localizations" VALUES (157,48,'en','410 g');
INSERT INTO "Localizations" VALUES (158,48,'ru','410 г');
INSERT INTO "Localizations" VALUES (159,50,'en','Pizza 5');
INSERT INTO "Localizations" VALUES (160,54,'uk','410 г');
INSERT INTO "Localizations" VALUES (161,59,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (162,59,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (163,58,'en','');
INSERT INTO "Localizations" VALUES (164,58,'ru','');
INSERT INTO "Localizations" VALUES (165,58,'uk','');
INSERT INTO "Localizations" VALUES (166,57,'en','');
INSERT INTO "Localizations" VALUES (167,57,'ru','');
INSERT INTO "Localizations" VALUES (168,59,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (169,57,'uk','');
INSERT INTO "Localizations" VALUES (170,56,'ru','Пицца 6');
INSERT INTO "Localizations" VALUES (171,56,'uk','Піца 6');
INSERT INTO "Localizations" VALUES (172,55,'en','Pizza 6');
INSERT INTO "Localizations" VALUES (173,55,'ru','Пицца 6');
INSERT INTO "Localizations" VALUES (174,55,'uk','Піца 6');
INSERT INTO "Localizations" VALUES (175,54,'en','410 g');
INSERT INTO "Localizations" VALUES (176,54,'ru','410 г');
INSERT INTO "Localizations" VALUES (177,56,'en','Pizza 6');
INSERT INTO "Localizations" VALUES (178,60,'uk','440 г');
INSERT INTO "Localizations" VALUES (179,65,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (180,65,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (181,64,'en','');
INSERT INTO "Localizations" VALUES (182,64,'ru','');
INSERT INTO "Localizations" VALUES (183,64,'uk','');
INSERT INTO "Localizations" VALUES (184,63,'en','');
INSERT INTO "Localizations" VALUES (185,63,'ru','');
INSERT INTO "Localizations" VALUES (186,65,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (187,63,'uk','');
INSERT INTO "Localizations" VALUES (188,62,'ru','Пицца 7');
INSERT INTO "Localizations" VALUES (189,62,'uk','Піца 7');
INSERT INTO "Localizations" VALUES (190,61,'en','Pizza 7');
INSERT INTO "Localizations" VALUES (191,61,'ru','Пицца 7');
INSERT INTO "Localizations" VALUES (192,61,'uk','Піца 7');
INSERT INTO "Localizations" VALUES (193,60,'en','440 g');
INSERT INTO "Localizations" VALUES (194,60,'ru','440 г');
INSERT INTO "Localizations" VALUES (195,62,'en','Pizza 7');
INSERT INTO "Localizations" VALUES (196,66,'uk','450 г');
INSERT INTO "Localizations" VALUES (197,71,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (198,71,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (199,70,'en','');
INSERT INTO "Localizations" VALUES (200,70,'ru','');
INSERT INTO "Localizations" VALUES (201,70,'uk','');
INSERT INTO "Localizations" VALUES (202,69,'en','');
INSERT INTO "Localizations" VALUES (203,69,'ru','');
INSERT INTO "Localizations" VALUES (204,71,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (205,69,'uk','');
INSERT INTO "Localizations" VALUES (206,68,'ru','Пицца 8');
INSERT INTO "Localizations" VALUES (207,68,'uk','Піца 8');
INSERT INTO "Localizations" VALUES (208,67,'en','Pizza 8');
INSERT INTO "Localizations" VALUES (209,67,'ru','Пицца 8');
INSERT INTO "Localizations" VALUES (210,67,'uk','Піца 8');
INSERT INTO "Localizations" VALUES (211,66,'en','450 g');
INSERT INTO "Localizations" VALUES (212,66,'ru','450 г');
INSERT INTO "Localizations" VALUES (213,68,'en','Pizza 8');
INSERT INTO "Localizations" VALUES (214,72,'uk','460 г');
INSERT INTO "Localizations" VALUES (215,77,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (216,77,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (217,76,'en','');
INSERT INTO "Localizations" VALUES (218,76,'ru','');
INSERT INTO "Localizations" VALUES (219,76,'uk','');
INSERT INTO "Localizations" VALUES (220,75,'en','');
INSERT INTO "Localizations" VALUES (221,75,'ru','');
INSERT INTO "Localizations" VALUES (222,77,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (223,75,'uk','');
INSERT INTO "Localizations" VALUES (224,74,'ru','Пицца 9');
INSERT INTO "Localizations" VALUES (225,74,'uk','Піца 9');
INSERT INTO "Localizations" VALUES (226,73,'en','Pizza 9');
INSERT INTO "Localizations" VALUES (227,73,'ru','Пицца 9');
INSERT INTO "Localizations" VALUES (228,73,'uk','Піца 9');
INSERT INTO "Localizations" VALUES (229,72,'en','460 g');
INSERT INTO "Localizations" VALUES (230,72,'ru','460 г');
INSERT INTO "Localizations" VALUES (231,74,'en','Pizza 9');
INSERT INTO "Localizations" VALUES (232,78,'uk','130 г');
INSERT INTO "Localizations" VALUES (233,83,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (234,83,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (235,82,'en','');
INSERT INTO "Localizations" VALUES (236,82,'ru','');
INSERT INTO "Localizations" VALUES (237,82,'uk','');
INSERT INTO "Localizations" VALUES (238,81,'en','');
INSERT INTO "Localizations" VALUES (239,81,'ru','');
INSERT INTO "Localizations" VALUES (240,83,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (241,81,'uk','');
INSERT INTO "Localizations" VALUES (242,80,'ru','Панини 1');
INSERT INTO "Localizations" VALUES (243,80,'uk','Паніні 1');
INSERT INTO "Localizations" VALUES (244,79,'en','Panini 1');
INSERT INTO "Localizations" VALUES (245,79,'ru','Панини 1');
INSERT INTO "Localizations" VALUES (246,79,'uk','Паніні 1');
INSERT INTO "Localizations" VALUES (247,78,'en','130 g');
INSERT INTO "Localizations" VALUES (248,78,'ru','130 г');
INSERT INTO "Localizations" VALUES (249,80,'en','Panini 1');
INSERT INTO "Localizations" VALUES (250,84,'uk','130 г');
INSERT INTO "Localizations" VALUES (251,89,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (252,89,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (253,88,'en','');
INSERT INTO "Localizations" VALUES (254,88,'ru','');
INSERT INTO "Localizations" VALUES (255,88,'uk','');
INSERT INTO "Localizations" VALUES (256,87,'en','');
INSERT INTO "Localizations" VALUES (257,87,'ru','');
INSERT INTO "Localizations" VALUES (258,89,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (259,87,'uk','');
INSERT INTO "Localizations" VALUES (260,86,'ru','Панини 2');
INSERT INTO "Localizations" VALUES (261,86,'uk','Паніні 2');
INSERT INTO "Localizations" VALUES (262,85,'en','Panini 2');
INSERT INTO "Localizations" VALUES (263,85,'ru','Панини 2');
INSERT INTO "Localizations" VALUES (264,85,'uk','Паніні 2');
INSERT INTO "Localizations" VALUES (265,84,'en','130 g');
INSERT INTO "Localizations" VALUES (266,84,'ru','130 г');
INSERT INTO "Localizations" VALUES (267,86,'en','Panini 2');
INSERT INTO "Localizations" VALUES (268,90,'uk','150 г');
INSERT INTO "Localizations" VALUES (269,95,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (270,95,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (271,94,'en','');
INSERT INTO "Localizations" VALUES (272,94,'ru','');
INSERT INTO "Localizations" VALUES (273,94,'uk','');
INSERT INTO "Localizations" VALUES (274,93,'en','');
INSERT INTO "Localizations" VALUES (275,93,'ru','');
INSERT INTO "Localizations" VALUES (276,95,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (277,93,'uk','');
INSERT INTO "Localizations" VALUES (278,92,'ru','Панини 3');
INSERT INTO "Localizations" VALUES (279,92,'uk','Паніні 3');
INSERT INTO "Localizations" VALUES (280,91,'en','Panini 3');
INSERT INTO "Localizations" VALUES (281,91,'ru','Панини 3');
INSERT INTO "Localizations" VALUES (282,91,'uk','Паніні 3');
INSERT INTO "Localizations" VALUES (283,90,'en','150 g');
INSERT INTO "Localizations" VALUES (284,90,'ru','150 г');
INSERT INTO "Localizations" VALUES (285,92,'en','Panini 3');
INSERT INTO "Localizations" VALUES (286,96,'uk','1 л');
INSERT INTO "Localizations" VALUES (287,101,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (288,101,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (289,100,'en','');
INSERT INTO "Localizations" VALUES (290,100,'ru','');
INSERT INTO "Localizations" VALUES (291,100,'uk','');
INSERT INTO "Localizations" VALUES (292,99,'en','');
INSERT INTO "Localizations" VALUES (293,99,'ru','');
INSERT INTO "Localizations" VALUES (294,101,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (295,99,'uk','');
INSERT INTO "Localizations" VALUES (296,98,'ru','Напитки 1');
INSERT INTO "Localizations" VALUES (297,98,'uk','Напої 1');
INSERT INTO "Localizations" VALUES (298,97,'en','Drinks 1');
INSERT INTO "Localizations" VALUES (299,97,'ru','Напитки 1');
INSERT INTO "Localizations" VALUES (300,97,'uk','Напої 1');
INSERT INTO "Localizations" VALUES (301,96,'en','1 l');
INSERT INTO "Localizations" VALUES (302,96,'ru','1 л');
INSERT INTO "Localizations" VALUES (303,98,'en','Drinks 1');
INSERT INTO "Localizations" VALUES (304,102,'uk','1 л');
INSERT INTO "Localizations" VALUES (305,107,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (306,107,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (307,106,'en','');
INSERT INTO "Localizations" VALUES (308,106,'ru','');
INSERT INTO "Localizations" VALUES (309,106,'uk','');
INSERT INTO "Localizations" VALUES (310,105,'en','');
INSERT INTO "Localizations" VALUES (311,105,'ru','');
INSERT INTO "Localizations" VALUES (312,107,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (313,105,'uk','');
INSERT INTO "Localizations" VALUES (314,104,'ru','Напитки 2');
INSERT INTO "Localizations" VALUES (315,104,'uk','Напої 2');
INSERT INTO "Localizations" VALUES (316,103,'en','Drinks 2');
INSERT INTO "Localizations" VALUES (317,103,'ru','Напитки 2');
INSERT INTO "Localizations" VALUES (318,103,'uk','Напої 2');
INSERT INTO "Localizations" VALUES (319,102,'en','1 l');
INSERT INTO "Localizations" VALUES (320,102,'ru','1 л');
INSERT INTO "Localizations" VALUES (321,104,'en','Drinks 2');
INSERT INTO "Localizations" VALUES (322,108,'uk','1 л');
INSERT INTO "Localizations" VALUES (323,113,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (324,113,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (325,112,'en','');
INSERT INTO "Localizations" VALUES (326,112,'ru','');
INSERT INTO "Localizations" VALUES (327,112,'uk','');
INSERT INTO "Localizations" VALUES (328,111,'en','');
INSERT INTO "Localizations" VALUES (329,111,'ru','');
INSERT INTO "Localizations" VALUES (330,113,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (331,111,'uk','');
INSERT INTO "Localizations" VALUES (332,110,'ru','Напитки 3');
INSERT INTO "Localizations" VALUES (333,110,'uk','Напої 3');
INSERT INTO "Localizations" VALUES (334,109,'en','Drinks 3');
INSERT INTO "Localizations" VALUES (335,109,'ru','Напитки 3');
INSERT INTO "Localizations" VALUES (336,109,'uk','Напої 3');
INSERT INTO "Localizations" VALUES (337,108,'en','1 l');
INSERT INTO "Localizations" VALUES (338,108,'ru','1 л');
INSERT INTO "Localizations" VALUES (339,110,'en','Drinks 3');
INSERT INTO "Localizations" VALUES (340,114,'uk','Новий');
INSERT INTO "Localizations" VALUES (341,114,'ru','Новый');
INSERT INTO "Localizations" VALUES (342,114,'en','New');
INSERT INTO "Localizations" VALUES (343,115,'uk','Підтверджений');
INSERT INTO "Localizations" VALUES (344,115,'ru','Подтвержден');
INSERT INTO "Localizations" VALUES (345,115,'en','Confirmed');
INSERT INTO "Localizations" VALUES (346,116,'uk','Запланований');
INSERT INTO "Localizations" VALUES (347,116,'ru','Запланирован');
INSERT INTO "Localizations" VALUES (348,116,'en','Scheduled');
INSERT INTO "Localizations" VALUES (349,117,'uk','Доставляється');
INSERT INTO "Localizations" VALUES (350,117,'ru','Доставляется');
INSERT INTO "Localizations" VALUES (351,117,'en','Being delivered');
INSERT INTO "Localizations" VALUES (352,118,'uk','Доставлений');
INSERT INTO "Localizations" VALUES (353,118,'ru','Доставлен');
INSERT INTO "Localizations" VALUES (354,118,'en','Delivered');
INSERT INTO "Localizations" VALUES (355,119,'uk','Закритий');
INSERT INTO "Localizations" VALUES (356,119,'ru','Закрыт');
INSERT INTO "Localizations" VALUES (357,119,'en','Closed');
INSERT INTO "Localizations" VALUES (358,120,'uk','Скасований');
INSERT INTO "Localizations" VALUES (359,120,'ru','Отменен');
INSERT INTO "Localizations" VALUES (360,120,'en','Canceled');
INSERT INTO "Localizations" VALUES (361,121,'uk','Не вказано');
INSERT INTO "Localizations" VALUES (362,121,'ru','Не указан');
INSERT INTO "Localizations" VALUES (363,121,'en','Not set');
INSERT INTO "Localizations" VALUES (364,122,'uk','Готівка');
INSERT INTO "Localizations" VALUES (365,122,'ru','Наличные');
INSERT INTO "Localizations" VALUES (366,122,'en','Cash');
INSERT INTO "Localizations" VALUES (367,123,'uk','Не вказано');
INSERT INTO "Localizations" VALUES (368,123,'ru','Не указан');
INSERT INTO "Localizations" VALUES (369,123,'en','Not set');
INSERT INTO "Localizations" VALUES (370,124,'uk','Самовивіз');
INSERT INTO "Localizations" VALUES (371,124,'ru','Самовывоз');
INSERT INTO "Localizations" VALUES (372,124,'en','Pickup');
INSERT INTO "Localizations" VALUES (373,125,'uk','Кур’єр');
INSERT INTO "Localizations" VALUES (374,125,'ru','Курьер');
INSERT INTO "Localizations" VALUES (375,125,'en','Courier');
INSERT INTO "Localizations" VALUES (376,126,'__','/about-us');
INSERT INTO "Localizations" VALUES (377,127,'uk','<h1>Про нас</h1><p>Вітаємо! Це ваш веб-сайт електронної комерції, він працює на базі системи керування вмістом &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Ви можете керувати ним (створювати сторінки, елементи меню, форми і так далі) за допомогою <a href="/backend">бекенду</a>. Для входу використовуйте, будь ласка, ім&rsquo;я користувача і пароль, вказані під час установки (за замовчуванням це &laquo;admin@platformus.net&raquo; і &laquo;admin&raquo; відповідно).</p><p>Щоб дізнатися більше про Платформус і про те, як ним користуватися, будь ласка, скористайтеся <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацією</a>, там є декілька прикладів, що стануть у нагоді початківцям. При виникненні труднощів або питань ви можете звернутися в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, де вам обов&rsquo;язково допоможуть.</p><p>Приємної роботи!</p>');
INSERT INTO "Localizations" VALUES (378,127,'ru','<h1>О нас</h1><p>Здравствуйте! Это ваш веб-сайт электронной коммерции, он работает на базе системы управления содержимым &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Вы можете управлять им (создавать страницы, элементы меню, формы и так далее) с помощью <a href="/backend">бекенда</a>. Для входа используйте, пожалуйста, имя пользователя и пароль, указанные при установке (по умолчанию это &laquo;admin@platformus.net&raquo; и &laquo;admin&raquo; соответственно).</p><p>Чтобы узнать больше о Платформусе и о том, как им пользоваться, пожалуйста, воспользуйтесь <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацией</a>, там есть несколько примеров, которые пригодятся начинающим. При возникновении сложностей или вопросов вы можете обратиться в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, где вам обязательно помогут.</p><p>Приятной работы!</p>');
INSERT INTO "Localizations" VALUES (379,127,'en','<h1>About Us</h1><p>Hello! This is your ecommerce website, it is based on the <a href="http://platformus.net/" target="_blank" rel="noopener">Platformus</a> content management system. You can manage it (create pages, menu items, forms and so on) using the <a href="/backend">backend</a>. Please use the username and password specified during the installation to sign in (it is &ldquo;admin@platformus.net&rdquo; and &ldquo;admin&rdquo; by default).</p><p>Please use the <a href="http://docs.platformus.net/" target="_blank" rel="noopener">documentation</a> to learn more about Platformus and how to use it. There are several examples that could be useful for the beginners. Also, you can get help in our <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">chat</a>.</p><p>Have a nice work!</p>');
INSERT INTO "Localizations" VALUES (380,128,'uk','Про нас');
INSERT INTO "Localizations" VALUES (381,128,'ru','О нас');
INSERT INTO "Localizations" VALUES (382,128,'en','About Us');
INSERT INTO "Localizations" VALUES (383,129,'uk','');
INSERT INTO "Localizations" VALUES (384,129,'ru','');
INSERT INTO "Localizations" VALUES (385,129,'en','');
INSERT INTO "Localizations" VALUES (386,130,'uk','');
INSERT INTO "Localizations" VALUES (387,130,'ru','');
INSERT INTO "Localizations" VALUES (388,130,'en','');
INSERT INTO "Localizations" VALUES (389,131,'__','/contacts');
INSERT INTO "Localizations" VALUES (390,132,'uk','<h1>Контакти</h1><p>Додайте свої контакти на цій сторінці. Номер телефону, месенджери, посилання на соціальні мережі. Форма зворотного зв&rsquo;язку, розташована нижче (до речі, ви можете її змінити або перенести в інше місце), допоможе відвідувачам написати вам повідомлення прямо з сайту, лише вкажіть для цього адресу, на яку потрібно надсилати повідомлення.</p><h2>Форма зворотного зв&rsquo;язку</h2>');
INSERT INTO "Localizations" VALUES (391,132,'ru','<h1>Контакты</h1><p>Добавьте свои контакты на этой странице. Телефонный номер, мессенджеры, ссылки на социальные сети. Форма обратной связи, расположенная ниже (кстати, вы можете ее изменить или перенести в другое место), поможет посетителям написать вам сообщение прямо с сайта, лишь укажите для этого адрес, на который нужно присылать сообщения.</p><h2>Форма обратной связи</h2>');
INSERT INTO "Localizations" VALUES (392,132,'en','<h1>Contacts</h1><p>Add your contacts on this page. Phone number, messengers, social links. The feedback form below (by the way, you can edit or move it to a different place) allows your visitors to write you directly from the website, just don&rsquo;t forget to specify the email address for the messages.</p><h2>Feedback from</h2>');
INSERT INTO "Localizations" VALUES (393,133,'uk','Контакти');
INSERT INTO "Localizations" VALUES (394,133,'ru','Контакты');
INSERT INTO "Localizations" VALUES (395,133,'en','Contacts');
INSERT INTO "Localizations" VALUES (396,134,'uk','');
INSERT INTO "Localizations" VALUES (397,134,'ru','');
INSERT INTO "Localizations" VALUES (398,134,'en','');
INSERT INTO "Localizations" VALUES (399,135,'uk','');
INSERT INTO "Localizations" VALUES (400,135,'ru','');
INSERT INTO "Localizations" VALUES (401,135,'en','');
INSERT INTO "Endpoints" VALUES (1,'Default','{*url}',1000,0,NULL,'Platformus.Website.Frontend.RequestProcessors.DefaultRequestProcessor','ViewName=RegularPage',NULL,NULL);
INSERT INTO "Endpoints" VALUES (2,'Contacts','contacts',10,0,NULL,'Platformus.Website.Frontend.RequestProcessors.DefaultRequestProcessor','ViewName=ContactsPage',NULL,NULL);
INSERT INTO "DataSources" VALUES (1,1,'Page','Platformus.Website.Frontend.DataProviders.PageObjectDataProvider',NULL);
INSERT INTO "DataSources" VALUES (2,2,'Page','Platformus.Website.Frontend.DataProviders.PageObjectDataProvider',NULL);
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
INSERT INTO "DataTypes" VALUES (8,'datetime','dateTime','DateTime',8);
INSERT INTO "DataTypes" VALUES (9,'string','image','Image',9);
INSERT INTO "DataTypes" VALUES (10,'string','sourceCode','Source code',10);
INSERT INTO "DataTypeParameters" VALUES (1,1,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (2,1,'numericTextBox','MaxLength','Max length');
INSERT INTO "DataTypeParameters" VALUES (3,2,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (4,2,'numericTextBox','MaxLength','Max length');
INSERT INTO "DataTypeParameters" VALUES (5,4,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (6,4,'numericTextBox','MinValue','Min value');
INSERT INTO "DataTypeParameters" VALUES (7,4,'numericTextBox','MaxValue','Max value');
INSERT INTO "DataTypeParameters" VALUES (8,5,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (9,5,'numericTextBox','MinValue','Min value');
INSERT INTO "DataTypeParameters" VALUES (10,5,'numericTextBox','MaxValue','Max value');
INSERT INTO "DataTypeParameters" VALUES (11,7,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (12,8,'numericTextBox','Width','Width');
INSERT INTO "DataTypeParameters" VALUES (13,8,'numericTextBox','Height','Height');
INSERT INTO "DataTypeParameters" VALUES (14,9,'textBox','Mode','Mode');
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
INSERT INTO "Properties" VALUES (1,1,1,NULL,NULL,126,NULL);
INSERT INTO "Properties" VALUES (2,1,2,NULL,NULL,127,NULL);
INSERT INTO "Properties" VALUES (3,1,3,NULL,NULL,128,NULL);
INSERT INTO "Properties" VALUES (4,1,4,NULL,NULL,129,NULL);
INSERT INTO "Properties" VALUES (5,1,5,NULL,NULL,130,NULL);
INSERT INTO "Properties" VALUES (6,2,1,NULL,NULL,131,NULL);
INSERT INTO "Properties" VALUES (7,2,2,NULL,NULL,132,NULL);
INSERT INTO "Properties" VALUES (8,2,3,NULL,NULL,133,NULL);
INSERT INTO "Properties" VALUES (9,2,4,NULL,NULL,134,NULL);
INSERT INTO "Properties" VALUES (10,2,5,NULL,NULL,135,NULL);
INSERT INTO "Menus" VALUES (1,'Main',1);
INSERT INTO "MenuItems" VALUES (1,1,NULL,2,'/about-us',10);
INSERT INTO "MenuItems" VALUES (2,1,NULL,3,'/contacts',20);
INSERT INTO "Forms" VALUES (1,'Feedback',4,5,1,'Platformus.Website.Frontend.FormHandlers.EmailFormHandler','RecipientEmails=test@test.com;RedirectUrl=/contacts');
INSERT INTO "FieldTypes" VALUES (1,'TextBox','Text box',1,NULL);
INSERT INTO "FieldTypes" VALUES (2,'TextArea','Text area',2,NULL);
INSERT INTO "FieldTypes" VALUES (3,'Checkbox','Checkbox',3,NULL);
INSERT INTO "FieldTypes" VALUES (4,'RadioButtonList','Radio button list',4,NULL);
INSERT INTO "FieldTypes" VALUES (5,'DropDownList','Drop down list',5,NULL);
INSERT INTO "FieldTypes" VALUES (6,'FileUpload','File upload',6,NULL);
INSERT INTO "FieldTypes" VALUES (7,'ReCAPTCHA','ReCAPTCHA',7,'Platformus.Website.Frontend.FieldValidators.ReCaptchaFieldValidator');
INSERT INTO "Fields" VALUES (1,1,1,'Name',6,1,NULL,10);
INSERT INTO "Fields" VALUES (2,1,1,'Email',7,1,NULL,20);
INSERT INTO "Fields" VALUES (3,1,2,'Message',8,1,NULL,30);
INSERT INTO "Categories" VALUES (1,NULL,'/',12,10,10,13,9,11,'Platformus.ECommerce.ProductProviders.DefaultProductProvider',NULL);
INSERT INTO "Categories" VALUES (2,NULL,'/panini',15,18,20,14,17,16,'Platformus.ECommerce.ProductProviders.DefaultProductProvider',NULL);
INSERT INTO "Categories" VALUES (3,NULL,'/drinks',20,23,30,19,22,21,'Platformus.ECommerce.ProductProviders.DefaultProductProvider',NULL);
INSERT INTO "Products" VALUES (1,1,'/pizza/pizza-1','pizza-1',25,28,29,110.0,24,27,26);
INSERT INTO "Products" VALUES (2,1,'/pizza/pizza-2','pizza-2',32,35,30,150.0,31,34,33);
INSERT INTO "Products" VALUES (3,1,'/pizza/pizza-3','pizza-3',38,41,36,110.0,37,40,39);
INSERT INTO "Products" VALUES (4,1,'/pizza/pizza-4','pizza-4',44,47,42,120.0,43,46,45);
INSERT INTO "Products" VALUES (5,1,'/pizza/pizza-5','pizza-5',50,53,48,140.0,49,52,51);
INSERT INTO "Products" VALUES (6,1,'/pizza/pizza-6','pizza-6',56,59,54,170.0,55,58,57);
INSERT INTO "Products" VALUES (7,1,'/pizza/pizza-7','pizza-7',62,65,60,160.0,61,64,63);
INSERT INTO "Products" VALUES (8,1,'/pizza/pizza-8','pizza-8',68,71,66,120.0,67,70,69);
INSERT INTO "Products" VALUES (9,1,'/pizza/pizza-9','pizza-9',74,77,72,120.0,73,76,75);
INSERT INTO "Products" VALUES (10,2,'/panini/panini-1','panini-1',80,83,78,80.0,79,82,81);
INSERT INTO "Products" VALUES (11,2,'/panini/panini-2','panini-2',86,89,84,70.0,85,88,87);
INSERT INTO "Products" VALUES (12,2,'/panini/panini-3','panini-3',92,95,90,70.0,91,94,93);
INSERT INTO "Products" VALUES (13,3,'/pizza/drinks-1','drinks-1',98,101,96,10.0,97,100,99);
INSERT INTO "Products" VALUES (14,3,'/pizza/drinks-2','drinks-2',104,107,102,70.0,103,106,105);
INSERT INTO "Products" VALUES (15,3,'/pizza/drinks-3','drinks-3',110,113,108,80.0,109,112,111);
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
INSERT INTO "OrderStates" VALUES (1,'New',114,10);
INSERT INTO "OrderStates" VALUES (2,'Confirmed',115,20);
INSERT INTO "OrderStates" VALUES (3,'Scheduled',116,30);
INSERT INTO "OrderStates" VALUES (4,'BeingDelivered',117,40);
INSERT INTO "OrderStates" VALUES (5,'Delivered',118,50);
INSERT INTO "OrderStates" VALUES (6,'Closed',119,60);
INSERT INTO "OrderStates" VALUES (7,'Canceled',120,70);
INSERT INTO "PaymentMethods" VALUES (1,'NotSet',121,10);
INSERT INTO "PaymentMethods" VALUES (2,'Cash',122,20);
INSERT INTO "DeliveryMethods" VALUES (1,'NotSet',123,10);
INSERT INTO "DeliveryMethods" VALUES (2,'Pickup',124,20);
INSERT INTO "DeliveryMethods" VALUES (3,'Courier',125,30);
COMMIT;
