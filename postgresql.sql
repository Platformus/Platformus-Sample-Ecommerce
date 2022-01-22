--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2022-01-22 23:16:29

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 285 (class 1259 OID 26700)
-- Name: Carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Carts" (
    "Id" integer NOT NULL,
    "ClientSideId" text NOT NULL,
    "Created" timestamp without time zone NOT NULL
);


ALTER TABLE public."Carts" OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 26699)
-- Name: Carts_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Carts_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Carts_Id_seq" OWNER TO postgres;

--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 284
-- Name: Carts_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Carts_Id_seq" OWNED BY public."Carts"."Id";


--
-- TOC entry 273 (class 1259 OID 26561)
-- Name: Categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Categories" (
    "Id" integer NOT NULL,
    "CategoryId" integer,
    "Url" text NOT NULL,
    "NameId" integer NOT NULL,
    "DescriptionId" integer NOT NULL,
    "Position" integer,
    "TitleId" integer NOT NULL,
    "MetaDescriptionId" integer NOT NULL,
    "MetaKeywordsId" integer NOT NULL,
    "ProductProviderCSharpClassName" text NOT NULL,
    "ProductProviderParameters" text
);


ALTER TABLE public."Categories" OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 26560)
-- Name: Categories_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Categories_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Categories_Id_seq" OWNER TO postgres;

--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 272
-- Name: Categories_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Categories_Id_seq" OWNED BY public."Categories"."Id";


--
-- TOC entry 237 (class 1259 OID 26262)
-- Name: Classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Classes" (
    "Id" integer NOT NULL,
    "ClassId" integer,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "PluralizedName" text NOT NULL,
    "IsAbstract" boolean NOT NULL
);


ALTER TABLE public."Classes" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 26261)
-- Name: Classes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Classes_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Classes_Id_seq" OWNER TO postgres;

--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 236
-- Name: Classes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Classes_Id_seq" OWNED BY public."Classes"."Id";


--
-- TOC entry 269 (class 1259 OID 26533)
-- Name: CompletedFields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CompletedFields" (
    "Id" integer NOT NULL,
    "CompletedFormId" integer NOT NULL,
    "FieldId" integer NOT NULL,
    "Value" text
);


ALTER TABLE public."CompletedFields" OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 26532)
-- Name: CompletedFields_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CompletedFields_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CompletedFields_Id_seq" OWNER TO postgres;

--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 268
-- Name: CompletedFields_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CompletedFields_Id_seq" OWNED BY public."CompletedFields"."Id";


--
-- TOC entry 267 (class 1259 OID 26521)
-- Name: CompletedForms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CompletedForms" (
    "Id" integer NOT NULL,
    "FormId" integer NOT NULL,
    "Created" timestamp without time zone NOT NULL
);


ALTER TABLE public."CompletedForms" OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 26520)
-- Name: CompletedForms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CompletedForms_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CompletedForms_Id_seq" OWNER TO postgres;

--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 266
-- Name: CompletedForms_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CompletedForms_Id_seq" OWNED BY public."CompletedForms"."Id";


--
-- TOC entry 223 (class 1259 OID 26168)
-- Name: Configurations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Configurations" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL
);


ALTER TABLE public."Configurations" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 26167)
-- Name: Configurations_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Configurations_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Configurations_Id_seq" OWNER TO postgres;

--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 222
-- Name: Configurations_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Configurations_Id_seq" OWNED BY public."Configurations"."Id";


--
-- TOC entry 213 (class 1259 OID 26092)
-- Name: CredentialTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CredentialTypes" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."CredentialTypes" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 26091)
-- Name: CredentialTypes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CredentialTypes_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CredentialTypes_Id_seq" OWNER TO postgres;

--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 212
-- Name: CredentialTypes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CredentialTypes_Id_seq" OWNED BY public."CredentialTypes"."Id";


--
-- TOC entry 215 (class 1259 OID 26101)
-- Name: Credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Credentials" (
    "Id" integer NOT NULL,
    "UserId" integer NOT NULL,
    "CredentialTypeId" integer NOT NULL,
    "Identifier" text NOT NULL,
    "Secret" text,
    "Extra" text
);


ALTER TABLE public."Credentials" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 26100)
-- Name: Credentials_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Credentials_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Credentials_Id_seq" OWNER TO postgres;

--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 214
-- Name: Credentials_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Credentials_Id_seq" OWNED BY public."Credentials"."Id";


--
-- TOC entry 226 (class 1259 OID 26190)
-- Name: Cultures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cultures" (
    "Id" text NOT NULL,
    "Name" text NOT NULL,
    "IsNeutral" boolean NOT NULL,
    "IsFrontendDefault" boolean NOT NULL,
    "IsBackendDefault" boolean NOT NULL
);


ALTER TABLE public."Cultures" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 26248)
-- Name: DataSources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataSources" (
    "Id" integer NOT NULL,
    "EndpointId" integer NOT NULL,
    "Code" text NOT NULL,
    "DataProviderCSharpClassName" text NOT NULL,
    "DataProviderParameters" text
);


ALTER TABLE public."DataSources" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 26247)
-- Name: DataSources_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataSources_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataSources_Id_seq" OWNER TO postgres;

--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 234
-- Name: DataSources_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataSources_Id_seq" OWNED BY public."DataSources"."Id";


--
-- TOC entry 245 (class 1259 OID 26313)
-- Name: DataTypeParameterOptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataTypeParameterOptions" (
    "Id" integer NOT NULL,
    "DataTypeParameterId" integer NOT NULL,
    "Value" text NOT NULL
);


ALTER TABLE public."DataTypeParameterOptions" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 26312)
-- Name: DataTypeParameterOptions_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataTypeParameterOptions_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataTypeParameterOptions_Id_seq" OWNER TO postgres;

--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 244
-- Name: DataTypeParameterOptions_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataTypeParameterOptions_Id_seq" OWNED BY public."DataTypeParameterOptions"."Id";


--
-- TOC entry 243 (class 1259 OID 26299)
-- Name: DataTypeParameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataTypeParameters" (
    "Id" integer NOT NULL,
    "DataTypeId" integer NOT NULL,
    "ParameterEditorCode" text NOT NULL,
    "Code" text NOT NULL,
    "Name" text
);


ALTER TABLE public."DataTypeParameters" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 26298)
-- Name: DataTypeParameters_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataTypeParameters_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataTypeParameters_Id_seq" OWNER TO postgres;

--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 242
-- Name: DataTypeParameters_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataTypeParameters_Id_seq" OWNED BY public."DataTypeParameters"."Id";


--
-- TOC entry 241 (class 1259 OID 26290)
-- Name: DataTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataTypes" (
    "Id" integer NOT NULL,
    "StorageDataType" text NOT NULL,
    "ParameterEditorCode" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."DataTypes" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 26289)
-- Name: DataTypes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataTypes_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataTypes_Id_seq" OWNER TO postgres;

--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 240
-- Name: DataTypes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataTypes_Id_seq" OWNED BY public."DataTypes"."Id";


--
-- TOC entry 283 (class 1259 OID 26686)
-- Name: DeliveryMethods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DeliveryMethods" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "NameId" integer NOT NULL,
    "Position" integer
);


ALTER TABLE public."DeliveryMethods" OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 26685)
-- Name: DeliveryMethods_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DeliveryMethods_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DeliveryMethods_Id_seq" OWNER TO postgres;

--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 282
-- Name: DeliveryMethods_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DeliveryMethods_Id_seq" OWNED BY public."DeliveryMethods"."Id";


--
-- TOC entry 228 (class 1259 OID 26198)
-- Name: Dictionaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Dictionaries" (
    "Id" integer NOT NULL
);


ALTER TABLE public."Dictionaries" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 26197)
-- Name: Dictionaries_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Dictionaries_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Dictionaries_Id_seq" OWNER TO postgres;

--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 227
-- Name: Dictionaries_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Dictionaries_Id_seq" OWNED BY public."Dictionaries"."Id";


--
-- TOC entry 233 (class 1259 OID 26232)
-- Name: EndpointPermissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EndpointPermissions" (
    "EndpointId" integer NOT NULL,
    "PermissionId" integer NOT NULL
);


ALTER TABLE public."EndpointPermissions" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 26224)
-- Name: Endpoints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Endpoints" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "UrlTemplate" text,
    "Position" integer,
    "DisallowAnonymous" boolean NOT NULL,
    "SignInUrl" text,
    "RequestProcessorCSharpClassName" text NOT NULL,
    "RequestProcessorParameters" text,
    "ResponseCacheCSharpClassName" text,
    "ResponseCacheParameters" text
);


ALTER TABLE public."Endpoints" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 26223)
-- Name: Endpoints_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Endpoints_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Endpoints_Id_seq" OWNER TO postgres;

--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 231
-- Name: Endpoints_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Endpoints_Id_seq" OWNED BY public."Endpoints"."Id";


--
-- TOC entry 265 (class 1259 OID 26504)
-- Name: FieldOptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FieldOptions" (
    "Id" integer NOT NULL,
    "FieldId" integer NOT NULL,
    "ValueId" integer NOT NULL,
    "Position" integer
);


ALTER TABLE public."FieldOptions" OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 26503)
-- Name: FieldOptions_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FieldOptions_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FieldOptions_Id_seq" OWNER TO postgres;

--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 264
-- Name: FieldOptions_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FieldOptions_Id_seq" OWNED BY public."FieldOptions"."Id";


--
-- TOC entry 261 (class 1259 OID 26471)
-- Name: FieldTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FieldTypes" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer,
    "ValidatorCSharpClassName" text
);


ALTER TABLE public."FieldTypes" OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 26470)
-- Name: FieldTypes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FieldTypes_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FieldTypes_Id_seq" OWNER TO postgres;

--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 260
-- Name: FieldTypes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FieldTypes_Id_seq" OWNED BY public."FieldTypes"."Id";


--
-- TOC entry 263 (class 1259 OID 26480)
-- Name: Fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Fields" (
    "Id" integer NOT NULL,
    "FormId" integer NOT NULL,
    "FieldTypeId" integer NOT NULL,
    "Code" text NOT NULL,
    "NameId" integer NOT NULL,
    "IsRequired" boolean NOT NULL,
    "MaxLength" integer,
    "Position" integer
);


ALTER TABLE public."Fields" OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 26479)
-- Name: Fields_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Fields_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Fields_Id_seq" OWNER TO postgres;

--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 262
-- Name: Fields_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Fields_Id_seq" OWNED BY public."Fields"."Id";


--
-- TOC entry 271 (class 1259 OID 26552)
-- Name: Files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Files" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "Size" bigint NOT NULL
);


ALTER TABLE public."Files" OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 26551)
-- Name: Files_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Files_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Files_Id_seq" OWNER TO postgres;

--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 270
-- Name: Files_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Files_Id_seq" OWNED BY public."Files"."Id";


--
-- TOC entry 259 (class 1259 OID 26452)
-- Name: Forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Forms" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "NameId" integer NOT NULL,
    "SubmitButtonTitleId" integer NOT NULL,
    "ProduceCompletedForms" boolean NOT NULL,
    "FormHandlerCSharpClassName" text NOT NULL,
    "FormHandlerParameters" text
);


ALTER TABLE public."Forms" OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 26451)
-- Name: Forms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Forms_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Forms_Id_seq" OWNER TO postgres;

--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 258
-- Name: Forms_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Forms_Id_seq" OWNED BY public."Forms"."Id";


--
-- TOC entry 230 (class 1259 OID 26205)
-- Name: Localizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Localizations" (
    "Id" integer NOT NULL,
    "DictionaryId" integer NOT NULL,
    "CultureId" text NOT NULL,
    "Value" text
);


ALTER TABLE public."Localizations" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 26204)
-- Name: Localizations_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Localizations_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Localizations_Id_seq" OWNER TO postgres;

--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 229
-- Name: Localizations_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Localizations_Id_seq" OWNED BY public."Localizations"."Id";


--
-- TOC entry 247 (class 1259 OID 26327)
-- Name: Members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Members" (
    "Id" integer NOT NULL,
    "ClassId" integer NOT NULL,
    "TabId" integer,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer,
    "PropertyDataTypeId" integer,
    "IsPropertyLocalizable" boolean,
    "IsPropertyVisibleInList" boolean,
    "PropertyDataTypeParameters" text,
    "RelationClassId" integer,
    "IsRelationSingleParent" boolean,
    "MinRelatedObjectsNumber" integer,
    "MaxRelatedObjectsNumber" integer
);


ALTER TABLE public."Members" OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 26326)
-- Name: Members_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Members_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Members_Id_seq" OWNER TO postgres;

--
-- TOC entry 3803 (class 0 OID 0)
-- Dependencies: 246
-- Name: Members_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Members_Id_seq" OWNED BY public."Members"."Id";


--
-- TOC entry 257 (class 1259 OID 26428)
-- Name: MenuItems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MenuItems" (
    "Id" integer NOT NULL,
    "MenuId" integer,
    "MenuItemId" integer,
    "NameId" integer NOT NULL,
    "Url" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."MenuItems" OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 26427)
-- Name: MenuItems_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MenuItems_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MenuItems_Id_seq" OWNER TO postgres;

--
-- TOC entry 3804 (class 0 OID 0)
-- Dependencies: 256
-- Name: MenuItems_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MenuItems_Id_seq" OWNED BY public."MenuItems"."Id";


--
-- TOC entry 255 (class 1259 OID 26414)
-- Name: Menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Menus" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "NameId" integer NOT NULL
);


ALTER TABLE public."Menus" OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 26413)
-- Name: Menus_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Menus_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Menus_Id_seq" OWNER TO postgres;

