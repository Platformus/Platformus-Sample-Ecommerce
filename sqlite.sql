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
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (3,1,'SmtpLogin','SMTP login','test',3);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (4,1,'SmtpPassword','SMTP password','test',4);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (5,1,'SmtpSenderEmail','SMTP sender email','test',5);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (6,1,'SmtpSenderName','SMTP sender name','test',6);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (7,2,'SpecifyCultureInUrl','Specify culture in URL','yes',1);
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
	"SerializedFields" TEXT,
	CONSTRAINT "PK_SerializedForm" PRIMARY KEY("CultureId","FormId"),
	CONSTRAINT "FK_SerializedForm_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id"),
	CONSTRAINT "FK_SerializedForm_Form_FormId" FOREIGN KEY("FormId") REFERENCES "Forms"("Id")
);
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SerializedFields) VALUES (2,1,'Feedback','Feedback','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Your name","IsRequired":true,"MaxLength":null,"Position":10,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Email","Name":"Your email","IsRequired":true,"MaxLength":null,"Position":20,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Your message","IsRequired":true,"MaxLength":null,"Position":30,"SerializedFieldOptions":null}]');
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SerializedFields) VALUES (3,1,'Feedback','Обратная связь','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Ваше имя","IsRequired":true,"MaxLength":null,"Position":10,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Email","Name":"Ваша электронная почта","IsRequired":true,"MaxLength":null,"Position":20,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Ваше сообщение","IsRequired":true,"MaxLength":null,"Position":30,"SerializedFieldOptions":null}]');
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SerializedFields) VALUES (4,1,'Feedback','Зворотний зв’язок','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Ваше ім’я","IsRequired":true,"MaxLength":null,"Position":10,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Email","Name":"Ваша електронна пошта","IsRequired":true,"MaxLength":null,"Position":20,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Ваше повідомлення","IsRequired":true,"MaxLength":null,"Position":30,"SerializedFieldOptions":null}]');
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
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (1,1,1,NULL,NULL,103,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (2,1,2,NULL,NULL,104,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (3,1,3,NULL,NULL,105,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (4,1,4,NULL,NULL,106,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (5,1,5,NULL,NULL,107,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (6,2,1,NULL,NULL,108,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (7,2,2,NULL,NULL,109,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (8,2,3,NULL,NULL,110,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (9,2,4,NULL,NULL,111,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (10,2,5,NULL,NULL,112,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (11,3,1,NULL,NULL,113,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (12,3,2,NULL,NULL,114,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (13,3,3,NULL,NULL,115,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (14,3,4,NULL,NULL,116,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (15,3,5,NULL,NULL,117,NULL);
CREATE TABLE "Products" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Product" PRIMARY KEY AUTOINCREMENT,
	"CategoryId" INTEGER NOT NULL,
	"Url" TEXT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"DescriptionId" INTEGER NOT NULL,
	"Price" REAL,
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
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (1,1,'/pizza/pizza-1','pizza-1',19,16,140.0,20,17,18);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (2,1,'/pizza/pizza-2','pizza-2',24,21,160.0,25,22,23);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (3,1,'/pizza/pizza-3','pizza-3',29,26,150.0,30,27,28);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (4,1,'/pizza/pizza-4','pizza-4',34,31,180.0,35,32,33);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (5,1,'/pizza/pizza-5','pizza-5',39,36,110.0,40,37,38);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (6,1,'/pizza/pizza-6','pizza-6',44,41,170.0,45,42,43);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (7,1,'/pizza/pizza-7','pizza-7',49,46,150.0,50,47,48);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (8,1,'/pizza/pizza-8','pizza-8',54,51,160.0,55,52,53);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (9,1,'/pizza/pizza-9','pizza-9',59,56,140.0,60,57,58);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (10,2,'/panini/panini-1','panini-1',64,61,20.0,65,62,63);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (11,2,'/panini/panini-2','panini-2',69,66,10.0,70,67,68);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (12,2,'/panini/panini-3','panini-3',74,71,30.0,75,72,73);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (13,3,'/pizza/drinks-1','drinks-1',79,76,40.0,80,77,78);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (14,3,'/pizza/drinks-2','drinks-2',84,81,10.0,85,82,83);
INSERT INTO `Products` (Id,CategoryId,Url,Code,NameId,DescriptionId,Price,TitleId,MetaDescriptionId,MetaKeywordsId) VALUES (15,3,'/pizza/drinks-3','drinks-3',89,86,30.0,90,87,88);
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
INSERT INTO `PaymentMethods` (Id,Code,NameId,Position) VALUES (1,'NotSet',98,10);
INSERT INTO `PaymentMethods` (Id,Code,NameId,Position) VALUES (2,'Cash',99,20);
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
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (1,'New',91,10);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (2,'Confirmed',92,20);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (3,'Scheduled',93,30);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (4,'BeingDelivered',94,40);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (5,'Delivered',95,50);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (6,'Closed',96,60);
INSERT INTO `OrderStates` (Id,Code,NameId,Position) VALUES (7,'Canceled',97,70);
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
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (19,7,2,'Your name');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (20,7,3,'Ваше имя');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (21,7,4,'Ваше ім’я');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (22,8,2,'Your email');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (23,8,3,'Ваша электронная почта');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (24,8,4,'Ваша електронна пошта');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (25,9,2,'Your message');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (26,9,3,'Ваше сообщение');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (27,9,4,'Ваше повідомлення');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (28,10,2,'Pizza');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (29,10,3,'Пицца');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (30,10,4,'Піца');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (31,11,2,'Panini');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (32,11,3,'Панини');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (33,11,4,'Паніні');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (34,12,2,'Drinks');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (35,12,3,'Напитки');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (36,12,4,'Напої');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (37,13,2,'Pizza');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (38,13,3,'Пицца');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (39,13,4,'Піца');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (40,14,2,'Panini');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (41,14,3,'Панини');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (42,14,4,'Паніні');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (43,15,2,'Drinks');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (44,15,3,'Напитки');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (45,15,4,'Напої');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (46,16,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (47,16,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (48,16,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (49,17,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (50,17,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (51,17,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (52,18,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (53,18,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (54,18,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (55,19,2,'Pizza 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (56,19,3,'Пицца 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (57,19,4,'Піца 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (58,20,2,'Pizza 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (59,20,3,'Пицца 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (60,20,4,'Піца 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (61,21,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (62,21,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (63,21,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (64,22,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (65,22,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (66,22,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (67,23,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (68,23,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (69,23,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (70,24,2,'Pizza 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (71,24,3,'Пицца 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (72,24,4,'Піца 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (73,25,2,'Pizza 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (74,25,3,'Пицца 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (75,25,4,'Піца 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (76,26,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (77,26,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (78,26,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (79,27,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (80,27,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (81,27,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (82,28,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (83,28,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (84,28,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (85,29,2,'Pizza 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (86,29,3,'Пицца 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (87,29,4,'Піца 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (88,30,2,'Pizza 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (89,30,3,'Пицца 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (90,30,4,'Піца 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (91,31,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (92,31,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (93,31,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (94,32,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (95,32,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (96,32,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (97,33,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (98,33,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (99,33,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (100,34,2,'Pizza 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (101,34,3,'Пицца 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (102,34,4,'Піца 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (103,35,2,'Pizza 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (104,35,3,'Пицца 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (105,35,4,'Піца 4');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (106,36,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (107,36,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (108,36,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (109,37,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (110,37,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (111,37,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (112,38,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (113,38,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (114,38,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (115,39,2,'Pizza 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (116,39,3,'Пицца 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (117,39,4,'Піца 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (118,40,2,'Pizza 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (119,40,3,'Пицца 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (120,40,4,'Піца 5');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (121,41,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (122,41,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (123,41,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (124,42,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (125,42,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (126,42,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (127,43,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (128,43,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (129,43,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (130,44,2,'Pizza 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (131,44,3,'Пицца 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (132,44,4,'Піца 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (133,45,2,'Pizza 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (134,45,3,'Пицца 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (135,45,4,'Піца 6');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (136,46,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (137,46,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (138,46,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (139,47,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (140,47,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (141,47,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (142,48,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (143,48,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (144,48,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (145,49,2,'Pizza 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (146,49,3,'Пицца 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (147,49,4,'Піца 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (148,50,2,'Pizza 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (149,50,3,'Пицца 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (150,50,4,'Піца 7');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (151,51,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (152,51,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (153,51,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (154,52,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (155,52,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (156,52,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (157,53,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (158,53,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (159,53,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (160,54,2,'Pizza 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (161,54,3,'Пицца 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (162,54,4,'Піца 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (163,55,2,'Pizza 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (164,55,3,'Пицца 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (165,55,4,'Піца 8');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (166,56,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (167,56,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (168,56,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (169,57,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (170,57,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (171,57,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (172,58,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (173,58,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (174,58,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (175,59,2,'Pizza 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (176,59,3,'Пицца 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (177,59,4,'Піца 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (178,60,2,'Pizza 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (179,60,3,'Пицца 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (180,60,4,'Піца 9');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (181,61,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (182,61,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (183,61,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (184,62,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (185,62,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (186,62,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (187,63,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (188,63,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (189,63,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (190,64,2,'Panini 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (191,64,3,'Панини 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (192,64,4,'Паніні 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (193,65,2,'Panini 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (194,65,3,'Панини 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (195,65,4,'Паніні 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (196,66,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (197,66,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (198,66,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (199,67,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (200,67,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (201,67,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (202,68,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (203,68,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (204,68,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (205,69,2,'Panini 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (206,69,3,'Панини 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (207,69,4,'Паніні 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (208,70,2,'Panini 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (209,70,3,'Панини 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (210,70,4,'Паніні 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (211,71,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (212,71,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (213,71,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (214,72,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (215,72,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (216,72,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (217,73,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (218,73,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (219,73,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (220,74,2,'Panini 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (221,74,3,'Панини 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (222,74,4,'Паніні 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (223,75,2,'Panini 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (224,75,3,'Панини 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (225,75,4,'Паніні 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (226,76,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (227,76,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (228,76,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (229,77,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (230,77,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (231,77,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (232,78,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (233,78,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (234,78,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (235,79,2,'Drinks 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (236,79,3,'Напитки 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (237,79,4,'Напої 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (238,80,2,'Drinks 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (239,80,3,'Напитки 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (240,80,4,'Напої 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (241,81,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (242,81,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (243,81,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (244,82,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (245,82,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (246,82,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (247,83,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (248,83,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (249,83,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (250,84,2,'Drinks 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (251,84,3,'Напитки 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (252,84,4,'Напої 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (253,85,2,'Drinks 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (254,85,3,'Напитки 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (255,85,4,'Напої 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (256,86,2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (257,86,3,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (258,86,4,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (259,87,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (260,87,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (261,87,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (262,88,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (263,88,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (264,88,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (265,89,2,'Drinks 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (266,89,3,'Напитки 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (267,89,4,'Напої 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (268,90,2,'Drinks 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (269,90,3,'Напитки 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (270,90,4,'Напої 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (271,91,2,'New');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (272,91,3,'Новый');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (273,91,4,'Новий');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (274,92,2,'Confirmed');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (275,92,3,'Подтвержден');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (276,92,4,'Підтверджений');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (277,93,2,'Scheduled');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (278,93,3,'Запланирован');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (279,93,4,'Запланований');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (280,94,2,'Being delivered');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (281,94,3,'Доставляется');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (282,94,4,'Доставляється');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (283,95,2,'Delivered');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (284,95,3,'Доставлен');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (285,95,4,'Доставлений');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (286,96,2,'Closed');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (287,96,3,'Закрыт');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (288,96,4,'Закритий');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (289,97,2,'Canceled');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (290,97,3,'Отменен');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (291,97,4,'Скасований');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (292,98,2,'Not set');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (293,98,3,'Не указан');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (294,98,4,'Не вказано');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (295,99,2,'Cash');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (296,99,3,'Наличные');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (297,99,4,'Готівка');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (298,100,2,'Not set');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (299,100,3,'Не указан');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (300,100,4,'Не вказано');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (301,101,2,'Pickup');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (302,101,3,'Самовывоз');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (303,101,4,'Самовивіз');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (304,102,2,'Courier');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (305,102,3,'Курьер');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (306,102,4,'Кур’єр');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (307,103,1,'/');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (308,104,2,'<h1>Your Ecommerce Website</h1><p>Hello! This is your ecommerce website, it is based on the <a href="http://platformus.net/" target="_blank" rel="noopener">Platformus</a> content management system. You can manage it (create pages, menu items, forms and so on) using the <a href="/backend">backend</a>. Please use the username and password specified during the installation to sign in (it is &ldquo;admin@platformus.net&rdquo; and &ldquo;admin&rdquo; by default).</p><p>Please use the <a href="http://docs.platformus.net/" target="_blank" rel="noopener">documentation</a> to learn more about Platformus and how to use it. There are several examples that could be useful for the beginners. Also, you can get help in our <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">chat</a>.</p><p>Have a nice work!</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (309,104,3,'<h1>Ваш веб-сайт электронной коммерции</h1><p>Здравствуйте! Это ваш веб-сайт электронной коммерции, он работает на базе системы управления содержимым &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Вы можете управлять им (создавать страницы, элементы меню, формы и так далее) с помощью <a href="/backend">бекенда</a>. Для входа используйте, пожалуйста, имя пользователя и пароль, указанные при установке (по умолчанию это &laquo;admin@platformus.net&raquo; и &laquo;admin&raquo; соответственно).</p><p>Чтобы узнать больше о Платформусе и о том, как им пользоваться, пожалуйста, воспользуйтесь <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацией</a>, там есть несколько примеров, которые пригодятся начинающим. При возникновении сложностей или вопросов вы можете обратиться в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, где вам обязательно помогут.</p><p>Приятной работы!</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (310,104,4,'<h1>Ваш веб-сайт електронної комерції</h1><p>Вітаємо! Це ваш веб-сайт електронної комерції, він працює на базі системи керування вмістом &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Ви можете керувати ним (створювати сторінки, елементи меню, форми і так далі) за допомогою <a href="/backend">бекенду</a>. Для входу використовуйте, будь ласка, ім&rsquo;я користувача і пароль, вказані під час установки (за замовчуванням це &laquo;admin@platformus.net&raquo; і &laquo;admin&raquo; відповідно).</p><p>Щоб дізнатися більше про Платформус і про те, як ним користуватися, будь ласка, скористайтеся <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацією</a>, там є декілька прикладів, що стануть у нагоді початківцям. При виникненні труднощів або питань ви можете звернутися в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, де вам обов&rsquo;язково допоможуть.</p><p>Приємної роботи!</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (311,105,2,'Your Ecommerce Website');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (312,105,3,'Ваш веб-сайт электронной коммерции');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (313,105,4,'Ваш веб-сайт електронної комерції');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (314,106,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (315,106,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (316,106,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (317,107,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (318,107,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (319,107,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (320,108,1,'/about-us');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (321,109,2,'<h1>About Us</h1><p>Tell us about your ecommerce website. You can add photos or videos here.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (322,109,3,'<h1>О нас</h1><p>Расскажите о вашем веб-сайте электронной коммерции. Вы можете добавить сюда фотографии или видео.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (323,109,4,'<h1>Про нас</h1><p>Розкажіть про ваш веб-сайт електронної комерції. Ви можете додати сюди фотографії або відео.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (324,110,2,'About Us');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (325,110,3,'О нас');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (326,110,4,'Про нас');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (327,111,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (328,111,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (329,111,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (330,112,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (331,112,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (332,112,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (333,113,1,'/contacts');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (334,114,2,'<h1>Contacts</h1><p>Add your contacts on this page. Phone number, messengers, social links. The feedback form below (by the way, you can edit or move it to a different place) allows your visitors to write you directly from the website, just don&rsquo;t forget to specify the email address for the messages.</p><h2>Feedback from</h2>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (335,114,3,'<h1>Контакты</h1><p>Добавьте свои контакты на этой странице. Телефонный номер, мессенджеры, ссылки на социальные сети. Форма обратной связи, расположенная ниже (кстати, вы можете ее изменить или перенести в другое место), поможет посетителям написать вам сообщение прямо с сайта, лишь укажите для этого адрес, на который нужно присылать сообщения.</p><h2>Форма обратной связи</h2>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (336,114,4,'<h1>Контакти</h1><p>Додайте свої контакти на цій сторінці. Номер телефону, месенджери, посилання на соціальні мережі. Форма зворотного зв&rsquo;язку, розташована нижче (до речі, ви можете її змінити або перенести в інше місце), допоможе відвідувачам написати вам повідомлення прямо з сайту, лише вкажіть для цього адресу, на яку потрібно надсилати повідомлення.</p><h2>Форма зворотного зв&rsquo;язку</h2>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (337,115,2,'Contacts');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (338,115,3,'Контакты');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (339,115,4,'Контакти');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (340,116,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (341,116,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (342,116,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (343,117,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (344,117,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (345,117,4,'');
CREATE TABLE "Forms" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Form" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"ProduceCompletedForms" INTEGER NOT NULL,
	"CSharpClassName" TEXT NOT NULL,
	"Parameters" TEXT,
	CONSTRAINT "FK_Form_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Forms` (Id,Code,NameId,ProduceCompletedForms,CSharpClassName,Parameters) VALUES (1,'Feedback',6,1,'Platformus.Forms.Frontend.FormHandlers.EmailFormHandler','RecipientEmails=test@test.com;RedirectUrl=/contacts');
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
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (1,1,1,'Name',7,1,NULL,10);
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (2,1,1,'Email',8,1,NULL,20);
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (3,1,2,'Message',9,1,NULL,30);
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
CREATE TABLE "DeliveryMethods" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DeliveryMethod" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_DeliveryMethod_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `DeliveryMethods` (Id,Code,NameId,Position) VALUES (1,'NotSet',100,10);
INSERT INTO `DeliveryMethods` (Id,Code,NameId,Position) VALUES (2,'Pickup',101,20);
INSERT INTO `DeliveryMethods` (Id,Code,NameId,Position) VALUES (3,'Courier',102,30);
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
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (7,'string','image','Image',7);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (8,'datetime','date','Date',8);
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
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (5,7,'numericTextBox','Width','Width');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (6,7,'numericTextBox','Height','Height');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (7,8,'checkbox','IsRequired','Is required');
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
INSERT INTO `Categories` (Id,CategoryId,NameId,Position) VALUES (1,NULL,10,10);
INSERT INTO `Categories` (Id,CategoryId,NameId,Position) VALUES (2,NULL,11,20);
INSERT INTO `Categories` (Id,CategoryId,NameId,Position) VALUES (3,NULL,12,30);
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
INSERT INTO `Catalogs` (Id,CatalogId,Url,NameId,CSharpClassName,Parameters,Position) VALUES (1,NULL,'/pizza',13,'Platformus.ECommerce.ProductProviders.CategoryProductProvider','CategoryId=1',10);
INSERT INTO `Catalogs` (Id,CatalogId,Url,NameId,CSharpClassName,Parameters,Position) VALUES (2,NULL,'/panini',14,'Platformus.ECommerce.ProductProviders.CategoryProductProvider','CategoryId=2',20);
INSERT INTO `Catalogs` (Id,CatalogId,Url,NameId,CSharpClassName,Parameters,Position) VALUES (3,NULL,'/drinks',15,'Platformus.ECommerce.ProductProviders.CategoryProductProvider','CategoryId=3',30);
CREATE TABLE "Carts" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Cart" PRIMARY KEY AUTOINCREMENT,
	"OrderId" INTEGER,
	"ClientSideId" TEXT NOT NULL,
	"Created" TEXT NOT NULL,
	CONSTRAINT "FK_Cart_Order_OrderId" FOREIGN KEY("OrderId") REFERENCES "Orders" ("Id")
);
COMMIT;
