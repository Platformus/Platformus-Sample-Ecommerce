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
	CONSTRAINT "FK_Credential_User_UserId" FOREIGN KEY("UserId") REFERENCES "Users"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Credential_CredentialType_CredentialTypeId" FOREIGN KEY("CredentialTypeId") REFERENCES "CredentialTypes"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Credential" PRIMARY KEY("Id" AUTOINCREMENT)
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
	CONSTRAINT "FK_UserRole_User_UserId" FOREIGN KEY("UserId") REFERENCES "Users"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_UserRole_Role_RoleId" FOREIGN KEY("RoleId") REFERENCES "Roles"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_UserRole" PRIMARY KEY("UserId","RoleId")
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
	CONSTRAINT "FK_RolePermission_Permission_PermissionId" FOREIGN KEY("PermissionId") REFERENCES "Permissions"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_RolePermission_Role_RoleId" FOREIGN KEY("RoleId") REFERENCES "Roles"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_RolePermission" PRIMARY KEY("RoleId","PermissionId")
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
	CONSTRAINT "FK_Variable_Configuration_ConfigurationId" FOREIGN KEY("ConfigurationId") REFERENCES "Configurations"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Variable" PRIMARY KEY("Id" AUTOINCREMENT)
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
	CONSTRAINT "FK_Localization_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Localization_Dictionary_DictionaryId" FOREIGN KEY("DictionaryId") REFERENCES "Dictionaries"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Localization" PRIMARY KEY("Id" AUTOINCREMENT)
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
	CONSTRAINT "FK_EndpointPermission_Permission_PermissionId" FOREIGN KEY("PermissionId") REFERENCES "Permissions"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_EndpointPermission_Endpoint_EndpointId" FOREIGN KEY("EndpointId") REFERENCES "Endpoints"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_EndpointPermission" PRIMARY KEY("EndpointId","PermissionId")
);
CREATE TABLE IF NOT EXISTS "DataSources" (
	"Id"	INTEGER NOT NULL,
	"EndpointId"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"DataProviderCSharpClassName"	TEXT NOT NULL,
	"DataProviderParameters"	TEXT,
	CONSTRAINT "FK_DataSource_Endpoint_EndpointId" FOREIGN KEY("EndpointId") REFERENCES "Endpoints"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_DataSource" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Classes" (
	"Id"	INTEGER NOT NULL,
	"ClassId"	INTEGER,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"PluralizedName"	TEXT NOT NULL,
	"IsAbstract"	INTEGER NOT NULL,
	CONSTRAINT "FK_Class_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE SET NULL,
	CONSTRAINT "PK_Class" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tabs" (
	"Id"	INTEGER NOT NULL,
	"ClassId"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "FK_Tab_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Tab" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DataTypes" (
	"Id"	INTEGER NOT NULL,
	"StorageDataType"	TEXT NOT NULL,
	"ParameterEditorCode"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_DataType" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DataTypeParameters" (
	"Id"	INTEGER NOT NULL,
	"DataTypeId"	INT NOT NULL,
	"ParameterEditorCode"	TEXT NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	CONSTRAINT "FK_DataTypeParameter_DataType_DataTypeId" FOREIGN KEY("DataTypeId") REFERENCES "DataTypes"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_DataTypeParameter" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DataTypeParameterOptions" (
	"Id"	INTEGER NOT NULL,
	"DataTypeParameterId"	INT NOT NULL,
	"Value"	TEXT NOT NULL,
	CONSTRAINT "FK_DataTypeParameterOption_DataTypeParameter_DataTypeParameterId" FOREIGN KEY("DataTypeParameterId") REFERENCES "DataTypeParameters"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_DataTypeParameterOption" PRIMARY KEY("Id" AUTOINCREMENT)
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
	"PropertyDataTypeParameters"	TEXT,
	"RelationClassId"	INTEGER,
	"IsRelationSingleParent"	INTEGER,
	"MinRelatedObjectsNumber"	INTEGER,
	"MaxRelatedObjectsNumber"	INTEGER,
	CONSTRAINT "FK_Member_Tab_TabId" FOREIGN KEY("TabId") REFERENCES "Tabs"("Id") ON DELETE SET NULL,
	CONSTRAINT "FK_Member_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Member_Class_RelationClassId" FOREIGN KEY("RelationClassId") REFERENCES "Classes"("Id") ON DELETE SET NULL,
	CONSTRAINT "FK_Member_DataType_PropertyDataTypeId" FOREIGN KEY("PropertyDataTypeId") REFERENCES "DataTypes"("Id") ON DELETE SET NULL,
	CONSTRAINT "PK_Member" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Objects" (
	"Id"	INTEGER NOT NULL,
	"ClassId"	INTEGER NOT NULL,
	CONSTRAINT "FK_Object_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Object" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Properties" (
	"Id"	INTEGER NOT NULL,
	"ObjectId"	INTEGER NOT NULL,
	"MemberId"	INTEGER NOT NULL,
	"IntegerValue"	INTEGER,
	"DecimalValue"	REAL,
	"StringValueId"	INTEGER,
	"DateTimeValue"	TEXT,
	CONSTRAINT "FK_Property_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Property_Object_ObjectId" FOREIGN KEY("ObjectId") REFERENCES "Objects"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Property_Dictionary_StringValueId" FOREIGN KEY("StringValueId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_Property" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Relations" (
	"Id"	INTEGER NOT NULL,
	"MemberId"	INTEGER NOT NULL,
	"PrimaryId"	INTEGER NOT NULL,
	"ForeignId"	INTEGER NOT NULL,
	CONSTRAINT "FK_Relation_Object_ForeignId" FOREIGN KEY("ForeignId") REFERENCES "Objects"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Relation_Object_PrimaryId" FOREIGN KEY("PrimaryId") REFERENCES "Objects"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Relation_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Relation" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Menus" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	CONSTRAINT "FK_Menu_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_Menu" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MenuItems" (
	"Id"	INTEGER NOT NULL,
	"MenuId"	INTEGER,
	"MenuItemId"	INTEGER,
	"NameId"	INTEGER NOT NULL,
	"Url"	TEXT,
	"Position"	INTEGER,
	CONSTRAINT "FK_MenuItem_MenuItem_MenuItemId" FOREIGN KEY("MenuItemId") REFERENCES "MenuItems"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_MenuItem_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_MenuItem_Menu_MenuId" FOREIGN KEY("MenuId") REFERENCES "Menus"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_MenuItem" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Forms" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"SubmitButtonTitleId"	INTEGER NOT NULL,
	"ProduceCompletedForms"	INTEGER NOT NULL,
	"FormHandlerCSharpClassName"	TEXT NOT NULL,
	"FormHandlerParameters"	TEXT,
	CONSTRAINT "FK_Form_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Form_Dictionary_SubmitButtonTitleId" FOREIGN KEY("SubmitButtonTitleId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_Form" PRIMARY KEY("Id" AUTOINCREMENT)
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
	CONSTRAINT "FK_Field_FieldType_FieldTypeId" FOREIGN KEY("FieldTypeId") REFERENCES "FieldTypes"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Field_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Field_Form_FormId" FOREIGN KEY("FormId") REFERENCES "Forms"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Field" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "FieldOptions" (
	"Id"	INTEGER NOT NULL,
	"FieldId"	INTEGER NOT NULL,
	"ValueId"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "FK_FieldOption_Dictionary_ValueId" FOREIGN KEY("ValueId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_FieldOption_Field_FieldId" FOREIGN KEY("FieldId") REFERENCES "Fields"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_FieldOption" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "CompletedForms" (
	"Id"	INTEGER NOT NULL,
	"FormId"	INTEGER NOT NULL,
	"Created"	TEXT NOT NULL,
	CONSTRAINT "FK_CompletedForm_Form_FormId" FOREIGN KEY("FormId") REFERENCES "Forms"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_CompletedForm" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "CompletedFields" (
	"Id"	INTEGER NOT NULL,
	"CompletedFormId"	INTEGER NOT NULL,
	"FieldId"	INTEGER NOT NULL,
	"Value"	TEXT,
	CONSTRAINT "FK_CompletedField_Field_FieldId" FOREIGN KEY("FieldId") REFERENCES "Fields"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_CompletedField_CompletedForm_CompletedFormId" FOREIGN KEY("CompletedFormId") REFERENCES "CompletedForms"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_CompletedField" PRIMARY KEY("Id" AUTOINCREMENT)
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
	CONSTRAINT "FK_Category_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Category_Dictionary_DescriptionId" FOREIGN KEY("DescriptionId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Category_Dictionary_MetaKeywordsId" FOREIGN KEY("MetaKeywordsId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Category_Dictionary_TitleId" FOREIGN KEY("TitleId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Category_Category_CategoryId" FOREIGN KEY("CategoryId") REFERENCES "Categories"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Category_Dictionary_MetaDescriptionId" FOREIGN KEY("MetaDescriptionId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_Category" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Products" (
	"Id"	INTEGER NOT NULL,
	"CategoryId"	INTEGER NOT NULL,
	"Url"	TEXT NOT NULL,
	"Code"	TEXT,
	"NameId"	INTEGER NOT NULL,
	"DescriptionId"	INTEGER NOT NULL,
	"UnitsId"	INTEGER NOT NULL,
	"Price"	REAL NOT NULL,
	"TitleId"	INTEGER NOT NULL,
	"MetaDescriptionId"	INTEGER NOT NULL,
	"MetaKeywordsId"	INTEGER NOT NULL,
	CONSTRAINT "FK_Product_Category_CategoryId" FOREIGN KEY("CategoryId") REFERENCES "Categories"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Product_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_DescriptionId" FOREIGN KEY("DescriptionId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_UnitsId" FOREIGN KEY("UnitsId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_TitleId" FOREIGN KEY("TitleId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_MetaDescriptionId" FOREIGN KEY("MetaDescriptionId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Product_Dictionary_MetaKeywordsId" FOREIGN KEY("MetaKeywordsId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_Product" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Photos" (
	"Id"	INTEGER NOT NULL,
	"ProductId"	INTEGER NOT NULL,
	"Filename"	TEXT NOT NULL,
	"IsCover"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "FK_Photo_Product_ProductId" FOREIGN KEY("ProductId") REFERENCES "Products"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Photo" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "OrderStates" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "FK_OrderState_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_OrderState" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PaymentMethods" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "FK_PaymentMethod_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_PaymentMethod" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DeliveryMethods" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "FK_DeliveryMethod_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_DeliveryMethod" PRIMARY KEY("Id" AUTOINCREMENT)
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
	CONSTRAINT "FK_Order_DeliveryMethod_DeliveryMethodId" FOREIGN KEY("DeliveryMethodId") REFERENCES "DeliveryMethods"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Order_PaymentMethod_PaymentMethodId" FOREIGN KEY("PaymentMethodId") REFERENCES "PaymentMethods"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Order_OrderState_OrderStateId" FOREIGN KEY("OrderStateId") REFERENCES "OrderStates"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Order" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Positions" (
	"Id"	INTEGER NOT NULL,
	"CartId"	INTEGER,
	"OrderId"	INTEGER,
	"ProductId"	INTEGER NOT NULL,
	"Price"	REAL NOT NULL,
	"Quantity"	REAL NOT NULL,
	CONSTRAINT "FK_Position_Product_ProductId" FOREIGN KEY("ProductId") REFERENCES "Products"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Position_Order_OrderId" FOREIGN KEY("OrderId") REFERENCES "Orders"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Position_Cart_CartId" FOREIGN KEY("CartId") REFERENCES "Carts"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Position" PRIMARY KEY("Id" AUTOINCREMENT)
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
INSERT INTO "Permissions" VALUES (9,'ManageClasses','Manage classes',900);
INSERT INTO "Permissions" VALUES (10,'ManageMenus','Manage menus',1000);
INSERT INTO "Permissions" VALUES (11,'ManageForms','Manage forms',1100);
INSERT INTO "Permissions" VALUES (12,'ManageFileManager','Manage file manager',1200);
INSERT INTO "Permissions" VALUES (13,'ManageCategories','Manage categories',1300);
INSERT INTO "Permissions" VALUES (14,'ManageProducts','Manage products',1400);
INSERT INTO "Permissions" VALUES (15,'ManageOrderStates','Manage order states',1500);
INSERT INTO "Permissions" VALUES (16,'ManagePaymentMethods','Manage payment methods',1600);
INSERT INTO "Permissions" VALUES (17,'ManageDeliveryMethods','Manage delivery methods',1700);
INSERT INTO "Permissions" VALUES (18,'ManageCarts','Manage carts',1800);
INSERT INTO "Permissions" VALUES (19,'ManageOrders','Manage orders',1900);
INSERT INTO "RolePermissions" VALUES (1,1);
INSERT INTO "RolePermissions" VALUES (2,1);
INSERT INTO "RolePermissions" VALUES (3,8);
INSERT INTO "RolePermissions" VALUES (3,10);
INSERT INTO "RolePermissions" VALUES (3,11);
INSERT INTO "RolePermissions" VALUES (3,12);
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
INSERT INTO "Localizations" VALUES (4,2,'en','About us');
INSERT INTO "Localizations" VALUES (5,2,'ru','О нас');
INSERT INTO "Localizations" VALUES (6,2,'uk','Про нас');
INSERT INTO "Localizations" VALUES (7,3,'en','Contacts');
INSERT INTO "Localizations" VALUES (8,3,'ru','Контакты');
INSERT INTO "Localizations" VALUES (9,3,'uk','Контакти');
INSERT INTO "Localizations" VALUES (10,4,'en','Feedback');
INSERT INTO "Localizations" VALUES (11,4,'ru','Обратная связь');
INSERT INTO "Localizations" VALUES (12,4,'uk','Зворотний зв’язок');
INSERT INTO "Localizations" VALUES (13,5,'en','Submit');
INSERT INTO "Localizations" VALUES (14,5,'ru','Отправить');
INSERT INTO "Localizations" VALUES (15,5,'uk','Надіслати');
INSERT INTO "Localizations" VALUES (16,6,'en','Your name');
INSERT INTO "Localizations" VALUES (17,6,'ru','Ваше имя');
INSERT INTO "Localizations" VALUES (18,6,'uk','Ваше ім’я');
INSERT INTO "Localizations" VALUES (19,7,'en','Your email');
INSERT INTO "Localizations" VALUES (20,7,'ru','Ваша электронная почта');
INSERT INTO "Localizations" VALUES (21,7,'uk','Ваша електронна пошта');
INSERT INTO "Localizations" VALUES (22,8,'en','Your message');
INSERT INTO "Localizations" VALUES (23,8,'ru','Ваше сообщение');
INSERT INTO "Localizations" VALUES (24,8,'uk','Ваше повідомлення');
INSERT INTO "Localizations" VALUES (25,9,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (26,9,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (27,9,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (28,10,'en','');
INSERT INTO "Localizations" VALUES (29,10,'ru','');
INSERT INTO "Localizations" VALUES (30,10,'uk','');
INSERT INTO "Localizations" VALUES (31,11,'en','');
INSERT INTO "Localizations" VALUES (32,11,'ru','');
INSERT INTO "Localizations" VALUES (33,11,'uk','');
INSERT INTO "Localizations" VALUES (34,12,'en','Pizza');
INSERT INTO "Localizations" VALUES (35,12,'ru','Пицца');
INSERT INTO "Localizations" VALUES (36,12,'uk','Піца');
INSERT INTO "Localizations" VALUES (37,13,'en','Pizza');
INSERT INTO "Localizations" VALUES (38,13,'ru','Пицца');
INSERT INTO "Localizations" VALUES (39,13,'uk','Піца');
INSERT INTO "Localizations" VALUES (40,14,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (41,14,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (42,14,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (43,15,'en','');
INSERT INTO "Localizations" VALUES (44,15,'ru','');
INSERT INTO "Localizations" VALUES (45,15,'uk','');
INSERT INTO "Localizations" VALUES (46,16,'en','');
INSERT INTO "Localizations" VALUES (47,16,'ru','');
INSERT INTO "Localizations" VALUES (48,16,'uk','');
INSERT INTO "Localizations" VALUES (49,17,'en','Panini');
INSERT INTO "Localizations" VALUES (50,17,'ru','Панини');
INSERT INTO "Localizations" VALUES (51,17,'uk','Паніні');
INSERT INTO "Localizations" VALUES (52,18,'en','Panini');
INSERT INTO "Localizations" VALUES (53,18,'ru','Панини');
INSERT INTO "Localizations" VALUES (54,18,'uk','Паніні');
INSERT INTO "Localizations" VALUES (55,19,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (56,19,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (57,19,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (58,20,'en','');
INSERT INTO "Localizations" VALUES (59,20,'ru','');
INSERT INTO "Localizations" VALUES (60,20,'uk','');
INSERT INTO "Localizations" VALUES (61,21,'en','');
INSERT INTO "Localizations" VALUES (62,21,'ru','');
INSERT INTO "Localizations" VALUES (63,21,'uk','');
INSERT INTO "Localizations" VALUES (64,22,'en','Drinks');
INSERT INTO "Localizations" VALUES (65,22,'ru','Напитки');
INSERT INTO "Localizations" VALUES (66,22,'uk','Напої');
INSERT INTO "Localizations" VALUES (67,23,'en','Drinks');
INSERT INTO "Localizations" VALUES (68,23,'ru','Напитки');
INSERT INTO "Localizations" VALUES (69,23,'uk','Напої');
INSERT INTO "Localizations" VALUES (70,24,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (71,24,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (72,24,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (73,25,'en','');
INSERT INTO "Localizations" VALUES (74,25,'ru','');
INSERT INTO "Localizations" VALUES (75,25,'uk','');
INSERT INTO "Localizations" VALUES (76,26,'en','');
INSERT INTO "Localizations" VALUES (77,26,'ru','');
INSERT INTO "Localizations" VALUES (78,26,'uk','');
INSERT INTO "Localizations" VALUES (79,27,'en','Pizza 1');
INSERT INTO "Localizations" VALUES (80,27,'ru','Пицца 1');
INSERT INTO "Localizations" VALUES (81,27,'uk','Піца 1');
INSERT INTO "Localizations" VALUES (82,28,'en','Pizza 1');
INSERT INTO "Localizations" VALUES (83,28,'ru','Пицца 1');
INSERT INTO "Localizations" VALUES (84,28,'uk','Піца 1');
INSERT INTO "Localizations" VALUES (85,29,'en','480 g');
INSERT INTO "Localizations" VALUES (86,29,'ru','480 г');
INSERT INTO "Localizations" VALUES (87,29,'uk','480 г');
INSERT INTO "Localizations" VALUES (88,30,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (89,30,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (90,30,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (91,31,'en','');
INSERT INTO "Localizations" VALUES (92,31,'ru','');
INSERT INTO "Localizations" VALUES (93,31,'uk','');
INSERT INTO "Localizations" VALUES (94,32,'en','');
INSERT INTO "Localizations" VALUES (95,32,'ru','');
INSERT INTO "Localizations" VALUES (96,32,'uk','');
INSERT INTO "Localizations" VALUES (97,33,'en','Pizza 2');
INSERT INTO "Localizations" VALUES (98,33,'ru','Пицца 2');
INSERT INTO "Localizations" VALUES (99,33,'uk','Піца 2');
INSERT INTO "Localizations" VALUES (100,34,'en','Pizza 2');
INSERT INTO "Localizations" VALUES (101,34,'ru','Пицца 2');
INSERT INTO "Localizations" VALUES (102,34,'uk','Піца 2');
INSERT INTO "Localizations" VALUES (103,35,'en','420 g');
INSERT INTO "Localizations" VALUES (104,35,'ru','420 г');
INSERT INTO "Localizations" VALUES (105,35,'uk','420 г');
INSERT INTO "Localizations" VALUES (106,36,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (107,36,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (108,36,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (109,37,'en','');
INSERT INTO "Localizations" VALUES (110,37,'ru','');
INSERT INTO "Localizations" VALUES (111,37,'uk','');
INSERT INTO "Localizations" VALUES (112,38,'en','');
INSERT INTO "Localizations" VALUES (113,38,'ru','');
INSERT INTO "Localizations" VALUES (114,38,'uk','');
INSERT INTO "Localizations" VALUES (115,39,'en','Pizza 3');
INSERT INTO "Localizations" VALUES (116,39,'ru','Пицца 3');
INSERT INTO "Localizations" VALUES (117,39,'uk','Піца 3');
INSERT INTO "Localizations" VALUES (118,40,'en','Pizza 3');
INSERT INTO "Localizations" VALUES (119,40,'ru','Пицца 3');
INSERT INTO "Localizations" VALUES (120,40,'uk','Піца 3');
INSERT INTO "Localizations" VALUES (121,41,'en','480 g');
INSERT INTO "Localizations" VALUES (122,41,'ru','480 г');
INSERT INTO "Localizations" VALUES (123,41,'uk','480 г');
INSERT INTO "Localizations" VALUES (124,42,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (125,42,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (126,42,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (127,43,'en','');
INSERT INTO "Localizations" VALUES (128,43,'ru','');
INSERT INTO "Localizations" VALUES (129,43,'uk','');
INSERT INTO "Localizations" VALUES (130,44,'en','');
INSERT INTO "Localizations" VALUES (131,44,'ru','');
INSERT INTO "Localizations" VALUES (132,44,'uk','');
INSERT INTO "Localizations" VALUES (133,45,'en','Pizza 4');
INSERT INTO "Localizations" VALUES (134,45,'ru','Пицца 4');
INSERT INTO "Localizations" VALUES (135,45,'uk','Піца 4');
INSERT INTO "Localizations" VALUES (136,46,'en','Pizza 4');
INSERT INTO "Localizations" VALUES (137,46,'ru','Пицца 4');
INSERT INTO "Localizations" VALUES (138,46,'uk','Піца 4');
INSERT INTO "Localizations" VALUES (139,47,'en','470 g');
INSERT INTO "Localizations" VALUES (140,47,'ru','470 г');
INSERT INTO "Localizations" VALUES (141,47,'uk','470 г');
INSERT INTO "Localizations" VALUES (142,48,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (143,48,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (144,48,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (145,49,'en','');
INSERT INTO "Localizations" VALUES (146,49,'ru','');
INSERT INTO "Localizations" VALUES (147,49,'uk','');
INSERT INTO "Localizations" VALUES (148,50,'en','');
INSERT INTO "Localizations" VALUES (149,50,'ru','');
INSERT INTO "Localizations" VALUES (150,50,'uk','');
INSERT INTO "Localizations" VALUES (151,51,'en','Pizza 5');
INSERT INTO "Localizations" VALUES (152,51,'ru','Пицца 5');
INSERT INTO "Localizations" VALUES (153,51,'uk','Піца 5');
INSERT INTO "Localizations" VALUES (154,52,'en','Pizza 5');
INSERT INTO "Localizations" VALUES (155,52,'ru','Пицца 5');
INSERT INTO "Localizations" VALUES (156,52,'uk','Піца 5');
INSERT INTO "Localizations" VALUES (157,53,'en','440 g');
INSERT INTO "Localizations" VALUES (158,53,'ru','440 г');
INSERT INTO "Localizations" VALUES (159,53,'uk','440 г');
INSERT INTO "Localizations" VALUES (160,54,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (161,54,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (162,54,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (163,55,'en','');
INSERT INTO "Localizations" VALUES (164,55,'ru','');
INSERT INTO "Localizations" VALUES (165,55,'uk','');
INSERT INTO "Localizations" VALUES (166,56,'en','');
INSERT INTO "Localizations" VALUES (167,56,'ru','');
INSERT INTO "Localizations" VALUES (168,56,'uk','');
INSERT INTO "Localizations" VALUES (169,57,'en','Pizza 6');
INSERT INTO "Localizations" VALUES (170,57,'ru','Пицца 6');
INSERT INTO "Localizations" VALUES (171,57,'uk','Піца 6');
INSERT INTO "Localizations" VALUES (172,58,'en','Pizza 6');
INSERT INTO "Localizations" VALUES (173,58,'ru','Пицца 6');
INSERT INTO "Localizations" VALUES (174,58,'uk','Піца 6');
INSERT INTO "Localizations" VALUES (175,59,'en','410 g');
INSERT INTO "Localizations" VALUES (176,59,'ru','410 г');
INSERT INTO "Localizations" VALUES (177,59,'uk','410 г');
INSERT INTO "Localizations" VALUES (178,60,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (179,60,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (180,60,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (181,61,'en','');
INSERT INTO "Localizations" VALUES (182,61,'ru','');
INSERT INTO "Localizations" VALUES (183,61,'uk','');
INSERT INTO "Localizations" VALUES (184,62,'en','');
INSERT INTO "Localizations" VALUES (185,62,'ru','');
INSERT INTO "Localizations" VALUES (186,62,'uk','');
INSERT INTO "Localizations" VALUES (187,63,'en','Pizza 7');
INSERT INTO "Localizations" VALUES (188,63,'ru','Пицца 7');
INSERT INTO "Localizations" VALUES (189,63,'uk','Піца 7');
INSERT INTO "Localizations" VALUES (190,64,'en','Pizza 7');
INSERT INTO "Localizations" VALUES (191,64,'ru','Пицца 7');
INSERT INTO "Localizations" VALUES (192,64,'uk','Піца 7');
INSERT INTO "Localizations" VALUES (193,65,'en','450 g');
INSERT INTO "Localizations" VALUES (194,65,'ru','450 г');
INSERT INTO "Localizations" VALUES (195,65,'uk','450 г');
INSERT INTO "Localizations" VALUES (196,66,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (197,66,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (198,66,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (199,67,'en','');
INSERT INTO "Localizations" VALUES (200,67,'ru','');
INSERT INTO "Localizations" VALUES (201,67,'uk','');
INSERT INTO "Localizations" VALUES (202,68,'en','');
INSERT INTO "Localizations" VALUES (203,68,'ru','');
INSERT INTO "Localizations" VALUES (204,68,'uk','');
INSERT INTO "Localizations" VALUES (205,69,'en','Pizza 8');
INSERT INTO "Localizations" VALUES (206,69,'ru','Пицца 8');
INSERT INTO "Localizations" VALUES (207,69,'uk','Піца 8');
INSERT INTO "Localizations" VALUES (208,70,'en','Pizza 8');
INSERT INTO "Localizations" VALUES (209,70,'ru','Пицца 8');
INSERT INTO "Localizations" VALUES (210,70,'uk','Піца 8');
INSERT INTO "Localizations" VALUES (211,71,'en','460 g');
INSERT INTO "Localizations" VALUES (212,71,'ru','460 г');
INSERT INTO "Localizations" VALUES (213,71,'uk','460 г');
INSERT INTO "Localizations" VALUES (214,72,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (215,72,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (216,72,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (217,73,'en','');
INSERT INTO "Localizations" VALUES (218,73,'ru','');
INSERT INTO "Localizations" VALUES (219,73,'uk','');
INSERT INTO "Localizations" VALUES (220,74,'en','');
INSERT INTO "Localizations" VALUES (221,74,'ru','');
INSERT INTO "Localizations" VALUES (222,74,'uk','');
INSERT INTO "Localizations" VALUES (223,75,'en','Pizza 9');
INSERT INTO "Localizations" VALUES (224,75,'ru','Пицца 9');
INSERT INTO "Localizations" VALUES (225,75,'uk','Піца 9');
INSERT INTO "Localizations" VALUES (226,76,'en','Pizza 9');
INSERT INTO "Localizations" VALUES (227,76,'ru','Пицца 9');
INSERT INTO "Localizations" VALUES (228,76,'uk','Піца 9');
INSERT INTO "Localizations" VALUES (229,77,'en','450 g');
INSERT INTO "Localizations" VALUES (230,77,'ru','450 г');
INSERT INTO "Localizations" VALUES (231,77,'uk','450 г');
INSERT INTO "Localizations" VALUES (232,78,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (233,78,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (234,78,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (235,79,'en','');
INSERT INTO "Localizations" VALUES (236,79,'ru','');
INSERT INTO "Localizations" VALUES (237,79,'uk','');
INSERT INTO "Localizations" VALUES (238,80,'en','');
INSERT INTO "Localizations" VALUES (239,80,'ru','');
INSERT INTO "Localizations" VALUES (240,80,'uk','');
INSERT INTO "Localizations" VALUES (241,81,'en','Panini 1');
INSERT INTO "Localizations" VALUES (242,81,'ru','Панини 1');
INSERT INTO "Localizations" VALUES (243,81,'uk','Паніні 1');
INSERT INTO "Localizations" VALUES (244,82,'en','Panini 1');
INSERT INTO "Localizations" VALUES (245,82,'ru','Панини 1');
INSERT INTO "Localizations" VALUES (246,82,'uk','Паніні 1');
INSERT INTO "Localizations" VALUES (247,83,'en','140 g');
INSERT INTO "Localizations" VALUES (248,83,'ru','140 г');
INSERT INTO "Localizations" VALUES (249,83,'uk','140 г');
INSERT INTO "Localizations" VALUES (250,84,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (251,84,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (252,84,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (253,85,'en','');
INSERT INTO "Localizations" VALUES (254,85,'ru','');
INSERT INTO "Localizations" VALUES (255,85,'uk','');
INSERT INTO "Localizations" VALUES (256,86,'en','');
INSERT INTO "Localizations" VALUES (257,86,'ru','');
INSERT INTO "Localizations" VALUES (258,86,'uk','');
INSERT INTO "Localizations" VALUES (259,87,'en','Panini 2');
INSERT INTO "Localizations" VALUES (260,87,'ru','Панини 2');
INSERT INTO "Localizations" VALUES (261,87,'uk','Паніні 2');
INSERT INTO "Localizations" VALUES (262,88,'en','Panini 2');
INSERT INTO "Localizations" VALUES (263,88,'ru','Панини 2');
INSERT INTO "Localizations" VALUES (264,88,'uk','Паніні 2');
INSERT INTO "Localizations" VALUES (265,89,'en','150 g');
INSERT INTO "Localizations" VALUES (266,89,'ru','150 г');
INSERT INTO "Localizations" VALUES (267,89,'uk','150 г');
INSERT INTO "Localizations" VALUES (268,90,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (269,90,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (270,90,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (271,91,'en','');
INSERT INTO "Localizations" VALUES (272,91,'ru','');
INSERT INTO "Localizations" VALUES (273,91,'uk','');
INSERT INTO "Localizations" VALUES (274,92,'en','');
INSERT INTO "Localizations" VALUES (275,92,'ru','');
INSERT INTO "Localizations" VALUES (276,92,'uk','');
INSERT INTO "Localizations" VALUES (277,93,'en','Panini 3');
INSERT INTO "Localizations" VALUES (278,93,'ru','Панини 3');
INSERT INTO "Localizations" VALUES (279,93,'uk','Паніні 3');
INSERT INTO "Localizations" VALUES (280,94,'en','Panini 3');
INSERT INTO "Localizations" VALUES (281,94,'ru','Панини 3');
INSERT INTO "Localizations" VALUES (282,94,'uk','Паніні 3');
INSERT INTO "Localizations" VALUES (283,95,'en','130 g');
INSERT INTO "Localizations" VALUES (284,95,'ru','130 г');
INSERT INTO "Localizations" VALUES (285,95,'uk','130 г');
INSERT INTO "Localizations" VALUES (286,96,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (287,96,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (288,96,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (289,97,'en','');
INSERT INTO "Localizations" VALUES (290,97,'ru','');
INSERT INTO "Localizations" VALUES (291,97,'uk','');
INSERT INTO "Localizations" VALUES (292,98,'en','');
INSERT INTO "Localizations" VALUES (293,98,'ru','');
INSERT INTO "Localizations" VALUES (294,98,'uk','');
INSERT INTO "Localizations" VALUES (295,99,'en','Drinks 1');
INSERT INTO "Localizations" VALUES (296,99,'ru','Напитки 1');
INSERT INTO "Localizations" VALUES (297,99,'uk','Напої 1');
INSERT INTO "Localizations" VALUES (298,100,'en','Drinks 1');
INSERT INTO "Localizations" VALUES (299,100,'ru','Напитки 1');
INSERT INTO "Localizations" VALUES (300,100,'uk','Напої 1');
INSERT INTO "Localizations" VALUES (301,101,'en','1 l');
INSERT INTO "Localizations" VALUES (302,101,'ru','1 л');
INSERT INTO "Localizations" VALUES (303,101,'uk','1 л');
INSERT INTO "Localizations" VALUES (304,102,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (305,102,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (306,102,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (307,103,'en','');
INSERT INTO "Localizations" VALUES (308,103,'ru','');
INSERT INTO "Localizations" VALUES (309,103,'uk','');
INSERT INTO "Localizations" VALUES (310,104,'en','');
INSERT INTO "Localizations" VALUES (311,104,'ru','');
INSERT INTO "Localizations" VALUES (312,104,'uk','');
INSERT INTO "Localizations" VALUES (313,105,'en','Drinks 2');
INSERT INTO "Localizations" VALUES (314,105,'ru','Напитки 2');
INSERT INTO "Localizations" VALUES (315,105,'uk','Напої 2');
INSERT INTO "Localizations" VALUES (316,106,'en','Drinks 2');
INSERT INTO "Localizations" VALUES (317,106,'ru','Напитки 2');
INSERT INTO "Localizations" VALUES (318,106,'uk','Напої 2');
INSERT INTO "Localizations" VALUES (319,107,'en','1 l');
INSERT INTO "Localizations" VALUES (320,107,'ru','1 л');
INSERT INTO "Localizations" VALUES (321,107,'uk','1 л');
INSERT INTO "Localizations" VALUES (322,108,'en','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (323,108,'ru','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (324,108,'uk','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO "Localizations" VALUES (325,109,'en','');
INSERT INTO "Localizations" VALUES (326,109,'ru','');
INSERT INTO "Localizations" VALUES (327,109,'uk','');
INSERT INTO "Localizations" VALUES (328,110,'en','');
INSERT INTO "Localizations" VALUES (329,110,'ru','');
INSERT INTO "Localizations" VALUES (330,110,'uk','');
INSERT INTO "Localizations" VALUES (331,111,'en','Drinks 3');
INSERT INTO "Localizations" VALUES (332,111,'ru','Напитки 3');
INSERT INTO "Localizations" VALUES (333,111,'uk','Напої 3');
INSERT INTO "Localizations" VALUES (334,112,'en','Drinks 3');
INSERT INTO "Localizations" VALUES (335,112,'ru','Напитки 3');
INSERT INTO "Localizations" VALUES (336,112,'uk','Напої 3');
INSERT INTO "Localizations" VALUES (337,113,'en','1 l');
INSERT INTO "Localizations" VALUES (338,113,'ru','1 л');
INSERT INTO "Localizations" VALUES (339,113,'uk','1 л');
INSERT INTO "Localizations" VALUES (340,114,'en','New');
INSERT INTO "Localizations" VALUES (341,114,'ru','Новый');
INSERT INTO "Localizations" VALUES (342,114,'uk','Новий');
INSERT INTO "Localizations" VALUES (343,115,'en','Confirmed');
INSERT INTO "Localizations" VALUES (344,115,'ru','Подтвержден');
INSERT INTO "Localizations" VALUES (345,115,'uk','Підтверджений');
INSERT INTO "Localizations" VALUES (346,116,'en','Scheduled');
INSERT INTO "Localizations" VALUES (347,116,'ru','Запланирован');
INSERT INTO "Localizations" VALUES (348,116,'uk','Запланований');
INSERT INTO "Localizations" VALUES (349,117,'en','Being delivered');
INSERT INTO "Localizations" VALUES (350,117,'ru','Доставляется');
INSERT INTO "Localizations" VALUES (351,117,'uk','Доставляється');
INSERT INTO "Localizations" VALUES (352,118,'en','Delivered');
INSERT INTO "Localizations" VALUES (353,118,'ru','Доставлен');
INSERT INTO "Localizations" VALUES (354,118,'uk','Доставлений');
INSERT INTO "Localizations" VALUES (355,119,'en','Closed');
INSERT INTO "Localizations" VALUES (356,119,'ru','Закрыт');
INSERT INTO "Localizations" VALUES (357,119,'uk','Закритий');
INSERT INTO "Localizations" VALUES (358,120,'en','Canceled');
INSERT INTO "Localizations" VALUES (359,120,'ru','Отменен');
INSERT INTO "Localizations" VALUES (360,120,'uk','Скасований');
INSERT INTO "Localizations" VALUES (361,121,'en','Not set');
INSERT INTO "Localizations" VALUES (362,121,'ru','Не указан');
INSERT INTO "Localizations" VALUES (363,121,'uk','Не вказано');
INSERT INTO "Localizations" VALUES (364,122,'en','Cash');
INSERT INTO "Localizations" VALUES (365,122,'ru','Наличные');
INSERT INTO "Localizations" VALUES (366,122,'uk','Готівка');
INSERT INTO "Localizations" VALUES (367,123,'en','Not set');
INSERT INTO "Localizations" VALUES (368,123,'ru','Не указан');
INSERT INTO "Localizations" VALUES (369,123,'uk','Не вказано');
INSERT INTO "Localizations" VALUES (370,124,'en','Pickup');
INSERT INTO "Localizations" VALUES (371,124,'ru','Самовывоз');
INSERT INTO "Localizations" VALUES (372,124,'uk','Самовивіз');
INSERT INTO "Localizations" VALUES (373,125,'en','Courier');
INSERT INTO "Localizations" VALUES (374,125,'ru','Курьер');
INSERT INTO "Localizations" VALUES (375,125,'uk','Кур’єр');
INSERT INTO "Localizations" VALUES (376,126,'__','/about-us');
INSERT INTO "Localizations" VALUES (377,127,'en','<h1>About Us</h1><p>Hello! This is your ecommerce website, it is based on the <a href="https://platformus.net/" target="_blank" rel="noopener">Platformus</a> content management system. You can manage it (create pages, menu items, forms and so on) using the <a href="/backend">backend</a>. Please use the username and password specified during the installation to sign in (it is &ldquo;admin@platformus.net&rdquo; and &ldquo;admin&rdquo; by default).</p><p>Please use the <a href="http://docs.platformus.net/" target="_blank" rel="noopener">documentation</a> to learn more about Platformus and how to use it. There are several examples that could be useful for the beginners. Also, you can get help in our <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">chat</a>.</p><p>Have a nice work!</p>');
INSERT INTO "Localizations" VALUES (378,127,'ru','<h1>О нас</h1><p>Здравствуйте! Это ваш веб-сайт электронной коммерции, он работает на базе системы управления содержимым &laquo;<a href="https://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Вы можете управлять им (создавать страницы, элементы меню, формы и так далее) с помощью <a href="/backend">бекенда</a>. Для входа используйте, пожалуйста, имя пользователя и пароль, указанные при установке (по умолчанию это &laquo;admin@platformus.net&raquo; и &laquo;admin&raquo; соответственно).</p><p>Чтобы узнать больше о Платформусе и о том, как им пользоваться, пожалуйста, воспользуйтесь <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацией</a>, там есть несколько примеров, которые пригодятся начинающим. При возникновении сложностей или вопросов вы можете обратиться в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, где вам обязательно помогут.</p><p>Приятной работы!</p>');
INSERT INTO "Localizations" VALUES (379,127,'uk','<h1>Про нас</h1><p>Вітаємо! Це ваш веб-сайт електронної комерції, він працює на базі системи керування вмістом &laquo;<a href="https://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Ви можете керувати ним (створювати сторінки, елементи меню, форми і так далі) за допомогою <a href="/backend">бекенду</a>. Для входу використовуйте, будь ласка, ім&rsquo;я користувача і пароль, вказані під час установки (за замовчуванням це &laquo;admin@platformus.net&raquo; і &laquo;admin&raquo; відповідно).</p><p>Щоб дізнатися більше про Платформус і про те, як ним користуватися, будь ласка, скористайтеся <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацією</a>, там є декілька прикладів, що стануть у нагоді початківцям. При виникненні труднощів або питань ви можете звернутися в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, де вам обов&rsquo;язково допоможуть.</p><p>Приємної роботи!</p>');
INSERT INTO "Localizations" VALUES (380,128,'en','About Us');
INSERT INTO "Localizations" VALUES (381,128,'ru','О нас');
INSERT INTO "Localizations" VALUES (382,128,'uk','Про нас');
INSERT INTO "Localizations" VALUES (383,129,'en','');
INSERT INTO "Localizations" VALUES (384,129,'ru','');
INSERT INTO "Localizations" VALUES (385,129,'uk','');
INSERT INTO "Localizations" VALUES (386,130,'en','');
INSERT INTO "Localizations" VALUES (387,130,'ru','');
INSERT INTO "Localizations" VALUES (388,130,'uk','');
INSERT INTO "Localizations" VALUES (389,131,'__','/contacts');
INSERT INTO "Localizations" VALUES (390,132,'en','<h1>Contacts</h1><p>Add your contacts on this page. Phone number, messengers, social links. The feedback form below (by the way, you can edit or move it to a different place) allows your visitors to write you directly from the website, just don&rsquo;t forget to specify the email address for the messages.</p><h2>Feedback from</h2>');
INSERT INTO "Localizations" VALUES (391,132,'ru','<h1>Контакты</h1><p>Добавьте свои контакты на этой странице. Телефонный номер, мессенджеры, ссылки на социальные сети. Форма обратной связи, расположенная ниже (кстати, вы можете ее изменить или перенести в другое место), поможет посетителям написать вам сообщение прямо с сайта, лишь укажите для этого адрес, на который нужно присылать сообщения.</p><h2>Форма обратной связи</h2>');
INSERT INTO "Localizations" VALUES (392,132,'uk','<h1>Контакти</h1><p>Додайте свої контакти на цій сторінці. Номер телефону, месенджери, посилання на соціальні мережі. Форма зворотного зв&rsquo;язку, розташована нижче (до речі, ви можете її змінити або перенести в інше місце), допоможе відвідувачам написати вам повідомлення прямо з сайту, лише вкажіть для цього адресу, на яку потрібно надсилати повідомлення.</p><h2>Форма зворотного зв&rsquo;язку</h2>');
INSERT INTO "Localizations" VALUES (393,133,'en','Contacts');
INSERT INTO "Localizations" VALUES (394,133,'ru','Контакты');
INSERT INTO "Localizations" VALUES (395,133,'uk','Контакти');
INSERT INTO "Localizations" VALUES (396,134,'en','');
INSERT INTO "Localizations" VALUES (397,134,'ru','');
INSERT INTO "Localizations" VALUES (398,134,'uk','');
INSERT INTO "Localizations" VALUES (399,135,'en','');
INSERT INTO "Localizations" VALUES (400,135,'ru','');
INSERT INTO "Localizations" VALUES (401,135,'uk','');
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
INSERT INTO "DataTypeParameters" VALUES (2,1,'integerBox','MaxLength','Max length');
INSERT INTO "DataTypeParameters" VALUES (3,2,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (4,2,'integerBox','MaxLength','Max length');
INSERT INTO "DataTypeParameters" VALUES (5,4,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (6,4,'integerBox','MinValue','Min value');
INSERT INTO "DataTypeParameters" VALUES (7,4,'integerBox','MaxValue','Max value');
INSERT INTO "DataTypeParameters" VALUES (8,5,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (9,5,'integerBox','MinValue','Min value');
INSERT INTO "DataTypeParameters" VALUES (10,5,'integerBox','MaxValue','Max value');
INSERT INTO "DataTypeParameters" VALUES (11,7,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (12,8,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (13,9,'integerBox','Width','Width');
INSERT INTO "DataTypeParameters" VALUES (14,9,'integerBox','Height','Height');
INSERT INTO "DataTypeParameters" VALUES (15,10,'textBox','Mode','Mode');
INSERT INTO "Members" VALUES (1,1,NULL,'Url','URL',1,1,0,1,'IsRequired=true;MaxLength=128',NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (2,1,NULL,'Content','Content',10,3,1,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (3,1,1,'Title','Title',1000,1,1,0,'IsRequired=false;MaxLength=128',NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (4,1,1,'MetaDescription','META description',1010,1,1,0,'IsRequired=false;MaxLength=512',NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (5,1,1,'MetaKeywords','META keywords',1020,1,1,0,'IsRequired=false;MaxLength=256',NULL,NULL,NULL,NULL);
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
INSERT INTO "Categories" VALUES (1,NULL,'/',12,9,10,13,10,11,'Platformus.ECommerce.ProductProviders.DefaultProductProvider',NULL);
INSERT INTO "Categories" VALUES (2,NULL,'/panini',17,14,20,18,15,16,'Platformus.ECommerce.ProductProviders.DefaultProductProvider',NULL);
INSERT INTO "Categories" VALUES (3,NULL,'/drinks',22,19,30,23,20,21,'Platformus.ECommerce.ProductProviders.DefaultProductProvider',NULL);
INSERT INTO "Products" VALUES (1,1,'/pizza/pizza-1','pizza-1',27,24,29,130.0,28,25,26);
INSERT INTO "Products" VALUES (2,1,'/pizza/pizza-2','pizza-2',33,30,35,150.0,34,31,32);
INSERT INTO "Products" VALUES (3,1,'/pizza/pizza-3','pizza-3',39,36,41,130.0,40,37,38);
INSERT INTO "Products" VALUES (4,1,'/pizza/pizza-4','pizza-4',45,42,47,160.0,46,43,44);
INSERT INTO "Products" VALUES (5,1,'/pizza/pizza-5','pizza-5',51,48,53,110.0,52,49,50);
INSERT INTO "Products" VALUES (6,1,'/pizza/pizza-6','pizza-6',57,54,59,150.0,58,55,56);
INSERT INTO "Products" VALUES (7,1,'/pizza/pizza-7','pizza-7',63,60,65,140.0,64,61,62);
INSERT INTO "Products" VALUES (8,1,'/pizza/pizza-8','pizza-8',69,66,71,120.0,70,67,68);
INSERT INTO "Products" VALUES (9,1,'/pizza/pizza-9','pizza-9',75,72,77,130.0,76,73,74);
INSERT INTO "Products" VALUES (10,2,'/panini/panini-1','panini-1',81,78,83,80.0,82,79,80);
INSERT INTO "Products" VALUES (11,2,'/panini/panini-2','panini-2',87,84,89,80.0,88,85,86);
INSERT INTO "Products" VALUES (12,2,'/panini/panini-3','panini-3',93,90,95,80.0,94,91,92);
INSERT INTO "Products" VALUES (13,3,'/pizza/drinks-1','drinks-1',99,96,101,40.0,100,97,98);
INSERT INTO "Products" VALUES (14,3,'/pizza/drinks-2','drinks-2',105,102,107,80.0,106,103,104);
INSERT INTO "Products" VALUES (15,3,'/pizza/drinks-3','drinks-3',111,108,113,70.0,112,109,110);
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