--
-- TOC entry 3805 (class 0 OID 0)
-- Dependencies: 254
-- Name: Menus_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Menus_Id_seq" OWNED BY public."Menus"."Id";


--
-- TOC entry 209 (class 1259 OID 26075)
-- Name: ModelStates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ModelStates" (
    "Id" uuid NOT NULL,
    "Value" text NOT NULL,
    "Created" timestamp without time zone NOT NULL
);


ALTER TABLE public."ModelStates" OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 26356)
-- Name: Objects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Objects" (
    "Id" integer NOT NULL,
    "ClassId" integer NOT NULL
);


ALTER TABLE public."Objects" OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 26355)
-- Name: Objects_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Objects_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Objects_Id_seq" OWNER TO postgres;

--
-- TOC entry 3806 (class 0 OID 0)
-- Dependencies: 248
-- Name: Objects_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Objects_Id_seq" OWNED BY public."Objects"."Id";


--
-- TOC entry 279 (class 1259 OID 26658)
-- Name: OrderStates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderStates" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "NameId" integer NOT NULL,
    "Position" integer
);


ALTER TABLE public."OrderStates" OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 26657)
-- Name: OrderStates_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderStates_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrderStates_Id_seq" OWNER TO postgres;

--
-- TOC entry 3807 (class 0 OID 0)
-- Dependencies: 278
-- Name: OrderStates_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderStates_Id_seq" OWNED BY public."OrderStates"."Id";


--
-- TOC entry 287 (class 1259 OID 26709)
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    "Id" integer NOT NULL,
    "OrderStateId" integer NOT NULL,
    "PaymentMethodId" integer NOT NULL,
    "DeliveryMethodId" integer NOT NULL,
    "CustomerFirstName" text NOT NULL,
    "CustomerLastName" text,
    "CustomerPhone" text NOT NULL,
    "CustomerEmail" text,
    "CustomerAddress" text,
    "Note" text,
    "Created" timestamp without time zone NOT NULL
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 26708)
-- Name: Orders_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Orders_Id_seq" OWNER TO postgres;

--
-- TOC entry 3808 (class 0 OID 0)
-- Dependencies: 286
-- Name: Orders_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_Id_seq" OWNED BY public."Orders"."Id";


--
-- TOC entry 281 (class 1259 OID 26672)
-- Name: PaymentMethods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaymentMethods" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "NameId" integer NOT NULL,
    "Position" integer
);


ALTER TABLE public."PaymentMethods" OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 26671)
-- Name: PaymentMethods_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PaymentMethods_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PaymentMethods_Id_seq" OWNER TO postgres;

--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 280
-- Name: PaymentMethods_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PaymentMethods_Id_seq" OWNED BY public."PaymentMethods"."Id";


--
-- TOC entry 220 (class 1259 OID 26144)
-- Name: Permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Permissions" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."Permissions" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 26143)
-- Name: Permissions_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Permissions_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Permissions_Id_seq" OWNER TO postgres;

--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 219
-- Name: Permissions_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Permissions_Id_seq" OWNED BY public."Permissions"."Id";


--
-- TOC entry 277 (class 1259 OID 26644)
-- Name: Photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Photos" (
    "Id" integer NOT NULL,
    "ProductId" integer NOT NULL,
    "Filename" text NOT NULL,
    "IsCover" boolean NOT NULL,
    "Position" integer
);


ALTER TABLE public."Photos" OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 26643)
-- Name: Photos_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Photos_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Photos_Id_seq" OWNER TO postgres;

--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 276
-- Name: Photos_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Photos_Id_seq" OWNED BY public."Photos"."Id";


--
-- TOC entry 289 (class 1259 OID 26733)
-- Name: Positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Positions" (
    "Id" integer NOT NULL,
    "CartId" integer,
    "OrderId" integer,
    "ProductId" integer NOT NULL,
    "Price" numeric NOT NULL,
    "Quantity" numeric NOT NULL
);


ALTER TABLE public."Positions" OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 26732)
-- Name: Positions_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Positions_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Positions_Id_seq" OWNER TO postgres;

--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 288
-- Name: Positions_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Positions_Id_seq" OWNED BY public."Positions"."Id";


--
-- TOC entry 275 (class 1259 OID 26600)
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Products" (
    "Id" integer NOT NULL,
    "CategoryId" integer NOT NULL,
    "Url" text NOT NULL,
    "Code" text,
    "NameId" integer NOT NULL,
    "DescriptionId" integer NOT NULL,
    "UnitsId" integer NOT NULL,
    "Price" numeric NOT NULL,
    "TitleId" integer NOT NULL,
    "MetaDescriptionId" integer NOT NULL,
    "MetaKeywordsId" integer NOT NULL
);


ALTER TABLE public."Products" OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 26599)
-- Name: Products_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Products_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Products_Id_seq" OWNER TO postgres;

--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 274
-- Name: Products_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Products_Id_seq" OWNED BY public."Products"."Id";


--
-- TOC entry 251 (class 1259 OID 26368)
-- Name: Properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Properties" (
    "Id" integer NOT NULL,
    "ObjectId" integer NOT NULL,
    "MemberId" integer NOT NULL,
    "IntegerValue" integer,
    "DecimalValue" numeric,
    "StringValueId" integer,
    "DateTimeValue" timestamp without time zone
);


ALTER TABLE public."Properties" OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 26367)
-- Name: Properties_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Properties_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Properties_Id_seq" OWNER TO postgres;

--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 250
-- Name: Properties_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Properties_Id_seq" OWNED BY public."Properties"."Id";


--
-- TOC entry 253 (class 1259 OID 26392)
-- Name: Relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Relations" (
    "Id" integer NOT NULL,
    "MemberId" integer NOT NULL,
    "PrimaryId" integer NOT NULL,
    "ForeignId" integer NOT NULL
);


ALTER TABLE public."Relations" OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 26391)
-- Name: Relations_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Relations_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Relations_Id_seq" OWNER TO postgres;

--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 252
-- Name: Relations_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Relations_Id_seq" OWNED BY public."Relations"."Id";


--
-- TOC entry 221 (class 1259 OID 26152)
-- Name: RolePermissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RolePermissions" (
    "RoleId" integer NOT NULL,
    "PermissionId" integer NOT NULL
);


ALTER TABLE public."RolePermissions" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 26120)
-- Name: Roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Roles" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."Roles" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 26119)
-- Name: Roles_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Roles_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Roles_Id_seq" OWNER TO postgres;

--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 216
-- Name: Roles_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Roles_Id_seq" OWNED BY public."Roles"."Id";


--
-- TOC entry 239 (class 1259 OID 26276)
-- Name: Tabs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tabs" (
    "Id" integer NOT NULL,
    "ClassId" integer NOT NULL,
    "Name" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."Tabs" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 26275)
-- Name: Tabs_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tabs_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tabs_Id_seq" OWNER TO postgres;

--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 238
-- Name: Tabs_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tabs_Id_seq" OWNED BY public."Tabs"."Id";


--
-- TOC entry 218 (class 1259 OID 26128)
-- Name: UserRoles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserRoles" (
    "UserId" integer NOT NULL,
    "RoleId" integer NOT NULL
);


ALTER TABLE public."UserRoles" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 26083)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "Created" timestamp without time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 26082)
-- Name: Users_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_Id_seq" OWNER TO postgres;

--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 210
-- Name: Users_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_Id_seq" OWNED BY public."Users"."Id";


--
-- TOC entry 225 (class 1259 OID 26177)
-- Name: Variables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Variables" (
    "Id" integer NOT NULL,
    "ConfigurationId" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Value" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."Variables" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 26176)
-- Name: Variables_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Variables_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Variables_Id_seq" OWNER TO postgres;

--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 224
-- Name: Variables_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Variables_Id_seq" OWNED BY public."Variables"."Id";


--
-- TOC entry 3404 (class 2604 OID 26703)
-- Name: Carts Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carts" ALTER COLUMN "Id" SET DEFAULT nextval('public."Carts_Id_seq"'::regclass);


--
-- TOC entry 3398 (class 2604 OID 26564)
-- Name: Categories Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories" ALTER COLUMN "Id" SET DEFAULT nextval('public."Categories_Id_seq"'::regclass);


--
-- TOC entry 3380 (class 2604 OID 26265)
-- Name: Classes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Classes" ALTER COLUMN "Id" SET DEFAULT nextval('public."Classes_Id_seq"'::regclass);


--
-- TOC entry 3396 (class 2604 OID 26536)
-- Name: CompletedFields Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedFields" ALTER COLUMN "Id" SET DEFAULT nextval('public."CompletedFields_Id_seq"'::regclass);


--
-- TOC entry 3395 (class 2604 OID 26524)
-- Name: CompletedForms Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedForms" ALTER COLUMN "Id" SET DEFAULT nextval('public."CompletedForms_Id_seq"'::regclass);


--
-- TOC entry 3374 (class 2604 OID 26171)
-- Name: Configurations Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Configurations" ALTER COLUMN "Id" SET DEFAULT nextval('public."Configurations_Id_seq"'::regclass);


--
-- TOC entry 3370 (class 2604 OID 26095)
-- Name: CredentialTypes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CredentialTypes" ALTER COLUMN "Id" SET DEFAULT nextval('public."CredentialTypes_Id_seq"'::regclass);


--
-- TOC entry 3371 (class 2604 OID 26104)
-- Name: Credentials Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credentials" ALTER COLUMN "Id" SET DEFAULT nextval('public."Credentials_Id_seq"'::regclass);


--
-- TOC entry 3379 (class 2604 OID 26251)
-- Name: DataSources Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSources" ALTER COLUMN "Id" SET DEFAULT nextval('public."DataSources_Id_seq"'::regclass);


--
-- TOC entry 3384 (class 2604 OID 26316)
-- Name: DataTypeParameterOptions Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameterOptions" ALTER COLUMN "Id" SET DEFAULT nextval('public."DataTypeParameterOptions_Id_seq"'::regclass);


--
-- TOC entry 3383 (class 2604 OID 26302)
-- Name: DataTypeParameters Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameters" ALTER COLUMN "Id" SET DEFAULT nextval('public."DataTypeParameters_Id_seq"'::regclass);


--
-- TOC entry 3382 (class 2604 OID 26293)
-- Name: DataTypes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypes" ALTER COLUMN "Id" SET DEFAULT nextval('public."DataTypes_Id_seq"'::regclass);


--
-- TOC entry 3403 (class 2604 OID 26689)
-- Name: DeliveryMethods Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeliveryMethods" ALTER COLUMN "Id" SET DEFAULT nextval('public."DeliveryMethods_Id_seq"'::regclass);


--
-- TOC entry 3376 (class 2604 OID 26201)
-- Name: Dictionaries Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dictionaries" ALTER COLUMN "Id" SET DEFAULT nextval('public."Dictionaries_Id_seq"'::regclass);


--
-- TOC entry 3378 (class 2604 OID 26227)
-- Name: Endpoints Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Endpoints" ALTER COLUMN "Id" SET DEFAULT nextval('public."Endpoints_Id_seq"'::regclass);


--
-- TOC entry 3394 (class 2604 OID 26507)
-- Name: FieldOptions Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldOptions" ALTER COLUMN "Id" SET DEFAULT nextval('public."FieldOptions_Id_seq"'::regclass);


--
-- TOC entry 3392 (class 2604 OID 26474)
-- Name: FieldTypes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldTypes" ALTER COLUMN "Id" SET DEFAULT nextval('public."FieldTypes_Id_seq"'::regclass);


--
-- TOC entry 3393 (class 2604 OID 26483)
-- Name: Fields Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fields" ALTER COLUMN "Id" SET DEFAULT nextval('public."Fields_Id_seq"'::regclass);


--
-- TOC entry 3397 (class 2604 OID 26555)
-- Name: Files Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Files" ALTER COLUMN "Id" SET DEFAULT nextval('public."Files_Id_seq"'::regclass);


--
-- TOC entry 3391 (class 2604 OID 26455)
-- Name: Forms Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Forms" ALTER COLUMN "Id" SET DEFAULT nextval('public."Forms_Id_seq"'::regclass);


--
-- TOC entry 3377 (class 2604 OID 26208)
-- Name: Localizations Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Localizations" ALTER COLUMN "Id" SET DEFAULT nextval('public."Localizations_Id_seq"'::regclass);


--
-- TOC entry 3385 (class 2604 OID 26330)
-- Name: Members Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members" ALTER COLUMN "Id" SET DEFAULT nextval('public."Members_Id_seq"'::regclass);


--
-- TOC entry 3390 (class 2604 OID 26431)
-- Name: MenuItems Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MenuItems" ALTER COLUMN "Id" SET DEFAULT nextval('public."MenuItems_Id_seq"'::regclass);


--
-- TOC entry 3389 (class 2604 OID 26417)
-- Name: Menus Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Menus" ALTER COLUMN "Id" SET DEFAULT nextval('public."Menus_Id_seq"'::regclass);


--
-- TOC entry 3386 (class 2604 OID 26359)
-- Name: Objects Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objects" ALTER COLUMN "Id" SET DEFAULT nextval('public."Objects_Id_seq"'::regclass);


--
-- TOC entry 3401 (class 2604 OID 26661)
-- Name: OrderStates Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderStates" ALTER COLUMN "Id" SET DEFAULT nextval('public."OrderStates_Id_seq"'::regclass);


--
-- TOC entry 3405 (class 2604 OID 26712)
-- Name: Orders Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN "Id" SET DEFAULT nextval('public."Orders_Id_seq"'::regclass);


--
-- TOC entry 3402 (class 2604 OID 26675)
-- Name: PaymentMethods Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentMethods" ALTER COLUMN "Id" SET DEFAULT nextval('public."PaymentMethods_Id_seq"'::regclass);


--
-- TOC entry 3373 (class 2604 OID 26147)
-- Name: Permissions Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permissions" ALTER COLUMN "Id" SET DEFAULT nextval('public."Permissions_Id_seq"'::regclass);


--
-- TOC entry 3400 (class 2604 OID 26647)
-- Name: Photos Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Photos" ALTER COLUMN "Id" SET DEFAULT nextval('public."Photos_Id_seq"'::regclass);


--
-- TOC entry 3406 (class 2604 OID 26736)
-- Name: Positions Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Positions" ALTER COLUMN "Id" SET DEFAULT nextval('public."Positions_Id_seq"'::regclass);


--
-- TOC entry 3399 (class 2604 OID 26603)
-- Name: Products Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products" ALTER COLUMN "Id" SET DEFAULT nextval('public."Products_Id_seq"'::regclass);


--
-- TOC entry 3387 (class 2604 OID 26371)
-- Name: Properties Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Properties" ALTER COLUMN "Id" SET DEFAULT nextval('public."Properties_Id_seq"'::regclass);


--
-- TOC entry 3388 (class 2604 OID 26395)
-- Name: Relations Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Relations" ALTER COLUMN "Id" SET DEFAULT nextval('public."Relations_Id_seq"'::regclass);


--
-- TOC entry 3372 (class 2604 OID 26123)
-- Name: Roles Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN "Id" SET DEFAULT nextval('public."Roles_Id_seq"'::regclass);


--
-- TOC entry 3381 (class 2604 OID 26279)
-- Name: Tabs Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tabs" ALTER COLUMN "Id" SET DEFAULT nextval('public."Tabs_Id_seq"'::regclass);


--
-- TOC entry 3369 (class 2604 OID 26086)
-- Name: Users Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN "Id" SET DEFAULT nextval('public."Users_Id_seq"'::regclass);


--
-- TOC entry 3375 (class 2604 OID 26180)
-- Name: Variables Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Variables" ALTER COLUMN "Id" SET DEFAULT nextval('public."Variables_Id_seq"'::regclass);


--
-- TOC entry 3772 (class 0 OID 26700)
-- Dependencies: 285
-- Data for Name: Carts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3760 (class 0 OID 26561)
-- Dependencies: 273
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Categories" ("Id", "CategoryId", "Url", "NameId", "DescriptionId", "Position", "TitleId", "MetaDescriptionId", "MetaKeywordsId", "ProductProviderCSharpClassName", "ProductProviderParameters") VALUES (1, NULL, '/', 12, 9, 10, 13, 10, 11, 'Platformus.ECommerce.ProductProviders.DefaultProductProvider', NULL);
INSERT INTO public."Categories" ("Id", "CategoryId", "Url", "NameId", "DescriptionId", "Position", "TitleId", "MetaDescriptionId", "MetaKeywordsId", "ProductProviderCSharpClassName", "ProductProviderParameters") VALUES (2, NULL, '/panini', 17, 14, 20, 18, 15, 16, 'Platformus.ECommerce.ProductProviders.DefaultProductProvider', NULL);
INSERT INTO public."Categories" ("Id", "CategoryId", "Url", "NameId", "DescriptionId", "Position", "TitleId", "MetaDescriptionId", "MetaKeywordsId", "ProductProviderCSharpClassName", "ProductProviderParameters") VALUES (3, NULL, '/drinks', 22, 19, 30, 23, 20, 21, 'Platformus.ECommerce.ProductProviders.DefaultProductProvider', NULL);


--
-- TOC entry 3724 (class 0 OID 26262)
-- Dependencies: 237
-- Data for Name: Classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Classes" ("Id", "ClassId", "Code", "Name", "PluralizedName", "IsAbstract") VALUES (1, NULL, 'Page', 'Page', 'Pages', true);
INSERT INTO public."Classes" ("Id", "ClassId", "Code", "Name", "PluralizedName", "IsAbstract") VALUES (2, 1, 'RegularPage', 'Regular Page', 'Regular Pages', false);


--
-- TOC entry 3756 (class 0 OID 26533)
-- Dependencies: 269
-- Data for Name: CompletedFields; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3754 (class 0 OID 26521)
-- Dependencies: 267
-- Data for Name: CompletedForms; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3710 (class 0 OID 26168)
-- Dependencies: 223
-- Data for Name: Configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Configurations" ("Id", "Code", "Name") VALUES (1, 'Email', 'Email');
INSERT INTO public."Configurations" ("Id", "Code", "Name") VALUES (2, 'Globalization', 'Globalization');


--
-- TOC entry 3700 (class 0 OID 26092)
-- Dependencies: 213
-- Data for Name: CredentialTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."CredentialTypes" ("Id", "Code", "Name", "Position") VALUES (1, 'Email', 'Email', 1);


--
-- TOC entry 3702 (class 0 OID 26101)
-- Dependencies: 215
-- Data for Name: Credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Credentials" ("Id", "UserId", "CredentialTypeId", "Identifier", "Secret", "Extra") VALUES (1, 1, 1, 'admin@platformus.net', '8lE3xN2Ijiv/Y/aIGwaZLrbcqrt/1jDmzPTdudKbVD0=', '0O/ZGwhScZRGbsmiUEckOg==');


--
-- TOC entry 3713 (class 0 OID 26190)
-- Dependencies: 226
-- Data for Name: Cultures; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Cultures" ("Id", "Name", "IsNeutral", "IsFrontendDefault", "IsBackendDefault") VALUES ('__', 'Neutral', true, false, false);
INSERT INTO public."Cultures" ("Id", "Name", "IsNeutral", "IsFrontendDefault", "IsBackendDefault") VALUES ('en', 'English', false, true, true);
INSERT INTO public."Cultures" ("Id", "Name", "IsNeutral", "IsFrontendDefault", "IsBackendDefault") VALUES ('ru', 'Русский', false, false, false);
INSERT INTO public."Cultures" ("Id", "Name", "IsNeutral", "IsFrontendDefault", "IsBackendDefault") VALUES ('uk', 'Українська', false, false, false);


--
-- TOC entry 3722 (class 0 OID 26248)
-- Dependencies: 235
-- Data for Name: DataSources; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DataSources" ("Id", "EndpointId", "Code", "DataProviderCSharpClassName", "DataProviderParameters") VALUES (1, 1, 'Page', 'Platformus.Website.Frontend.DataProviders.PageObjectDataProvider', NULL);
INSERT INTO public."DataSources" ("Id", "EndpointId", "Code", "DataProviderCSharpClassName", "DataProviderParameters") VALUES (2, 2, 'Page', 'Platformus.Website.Frontend.DataProviders.PageObjectDataProvider', NULL);


--
-- TOC entry 3732 (class 0 OID 26313)
-- Dependencies: 245
-- Data for Name: DataTypeParameterOptions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3730 (class 0 OID 26299)
-- Dependencies: 243
-- Data for Name: DataTypeParameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (1, 1, 'checkbox', 'IsRequired', 'Is required');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (2, 1, 'integerBox', 'MaxLength', 'Max length');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (3, 2, 'checkbox', 'IsRequired', 'Is required');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (4, 2, 'integerBox', 'MaxLength', 'Max length');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (5, 4, 'checkbox', 'IsRequired', 'Is required');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (6, 4, 'integerBox', 'MinValue', 'Min value');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (7, 4, 'integerBox', 'MaxValue', 'Max value');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (8, 5, 'checkbox', 'IsRequired', 'Is required');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (9, 5, 'integerBox', 'MinValue', 'Min value');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (10, 5, 'integerBox', 'MaxValue', 'Max value');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (11, 7, 'checkbox', 'IsRequired', 'Is required');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (12, 8, 'checkbox', 'IsRequired', 'Is required');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (13, 9, 'integerBox', 'Width', 'Width');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (14, 9, 'integerBox', 'Height', 'Height');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "ParameterEditorCode", "Code", "Name") VALUES (15, 10, 'textBox', 'Mode', 'Mode');


--
-- TOC entry 3728 (class 0 OID 26290)
-- Dependencies: 241
-- Data for Name: DataTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DataTypes" ("Id", "StorageDataType", "ParameterEditorCode", "Name", "Position") VALUES (1, 'string', 'singleLinePlainText', 'Single line plain text', 1);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "ParameterEditorCode", "Name", "Position") VALUES (2, 'string', 'multilinePlainText', 'Multiline plain text', 2);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "ParameterEditorCode", "Name", "Position") VALUES (3, 'string', 'html', 'Html', 3);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "ParameterEditorCode", "Name", "Position") VALUES (4, 'integer', 'integerNumber', 'Integer number', 4);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "ParameterEditorCode", "Name", "Position") VALUES (5, 'decimal', 'decimalNumber', 'Decimal number', 5);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "ParameterEditorCode", "Name", "Position") VALUES (6, 'integer', 'booleanFlag', 'Boolean flag', 6);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "ParameterEditorCode", "Name", "Position") VALUES (7, 'datetime', 'date', 'Date', 7);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "ParameterEditorCode", "Name", "Position") VALUES (8, 'datetime', 'dateTime', 'DateTime', 8);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "ParameterEditorCode", "Name", "Position") VALUES (9, 'string', 'image', 'Image', 9);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "ParameterEditorCode", "Name", "Position") VALUES (10, 'string', 'sourceCode', 'Source code', 10);


--
-- TOC entry 3770 (class 0 OID 26686)
-- Dependencies: 283
-- Data for Name: DeliveryMethods; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DeliveryMethods" ("Id", "Code", "NameId", "Position") VALUES (1, 'NotSet', 123, 10);
INSERT INTO public."DeliveryMethods" ("Id", "Code", "NameId", "Position") VALUES (2, 'Pickup', 124, 20);
INSERT INTO public."DeliveryMethods" ("Id", "Code", "NameId", "Position") VALUES (3, 'Courier', 125, 30);


--
-- TOC entry 3715 (class 0 OID 26198)
-- Dependencies: 228
-- Data for Name: Dictionaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Dictionaries" ("Id") VALUES (1);
INSERT INTO public."Dictionaries" ("Id") VALUES (2);
INSERT INTO public."Dictionaries" ("Id") VALUES (3);
INSERT INTO public."Dictionaries" ("Id") VALUES (4);
INSERT INTO public."Dictionaries" ("Id") VALUES (5);
INSERT INTO public."Dictionaries" ("Id") VALUES (6);
INSERT INTO public."Dictionaries" ("Id") VALUES (7);
INSERT INTO public."Dictionaries" ("Id") VALUES (8);
INSERT INTO public."Dictionaries" ("Id") VALUES (9);
INSERT INTO public."Dictionaries" ("Id") VALUES (10);
INSERT INTO public."Dictionaries" ("Id") VALUES (11);
INSERT INTO public."Dictionaries" ("Id") VALUES (12);
INSERT INTO public."Dictionaries" ("Id") VALUES (13);
INSERT INTO public."Dictionaries" ("Id") VALUES (14);
INSERT INTO public."Dictionaries" ("Id") VALUES (15);
INSERT INTO public."Dictionaries" ("Id") VALUES (16);
INSERT INTO public."Dictionaries" ("Id") VALUES (17);
INSERT INTO public."Dictionaries" ("Id") VALUES (18);
INSERT INTO public."Dictionaries" ("Id") VALUES (19);
INSERT INTO public."Dictionaries" ("Id") VALUES (20);
INSERT INTO public."Dictionaries" ("Id") VALUES (21);
INSERT INTO public."Dictionaries" ("Id") VALUES (22);
INSERT INTO public."Dictionaries" ("Id") VALUES (23);
INSERT INTO public."Dictionaries" ("Id") VALUES (24);
INSERT INTO public."Dictionaries" ("Id") VALUES (25);
INSERT INTO public."Dictionaries" ("Id") VALUES (26);
INSERT INTO public."Dictionaries" ("Id") VALUES (27);
INSERT INTO public."Dictionaries" ("Id") VALUES (28);
INSERT INTO public."Dictionaries" ("Id") VALUES (29);
INSERT INTO public."Dictionaries" ("Id") VALUES (30);
INSERT INTO public."Dictionaries" ("Id") VALUES (31);
INSERT INTO public."Dictionaries" ("Id") VALUES (32);
INSERT INTO public."Dictionaries" ("Id") VALUES (33);
INSERT INTO public."Dictionaries" ("Id") VALUES (34);
INSERT INTO public."Dictionaries" ("Id") VALUES (35);
INSERT INTO public."Dictionaries" ("Id") VALUES (36);
INSERT INTO public."Dictionaries" ("Id") VALUES (37);
INSERT INTO public."Dictionaries" ("Id") VALUES (38);
INSERT INTO public."Dictionaries" ("Id") VALUES (39);
INSERT INTO public."Dictionaries" ("Id") VALUES (40);
INSERT INTO public."Dictionaries" ("Id") VALUES (41);
INSERT INTO public."Dictionaries" ("Id") VALUES (42);
INSERT INTO public."Dictionaries" ("Id") VALUES (43);
INSERT INTO public."Dictionaries" ("Id") VALUES (44);
INSERT INTO public."Dictionaries" ("Id") VALUES (45);
INSERT INTO public."Dictionaries" ("Id") VALUES (46);
INSERT INTO public."Dictionaries" ("Id") VALUES (47);
INSERT INTO public."Dictionaries" ("Id") VALUES (48);
INSERT INTO public."Dictionaries" ("Id") VALUES (49);
INSERT INTO public."Dictionaries" ("Id") VALUES (50);
INSERT INTO public."Dictionaries" ("Id") VALUES (51);
INSERT INTO public."Dictionaries" ("Id") VALUES (52);
INSERT INTO public."Dictionaries" ("Id") VALUES (53);
INSERT INTO public."Dictionaries" ("Id") VALUES (54);
INSERT INTO public."Dictionaries" ("Id") VALUES (55);
INSERT INTO public."Dictionaries" ("Id") VALUES (56);
INSERT INTO public."Dictionaries" ("Id") VALUES (57);
INSERT INTO public."Dictionaries" ("Id") VALUES (58);
INSERT INTO public."Dictionaries" ("Id") VALUES (59);
INSERT INTO public."Dictionaries" ("Id") VALUES (60);
INSERT INTO public."Dictionaries" ("Id") VALUES (61);
INSERT INTO public."Dictionaries" ("Id") VALUES (62);
INSERT INTO public."Dictionaries" ("Id") VALUES (63);
INSERT INTO public."Dictionaries" ("Id") VALUES (64);
INSERT INTO public."Dictionaries" ("Id") VALUES (65);
INSERT INTO public."Dictionaries" ("Id") VALUES (66);
INSERT INTO public."Dictionaries" ("Id") VALUES (67);
INSERT INTO public."Dictionaries" ("Id") VALUES (68);
INSERT INTO public."Dictionaries" ("Id") VALUES (69);
INSERT INTO public."Dictionaries" ("Id") VALUES (70);
INSERT INTO public."Dictionaries" ("Id") VALUES (71);
INSERT INTO public."Dictionaries" ("Id") VALUES (72);
INSERT INTO public."Dictionaries" ("Id") VALUES (73);
INSERT INTO public."Dictionaries" ("Id") VALUES (74);
INSERT INTO public."Dictionaries" ("Id") VALUES (75);
INSERT INTO public."Dictionaries" ("Id") VALUES (76);
INSERT INTO public."Dictionaries" ("Id") VALUES (77);
INSERT INTO public."Dictionaries" ("Id") VALUES (78);
INSERT INTO public."Dictionaries" ("Id") VALUES (79);
INSERT INTO public."Dictionaries" ("Id") VALUES (80);
INSERT INTO public."Dictionaries" ("Id") VALUES (81);
INSERT INTO public."Dictionaries" ("Id") VALUES (82);
INSERT INTO public."Dictionaries" ("Id") VALUES (83);
INSERT INTO public."Dictionaries" ("Id") VALUES (84);
INSERT INTO public."Dictionaries" ("Id") VALUES (85);
INSERT INTO public."Dictionaries" ("Id") VALUES (86);
INSERT INTO public."Dictionaries" ("Id") VALUES (87);
INSERT INTO public."Dictionaries" ("Id") VALUES (88);
INSERT INTO public."Dictionaries" ("Id") VALUES (89);
INSERT INTO public."Dictionaries" ("Id") VALUES (90);
INSERT INTO public."Dictionaries" ("Id") VALUES (91);
INSERT INTO public."Dictionaries" ("Id") VALUES (92);
INSERT INTO public."Dictionaries" ("Id") VALUES (93);
INSERT INTO public."Dictionaries" ("Id") VALUES (94);
INSERT INTO public."Dictionaries" ("Id") VALUES (95);
INSERT INTO public."Dictionaries" ("Id") VALUES (96);
INSERT INTO public."Dictionaries" ("Id") VALUES (97);
INSERT INTO public."Dictionaries" ("Id") VALUES (98);
INSERT INTO public."Dictionaries" ("Id") VALUES (99);
INSERT INTO public."Dictionaries" ("Id") VALUES (100);
INSERT INTO public."Dictionaries" ("Id") VALUES (101);
INSERT INTO public."Dictionaries" ("Id") VALUES (102);
INSERT INTO public."Dictionaries" ("Id") VALUES (103);
INSERT INTO public."Dictionaries" ("Id") VALUES (104);
INSERT INTO public."Dictionaries" ("Id") VALUES (105);
INSERT INTO public."Dictionaries" ("Id") VALUES (106);
INSERT INTO public."Dictionaries" ("Id") VALUES (107);
INSERT INTO public."Dictionaries" ("Id") VALUES (108);
INSERT INTO public."Dictionaries" ("Id") VALUES (109);
INSERT INTO public."Dictionaries" ("Id") VALUES (110);
INSERT INTO public."Dictionaries" ("Id") VALUES (111);
INSERT INTO public."Dictionaries" ("Id") VALUES (112);
INSERT INTO public."Dictionaries" ("Id") VALUES (113);
INSERT INTO public."Dictionaries" ("Id") VALUES (114);
INSERT INTO public."Dictionaries" ("Id") VALUES (115);
INSERT INTO public."Dictionaries" ("Id") VALUES (116);
INSERT INTO public."Dictionaries" ("Id") VALUES (117);
INSERT INTO public."Dictionaries" ("Id") VALUES (118);
INSERT INTO public."Dictionaries" ("Id") VALUES (119);
INSERT INTO public."Dictionaries" ("Id") VALUES (120);
INSERT INTO public."Dictionaries" ("Id") VALUES (121);
INSERT INTO public."Dictionaries" ("Id") VALUES (122);
INSERT INTO public."Dictionaries" ("Id") VALUES (123);
INSERT INTO public."Dictionaries" ("Id") VALUES (124);
INSERT INTO public."Dictionaries" ("Id") VALUES (125);
INSERT INTO public."Dictionaries" ("Id") VALUES (126);
INSERT INTO public."Dictionaries" ("Id") VALUES (127);
INSERT INTO public."Dictionaries" ("Id") VALUES (128);
INSERT INTO public."Dictionaries" ("Id") VALUES (129);
INSERT INTO public."Dictionaries" ("Id") VALUES (130);
INSERT INTO public."Dictionaries" ("Id") VALUES (131);
INSERT INTO public."Dictionaries" ("Id") VALUES (132);
INSERT INTO public."Dictionaries" ("Id") VALUES (133);
INSERT INTO public."Dictionaries" ("Id") VALUES (134);
INSERT INTO public."Dictionaries" ("Id") VALUES (135);


--
-- TOC entry 3720 (class 0 OID 26232)
-- Dependencies: 233
-- Data for Name: EndpointPermissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3719 (class 0 OID 26224)
-- Dependencies: 232
-- Data for Name: Endpoints; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Endpoints" ("Id", "Name", "UrlTemplate", "Position", "DisallowAnonymous", "SignInUrl", "RequestProcessorCSharpClassName", "RequestProcessorParameters", "ResponseCacheCSharpClassName", "ResponseCacheParameters") VALUES (1, 'Default', '{*url}', 1000, false, NULL, 'Platformus.Website.Frontend.RequestProcessors.DefaultRequestProcessor', 'ViewName=RegularPage', NULL, NULL);
INSERT INTO public."Endpoints" ("Id", "Name", "UrlTemplate", "Position", "DisallowAnonymous", "SignInUrl", "RequestProcessorCSharpClassName", "RequestProcessorParameters", "ResponseCacheCSharpClassName", "ResponseCacheParameters") VALUES (2, 'Contacts', 'contacts', 10, false, NULL, 'Platformus.Website.Frontend.RequestProcessors.DefaultRequestProcessor', 'ViewName=ContactsPage', NULL, NULL);


--
-- TOC entry 3752 (class 0 OID 26504)
-- Dependencies: 265
-- Data for Name: FieldOptions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3748 (class 0 OID 26471)
-- Dependencies: 261
-- Data for Name: FieldTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (1, 'TextBox', 'Text box', 1, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (2, 'TextArea', 'Text area', 2, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (3, 'Checkbox', 'Checkbox', 3, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (4, 'RadioButtonList', 'Radio button list', 4, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (5, 'DropDownList', 'Drop down list', 5, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (6, 'FileUpload', 'File upload', 6, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (7, 'ReCAPTCHA', 'ReCAPTCHA', 7, 'Platformus.Website.Frontend.FieldValidators.ReCaptchaFieldValidator');


--
-- TOC entry 3750 (class 0 OID 26480)
-- Dependencies: 263
-- Data for Name: Fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Fields" ("Id", "FormId", "FieldTypeId", "Code", "NameId", "IsRequired", "MaxLength", "Position") VALUES (1, 1, 1, 'Name', 6, true, NULL, 10);
INSERT INTO public."Fields" ("Id", "FormId", "FieldTypeId", "Code", "NameId", "IsRequired", "MaxLength", "Position") VALUES (2, 1, 1, 'Email', 7, true, NULL, 20);
INSERT INTO public."Fields" ("Id", "FormId", "FieldTypeId", "Code", "NameId", "IsRequired", "MaxLength", "Position") VALUES (3, 1, 2, 'Message', 8, true, NULL, 30);


--
-- TOC entry 3758 (class 0 OID 26552)
-- Dependencies: 271
-- Data for Name: Files; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3746 (class 0 OID 26452)
-- Dependencies: 259
-- Data for Name: Forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Forms" ("Id", "Code", "NameId", "SubmitButtonTitleId", "ProduceCompletedForms", "FormHandlerCSharpClassName", "FormHandlerParameters") VALUES (1, 'Feedback', 4, 5, true, 'Platformus.Website.Frontend.FormHandlers.EmailFormHandler', 'RecipientEmails=test@test.com;RedirectUrl=/contacts');


--
-- TOC entry 3717 (class 0 OID 26205)
-- Dependencies: 230
-- Data for Name: Localizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (1, 1, 'en', 'Main');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (2, 1, 'ru', 'Главное');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (3, 1, 'uk', 'Головне');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (4, 2, 'en', 'About us');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (5, 2, 'ru', 'О нас');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (6, 2, 'uk', 'Про нас');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (7, 3, 'en', 'Contacts');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (8, 3, 'ru', 'Контакты');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (9, 3, 'uk', 'Контакти');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (10, 4, 'en', 'Feedback');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (11, 4, 'ru', 'Обратная связь');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (12, 4, 'uk', 'Зворотний зв’язок');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (13, 5, 'en', 'Submit');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (14, 5, 'ru', 'Отправить');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (15, 5, 'uk', 'Надіслати');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (16, 6, 'en', 'Your name');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (17, 6, 'ru', 'Ваше имя');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (18, 6, 'uk', 'Ваше ім’я');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (19, 7, 'en', 'Your email');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (20, 7, 'ru', 'Ваша электронная почта');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (21, 7, 'uk', 'Ваша електронна пошта');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (22, 8, 'en', 'Your message');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (23, 8, 'ru', 'Ваше сообщение');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (24, 8, 'uk', 'Ваше повідомлення');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (25, 9, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (26, 9, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (27, 9, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (28, 10, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (29, 10, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (30, 10, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (31, 11, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (32, 11, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (33, 11, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (34, 12, 'en', 'Pizza');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (35, 12, 'ru', 'Пицца');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (36, 12, 'uk', 'Піца');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (37, 13, 'en', 'Pizza');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (38, 13, 'ru', 'Пицца');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (39, 13, 'uk', 'Піца');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (40, 14, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (41, 14, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (42, 14, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (43, 15, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (44, 15, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (45, 15, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (46, 16, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (47, 16, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (48, 16, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (49, 17, 'en', 'Panini');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (50, 17, 'ru', 'Панини');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (51, 17, 'uk', 'Паніні');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (52, 18, 'en', 'Panini');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (53, 18, 'ru', 'Панини');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (54, 18, 'uk', 'Паніні');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (55, 19, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (56, 19, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (57, 19, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (58, 20, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (59, 20, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (60, 20, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (61, 21, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (62, 21, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (63, 21, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (64, 22, 'en', 'Drinks');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (65, 22, 'ru', 'Напитки');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (66, 22, 'uk', 'Напої');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (67, 23, 'en', 'Drinks');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (68, 23, 'ru', 'Напитки');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (69, 23, 'uk', 'Напої');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (70, 24, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (71, 24, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (72, 24, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (73, 25, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (74, 25, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (75, 25, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (76, 26, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (77, 26, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (78, 26, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (79, 27, 'en', 'Pizza 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (80, 27, 'ru', 'Пицца 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (81, 27, 'uk', 'Піца 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (82, 28, 'en', 'Pizza 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (83, 28, 'ru', 'Пицца 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (84, 28, 'uk', 'Піца 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (85, 29, 'en', '430 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (86, 29, 'ru', '430 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (87, 29, 'uk', '430 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (88, 30, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (89, 30, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (90, 30, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (91, 31, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (92, 31, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (93, 31, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (94, 32, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (95, 32, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (96, 32, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (97, 33, 'en', 'Pizza 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (98, 33, 'ru', 'Пицца 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (99, 33, 'uk', 'Піца 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (100, 34, 'en', 'Pizza 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (101, 34, 'ru', 'Пицца 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (102, 34, 'uk', 'Піца 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (103, 35, 'en', '450 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (104, 35, 'ru', '450 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (105, 35, 'uk', '450 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (106, 36, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (107, 36, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (108, 36, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (109, 37, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (110, 37, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (111, 37, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (112, 38, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (113, 38, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (114, 38, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (115, 39, 'en', 'Pizza 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (116, 39, 'ru', 'Пицца 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (117, 39, 'uk', 'Піца 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (118, 40, 'en', 'Pizza 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (119, 40, 'ru', 'Пицца 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (120, 40, 'uk', 'Піца 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (121, 41, 'en', '450 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (122, 41, 'ru', '450 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (123, 41, 'uk', '450 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (124, 42, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (125, 42, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (126, 42, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (127, 43, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (128, 43, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (129, 43, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (130, 44, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (131, 44, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (132, 44, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (133, 45, 'en', 'Pizza 4');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (134, 45, 'ru', 'Пицца 4');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (135, 45, 'uk', 'Піца 4');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (136, 46, 'en', 'Pizza 4');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (137, 46, 'ru', 'Пицца 4');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (138, 46, 'uk', 'Піца 4');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (139, 47, 'en', '430 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (140, 47, 'ru', '430 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (141, 47, 'uk', '430 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (142, 48, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (143, 48, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (144, 48, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (145, 49, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (146, 49, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (147, 49, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (148, 50, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (149, 50, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (150, 50, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (151, 51, 'en', 'Pizza 5');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (152, 51, 'ru', 'Пицца 5');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (153, 51, 'uk', 'Піца 5');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (154, 52, 'en', 'Pizza 5');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (155, 52, 'ru', 'Пицца 5');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (156, 52, 'uk', 'Піца 5');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (157, 53, 'en', '430 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (158, 53, 'ru', '430 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (159, 53, 'uk', '430 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (160, 54, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (161, 54, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (162, 54, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (163, 55, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (164, 55, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (165, 55, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (166, 56, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (167, 56, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (168, 56, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (169, 57, 'en', 'Pizza 6');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (170, 57, 'ru', 'Пицца 6');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (171, 57, 'uk', 'Піца 6');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (172, 58, 'en', 'Pizza 6');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (173, 58, 'ru', 'Пицца 6');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (174, 58, 'uk', 'Піца 6');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (175, 59, 'en', '430 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (176, 59, 'ru', '430 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (177, 59, 'uk', '430 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (178, 60, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (179, 60, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (180, 60, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (181, 61, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (182, 61, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (183, 61, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (184, 62, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (185, 62, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (186, 62, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (187, 63, 'en', 'Pizza 7');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (188, 63, 'ru', 'Пицца 7');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (189, 63, 'uk', 'Піца 7');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (190, 64, 'en', 'Pizza 7');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (191, 64, 'ru', 'Пицца 7');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (192, 64, 'uk', 'Піца 7');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (193, 65, 'en', '430 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (194, 65, 'ru', '430 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (195, 65, 'uk', '430 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (196, 66, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (197, 66, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (198, 66, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (199, 67, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (200, 67, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (201, 67, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (202, 68, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (203, 68, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (204, 68, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (205, 69, 'en', 'Pizza 8');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (206, 69, 'ru', 'Пицца 8');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (207, 69, 'uk', 'Піца 8');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (208, 70, 'en', 'Pizza 8');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (209, 70, 'ru', 'Пицца 8');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (210, 70, 'uk', 'Піца 8');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (211, 71, 'en', '420 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (212, 71, 'ru', '420 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (213, 71, 'uk', '420 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (214, 72, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (215, 72, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (216, 72, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (217, 73, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (218, 73, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (219, 73, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (220, 74, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (221, 74, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (222, 74, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (223, 75, 'en', 'Pizza 9');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (224, 75, 'ru', 'Пицца 9');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (225, 75, 'uk', 'Піца 9');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (226, 76, 'en', 'Pizza 9');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (227, 76, 'ru', 'Пицца 9');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (228, 76, 'uk', 'Піца 9');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (229, 77, 'en', '440 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (230, 77, 'ru', '440 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (231, 77, 'uk', '440 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (232, 78, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (233, 78, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (234, 78, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (235, 79, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (236, 79, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (237, 79, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (238, 80, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (239, 80, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (240, 80, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (241, 81, 'en', 'Panini 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (242, 81, 'ru', 'Панини 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (243, 81, 'uk', 'Паніні 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (244, 82, 'en', 'Panini 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (245, 82, 'ru', 'Панини 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (246, 82, 'uk', 'Паніні 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (247, 83, 'en', '140 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (248, 83, 'ru', '140 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (249, 83, 'uk', '140 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (250, 84, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (251, 84, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (252, 84, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (253, 85, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (254, 85, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (255, 85, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (256, 86, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (257, 86, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (258, 86, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (259, 87, 'en', 'Panini 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (260, 87, 'ru', 'Панини 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (261, 87, 'uk', 'Паніні 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (262, 88, 'en', 'Panini 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (263, 88, 'ru', 'Панини 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (264, 88, 'uk', 'Паніні 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (265, 89, 'en', '120 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (266, 89, 'ru', '120 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (267, 89, 'uk', '120 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (268, 90, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (269, 90, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (270, 90, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (271, 91, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (272, 91, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (273, 91, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (274, 92, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (275, 92, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (276, 92, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (277, 93, 'en', 'Panini 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (278, 93, 'ru', 'Панини 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (279, 93, 'uk', 'Паніні 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (280, 94, 'en', 'Panini 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (281, 94, 'ru', 'Панини 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (282, 94, 'uk', 'Паніні 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (283, 95, 'en', '120 g');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (284, 95, 'ru', '120 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (285, 95, 'uk', '120 г');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (286, 96, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (287, 96, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (288, 96, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (289, 97, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (290, 97, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (291, 97, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (292, 98, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (293, 98, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (294, 98, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (295, 99, 'en', 'Drinks 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (296, 99, 'ru', 'Напитки 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (297, 99, 'uk', 'Напої 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (298, 100, 'en', 'Drinks 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (299, 100, 'ru', 'Напитки 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (300, 100, 'uk', 'Напої 1');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (301, 101, 'en', '1 l');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (302, 101, 'ru', '1 л');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (303, 101, 'uk', '1 л');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (304, 102, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (305, 102, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (306, 102, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (307, 103, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (308, 103, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (309, 103, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (310, 104, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (311, 104, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (312, 104, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (313, 105, 'en', 'Drinks 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (314, 105, 'ru', 'Напитки 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (315, 105, 'uk', 'Напої 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (316, 106, 'en', 'Drinks 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (317, 106, 'ru', 'Напитки 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (318, 106, 'uk', 'Напої 2');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (319, 107, 'en', '1 l');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (320, 107, 'ru', '1 л');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (321, 107, 'uk', '1 л');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (322, 108, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (323, 108, 'ru', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (324, 108, 'uk', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (325, 109, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (326, 109, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (327, 109, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (328, 110, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (329, 110, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (330, 110, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (331, 111, 'en', 'Drinks 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (332, 111, 'ru', 'Напитки 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (333, 111, 'uk', 'Напої 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (334, 112, 'en', 'Drinks 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (335, 112, 'ru', 'Напитки 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (336, 112, 'uk', 'Напої 3');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (337, 113, 'en', '1 l');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (338, 113, 'ru', '1 л');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (339, 113, 'uk', '1 л');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (340, 114, 'en', 'New');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (341, 114, 'ru', 'Новый');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (342, 114, 'uk', 'Новий');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (343, 115, 'en', 'Confirmed');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (344, 115, 'ru', 'Подтвержден');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (345, 115, 'uk', 'Підтверджений');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (346, 116, 'en', 'Scheduled');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (347, 116, 'ru', 'Запланирован');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (348, 116, 'uk', 'Запланований');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (349, 117, 'en', 'Being delivered');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (350, 117, 'ru', 'Доставляется');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (351, 117, 'uk', 'Доставляється');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (352, 118, 'en', 'Delivered');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (353, 118, 'ru', 'Доставлен');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (354, 118, 'uk', 'Доставлений');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (355, 119, 'en', 'Closed');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (356, 119, 'ru', 'Закрыт');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (357, 119, 'uk', 'Закритий');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (358, 120, 'en', 'Canceled');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (359, 120, 'ru', 'Отменен');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (360, 120, 'uk', 'Скасований');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (361, 121, 'en', 'Not set');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (362, 121, 'ru', 'Не указан');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (363, 121, 'uk', 'Не вказано');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (364, 122, 'en', 'Cash');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (365, 122, 'ru', 'Наличные');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (366, 122, 'uk', 'Готівка');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (367, 123, 'en', 'Not set');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (368, 123, 'ru', 'Не указан');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (369, 123, 'uk', 'Не вказано');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (370, 124, 'en', 'Pickup');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (371, 124, 'ru', 'Самовывоз');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (372, 124, 'uk', 'Самовивіз');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (373, 125, 'en', 'Courier');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (374, 125, 'ru', 'Курьер');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (375, 125, 'uk', 'Кур’єр');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (376, 126, '__', '/about-us');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (377, 127, 'en', '<h1>About Us</h1><p>Hello! This is your ecommerce website, it is based on the <a href="https://platformus.net/" target="_blank" rel="noopener">Platformus</a> content management system. You can manage it (create pages, menu items, forms and so on) using the <a href="/backend">backend</a>. Please use the username and password specified during the installation to sign in (it is &ldquo;admin@platformus.net&rdquo; and &ldquo;admin&rdquo; by default).</p><p>Please use the <a href="http://docs.platformus.net/" target="_blank" rel="noopener">documentation</a> to learn more about Platformus and how to use it. There are several examples that could be useful for the beginners. Also, you can get help in our <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">chat</a>.</p><p>Have a nice work!</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (378, 127, 'ru', '<h1>О нас</h1><p>Здравствуйте! Это ваш веб-сайт электронной коммерции, он работает на базе системы управления содержимым &laquo;<a href="https://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Вы можете управлять им (создавать страницы, элементы меню, формы и так далее) с помощью <a href="/backend">бекенда</a>. Для входа используйте, пожалуйста, имя пользователя и пароль, указанные при установке (по умолчанию это &laquo;admin@platformus.net&raquo; и &laquo;admin&raquo; соответственно).</p><p>Чтобы узнать больше о Платформусе и о том, как им пользоваться, пожалуйста, воспользуйтесь <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацией</a>, там есть несколько примеров, которые пригодятся начинающим. При возникновении сложностей или вопросов вы можете обратиться в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, где вам обязательно помогут.</p><p>Приятной работы!</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (379, 127, 'uk', '<h1>Про нас</h1><p>Вітаємо! Це ваш веб-сайт електронної комерції, він працює на базі системи керування вмістом &laquo;<a href="https://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Ви можете керувати ним (створювати сторінки, елементи меню, форми і так далі) за допомогою <a href="/backend">бекенду</a>. Для входу використовуйте, будь ласка, ім&rsquo;я користувача і пароль, вказані під час установки (за замовчуванням це &laquo;admin@platformus.net&raquo; і &laquo;admin&raquo; відповідно).</p><p>Щоб дізнатися більше про Платформус і про те, як ним користуватися, будь ласка, скористайтеся <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацією</a>, там є декілька прикладів, що стануть у нагоді початківцям. При виникненні труднощів або питань ви можете звернутися в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, де вам обов&rsquo;язково допоможуть.</p><p>Приємної роботи!</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (380, 128, 'en', 'About Us');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (381, 128, 'ru', 'О нас');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (382, 128, 'uk', 'Про нас');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (383, 129, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (384, 129, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (385, 129, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (386, 130, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (387, 130, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (388, 130, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (389, 131, '__', '/contacts');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (390, 132, 'en', '<h1>Contacts</h1><p>Add your contacts on this page. Phone number, messengers, social links. The feedback form below (by the way, you can edit or move it to a different place) allows your visitors to write you directly from the website, just don&rsquo;t forget to specify the email address for the messages.</p><h2>Feedback from</h2>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (391, 132, 'ru', '<h1>Контакты</h1><p>Добавьте свои контакты на этой странице. Телефонный номер, мессенджеры, ссылки на социальные сети. Форма обратной связи, расположенная ниже (кстати, вы можете ее изменить или перенести в другое место), поможет посетителям написать вам сообщение прямо с сайта, лишь укажите для этого адрес, на который нужно присылать сообщения.</p><h2>Форма обратной связи</h2>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (392, 132, 'uk', '<h1>Контакти</h1><p>Додайте свої контакти на цій сторінці. Номер телефону, месенджери, посилання на соціальні мережі. Форма зворотного зв&rsquo;язку, розташована нижче (до речі, ви можете її змінити або перенести в інше місце), допоможе відвідувачам написати вам повідомлення прямо з сайту, лише вкажіть для цього адресу, на яку потрібно надсилати повідомлення.</p><h2>Форма зворотного зв&rsquo;язку</h2>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (393, 133, 'en', 'Contacts');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (394, 133, 'ru', 'Контакты');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (395, 133, 'uk', 'Контакти');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (396, 134, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (397, 134, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (398, 134, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (399, 135, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (400, 135, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (401, 135, 'uk', '');


--
-- TOC entry 3734 (class 0 OID 26327)
-- Dependencies: 247
-- Data for Name: Members; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Members" ("Id", "ClassId", "TabId", "Code", "Name", "Position", "PropertyDataTypeId", "IsPropertyLocalizable", "IsPropertyVisibleInList", "PropertyDataTypeParameters", "RelationClassId", "IsRelationSingleParent", "MinRelatedObjectsNumber", "MaxRelatedObjectsNumber") VALUES (1, 1, NULL, 'Url', 'URL', 1, 1, false, true, 'IsRequired=true;MaxLength=128', NULL, NULL, NULL, NULL);
INSERT INTO public."Members" ("Id", "ClassId", "TabId", "Code", "Name", "Position", "PropertyDataTypeId", "IsPropertyLocalizable", "IsPropertyVisibleInList", "PropertyDataTypeParameters", "RelationClassId", "IsRelationSingleParent", "MinRelatedObjectsNumber", "MaxRelatedObjectsNumber") VALUES (2, 1, NULL, 'Content', 'Content', 10, 3, true, false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public."Members" ("Id", "ClassId", "TabId", "Code", "Name", "Position", "PropertyDataTypeId", "IsPropertyLocalizable", "IsPropertyVisibleInList", "PropertyDataTypeParameters", "RelationClassId", "IsRelationSingleParent", "MinRelatedObjectsNumber", "MaxRelatedObjectsNumber") VALUES (3, 1, 1, 'Title', 'Title', 1000, 1, true, false, 'IsRequired=false;MaxLength=128', NULL, NULL, NULL, NULL);
INSERT INTO public."Members" ("Id", "ClassId", "TabId", "Code", "Name", "Position", "PropertyDataTypeId", "IsPropertyLocalizable", "IsPropertyVisibleInList", "PropertyDataTypeParameters", "RelationClassId", "IsRelationSingleParent", "MinRelatedObjectsNumber", "MaxRelatedObjectsNumber") VALUES (4, 1, 1, 'MetaDescription', 'META description', 1010, 1, true, false, 'IsRequired=false;MaxLength=512', NULL, NULL, NULL, NULL);
INSERT INTO public."Members" ("Id", "ClassId", "TabId", "Code", "Name", "Position", "PropertyDataTypeId", "IsPropertyLocalizable", "IsPropertyVisibleInList", "PropertyDataTypeParameters", "RelationClassId", "IsRelationSingleParent", "MinRelatedObjectsNumber", "MaxRelatedObjectsNumber") VALUES (5, 1, 1, 'MetaKeywords', 'META keywords', 1020, 1, true, false, 'IsRequired=false;MaxLength=256', NULL, NULL, NULL, NULL);


--
-- TOC entry 3744 (class 0 OID 26428)
-- Dependencies: 257
-- Data for Name: MenuItems; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."MenuItems" ("Id", "MenuId", "MenuItemId", "NameId", "Url", "Position") VALUES (1, 1, NULL, 2, '/about-us', 10);
INSERT INTO public."MenuItems" ("Id", "MenuId", "MenuItemId", "NameId", "Url", "Position") VALUES (2, 1, NULL, 3, '/contacts', 20);


--
-- TOC entry 3742 (class 0 OID 26414)
-- Dependencies: 255
-- Data for Name: Menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Menus" ("Id", "Code", "NameId") VALUES (1, 'Main', 1);


--
-- TOC entry 3696 (class 0 OID 26075)
-- Dependencies: 209
-- Data for Name: ModelStates; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3736 (class 0 OID 26356)
-- Dependencies: 249
-- Data for Name: Objects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Objects" ("Id", "ClassId") VALUES (1, 2);
INSERT INTO public."Objects" ("Id", "ClassId") VALUES (2, 2);


--
-- TOC entry 3766 (class 0 OID 26658)
-- Dependencies: 279
-- Data for Name: OrderStates; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."OrderStates" ("Id", "Code", "NameId", "Position") VALUES (1, 'New', 114, 10);
INSERT INTO public."OrderStates" ("Id", "Code", "NameId", "Position") VALUES (2, 'Confirmed', 115, 20);
INSERT INTO public."OrderStates" ("Id", "Code", "NameId", "Position") VALUES (3, 'Scheduled', 116, 30);
INSERT INTO public."OrderStates" ("Id", "Code", "NameId", "Position") VALUES (4, 'BeingDelivered', 117, 40);
INSERT INTO public."OrderStates" ("Id", "Code", "NameId", "Position") VALUES (5, 'Delivered', 118, 50);
INSERT INTO public."OrderStates" ("Id", "Code", "NameId", "Position") VALUES (6, 'Closed', 119, 60);
INSERT INTO public."OrderStates" ("Id", "Code", "NameId", "Position") VALUES (7, 'Canceled', 120, 70);


--
-- TOC entry 3774 (class 0 OID 26709)
-- Dependencies: 287
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3768 (class 0 OID 26672)
-- Dependencies: 281
-- Data for Name: PaymentMethods; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."PaymentMethods" ("Id", "Code", "NameId", "Position") VALUES (1, 'NotSet', 121, 10);
INSERT INTO public."PaymentMethods" ("Id", "Code", "NameId", "Position") VALUES (2, 'Cash', 122, 20);


--
-- TOC entry 3707 (class 0 OID 26144)
-- Dependencies: 220
-- Data for Name: Permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (1, 'DoAnything', 'Do anything', 100);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (2, 'ManagePermissions', 'Manage permissions', 200);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (3, 'ManageRoles', 'Manage roles', 300);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (4, 'ManageUsers', 'Manage users', 400);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (5, 'ManageConfigurations', 'Manage configurations', 500);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (6, 'ManageCultures', 'Manage cultures', 600);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (7, 'ManageEndpoints', 'Manage endpoints', 700);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (8, 'ManageObjects', 'Manage objects', 800);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (9, 'ManageClasses', 'Manage classes', 900);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (10, 'ManageMenus', 'Manage menus', 1000);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (11, 'ManageForms', 'Manage forms', 1100);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (12, 'ManageFileManager', 'Manage file manager', 1200);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (13, 'ManageCategories', 'Manage categories', 1300);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (14, 'ManageProducts', 'Manage products', 1400);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (15, 'ManageOrderStates', 'Manage order states', 1500);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (16, 'ManagePaymentMethods', 'Manage payment methods', 1600);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (17, 'ManageDeliveryMethods', 'Manage delivery methods', 1700);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (18, 'ManageCarts', 'Manage carts', 1800);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (19, 'ManageOrders', 'Manage orders', 1900);


--
-- TOC entry 3764 (class 0 OID 26644)
-- Dependencies: 277
-- Data for Name: Photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (1, 1, 'pizza1.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (2, 2, 'pizza2.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (3, 3, 'pizza3.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (4, 4, 'pizza4.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (5, 5, 'pizza5.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (6, 6, 'pizza6.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (7, 7, 'pizza7.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (8, 8, 'pizza8.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (9, 9, 'pizza9.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (10, 10, 'panini1.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (11, 11, 'panini2.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (12, 12, 'panini3.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (13, 13, 'drinks1.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (14, 14, 'drinks2.jpg', true, 1);
INSERT INTO public."Photos" ("Id", "ProductId", "Filename", "IsCover", "Position") VALUES (15, 15, 'drinks3.jpg', true, 1);


--
-- TOC entry 3776 (class 0 OID 26733)
-- Dependencies: 289
-- Data for Name: Positions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3762 (class 0 OID 26600)
-- Dependencies: 275
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (1, 1, '/pizza/pizza-1', 'pizza-1', 27, 24, 29, 160, 28, 25, 26);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (2, 1, '/pizza/pizza-2', 'pizza-2', 33, 30, 35, 130, 34, 31, 32);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (3, 1, '/pizza/pizza-3', 'pizza-3', 39, 36, 41, 130, 40, 37, 38);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (4, 1, '/pizza/pizza-4', 'pizza-4', 45, 42, 47, 160, 46, 43, 44);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (5, 1, '/pizza/pizza-5', 'pizza-5', 51, 48, 53, 110, 52, 49, 50);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (6, 1, '/pizza/pizza-6', 'pizza-6', 57, 54, 59, 120, 58, 55, 56);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (7, 1, '/pizza/pizza-7', 'pizza-7', 63, 60, 65, 120, 64, 61, 62);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (8, 1, '/pizza/pizza-8', 'pizza-8', 69, 66, 71, 170, 70, 67, 68);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (9, 1, '/pizza/pizza-9', 'pizza-9', 75, 72, 77, 120, 76, 73, 74);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (10, 2, '/panini/panini-1', 'panini-1', 81, 78, 83, 80, 82, 79, 80);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (11, 2, '/panini/panini-2', 'panini-2', 87, 84, 89, 10, 88, 85, 86);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (12, 2, '/panini/panini-3', 'panini-3', 93, 90, 95, 80, 94, 91, 92);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (13, 3, '/pizza/drinks-1', 'drinks-1', 99, 96, 101, 40, 100, 97, 98);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (14, 3, '/pizza/drinks-2', 'drinks-2', 105, 102, 107, 60, 106, 103, 104);
INSERT INTO public."Products" ("Id", "CategoryId", "Url", "Code", "NameId", "DescriptionId", "UnitsId", "Price", "TitleId", "MetaDescriptionId", "MetaKeywordsId") VALUES (15, 3, '/pizza/drinks-3', 'drinks-3', 111, 108, 113, 50, 112, 109, 110);


--
-- TOC entry 3738 (class 0 OID 26368)
-- Dependencies: 251
-- Data for Name: Properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (1, 1, 1, NULL, NULL, 126, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (2, 1, 2, NULL, NULL, 127, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (3, 1, 3, NULL, NULL, 128, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (4, 1, 4, NULL, NULL, 129, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (5, 1, 5, NULL, NULL, 130, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (6, 2, 1, NULL, NULL, 131, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (7, 2, 2, NULL, NULL, 132, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (8, 2, 3, NULL, NULL, 133, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (9, 2, 4, NULL, NULL, 134, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (10, 2, 5, NULL, NULL, 135, NULL);


--
-- TOC entry 3740 (class 0 OID 26392)
-- Dependencies: 253
-- Data for Name: Relations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3708 (class 0 OID 26152)
-- Dependencies: 221
-- Data for Name: RolePermissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (1, 1);
INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (2, 1);
INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (3, 8);
INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (3, 10);
INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (3, 11);
INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (3, 12);


--
-- TOC entry 3704 (class 0 OID 26120)
-- Dependencies: 217
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Roles" ("Id", "Code", "Name", "Position") VALUES (1, 'Developer', 'Developer', 100);
INSERT INTO public."Roles" ("Id", "Code", "Name", "Position") VALUES (2, 'Administrator', 'Administrator', 200);
INSERT INTO public."Roles" ("Id", "Code", "Name", "Position") VALUES (3, 'ContentManager', 'Content manager', 300);


--
-- TOC entry 3726 (class 0 OID 26276)
-- Dependencies: 239
-- Data for Name: Tabs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tabs" ("Id", "ClassId", "Name", "Position") VALUES (1, 1, 'SEO', 100);


--
-- TOC entry 3705 (class 0 OID 26128)
-- Dependencies: 218
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."UserRoles" ("UserId", "RoleId") VALUES (1, 1);
INSERT INTO public."UserRoles" ("UserId", "RoleId") VALUES (1, 2);


--
-- TOC entry 3698 (class 0 OID 26083)
-- Dependencies: 211
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Users" ("Id", "Name", "Created") VALUES (1, 'Administrator', '2017-01-01 00:00:00');


--
-- TOC entry 3712 (class 0 OID 26177)
-- Dependencies: 225
-- Data for Name: Variables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (1, 1, 'SmtpServer', 'SMTP server', 'test', 1);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (2, 1, 'SmtpPort', 'SMTP port', '25', 2);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (3, 1, 'SmtpUseSsl', 'SMTP use SSL', 'no', 3);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (4, 1, 'SmtpLogin', 'SMTP login', 'test', 4);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (5, 1, 'SmtpPassword', 'SMTP password', 'test', 5);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (6, 1, 'SmtpSenderEmail', 'SMTP sender email', 'test', 6);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (7, 1, 'SmtpSenderName', 'SMTP sender name', 'test', 7);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (8, 2, 'SpecifyCultureInUrl', 'Specify culture in URL', 'yes', 1);


--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 284
-- Name: Carts_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Carts_Id_seq"', 1, false);


--
-- TOC entry 3821 (class 0 OID 0)
-- Dependencies: 272
-- Name: Categories_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Categories_Id_seq"', 3, true);


--
-- TOC entry 3822 (class 0 OID 0)
-- Dependencies: 236
-- Name: Classes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Classes_Id_seq"', 2, true);


--
-- TOC entry 3823 (class 0 OID 0)
-- Dependencies: 268
-- Name: CompletedFields_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CompletedFields_Id_seq"', 1, false);


--
-- TOC entry 3824 (class 0 OID 0)
-- Dependencies: 266
-- Name: CompletedForms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CompletedForms_Id_seq"', 1, false);


--
-- TOC entry 3825 (class 0 OID 0)
-- Dependencies: 222
-- Name: Configurations_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Configurations_Id_seq"', 3, false);


--
-- TOC entry 3826 (class 0 OID 0)
-- Dependencies: 212
-- Name: CredentialTypes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CredentialTypes_Id_seq"', 2, false);


--
-- TOC entry 3827 (class 0 OID 0)
-- Dependencies: 214
-- Name: Credentials_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Credentials_Id_seq"', 2, false);


--
-- TOC entry 3828 (class 0 OID 0)
-- Dependencies: 234
-- Name: DataSources_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataSources_Id_seq"', 2, true);


--
-- TOC entry 3829 (class 0 OID 0)
-- Dependencies: 244
-- Name: DataTypeParameterOptions_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataTypeParameterOptions_Id_seq"', 1, false);


--
-- TOC entry 3830 (class 0 OID 0)
-- Dependencies: 242
-- Name: DataTypeParameters_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataTypeParameters_Id_seq"', 16, false);


--
-- TOC entry 3831 (class 0 OID 0)
-- Dependencies: 240
-- Name: DataTypes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataTypes_Id_seq"', 11, false);


--
-- TOC entry 3832 (class 0 OID 0)
-- Dependencies: 282
-- Name: DeliveryMethods_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DeliveryMethods_Id_seq"', 3, true);


--
-- TOC entry 3833 (class 0 OID 0)
-- Dependencies: 227
-- Name: Dictionaries_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Dictionaries_Id_seq"', 135, true);


--
-- TOC entry 3834 (class 0 OID 0)
-- Dependencies: 231
-- Name: Endpoints_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Endpoints_Id_seq"', 2, true);


--
-- TOC entry 3835 (class 0 OID 0)
-- Dependencies: 264
-- Name: FieldOptions_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FieldOptions_Id_seq"', 1, false);


--
-- TOC entry 3836 (class 0 OID 0)
-- Dependencies: 260
-- Name: FieldTypes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FieldTypes_Id_seq"', 8, false);


--
-- TOC entry 3837 (class 0 OID 0)
-- Dependencies: 262
-- Name: Fields_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Fields_Id_seq"', 3, true);


--
-- TOC entry 3838 (class 0 OID 0)
-- Dependencies: 270
-- Name: Files_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Files_Id_seq"', 1, false);


--
-- TOC entry 3839 (class 0 OID 0)
-- Dependencies: 258
-- Name: Forms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Forms_Id_seq"', 1, true);


--
-- TOC entry 3840 (class 0 OID 0)
-- Dependencies: 229
-- Name: Localizations_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Localizations_Id_seq"', 401, true);


--
-- TOC entry 3841 (class 0 OID 0)
-- Dependencies: 246
-- Name: Members_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Members_Id_seq"', 5, true);


--
-- TOC entry 3842 (class 0 OID 0)
-- Dependencies: 256
-- Name: MenuItems_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MenuItems_Id_seq"', 2, true);


--
-- TOC entry 3843 (class 0 OID 0)
-- Dependencies: 254
-- Name: Menus_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Menus_Id_seq"', 1, true);


--
-- TOC entry 3844 (class 0 OID 0)
-- Dependencies: 248
-- Name: Objects_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Objects_Id_seq"', 2, true);


--
-- TOC entry 3845 (class 0 OID 0)
-- Dependencies: 278
-- Name: OrderStates_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrderStates_Id_seq"', 7, true);


--
-- TOC entry 3846 (class 0 OID 0)
-- Dependencies: 286
-- Name: Orders_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orders_Id_seq"', 1, false);


--
-- TOC entry 3847 (class 0 OID 0)
-- Dependencies: 280
-- Name: PaymentMethods_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PaymentMethods_Id_seq"', 2, true);


--
-- TOC entry 3848 (class 0 OID 0)
-- Dependencies: 219
-- Name: Permissions_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Permissions_Id_seq"', 20, false);


--
-- TOC entry 3849 (class 0 OID 0)
-- Dependencies: 276
-- Name: Photos_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Photos_Id_seq"', 15, true);


--
-- TOC entry 3850 (class 0 OID 0)
-- Dependencies: 288
-- Name: Positions_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Positions_Id_seq"', 1, false);


--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 274
-- Name: Products_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Products_Id_seq"', 15, true);


--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 250
-- Name: Properties_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Properties_Id_seq"', 10, true);


--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 252
-- Name: Relations_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Relations_Id_seq"', 1, false);


--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 216
-- Name: Roles_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Roles_Id_seq"', 4, false);


--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 238
-- Name: Tabs_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tabs_Id_seq"', 1, true);


--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 210
-- Name: Users_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_Id_seq"', 2, false);


--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 224
-- Name: Variables_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Variables_Id_seq"', 9, false);


--
-- TOC entry 3488 (class 2606 OID 26707)
-- Name: Carts PK_Carts; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Carts"
    ADD CONSTRAINT "PK_Carts" PRIMARY KEY ("Id");


--
-- TOC entry 3476 (class 2606 OID 26568)
-- Name: Categories PK_Categories; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "PK_Categories" PRIMARY KEY ("Id");


--
-- TOC entry 3440 (class 2606 OID 26269)
-- Name: Classes PK_Classes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Classes"
    ADD CONSTRAINT "PK_Classes" PRIMARY KEY ("Id");


--
-- TOC entry 3472 (class 2606 OID 26540)
-- Name: CompletedFields PK_CompletedFields; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedFields"
    ADD CONSTRAINT "PK_CompletedFields" PRIMARY KEY ("Id");


--
-- TOC entry 3470 (class 2606 OID 26526)
-- Name: CompletedForms PK_CompletedForms; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedForms"
    ADD CONSTRAINT "PK_CompletedForms" PRIMARY KEY ("Id");


--
-- TOC entry 3424 (class 2606 OID 26175)
-- Name: Configurations PK_Configurations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Configurations"
    ADD CONSTRAINT "PK_Configurations" PRIMARY KEY ("Id");


--
-- TOC entry 3412 (class 2606 OID 26099)
-- Name: CredentialTypes PK_CredentialTypes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CredentialTypes"
    ADD CONSTRAINT "PK_CredentialTypes" PRIMARY KEY ("Id");


--
-- TOC entry 3414 (class 2606 OID 26108)
-- Name: Credentials PK_Credentials; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credentials"
    ADD CONSTRAINT "PK_Credentials" PRIMARY KEY ("Id");


--
-- TOC entry 3428 (class 2606 OID 26196)
-- Name: Cultures PK_Cultures; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cultures"
    ADD CONSTRAINT "PK_Cultures" PRIMARY KEY ("Id");


--
-- TOC entry 3438 (class 2606 OID 26255)
-- Name: DataSources PK_DataSources; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSources"
    ADD CONSTRAINT "PK_DataSources" PRIMARY KEY ("Id");


--
-- TOC entry 3448 (class 2606 OID 26320)
-- Name: DataTypeParameterOptions PK_DataTypeParameterOptions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameterOptions"
    ADD CONSTRAINT "PK_DataTypeParameterOptions" PRIMARY KEY ("Id");


--
-- TOC entry 3446 (class 2606 OID 26306)
-- Name: DataTypeParameters PK_DataTypeParameters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameters"
    ADD CONSTRAINT "PK_DataTypeParameters" PRIMARY KEY ("Id");


--
-- TOC entry 3444 (class 2606 OID 26297)
-- Name: DataTypes PK_DataTypes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypes"
    ADD CONSTRAINT "PK_DataTypes" PRIMARY KEY ("Id");


--
-- TOC entry 3486 (class 2606 OID 26693)
-- Name: DeliveryMethods PK_DeliveryMethods; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeliveryMethods"
    ADD CONSTRAINT "PK_DeliveryMethods" PRIMARY KEY ("Id");


--
-- TOC entry 3430 (class 2606 OID 26203)
-- Name: Dictionaries PK_Dictionaries; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dictionaries"
    ADD CONSTRAINT "PK_Dictionaries" PRIMARY KEY ("Id");


--
-- TOC entry 3436 (class 2606 OID 26236)
-- Name: EndpointPermissions PK_EndpointPermissions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EndpointPermissions"
    ADD CONSTRAINT "PK_EndpointPermissions" PRIMARY KEY ("EndpointId", "PermissionId");


--
-- TOC entry 3434 (class 2606 OID 26231)
-- Name: Endpoints PK_Endpoints; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Endpoints"
    ADD CONSTRAINT "PK_Endpoints" PRIMARY KEY ("Id");


--
-- TOC entry 3468 (class 2606 OID 26509)
-- Name: FieldOptions PK_FieldOptions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldOptions"
    ADD CONSTRAINT "PK_FieldOptions" PRIMARY KEY ("Id");


--
-- TOC entry 3464 (class 2606 OID 26478)
-- Name: FieldTypes PK_FieldTypes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldTypes"
    ADD CONSTRAINT "PK_FieldTypes" PRIMARY KEY ("Id");


--
-- TOC entry 3466 (class 2606 OID 26487)
-- Name: Fields PK_Fields; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fields"
    ADD CONSTRAINT "PK_Fields" PRIMARY KEY ("Id");


--
-- TOC entry 3474 (class 2606 OID 26559)
-- Name: Files PK_Files; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Files"
    ADD CONSTRAINT "PK_Files" PRIMARY KEY ("Id");


--
-- TOC entry 3462 (class 2606 OID 26459)
-- Name: Forms PK_Forms; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Forms"
    ADD CONSTRAINT "PK_Forms" PRIMARY KEY ("Id");


--
-- TOC entry 3432 (class 2606 OID 26212)
-- Name: Localizations PK_Localizations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Localizations"
    ADD CONSTRAINT "PK_Localizations" PRIMARY KEY ("Id");


--
-- TOC entry 3450 (class 2606 OID 26334)
-- Name: Members PK_Members; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "PK_Members" PRIMARY KEY ("Id");


--
-- TOC entry 3460 (class 2606 OID 26435)
-- Name: MenuItems PK_MenuItems; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MenuItems"
    ADD CONSTRAINT "PK_MenuItems" PRIMARY KEY ("Id");


--
-- TOC entry 3458 (class 2606 OID 26421)
-- Name: Menus PK_Menus; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Menus"
    ADD CONSTRAINT "PK_Menus" PRIMARY KEY ("Id");


--
-- TOC entry 3408 (class 2606 OID 26081)
-- Name: ModelStates PK_ModelStates; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ModelStates"
    ADD CONSTRAINT "PK_ModelStates" PRIMARY KEY ("Id");


--
-- TOC entry 3452 (class 2606 OID 26361)
-- Name: Objects PK_Objects; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objects"
    ADD CONSTRAINT "PK_Objects" PRIMARY KEY ("Id");


--
-- TOC entry 3482 (class 2606 OID 26665)
-- Name: OrderStates PK_OrderStates; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderStates"
    ADD CONSTRAINT "PK_OrderStates" PRIMARY KEY ("Id");


--
-- TOC entry 3490 (class 2606 OID 26716)
-- Name: Orders PK_Orders; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "PK_Orders" PRIMARY KEY ("Id");


--
-- TOC entry 3484 (class 2606 OID 26679)
-- Name: PaymentMethods PK_PaymentMethods; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentMethods"
    ADD CONSTRAINT "PK_PaymentMethods" PRIMARY KEY ("Id");


--
-- TOC entry 3420 (class 2606 OID 26151)
-- Name: Permissions PK_Permissions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "PK_Permissions" PRIMARY KEY ("Id");


--
-- TOC entry 3480 (class 2606 OID 26651)
-- Name: Photos PK_Photos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Photos"
    ADD CONSTRAINT "PK_Photos" PRIMARY KEY ("Id");


--
-- TOC entry 3492 (class 2606 OID 26740)
-- Name: Positions PK_Positions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Positions"
    ADD CONSTRAINT "PK_Positions" PRIMARY KEY ("Id");


--
-- TOC entry 3478 (class 2606 OID 26607)
-- Name: Products PK_Products; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "PK_Products" PRIMARY KEY ("Id");


--
-- TOC entry 3454 (class 2606 OID 26375)
-- Name: Properties PK_Properties; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "PK_Properties" PRIMARY KEY ("Id");


--
-- TOC entry 3456 (class 2606 OID 26397)
-- Name: Relations PK_Relations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Relations"
    ADD CONSTRAINT "PK_Relations" PRIMARY KEY ("Id");


--
-- TOC entry 3422 (class 2606 OID 26156)
-- Name: RolePermissions PK_RolePermissions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "PK_RolePermissions" PRIMARY KEY ("RoleId", "PermissionId");


--
-- TOC entry 3416 (class 2606 OID 26127)
-- Name: Roles PK_Roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "PK_Roles" PRIMARY KEY ("Id");


--
-- TOC entry 3442 (class 2606 OID 26283)
-- Name: Tabs PK_Tabs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tabs"
    ADD CONSTRAINT "PK_Tabs" PRIMARY KEY ("Id");


--
-- TOC entry 3418 (class 2606 OID 26132)
-- Name: UserRoles PK_UserRoles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "PK_UserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- TOC entry 3410 (class 2606 OID 26090)
-- Name: Users PK_Users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");


--
-- TOC entry 3426 (class 2606 OID 26184)
-- Name: Variables PK_Variable; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Variables"
    ADD CONSTRAINT "PK_Variable" PRIMARY KEY ("Id");


--
-- TOC entry 3534 (class 2606 OID 26569)
-- Name: Categories FK_Categories_Categories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "FK_Categories_Categories" FOREIGN KEY ("CategoryId") REFERENCES public."Categories"("Id") ON DELETE CASCADE;


--
-- TOC entry 3535 (class 2606 OID 26574)
-- Name: Categories FK_Categories_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "FK_Categories_Dictionaries" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3536 (class 2606 OID 26579)
-- Name: Categories FK_Categories_Dictionaries_DescriptionId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "FK_Categories_Dictionaries_DescriptionId" FOREIGN KEY ("DescriptionId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3538 (class 2606 OID 26589)
-- Name: Categories FK_Categories_Dictionaries_MetaDescriptionId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "FK_Categories_Dictionaries_MetaDescriptionId" FOREIGN KEY ("MetaDescriptionId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3539 (class 2606 OID 26594)
-- Name: Categories FK_Categories_Dictionaries_MetaKeywordsId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "FK_Categories_Dictionaries_MetaKeywordsId" FOREIGN KEY ("MetaKeywordsId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3537 (class 2606 OID 26584)
-- Name: Categories FK_Categories_Dictionaries_TitleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "FK_Categories_Dictionaries_TitleId" FOREIGN KEY ("TitleId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3505 (class 2606 OID 26270)
-- Name: Classes FK_Classes_Classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Classes"
    ADD CONSTRAINT "FK_Classes_Classes" FOREIGN KEY ("ClassId") REFERENCES public."Classes"("Id") ON DELETE SET NULL;


--
-- TOC entry 3532 (class 2606 OID 26541)
-- Name: CompletedFields FK_CompletedFields_CompletedForms; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedFields"
    ADD CONSTRAINT "FK_CompletedFields_CompletedForms" FOREIGN KEY ("CompletedFormId") REFERENCES public."CompletedForms"("Id") ON DELETE CASCADE;


--
-- TOC entry 3533 (class 2606 OID 26546)
-- Name: CompletedFields FK_CompletedFields_Fields; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedFields"
    ADD CONSTRAINT "FK_CompletedFields_Fields" FOREIGN KEY ("FieldId") REFERENCES public."Fields"("Id") ON DELETE CASCADE;


--
-- TOC entry 3531 (class 2606 OID 26527)
-- Name: CompletedForms FK_CompletedForms_Forms; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedForms"
    ADD CONSTRAINT "FK_CompletedForms_Forms" FOREIGN KEY ("FormId") REFERENCES public."Forms"("Id") ON DELETE CASCADE;


--
-- TOC entry 3494 (class 2606 OID 26114)
-- Name: Credentials FK_Credentials_CredentialTypes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credentials"
    ADD CONSTRAINT "FK_Credentials_CredentialTypes" FOREIGN KEY ("CredentialTypeId") REFERENCES public."CredentialTypes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3493 (class 2606 OID 26109)
-- Name: Credentials FK_Credentials_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credentials"
    ADD CONSTRAINT "FK_Credentials_Users" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- TOC entry 3504 (class 2606 OID 26256)
-- Name: DataSources FK_DataSources_Endpoints; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSources"
    ADD CONSTRAINT "FK_DataSources_Endpoints" FOREIGN KEY ("EndpointId") REFERENCES public."Endpoints"("Id") ON DELETE CASCADE;


--
-- TOC entry 3508 (class 2606 OID 26321)
-- Name: DataTypeParameterOptions FK_DataTypeParameterOptions_DataTypeParameters_DataTypeParamete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameterOptions"
    ADD CONSTRAINT "FK_DataTypeParameterOptions_DataTypeParameters_DataTypeParamete" FOREIGN KEY ("DataTypeParameterId") REFERENCES public."DataTypeParameters"("Id") ON DELETE CASCADE;


--
-- TOC entry 3507 (class 2606 OID 26307)
-- Name: DataTypeParameters FK_DataTypeParameters_DataTypes_DataTypeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameters"
    ADD CONSTRAINT "FK_DataTypeParameters_DataTypes_DataTypeId" FOREIGN KEY ("DataTypeId") REFERENCES public."DataTypes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3550 (class 2606 OID 26694)
-- Name: DeliveryMethods FK_DeliveryMethods_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeliveryMethods"
    ADD CONSTRAINT "FK_DeliveryMethods_Dictionaries" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3502 (class 2606 OID 26237)
-- Name: EndpointPermissions FK_EndpointPermissions_Roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EndpointPermissions"
    ADD CONSTRAINT "FK_EndpointPermissions_Roles" FOREIGN KEY ("EndpointId") REFERENCES public."Endpoints"("Id") ON DELETE CASCADE;


--
-- TOC entry 3530 (class 2606 OID 26515)
-- Name: FieldOptions FK_FieldOptions_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldOptions"
    ADD CONSTRAINT "FK_FieldOptions_Dictionaries" FOREIGN KEY ("ValueId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3529 (class 2606 OID 26510)
-- Name: FieldOptions FK_FieldOptions_Fields; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldOptions"
    ADD CONSTRAINT "FK_FieldOptions_Fields" FOREIGN KEY ("FieldId") REFERENCES public."Fields"("Id") ON DELETE CASCADE;


--
-- TOC entry 3528 (class 2606 OID 26498)
-- Name: Fields FK_Fields_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fields"
    ADD CONSTRAINT "FK_Fields_Dictionaries" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3527 (class 2606 OID 26493)
-- Name: Fields FK_Fields_FieldTypes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fields"
    ADD CONSTRAINT "FK_Fields_FieldTypes" FOREIGN KEY ("FieldTypeId") REFERENCES public."FieldTypes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3526 (class 2606 OID 26488)
-- Name: Fields FK_Fields_Forms; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fields"
    ADD CONSTRAINT "FK_Fields_Forms" FOREIGN KEY ("FormId") REFERENCES public."Forms"("Id") ON DELETE CASCADE;


--
-- TOC entry 3524 (class 2606 OID 26460)
-- Name: Forms FK_Forms_Dictionaries_NameId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Forms"
    ADD CONSTRAINT "FK_Forms_Dictionaries_NameId" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3525 (class 2606 OID 26465)
-- Name: Forms FK_Forms_Dictionaries_SubmitButtonTitleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Forms"
    ADD CONSTRAINT "FK_Forms_Dictionaries_SubmitButtonTitleId" FOREIGN KEY ("SubmitButtonTitleId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3501 (class 2606 OID 26218)
-- Name: Localizations FK_Localizations_Cultures; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Localizations"
    ADD CONSTRAINT "FK_Localizations_Cultures" FOREIGN KEY ("CultureId") REFERENCES public."Cultures"("Id") ON DELETE CASCADE;


--
-- TOC entry 3500 (class 2606 OID 26213)
-- Name: Localizations FK_Localizations_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Localizations"
    ADD CONSTRAINT "FK_Localizations_Dictionaries" FOREIGN KEY ("DictionaryId") REFERENCES public."Dictionaries"("Id") ON DELETE CASCADE;


--
-- TOC entry 3509 (class 2606 OID 26335)
-- Name: Members FK_Members_Classes_ClassId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "FK_Members_Classes_ClassId" FOREIGN KEY ("ClassId") REFERENCES public."Classes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3512 (class 2606 OID 26350)
-- Name: Members FK_Members_Classes_RelationClassId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "FK_Members_Classes_RelationClassId" FOREIGN KEY ("RelationClassId") REFERENCES public."Classes"("Id") ON DELETE SET NULL;


--
-- TOC entry 3511 (class 2606 OID 26345)
-- Name: Members FK_Members_DataTypes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "FK_Members_DataTypes" FOREIGN KEY ("PropertyDataTypeId") REFERENCES public."DataTypes"("Id") ON DELETE SET NULL;


--
-- TOC entry 3510 (class 2606 OID 26340)
-- Name: Members FK_Members_Tabs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "FK_Members_Tabs" FOREIGN KEY ("TabId") REFERENCES public."Tabs"("Id") ON DELETE SET NULL;


--
-- TOC entry 3523 (class 2606 OID 26446)
-- Name: MenuItems FK_MenuItems_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MenuItems"
    ADD CONSTRAINT "FK_MenuItems_Dictionaries" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3522 (class 2606 OID 26441)
-- Name: MenuItems FK_MenuItems_MenuItems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MenuItems"
    ADD CONSTRAINT "FK_MenuItems_MenuItems" FOREIGN KEY ("MenuItemId") REFERENCES public."MenuItems"("Id") ON DELETE CASCADE;


--
-- TOC entry 3521 (class 2606 OID 26436)
-- Name: MenuItems FK_MenuItems_Menus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MenuItems"
    ADD CONSTRAINT "FK_MenuItems_Menus" FOREIGN KEY ("MenuId") REFERENCES public."Menus"("Id") ON DELETE CASCADE;


--
-- TOC entry 3520 (class 2606 OID 26422)
-- Name: Menus FK_Menus_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Menus"
    ADD CONSTRAINT "FK_Menus_Dictionaries" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3513 (class 2606 OID 26362)
-- Name: Objects FK_Objects_Classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objects"
    ADD CONSTRAINT "FK_Objects_Classes" FOREIGN KEY ("ClassId") REFERENCES public."Classes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3548 (class 2606 OID 26666)
-- Name: OrderStates FK_OrderStates_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderStates"
    ADD CONSTRAINT "FK_OrderStates_Dictionaries" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3553 (class 2606 OID 26727)
-- Name: Orders FK_Orders_DeliveryMethods; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "FK_Orders_DeliveryMethods" FOREIGN KEY ("DeliveryMethodId") REFERENCES public."DeliveryMethods"("Id") ON DELETE CASCADE;


--
-- TOC entry 3551 (class 2606 OID 26717)
-- Name: Orders FK_Orders_OrderStates; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "FK_Orders_OrderStates" FOREIGN KEY ("OrderStateId") REFERENCES public."OrderStates"("Id") ON DELETE CASCADE;


--
-- TOC entry 3552 (class 2606 OID 26722)
-- Name: Orders FK_Orders_PaymentMethods; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "FK_Orders_PaymentMethods" FOREIGN KEY ("PaymentMethodId") REFERENCES public."PaymentMethods"("Id") ON DELETE CASCADE;


--
-- TOC entry 3549 (class 2606 OID 26680)
-- Name: PaymentMethods FK_PaymentMethods_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentMethods"
    ADD CONSTRAINT "FK_PaymentMethods_Dictionaries" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3547 (class 2606 OID 26652)
-- Name: Photos FK_Photos_Products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Photos"
    ADD CONSTRAINT "FK_Photos_Products" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id") ON DELETE CASCADE;


--
-- TOC entry 3554 (class 2606 OID 26741)
-- Name: Positions FK_Positions_Carts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Positions"
    ADD CONSTRAINT "FK_Positions_Carts" FOREIGN KEY ("CartId") REFERENCES public."Carts"("Id") ON DELETE CASCADE;


--
-- TOC entry 3555 (class 2606 OID 26746)
-- Name: Positions FK_Positions_Orders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Positions"
    ADD CONSTRAINT "FK_Positions_Orders" FOREIGN KEY ("OrderId") REFERENCES public."Orders"("Id") ON DELETE CASCADE;


--
-- TOC entry 3556 (class 2606 OID 26751)
-- Name: Positions FK_Positions_Products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Positions"
    ADD CONSTRAINT "FK_Positions_Products" FOREIGN KEY ("ProductId") REFERENCES public."Products"("Id") ON DELETE CASCADE;


--
-- TOC entry 3540 (class 2606 OID 26608)
-- Name: Products FK_Products_Categories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Categories" FOREIGN KEY ("CategoryId") REFERENCES public."Categories"("Id") ON DELETE CASCADE;


--
-- TOC entry 3542 (class 2606 OID 26618)
-- Name: Products FK_Products_Dictionaries_DescriptionId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Dictionaries_DescriptionId" FOREIGN KEY ("DescriptionId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3545 (class 2606 OID 26633)
-- Name: Products FK_Products_Dictionaries_MetaDescriptionId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Dictionaries_MetaDescriptionId" FOREIGN KEY ("MetaDescriptionId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3546 (class 2606 OID 26638)
-- Name: Products FK_Products_Dictionaries_MetaKeywordsId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Dictionaries_MetaKeywordsId" FOREIGN KEY ("MetaKeywordsId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3541 (class 2606 OID 26613)
-- Name: Products FK_Products_Dictionaries_NameId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Dictionaries_NameId" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3544 (class 2606 OID 26628)
-- Name: Products FK_Products_Dictionaries_TitleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Dictionaries_TitleId" FOREIGN KEY ("TitleId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3543 (class 2606 OID 26623)
-- Name: Products FK_Products_Dictionaries_UnitsId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "FK_Products_Dictionaries_UnitsId" FOREIGN KEY ("UnitsId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3516 (class 2606 OID 26386)
-- Name: Properties FK_Properties_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "FK_Properties_Dictionaries" FOREIGN KEY ("StringValueId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3515 (class 2606 OID 26381)
-- Name: Properties FK_Properties_Members; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "FK_Properties_Members" FOREIGN KEY ("MemberId") REFERENCES public."Members"("Id") ON DELETE CASCADE;


--
-- TOC entry 3514 (class 2606 OID 26376)
-- Name: Properties FK_Properties_Objects; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "FK_Properties_Objects" FOREIGN KEY ("ObjectId") REFERENCES public."Objects"("Id") ON DELETE CASCADE;


--
-- TOC entry 3517 (class 2606 OID 26398)
-- Name: Relations FK_Relations_Members; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Relations"
    ADD CONSTRAINT "FK_Relations_Members" FOREIGN KEY ("MemberId") REFERENCES public."Members"("Id") ON DELETE CASCADE;


--
-- TOC entry 3519 (class 2606 OID 26408)
-- Name: Relations FK_Relations_Objects_ForeignId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Relations"
    ADD CONSTRAINT "FK_Relations_Objects_ForeignId" FOREIGN KEY ("ForeignId") REFERENCES public."Objects"("Id") ON DELETE CASCADE;


--
-- TOC entry 3518 (class 2606 OID 26403)
-- Name: Relations FK_Relations_Objects_PrimaryId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Relations"
    ADD CONSTRAINT "FK_Relations_Objects_PrimaryId" FOREIGN KEY ("PrimaryId") REFERENCES public."Objects"("Id") ON DELETE CASCADE;


--
-- TOC entry 3498 (class 2606 OID 26162)
-- Name: RolePermissions FK_RolePermissions_Permissions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "FK_RolePermissions_Permissions" FOREIGN KEY ("PermissionId") REFERENCES public."Permissions"("Id") ON DELETE CASCADE;


--
-- TOC entry 3503 (class 2606 OID 26242)
-- Name: EndpointPermissions FK_RolePermissions_Permissions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EndpointPermissions"
    ADD CONSTRAINT "FK_RolePermissions_Permissions" FOREIGN KEY ("PermissionId") REFERENCES public."Permissions"("Id") ON DELETE CASCADE;


--
-- TOC entry 3497 (class 2606 OID 26157)
-- Name: RolePermissions FK_RolePermissions_Roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "FK_RolePermissions_Roles" FOREIGN KEY ("RoleId") REFERENCES public."Roles"("Id") ON DELETE CASCADE;


--
-- TOC entry 3506 (class 2606 OID 26284)
-- Name: Tabs FK_Tabs_Classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tabs"
    ADD CONSTRAINT "FK_Tabs_Classes" FOREIGN KEY ("ClassId") REFERENCES public."Classes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3496 (class 2606 OID 26138)
-- Name: UserRoles FK_UserRoles_Roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "FK_UserRoles_Roles" FOREIGN KEY ("RoleId") REFERENCES public."Roles"("Id") ON DELETE CASCADE;


--
-- TOC entry 3495 (class 2606 OID 26133)
-- Name: UserRoles FK_UserRoles_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "FK_UserRoles_Users" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- TOC entry 3499 (class 2606 OID 26185)
-- Name: Variables FK_Variables_Configurations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Variables"
    ADD CONSTRAINT "FK_Variables_Configurations" FOREIGN KEY ("ConfigurationId") REFERENCES public."Configurations"("Id") ON DELETE CASCADE;


-- Completed on 2022-01-22 23:16:30

--
-- PostgreSQL database dump complete
--

