PGDMP      "                }         
   wiki_chino #   16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)    16.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16390 
   wiki_chino    DATABASE     r   CREATE DATABASE wiki_chino WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE wiki_chino;
                chino    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16405 	   analytics    TABLE     �   CREATE TABLE public.analytics (
    key character varying(255) NOT NULL,
    "isEnabled" boolean DEFAULT false NOT NULL,
    config json NOT NULL
);
    DROP TABLE public.analytics;
       public         heap    chino    false    4                       1259    16768    apiKeys    TABLE     >  CREATE TABLE public."apiKeys" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    key text NOT NULL,
    expiration character varying(255) NOT NULL,
    "isRevoked" boolean DEFAULT false NOT NULL,
    "createdAt" character varying(255) NOT NULL,
    "updatedAt" character varying(255) NOT NULL
);
    DROP TABLE public."apiKeys";
       public         heap    chino    false    4                       1259    16767    apiKeys_id_seq    SEQUENCE     �   CREATE SEQUENCE public."apiKeys_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."apiKeys_id_seq";
       public          chino    false    258    4            �           0    0    apiKeys_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."apiKeys_id_seq" OWNED BY public."apiKeys".id;
          public          chino    false    257            �            1259    16425 	   assetData    TABLE     V   CREATE TABLE public."assetData" (
    id integer NOT NULL,
    data bytea NOT NULL
);
    DROP TABLE public."assetData";
       public         heap    chino    false    4            �            1259    16433    assetFolders    TABLE     �   CREATE TABLE public."assetFolders" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    "parentId" integer
);
 "   DROP TABLE public."assetFolders";
       public         heap    chino    false    4            �            1259    16432    assetFolders_id_seq    SEQUENCE     �   CREATE SEQUENCE public."assetFolders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."assetFolders_id_seq";
       public          chino    false    224    4            �           0    0    assetFolders_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."assetFolders_id_seq" OWNED BY public."assetFolders".id;
          public          chino    false    223            �            1259    16414    assets    TABLE     c  CREATE TABLE public.assets (
    id integer NOT NULL,
    filename character varying(255) NOT NULL,
    hash character varying(255) NOT NULL,
    ext character varying(255) NOT NULL,
    kind text DEFAULT 'binary'::text NOT NULL,
    mime character varying(255) DEFAULT 'application/octet-stream'::character varying NOT NULL,
    "fileSize" integer,
    metadata json,
    "createdAt" character varying(255) NOT NULL,
    "updatedAt" character varying(255) NOT NULL,
    "folderId" integer,
    "authorId" integer,
    CONSTRAINT assets_kind_check CHECK ((kind = ANY (ARRAY['binary'::text, 'image'::text])))
);
    DROP TABLE public.assets;
       public         heap    chino    false    4            �           0    0    COLUMN assets."fileSize"    COMMENT     >   COMMENT ON COLUMN public.assets."fileSize" IS 'In kilobytes';
          public          chino    false    221            �            1259    16413    assets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.assets_id_seq;
       public          chino    false    221    4            �           0    0    assets_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.assets_id_seq OWNED BY public.assets.id;
          public          chino    false    220            �            1259    16446    authentication    TABLE     �  CREATE TABLE public.authentication (
    key character varying(255) NOT NULL,
    "isEnabled" boolean DEFAULT false NOT NULL,
    config json NOT NULL,
    "selfRegistration" boolean DEFAULT false NOT NULL,
    "domainWhitelist" json NOT NULL,
    "autoEnrollGroups" json NOT NULL,
    "order" integer DEFAULT 0 NOT NULL,
    "strategyKey" character varying(255) DEFAULT ''::character varying NOT NULL,
    "displayName" character varying(255) DEFAULT ''::character varying NOT NULL
);
 "   DROP TABLE public.authentication;
       public         heap    chino    false    4                       1259    16854    brute    TABLE     �   CREATE TABLE public.brute (
    key character varying(255),
    "firstRequest" bigint,
    "lastRequest" bigint,
    lifetime bigint,
    count integer
);
    DROP TABLE public.brute;
       public         heap    chino    false    4                       1259    16782    commentProviders    TABLE     �   CREATE TABLE public."commentProviders" (
    key character varying(255) NOT NULL,
    "isEnabled" boolean DEFAULT false NOT NULL,
    config json NOT NULL
);
 &   DROP TABLE public."commentProviders";
       public         heap    chino    false    4            �            1259    16456    comments    TABLE       CREATE TABLE public.comments (
    id integer NOT NULL,
    content text NOT NULL,
    "createdAt" character varying(255) NOT NULL,
    "updatedAt" character varying(255) NOT NULL,
    "pageId" integer,
    "authorId" integer,
    render text DEFAULT ''::text NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    ip character varying(255) DEFAULT ''::character varying NOT NULL,
    "replyTo" integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.comments;
       public         heap    chino    false    4            �            1259    16455    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          chino    false    227    4            �           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public          chino    false    226            �            1259    16464    editors    TABLE     �   CREATE TABLE public.editors (
    key character varying(255) NOT NULL,
    "isEnabled" boolean DEFAULT false NOT NULL,
    config json NOT NULL
);
    DROP TABLE public.editors;
       public         heap    chino    false    4            �            1259    16473    groups    TABLE     �  CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    permissions json NOT NULL,
    "pageRules" json NOT NULL,
    "isSystem" boolean DEFAULT false NOT NULL,
    "createdAt" character varying(255) NOT NULL,
    "updatedAt" character varying(255) NOT NULL,
    "redirectOnLogin" character varying(255) DEFAULT '/'::character varying NOT NULL
);
    DROP TABLE public.groups;
       public         heap    chino    false    4            �            1259    16472    groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public          chino    false    230    4            �           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public          chino    false    229            �            1259    16482    locales    TABLE     q  CREATE TABLE public.locales (
    code character varying(5) NOT NULL,
    strings json,
    "isRTL" boolean DEFAULT false NOT NULL,
    name character varying(255) NOT NULL,
    "nativeName" character varying(255) NOT NULL,
    availability integer DEFAULT 0 NOT NULL,
    "createdAt" character varying(255) NOT NULL,
    "updatedAt" character varying(255) NOT NULL
);
    DROP TABLE public.locales;
       public         heap    chino    false    4            �            1259    16491    loggers    TABLE     �   CREATE TABLE public.loggers (
    key character varying(255) NOT NULL,
    "isEnabled" boolean DEFAULT false NOT NULL,
    level character varying(255) DEFAULT 'warn'::character varying NOT NULL,
    config json
);
    DROP TABLE public.loggers;
       public         heap    chino    false    4            �            1259    16392 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);
    DROP TABLE public.migrations;
       public         heap    chino    false    4            �            1259    16391    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          chino    false    216    4            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          chino    false    215            �            1259    16399    migrations_lock    TABLE     [   CREATE TABLE public.migrations_lock (
    index integer NOT NULL,
    is_locked integer
);
 #   DROP TABLE public.migrations_lock;
       public         heap    chino    false    4            �            1259    16398    migrations_lock_index_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.migrations_lock_index_seq;
       public          chino    false    218    4            �           0    0    migrations_lock_index_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.migrations_lock_index_seq OWNED BY public.migrations_lock.index;
          public          chino    false    217            �            1259    16500 
   navigation    TABLE     ]   CREATE TABLE public.navigation (
    key character varying(255) NOT NULL,
    config json
);
    DROP TABLE public.navigation;
       public         heap    chino    false    4            �            1259    16508    pageHistory    TABLE     \  CREATE TABLE public."pageHistory" (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    hash character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    "isPrivate" boolean DEFAULT false NOT NULL,
    "isPublished" boolean DEFAULT false NOT NULL,
    "publishStartDate" character varying(255),
    "publishEndDate" character varying(255),
    action character varying(255) DEFAULT 'updated'::character varying,
    "pageId" integer,
    content text,
    "contentType" character varying(255) NOT NULL,
    "createdAt" character varying(255) NOT NULL,
    "editorKey" character varying(255),
    "localeCode" character varying(5),
    "authorId" integer,
    "versionDate" character varying(255) DEFAULT ''::character varying NOT NULL,
    extra json DEFAULT '{}'::json NOT NULL
);
 !   DROP TABLE public."pageHistory";
       public         heap    chino    false    4            �            1259    16616    pageHistoryTags    TABLE     n   CREATE TABLE public."pageHistoryTags" (
    id integer NOT NULL,
    "pageId" integer,
    "tagId" integer
);
 %   DROP TABLE public."pageHistoryTags";
       public         heap    chino    false    4            �            1259    16615    pageHistoryTags_id_seq    SEQUENCE     �   CREATE SEQUENCE public."pageHistoryTags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."pageHistoryTags_id_seq";
       public          chino    false    252    4            �           0    0    pageHistoryTags_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."pageHistoryTags_id_seq" OWNED BY public."pageHistoryTags".id;
          public          chino    false    251            �            1259    16507    pageHistory_id_seq    SEQUENCE     �   CREATE SEQUENCE public."pageHistory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."pageHistory_id_seq";
       public          chino    false    235    4            �           0    0    pageHistory_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."pageHistory_id_seq" OWNED BY public."pageHistory".id;
          public          chino    false    234            �            1259    16520 	   pageLinks    TABLE     �   CREATE TABLE public."pageLinks" (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    "localeCode" character varying(5) NOT NULL,
    "pageId" integer
);
    DROP TABLE public."pageLinks";
       public         heap    chino    false    4            �            1259    16519    pageLinks_id_seq    SEQUENCE     �   CREATE SEQUENCE public."pageLinks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."pageLinks_id_seq";
       public          chino    false    237    4            �           0    0    pageLinks_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."pageLinks_id_seq" OWNED BY public."pageLinks".id;
          public          chino    false    236            �            1259    16633    pageTags    TABLE     g   CREATE TABLE public."pageTags" (
    id integer NOT NULL,
    "pageId" integer,
    "tagId" integer
);
    DROP TABLE public."pageTags";
       public         heap    chino    false    4            �            1259    16632    pageTags_id_seq    SEQUENCE     �   CREATE SEQUENCE public."pageTags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."pageTags_id_seq";
       public          chino    false    4    254            �           0    0    pageTags_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."pageTags_id_seq" OWNED BY public."pageTags".id;
          public          chino    false    253            �            1259    16537    pageTree    TABLE     �  CREATE TABLE public."pageTree" (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    title character varying(255) NOT NULL,
    "isPrivate" boolean DEFAULT false NOT NULL,
    "isFolder" boolean DEFAULT false NOT NULL,
    "privateNS" character varying(255),
    parent integer,
    "pageId" integer,
    "localeCode" character varying(5),
    ancestors json
);
    DROP TABLE public."pageTree";
       public         heap    chino    false    4            �            1259    16527    pages    TABLE     6  CREATE TABLE public.pages (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    hash character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    "isPrivate" boolean DEFAULT false NOT NULL,
    "isPublished" boolean DEFAULT false NOT NULL,
    "privateNS" character varying(255),
    "publishStartDate" character varying(255),
    "publishEndDate" character varying(255),
    content text,
    render text,
    toc json,
    "contentType" character varying(255) NOT NULL,
    "createdAt" character varying(255) NOT NULL,
    "updatedAt" character varying(255) NOT NULL,
    "editorKey" character varying(255),
    "localeCode" character varying(5),
    "authorId" integer,
    "creatorId" integer,
    extra json DEFAULT '{}'::json NOT NULL
);
    DROP TABLE public.pages;
       public         heap    chino    false    4            �            1259    16526    pages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.pages_id_seq;
       public          chino    false    239    4            �           0    0    pages_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;
          public          chino    false    238            �            1259    16546 	   renderers    TABLE     �   CREATE TABLE public.renderers (
    key character varying(255) NOT NULL,
    "isEnabled" boolean DEFAULT false NOT NULL,
    config json
);
    DROP TABLE public.renderers;
       public         heap    chino    false    4            �            1259    16554    searchEngines    TABLE     �   CREATE TABLE public."searchEngines" (
    key character varying(255) NOT NULL,
    "isEnabled" boolean DEFAULT false NOT NULL,
    config json
);
 #   DROP TABLE public."searchEngines";
       public         heap    chino    false    4                       1259    16857    sessions    TABLE     �   CREATE TABLE public.sessions (
    sid character varying(255) NOT NULL,
    sess json NOT NULL,
    expired timestamp with time zone NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    chino    false    4            �            1259    16562    settings    TABLE     �   CREATE TABLE public.settings (
    key character varying(255) NOT NULL,
    value json,
    "updatedAt" character varying(255) NOT NULL
);
    DROP TABLE public.settings;
       public         heap    chino    false    4            �            1259    16569    storage    TABLE       CREATE TABLE public.storage (
    key character varying(255) NOT NULL,
    "isEnabled" boolean DEFAULT false NOT NULL,
    mode character varying(255) DEFAULT 'push'::character varying NOT NULL,
    config json,
    "syncInterval" character varying(255),
    state json
);
    DROP TABLE public.storage;
       public         heap    chino    false    4            �            1259    16579    tags    TABLE     �   CREATE TABLE public.tags (
    id integer NOT NULL,
    tag character varying(255) NOT NULL,
    title character varying(255),
    "createdAt" character varying(255) NOT NULL,
    "updatedAt" character varying(255) NOT NULL
);
    DROP TABLE public.tags;
       public         heap    chino    false    4            �            1259    16578    tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tags_id_seq;
       public          chino    false    4    246            �           0    0    tags_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;
          public          chino    false    245                       1259    16799    userAvatars    TABLE     X   CREATE TABLE public."userAvatars" (
    id integer NOT NULL,
    data bytea NOT NULL
);
 !   DROP TABLE public."userAvatars";
       public         heap    chino    false    4                        1259    16650 
   userGroups    TABLE     k   CREATE TABLE public."userGroups" (
    id integer NOT NULL,
    "userId" integer,
    "groupId" integer
);
     DROP TABLE public."userGroups";
       public         heap    chino    false    4            �            1259    16649    userGroups_id_seq    SEQUENCE     �   CREATE SEQUENCE public."userGroups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."userGroups_id_seq";
       public          chino    false    4    256            �           0    0    userGroups_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."userGroups_id_seq" OWNED BY public."userGroups".id;
          public          chino    false    255            �            1259    16590    userKeys    TABLE     
  CREATE TABLE public."userKeys" (
    id integer NOT NULL,
    kind character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    "createdAt" character varying(255) NOT NULL,
    "validUntil" character varying(255) NOT NULL,
    "userId" integer
);
    DROP TABLE public."userKeys";
       public         heap    chino    false    4            �            1259    16589    userKeys_id_seq    SEQUENCE     �   CREATE SEQUENCE public."userKeys_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."userKeys_id_seq";
       public          chino    false    4    248            �           0    0    userKeys_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."userKeys_id_seq" OWNED BY public."userKeys".id;
          public          chino    false    247            �            1259    16599    users    TABLE     /  CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "providerId" character varying(255),
    password character varying(255),
    "tfaIsActive" boolean DEFAULT false NOT NULL,
    "tfaSecret" character varying(255),
    "jobTitle" character varying(255) DEFAULT ''::character varying,
    location character varying(255) DEFAULT ''::character varying,
    "pictureUrl" character varying(255),
    timezone character varying(255) DEFAULT 'America/New_York'::character varying NOT NULL,
    "isSystem" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    "isVerified" boolean DEFAULT false NOT NULL,
    "mustChangePwd" boolean DEFAULT false NOT NULL,
    "createdAt" character varying(255) NOT NULL,
    "updatedAt" character varying(255) NOT NULL,
    "providerKey" character varying(255) DEFAULT 'local'::character varying NOT NULL,
    "localeCode" character varying(5) DEFAULT 'en'::character varying NOT NULL,
    "defaultEditor" character varying(255) DEFAULT 'markdown'::character varying NOT NULL,
    "lastLoginAt" character varying(255),
    "dateFormat" character varying(255) DEFAULT ''::character varying NOT NULL,
    appearance character varying(255) DEFAULT ''::character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap    chino    false    4            �            1259    16598    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          chino    false    250    4            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          chino    false    249            x           2604    16771 
   apiKeys id    DEFAULT     l   ALTER TABLE ONLY public."apiKeys" ALTER COLUMN id SET DEFAULT nextval('public."apiKeys_id_seq"'::regclass);
 ;   ALTER TABLE public."apiKeys" ALTER COLUMN id DROP DEFAULT;
       public          chino    false    257    258    258            @           2604    16436    assetFolders id    DEFAULT     v   ALTER TABLE ONLY public."assetFolders" ALTER COLUMN id SET DEFAULT nextval('public."assetFolders_id_seq"'::regclass);
 @   ALTER TABLE public."assetFolders" ALTER COLUMN id DROP DEFAULT;
       public          chino    false    223    224    224            =           2604    16417 	   assets id    DEFAULT     f   ALTER TABLE ONLY public.assets ALTER COLUMN id SET DEFAULT nextval('public.assets_id_seq'::regclass);
 8   ALTER TABLE public.assets ALTER COLUMN id DROP DEFAULT;
       public          chino    false    220    221    221            F           2604    16459    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          chino    false    227    226    227            M           2604    16476 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          chino    false    230    229    230            :           2604    16395    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          chino    false    216    215    216            ;           2604    16402    migrations_lock index    DEFAULT     ~   ALTER TABLE ONLY public.migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.migrations_lock_index_seq'::regclass);
 D   ALTER TABLE public.migrations_lock ALTER COLUMN index DROP DEFAULT;
       public          chino    false    217    218    218            T           2604    16511    pageHistory id    DEFAULT     t   ALTER TABLE ONLY public."pageHistory" ALTER COLUMN id SET DEFAULT nextval('public."pageHistory_id_seq"'::regclass);
 ?   ALTER TABLE public."pageHistory" ALTER COLUMN id DROP DEFAULT;
       public          chino    false    235    234    235            u           2604    16619    pageHistoryTags id    DEFAULT     |   ALTER TABLE ONLY public."pageHistoryTags" ALTER COLUMN id SET DEFAULT nextval('public."pageHistoryTags_id_seq"'::regclass);
 C   ALTER TABLE public."pageHistoryTags" ALTER COLUMN id DROP DEFAULT;
       public          chino    false    252    251    252            Z           2604    16523    pageLinks id    DEFAULT     p   ALTER TABLE ONLY public."pageLinks" ALTER COLUMN id SET DEFAULT nextval('public."pageLinks_id_seq"'::regclass);
 =   ALTER TABLE public."pageLinks" ALTER COLUMN id DROP DEFAULT;
       public          chino    false    236    237    237            v           2604    16636    pageTags id    DEFAULT     n   ALTER TABLE ONLY public."pageTags" ALTER COLUMN id SET DEFAULT nextval('public."pageTags_id_seq"'::regclass);
 <   ALTER TABLE public."pageTags" ALTER COLUMN id DROP DEFAULT;
       public          chino    false    253    254    254            [           2604    16530    pages id    DEFAULT     d   ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);
 7   ALTER TABLE public.pages ALTER COLUMN id DROP DEFAULT;
       public          chino    false    239    238    239            e           2604    16582    tags id    DEFAULT     b   ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);
 6   ALTER TABLE public.tags ALTER COLUMN id DROP DEFAULT;
       public          chino    false    246    245    246            w           2604    16653    userGroups id    DEFAULT     r   ALTER TABLE ONLY public."userGroups" ALTER COLUMN id SET DEFAULT nextval('public."userGroups_id_seq"'::regclass);
 >   ALTER TABLE public."userGroups" ALTER COLUMN id DROP DEFAULT;
       public          chino    false    256    255    256            f           2604    16593    userKeys id    DEFAULT     n   ALTER TABLE ONLY public."userKeys" ALTER COLUMN id SET DEFAULT nextval('public."userKeys_id_seq"'::regclass);
 <   ALTER TABLE public."userKeys" ALTER COLUMN id DROP DEFAULT;
       public          chino    false    247    248    248            g           2604    16602    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          chino    false    249    250    250            m          0    16405 	   analytics 
   TABLE DATA           =   COPY public.analytics (key, "isEnabled", config) FROM stdin;
    public          chino    false    219   ��       �          0    16768    apiKeys 
   TABLE DATA           e   COPY public."apiKeys" (id, name, key, expiration, "isRevoked", "createdAt", "updatedAt") FROM stdin;
    public          chino    false    258   ,�       p          0    16425 	   assetData 
   TABLE DATA           /   COPY public."assetData" (id, data) FROM stdin;
    public          chino    false    222   I�       r          0    16433    assetFolders 
   TABLE DATA           D   COPY public."assetFolders" (id, name, slug, "parentId") FROM stdin;
    public          chino    false    224   f�       o          0    16414    assets 
   TABLE DATA           �   COPY public.assets (id, filename, hash, ext, kind, mime, "fileSize", metadata, "createdAt", "updatedAt", "folderId", "authorId") FROM stdin;
    public          chino    false    221   ��       s          0    16446    authentication 
   TABLE DATA           �   COPY public.authentication (key, "isEnabled", config, "selfRegistration", "domainWhitelist", "autoEnrollGroups", "order", "strategyKey", "displayName") FROM stdin;
    public          chino    false    225   ��       �          0    16854    brute 
   TABLE DATA           T   COPY public.brute (key, "firstRequest", "lastRequest", lifetime, count) FROM stdin;
    public          chino    false    261   ��       �          0    16782    commentProviders 
   TABLE DATA           F   COPY public."commentProviders" (key, "isEnabled", config) FROM stdin;
    public          chino    false    259   ��       u          0    16456    comments 
   TABLE DATA           �   COPY public.comments (id, content, "createdAt", "updatedAt", "pageId", "authorId", render, name, email, ip, "replyTo") FROM stdin;
    public          chino    false    227   ��       v          0    16464    editors 
   TABLE DATA           ;   COPY public.editors (key, "isEnabled", config) FROM stdin;
    public          chino    false    228   ��       x          0    16473    groups 
   TABLE DATA           }   COPY public.groups (id, name, permissions, "pageRules", "isSystem", "createdAt", "updatedAt", "redirectOnLogin") FROM stdin;
    public          chino    false    230   �       y          0    16482    locales 
   TABLE DATA           u   COPY public.locales (code, strings, "isRTL", name, "nativeName", availability, "createdAt", "updatedAt") FROM stdin;
    public          chino    false    231   ��       z          0    16491    loggers 
   TABLE DATA           B   COPY public.loggers (key, "isEnabled", level, config) FROM stdin;
    public          chino    false    232   �0      j          0    16392 
   migrations 
   TABLE DATA           E   COPY public.migrations (id, name, batch, migration_time) FROM stdin;
    public          chino    false    216   Q1      l          0    16399    migrations_lock 
   TABLE DATA           ;   COPY public.migrations_lock (index, is_locked) FROM stdin;
    public          chino    false    218   �1      {          0    16500 
   navigation 
   TABLE DATA           1   COPY public.navigation (key, config) FROM stdin;
    public          chino    false    233   2      }          0    16508    pageHistory 
   TABLE DATA             COPY public."pageHistory" (id, path, hash, title, description, "isPrivate", "isPublished", "publishStartDate", "publishEndDate", action, "pageId", content, "contentType", "createdAt", "editorKey", "localeCode", "authorId", "versionDate", extra) FROM stdin;
    public          chino    false    235   �2      �          0    16616    pageHistoryTags 
   TABLE DATA           B   COPY public."pageHistoryTags" (id, "pageId", "tagId") FROM stdin;
    public          chino    false    252   �2                0    16520 	   pageLinks 
   TABLE DATA           G   COPY public."pageLinks" (id, path, "localeCode", "pageId") FROM stdin;
    public          chino    false    237   
3      �          0    16633    pageTags 
   TABLE DATA           ;   COPY public."pageTags" (id, "pageId", "tagId") FROM stdin;
    public          chino    false    254   '3      �          0    16537    pageTree 
   TABLE DATA           �   COPY public."pageTree" (id, path, depth, title, "isPrivate", "isFolder", "privateNS", parent, "pageId", "localeCode", ancestors) FROM stdin;
    public          chino    false    240   D3      �          0    16527    pages 
   TABLE DATA             COPY public.pages (id, path, hash, title, description, "isPrivate", "isPublished", "privateNS", "publishStartDate", "publishEndDate", content, render, toc, "contentType", "createdAt", "updatedAt", "editorKey", "localeCode", "authorId", "creatorId", extra) FROM stdin;
    public          chino    false    239   �3      �          0    16546 	   renderers 
   TABLE DATA           =   COPY public.renderers (key, "isEnabled", config) FROM stdin;
    public          chino    false    241   �4      �          0    16554    searchEngines 
   TABLE DATA           C   COPY public."searchEngines" (key, "isEnabled", config) FROM stdin;
    public          chino    false    242   �6      �          0    16857    sessions 
   TABLE DATA           6   COPY public.sessions (sid, sess, expired) FROM stdin;
    public          chino    false    262   8      �          0    16562    settings 
   TABLE DATA           ;   COPY public.settings (key, value, "updatedAt") FROM stdin;
    public          chino    false    243   38      �          0    16569    storage 
   TABLE DATA           X   COPY public.storage (key, "isEnabled", mode, config, "syncInterval", state) FROM stdin;
    public          chino    false    244   B      �          0    16579    tags 
   TABLE DATA           H   COPY public.tags (id, tag, title, "createdAt", "updatedAt") FROM stdin;
    public          chino    false    246   QD      �          0    16799    userAvatars 
   TABLE DATA           1   COPY public."userAvatars" (id, data) FROM stdin;
    public          chino    false    260   nD      �          0    16650 
   userGroups 
   TABLE DATA           ?   COPY public."userGroups" (id, "userId", "groupId") FROM stdin;
    public          chino    false    256   �D      �          0    16590    userKeys 
   TABLE DATA           Z   COPY public."userKeys" (id, kind, token, "createdAt", "validUntil", "userId") FROM stdin;
    public          chino    false    248   �D      �          0    16599    users 
   TABLE DATA           :  COPY public.users (id, email, name, "providerId", password, "tfaIsActive", "tfaSecret", "jobTitle", location, "pictureUrl", timezone, "isSystem", "isActive", "isVerified", "mustChangePwd", "createdAt", "updatedAt", "providerKey", "localeCode", "defaultEditor", "lastLoginAt", "dateFormat", appearance) FROM stdin;
    public          chino    false    250   �D      �           0    0    apiKeys_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."apiKeys_id_seq"', 1, false);
          public          chino    false    257            �           0    0    assetFolders_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."assetFolders_id_seq"', 1, false);
          public          chino    false    223            �           0    0    assets_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.assets_id_seq', 1, false);
          public          chino    false    220            �           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 1, false);
          public          chino    false    226            �           0    0    groups_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.groups_id_seq', 2, true);
          public          chino    false    229            �           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 16, true);
          public          chino    false    215            �           0    0    migrations_lock_index_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.migrations_lock_index_seq', 1, true);
          public          chino    false    217            �           0    0    pageHistoryTags_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."pageHistoryTags_id_seq"', 1, false);
          public          chino    false    251            �           0    0    pageHistory_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."pageHistory_id_seq"', 1, false);
          public          chino    false    234            �           0    0    pageLinks_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."pageLinks_id_seq"', 1, false);
          public          chino    false    236            �           0    0    pageTags_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."pageTags_id_seq"', 1, false);
          public          chino    false    253            �           0    0    pages_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.pages_id_seq', 1, true);
          public          chino    false    238            �           0    0    tags_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.tags_id_seq', 1, false);
          public          chino    false    245            �           0    0    userGroups_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."userGroups_id_seq"', 2, true);
          public          chino    false    255            �           0    0    userKeys_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."userKeys_id_seq"', 1, false);
          public          chino    false    247            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          chino    false    249            �           2606    16412    analytics analytics_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.analytics
    ADD CONSTRAINT analytics_pkey PRIMARY KEY (key);
 B   ALTER TABLE ONLY public.analytics DROP CONSTRAINT analytics_pkey;
       public            chino    false    219            �           2606    16776    apiKeys apiKeys_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."apiKeys"
    ADD CONSTRAINT "apiKeys_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."apiKeys" DROP CONSTRAINT "apiKeys_pkey";
       public            chino    false    258            �           2606    16431    assetData assetData_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."assetData"
    ADD CONSTRAINT "assetData_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."assetData" DROP CONSTRAINT "assetData_pkey";
       public            chino    false    222            �           2606    16440    assetFolders assetFolders_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."assetFolders"
    ADD CONSTRAINT "assetFolders_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."assetFolders" DROP CONSTRAINT "assetFolders_pkey";
       public            chino    false    224            �           2606    16424    assets assets_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.assets DROP CONSTRAINT assets_pkey;
       public            chino    false    221            �           2606    16454 "   authentication authentication_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.authentication
    ADD CONSTRAINT authentication_pkey PRIMARY KEY (key);
 L   ALTER TABLE ONLY public.authentication DROP CONSTRAINT authentication_pkey;
       public            chino    false    225            �           2606    16789 &   commentProviders commentProviders_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."commentProviders"
    ADD CONSTRAINT "commentProviders_pkey" PRIMARY KEY (key);
 T   ALTER TABLE ONLY public."commentProviders" DROP CONSTRAINT "commentProviders_pkey";
       public            chino    false    259            �           2606    16463    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            chino    false    227            �           2606    16471    editors editors_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.editors
    ADD CONSTRAINT editors_pkey PRIMARY KEY (key);
 >   ALTER TABLE ONLY public.editors DROP CONSTRAINT editors_pkey;
       public            chino    false    228            �           2606    16481    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            chino    false    230            �           2606    16490    locales locales_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.locales
    ADD CONSTRAINT locales_pkey PRIMARY KEY (code);
 >   ALTER TABLE ONLY public.locales DROP CONSTRAINT locales_pkey;
       public            chino    false    231            �           2606    16499    loggers loggers_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.loggers
    ADD CONSTRAINT loggers_pkey PRIMARY KEY (key);
 >   ALTER TABLE ONLY public.loggers DROP CONSTRAINT loggers_pkey;
       public            chino    false    232                       2606    16404 $   migrations_lock migrations_lock_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.migrations_lock
    ADD CONSTRAINT migrations_lock_pkey PRIMARY KEY (index);
 N   ALTER TABLE ONLY public.migrations_lock DROP CONSTRAINT migrations_lock_pkey;
       public            chino    false    218            }           2606    16397    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            chino    false    216            �           2606    16506    navigation navigation_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.navigation
    ADD CONSTRAINT navigation_pkey PRIMARY KEY (key);
 D   ALTER TABLE ONLY public.navigation DROP CONSTRAINT navigation_pkey;
       public            chino    false    233            �           2606    16621 $   pageHistoryTags pageHistoryTags_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."pageHistoryTags"
    ADD CONSTRAINT "pageHistoryTags_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."pageHistoryTags" DROP CONSTRAINT "pageHistoryTags_pkey";
       public            chino    false    252            �           2606    16518    pageHistory pageHistory_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."pageHistory"
    ADD CONSTRAINT "pageHistory_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."pageHistory" DROP CONSTRAINT "pageHistory_pkey";
       public            chino    false    235            �           2606    16525    pageLinks pageLinks_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."pageLinks"
    ADD CONSTRAINT "pageLinks_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."pageLinks" DROP CONSTRAINT "pageLinks_pkey";
       public            chino    false    237            �           2606    16638    pageTags pageTags_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."pageTags"
    ADD CONSTRAINT "pageTags_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."pageTags" DROP CONSTRAINT "pageTags_pkey";
       public            chino    false    254            �           2606    16545    pageTree pageTree_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."pageTree"
    ADD CONSTRAINT "pageTree_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."pageTree" DROP CONSTRAINT "pageTree_pkey";
       public            chino    false    240            �           2606    16536    pages pages_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_pkey;
       public            chino    false    239            �           2606    16553    renderers renderers_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.renderers
    ADD CONSTRAINT renderers_pkey PRIMARY KEY (key);
 B   ALTER TABLE ONLY public.renderers DROP CONSTRAINT renderers_pkey;
       public            chino    false    241            �           2606    16561     searchEngines searchEngines_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."searchEngines"
    ADD CONSTRAINT "searchEngines_pkey" PRIMARY KEY (key);
 N   ALTER TABLE ONLY public."searchEngines" DROP CONSTRAINT "searchEngines_pkey";
       public            chino    false    242            �           2606    16863    sessions sessions_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (sid);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            chino    false    262            �           2606    16568    settings settings_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (key);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public            chino    false    243            �           2606    16577    storage storage_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_pkey PRIMARY KEY (key);
 >   ALTER TABLE ONLY public.storage DROP CONSTRAINT storage_pkey;
       public            chino    false    244            �           2606    16586    tags tags_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public            chino    false    246            �           2606    16588    tags tags_tag_unique 
   CONSTRAINT     N   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_tag_unique UNIQUE (tag);
 >   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_tag_unique;
       public            chino    false    246            �           2606    16805    userAvatars userAvatars_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."userAvatars"
    ADD CONSTRAINT "userAvatars_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."userAvatars" DROP CONSTRAINT "userAvatars_pkey";
       public            chino    false    260            �           2606    16655    userGroups userGroups_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."userGroups"
    ADD CONSTRAINT "userGroups_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."userGroups" DROP CONSTRAINT "userGroups_pkey";
       public            chino    false    256            �           2606    16597    userKeys userKeys_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."userKeys"
    ADD CONSTRAINT "userKeys_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."userKeys" DROP CONSTRAINT "userKeys_pkey";
       public            chino    false    248            �           2606    16614    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            chino    false    250            �           2606    16766 $   users users_providerkey_email_unique 
   CONSTRAINT     o   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_providerkey_email_unique UNIQUE ("providerKey", email);
 N   ALTER TABLE ONLY public.users DROP CONSTRAINT users_providerkey_email_unique;
       public            chino    false    250    250            �           1259    16706    pagelinks_path_localecode_index    INDEX     e   CREATE INDEX pagelinks_path_localecode_index ON public."pageLinks" USING btree (path, "localeCode");
 3   DROP INDEX public.pagelinks_path_localecode_index;
       public            chino    false    237    237            �           1259    16864    sessions_expired_index    INDEX     N   CREATE INDEX sessions_expired_index ON public.sessions USING btree (expired);
 *   DROP INDEX public.sessions_expired_index;
       public            chino    false    262            �           2606    16441 *   assetFolders assetfolders_parentid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."assetFolders"
    ADD CONSTRAINT assetfolders_parentid_foreign FOREIGN KEY ("parentId") REFERENCES public."assetFolders"(id);
 V   ALTER TABLE ONLY public."assetFolders" DROP CONSTRAINT assetfolders_parentid_foreign;
       public          chino    false    224    3463    224            �           2606    16671    assets assets_authorid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_authorid_foreign FOREIGN KEY ("authorId") REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.assets DROP CONSTRAINT assets_authorid_foreign;
       public          chino    false    250    3502    221            �           2606    16666    assets assets_folderid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_folderid_foreign FOREIGN KEY ("folderId") REFERENCES public."assetFolders"(id);
 H   ALTER TABLE ONLY public.assets DROP CONSTRAINT assets_folderid_foreign;
       public          chino    false    224    221    3463            �           2606    16681 "   comments comments_authorid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_authorid_foreign FOREIGN KEY ("authorId") REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_authorid_foreign;
       public          chino    false    3502    227    250            �           2606    16676     comments comments_pageid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pageid_foreign FOREIGN KEY ("pageId") REFERENCES public.pages(id);
 J   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pageid_foreign;
       public          chino    false    239    227    3484            �           2606    16696 (   pageHistory pagehistory_authorid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."pageHistory"
    ADD CONSTRAINT pagehistory_authorid_foreign FOREIGN KEY ("authorId") REFERENCES public.users(id);
 T   ALTER TABLE ONLY public."pageHistory" DROP CONSTRAINT pagehistory_authorid_foreign;
       public          chino    false    3502    250    235            �           2606    16686 )   pageHistory pagehistory_editorkey_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."pageHistory"
    ADD CONSTRAINT pagehistory_editorkey_foreign FOREIGN KEY ("editorKey") REFERENCES public.editors(key);
 U   ALTER TABLE ONLY public."pageHistory" DROP CONSTRAINT pagehistory_editorkey_foreign;
       public          chino    false    228    235    3469            �           2606    16691 *   pageHistory pagehistory_localecode_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."pageHistory"
    ADD CONSTRAINT pagehistory_localecode_foreign FOREIGN KEY ("localeCode") REFERENCES public.locales(code);
 V   ALTER TABLE ONLY public."pageHistory" DROP CONSTRAINT pagehistory_localecode_foreign;
       public          chino    false    231    235    3473            �           2606    16622 .   pageHistoryTags pagehistorytags_pageid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."pageHistoryTags"
    ADD CONSTRAINT pagehistorytags_pageid_foreign FOREIGN KEY ("pageId") REFERENCES public."pageHistory"(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public."pageHistoryTags" DROP CONSTRAINT pagehistorytags_pageid_foreign;
       public          chino    false    235    252    3479            �           2606    16627 -   pageHistoryTags pagehistorytags_tagid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."pageHistoryTags"
    ADD CONSTRAINT pagehistorytags_tagid_foreign FOREIGN KEY ("tagId") REFERENCES public.tags(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public."pageHistoryTags" DROP CONSTRAINT pagehistorytags_tagid_foreign;
       public          chino    false    3496    252    246            �           2606    16701 "   pageLinks pagelinks_pageid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."pageLinks"
    ADD CONSTRAINT pagelinks_pageid_foreign FOREIGN KEY ("pageId") REFERENCES public.pages(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."pageLinks" DROP CONSTRAINT pagelinks_pageid_foreign;
       public          chino    false    237    239    3484            �           2606    16717    pages pages_authorid_foreign    FK CONSTRAINT     ~   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_authorid_foreign FOREIGN KEY ("authorId") REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_authorid_foreign;
       public          chino    false    250    239    3502            �           2606    16722    pages pages_creatorid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_creatorid_foreign FOREIGN KEY ("creatorId") REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_creatorid_foreign;
       public          chino    false    3502    250    239            �           2606    16707    pages pages_editorkey_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_editorkey_foreign FOREIGN KEY ("editorKey") REFERENCES public.editors(key);
 G   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_editorkey_foreign;
       public          chino    false    3469    228    239            �           2606    16712    pages pages_localecode_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_localecode_foreign FOREIGN KEY ("localeCode") REFERENCES public.locales(code);
 H   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_localecode_foreign;
       public          chino    false    231    239    3473            �           2606    16639     pageTags pagetags_pageid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."pageTags"
    ADD CONSTRAINT pagetags_pageid_foreign FOREIGN KEY ("pageId") REFERENCES public.pages(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public."pageTags" DROP CONSTRAINT pagetags_pageid_foreign;
       public          chino    false    3484    254    239            �           2606    16644    pageTags pagetags_tagid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."pageTags"
    ADD CONSTRAINT pagetags_tagid_foreign FOREIGN KEY ("tagId") REFERENCES public.tags(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."pageTags" DROP CONSTRAINT pagetags_tagid_foreign;
       public          chino    false    254    3496    246            �           2606    16737 $   pageTree pagetree_localecode_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."pageTree"
    ADD CONSTRAINT pagetree_localecode_foreign FOREIGN KEY ("localeCode") REFERENCES public.locales(code);
 P   ALTER TABLE ONLY public."pageTree" DROP CONSTRAINT pagetree_localecode_foreign;
       public          chino    false    231    240    3473            �           2606    16732     pageTree pagetree_pageid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."pageTree"
    ADD CONSTRAINT pagetree_pageid_foreign FOREIGN KEY ("pageId") REFERENCES public.pages(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public."pageTree" DROP CONSTRAINT pagetree_pageid_foreign;
       public          chino    false    239    3484    240            �           2606    16727     pageTree pagetree_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."pageTree"
    ADD CONSTRAINT pagetree_parent_foreign FOREIGN KEY (parent) REFERENCES public."pageTree"(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public."pageTree" DROP CONSTRAINT pagetree_parent_foreign;
       public          chino    false    240    3486    240            �           2606    16661 %   userGroups usergroups_groupid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."userGroups"
    ADD CONSTRAINT usergroups_groupid_foreign FOREIGN KEY ("groupId") REFERENCES public.groups(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."userGroups" DROP CONSTRAINT usergroups_groupid_foreign;
       public          chino    false    256    230    3471            �           2606    16656 $   userGroups usergroups_userid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."userGroups"
    ADD CONSTRAINT usergroups_userid_foreign FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public."userGroups" DROP CONSTRAINT usergroups_userid_foreign;
       public          chino    false    256    250    3502            �           2606    16742     userKeys userkeys_userid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."userKeys"
    ADD CONSTRAINT userkeys_userid_foreign FOREIGN KEY ("userId") REFERENCES public.users(id);
 L   ALTER TABLE ONLY public."userKeys" DROP CONSTRAINT userkeys_userid_foreign;
       public          chino    false    3502    250    248            �           2606    16760 !   users users_defaulteditor_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_defaulteditor_foreign FOREIGN KEY ("defaultEditor") REFERENCES public.editors(key);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT users_defaulteditor_foreign;
       public          chino    false    228    250    3469            �           2606    16755    users users_localecode_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_localecode_foreign FOREIGN KEY ("localeCode") REFERENCES public.locales(code);
 H   ALTER TABLE ONLY public.users DROP CONSTRAINT users_localecode_foreign;
       public          chino    false    231    250    3473            �           2606    16750    users users_providerkey_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_providerkey_foreign FOREIGN KEY ("providerKey") REFERENCES public.authentication(key);
 I   ALTER TABLE ONLY public.users DROP CONSTRAINT users_providerkey_foreign;
       public          chino    false    250    225    3465            m   w  x�}R=S�0����i��u���c6�Q����������M�pSl����g$��4\�.��tQ����'ܕ˲�5P�}�ӈ�ݽ
�5����8�ѫݍ����2�lP��fZJ7"ϻ�개�R��p��ʰ[�,��#|�	��5]�!��oH���	+Ў3{�A�*HqR���e�ZY�\n�[��zl5�N)�G��X{���l�e�?��S2�Y��|H�'��Ie,�&1x�
Z2#G��x�8ŝ']�5B��5���U
�G=%�r�W_b��A�.9̤��cxs&�Ԩ�g}8��_�/BZ�q-P�X{4:ih�PJ���sPс�k��z��.c�?#b�/d�����>GW���{U�7s���      �      x������ � �      p      x������ � �      r      x������ � �      o      x������ � �      s   ,   x���ON��,ᬮ�L�V*S����E08s�
|@$W� �%F      �      x������ � �      �   �   x�E���0D��3<��-33����j�@�VB�'!�ӽw��0�nrOPj+5� ;P6:a�Oz�TK!��a,j(��-��jv�8i����.�4��Ywpf-d���r����}�X�n˘R]�����*�4{      u      x������ � �      v   K   x�K,��L㬮�J,N��L�O��SS2K򋠼��T+7�(;%�<���+**JM.�ȕWg�W�C81z\\\ ��N      x   �   x�����0���1:B�T�1�+���Њ$�%\��ݽ�č����|��� aV��@f�S���@0���iI <�4�)/��(��{��Dy�.v����@���(-'�K֠ L���[kf|�f�f���6�~�+�#A��=r��K�ڸ�ɇ�$lR!v8}�Vz�ٶ[�"Z�3J�L]_      y      x��}�r����%\�R,f|ҍ�"E�6)�5Z;��&P {�膻�`h_c�l3�̬C�f�o�Nh��:u���\����h�,M=z�0�7M�[~Z6����w�ћѹ<���h�
/�my}�S���_��a�����eQ��n��
u���o��lLu�r���S̓��}ݻ�s�]QV�U�ݪ����7�Ӣ��{�٬���ި��eSw�Ѯ��'�C�+ꩯ��7�5�u�3J;�ǽ�j�i���2+�iѢ�>Qk���/�����}y��Y���_y���ި�s��J�Ч=��ন�}�w��7Z���{�ƹ>퍚[z=�=3�ٟqj�\V�:���]��=����1F��|㗚/����cgt�I���������c4x��-�rQ�����G��J�Q�F��m_�C��eoT�B�<���7��~ʓv�߽ѵ�}+S���y�.��$������Wm}�\6Kt��\�п%/�WY��X���l��y@�wұ}"Ы��L�è/���tyC`̉n����M��wk��"t�++��YU3�nV�*o=wE`ʕ=ջ�	dN�꺹*��'�˪.V�M�Ҥ��}N�m�p]���i�pG9��� �mV��o-�e�R��R��i��*�E�q�$E9%��O
��ŒM����񩠙��O��0;kj%7o�83�N����P��q�\����n�x�W�?�l�Kn���~�����aH^����6��`ں��Pt�����j��"�|�$�N���ݗ�哼����s׾w]_�=E=KW�;8XU���5w=�v1[`���K]��sK����L��|̴��}�)׆���PT��f�
�?	:�1w��$�'���ӷ+�. �M�_t�����!���;*+��c���9I`,T�@}<�1;�����<�}}�����zq��O@���v�O �f���� �BW>�h�r��������^��M�^!�f08�P���ky=����0�A����w���`:�(z�������
R�;�q܉>蛾��i%;?,g�=O}Q�xܻ�״�SRS�9)�[=N���!�f�Nȕ�ى=�!|Y\w� f�	�n��ӂ��	=9~�#y�����^	��P)�����Υ����Zɷ^1�w!�V�ruU����ɛl�>܄흾�Z�t��]5���hy���#��@$~������HoN_7��}O�/���֭�ᾠ6�6�.���6ԟ�8Ў��vW�ᄶ9�ȼm�XE����+ X��fD���e��<>�����IpN�<$�)*y��v9C�taΓe�9�(8�'L�~�����t�a:ҳqĳk0���=<������NO�c�6��$���hk�N<�J9B�Z/�E7	��*P�KPB/�6�?� �j�#�֗!�N�|V�;�n���{&|��Bԛ��V�R��$��
�\���@�A{s���tvUk''����	6pxR��G��s��WuS?��lN̾�(��AB[=/]��Ͼ#���]W��$n����Ě惍B�"��{���0dA����g!A�#߶N�U��.1V�̵��e\3��=����C�_�ŭ h��D��8�VP־>��FNy �'����	�NH����>s���U1%"�9��0m�҃�Z��9��ҩ\֫G�)��vϘ�]ׁ�Y��2+�`Ċ��c�ߠ?Hsܜ����4��egr�q����P9�Z�|Vp�>/�["�x�Z�EC㪵>����$�ڒwk-���<�����W<xZ�d"����}[^��aO���
�w���d|S^���oW��zݰ���kN���$�=���>g��1��/C�����Sc��E*��x�X s!��0�t��_ ������8�������}X����f6B;��)�4����/@��L�N��҄��6ؗ�i����Ӻr��K_�>���I�o���^W���?��0�f�1r�	�Y*�^�d2b��m�Jzƕ)u�Ӫ\��r��D1������w�'��r "O���мIVK޼����P��\�Yƫ\��b$�-�j�iNjj��*%���j�"�un�E��"t0��
�=��+%-�LP
i�ZZ=P:���t��&�~�q�$s��*�z ��]G��^/�{~���|���+7M�?	��d�i�$o�SFZn�#y�u��b�ڪK�.�� �������N>h)��g�ԗEuk���>r>���qv'��8J�l�X��n��e�d���_�vs�#�Y���X~�#�=/Ԁr����tزx�߀�av���kE�g�&�%���x���0������>��T
"2������c������*,U���/Ѿ��\��p��+qM�{a�FX�FY�U9;ъ��ꌅO�O�k%Z1"�6`�Y-:�����N�aN�j�k2�B�AZ���'�IH�nX�-����ݠ5�F�;�*֣-{J�'���`h/�-4��f1/}���ͅP:ZkN�E+%i��@
���f��=�d�Ue���OAf
��uE�h���*F'��G^�J� ��S��'�%"�$�x�U�Ȓ�i�tͼwQ�S�{Nz�!�����u�\c�}�1b�t�2g��{��e���e��hW"z�T*x�A4qr�N�b�k4�~^dr�������&\TF����'��$�;%�1lL橖ف�?�_�Y�ͭ�ö���n�H�O)u�%q������
�XE�gk��X�-TM�-N�J�=�eM�*�����|�LX:�סԊS��N3�1n�Mox@EHGH���;>B��d[�4�U��
�tl��6�����x�l��=�M��P�b��tƴ�;d�{E���l� ¼�vl#�2��pX>��f��c.��$8�!4�3�FɃV���a�qڪ��q�M��7:"V�9���	1U�}���z�4��>�R@x|.�ᾀ96o�ӝ�m�d����uB�3ɨ�� J�("V
GW���(Y���i����M&+f��keτk'��S��tTZ��!D7L�6�Mh�(��r����	ɍj�X����V"���9�>-R5�J�6�Ý�g���d�==��F	� :@$[��b��!�qI��s^��*x��������B�%�`��nxN��=���$��7M�7��CK{�g�bE�t[�7ʦ�kή	1I�XNx^Zi�A���t�y/�e�*���6��+���`u]�1��d�5L��I ����i�~
��c8��?���rК&��<��t��f��2�W�'�3���*G+4,pZ3WN�il����Z��H�ivn�.��ȃ�[������3�cb���bb����l<�I6���37a�$����Aڱ��<G_ql%��}3l�����g�35�AC�0���US��>�0$�� �m9�y+��k�%�_��j�	�!��O�k�)�"�U�3�GR!3�\��'(%���M3�Z�!�A�A70w9T�Q�ޣ"M���7K"�U�@��g��#������X.J\�}�� lौ�a��̾��WL�~a����R�Pړ�ԉ'��iEKM�/�]�����3��?o���h��)�~4-�c���/�XӷG3R�҅��IٲC�Fȃ1�-A�>�q=oF�#ĳ$�ki�U��Y�=�t�E*󹭬�狓��J�#"D8#����_��V�5��]VP��o��_��M�/�7/^p���Z,�,O��3�D�
��%�Я�1 k�I�[��]�d3Ѿee8Âz��a���d#Td32��I�.�e��$uB��vh�v��E�Q��[�_}(' ��{�G�o.�7�C{�(�A����#��Z&�	d���������$�uGHq1	T��S��@ވ?k������V6$e�3 �T�uO���d�E��_a"�p�$1wb�h#�y��Q7tn�uE}7m˥�=d�Ӥ�B��~^��js�W,���V�Y���$�U1�)����Y�7��&���{,z�sb���:?|������Ё]]�x�b0�������O��)rt~�    ��c7��Þ;�D�z�A��j�lXA�������y��?~��G�;������[�Kx�gc"Y$Y8�� �m�O"=ٰ�L4Y��1�}_� ��7��!�9��Wy�j8�"@B��!I,I�Z��Pf~ת[s\`S��=`mdݥvIʰ�my���_r�Wl�G�c��CqQ˚�W~��t�?p����M��I�v/h���bd��n���<�*�XL�����,6�B7���f���en[U�^��@�M&d���O�i��I+�i��	��_�e�]z�M����m�=�b�kg�P��r����R6��Y�\�Xi5�#B-���w���s���Ѯ�S��n�L�~�t%�Y*ˌ͡�q�P�1Zkz����&�Wަy6<Te�|�2p� �xqU5W/X�"��3X��
k��Q�r���w��+F!(��<�Ϗ�s�(*���S��{:��גȱ�3V���2TA��'�Y�Ӵik� ~bi|�P�p2���w8�u��g����/�kP�%�S1}���xKC}=�� �֢�o6cP��U5�њ5o� r�a�o� ���',����eK=SGjà]I�����"��G&����-�呪��Ϻ�<,�=?U@�a�I� �|N�!#X[Б�_�mIG�+�BN(�W��R��'1��m�lKB�c�N�*3�=���D�w(iDW��μisj^��Ў�X�H��e1���(Pڬ$��dE�e��͏���͢��
�9�4a|���P�FO<&��e�|�E�l�,%Ƀ}��:�(�/�ɬm�2�et��(����os��]�I�d��E���osŽ�G� 8 �?N���`�f�Rc+*�<'��ǸB�KG�u��jޣgĭpA:����DX,cpH����Uu̶ϝ(�2��E�����3��m"ft��L�`�  �
lzrT��.�Y�2N3m0���1�sA���K��B�b�'�E���7���/�y�����������g��<�*��-�~�� �U�C���9+c3�Q׃�>�>p���V��4GE���p����u�Œ�O�Zz$hG�[uW!f��~�I�*��}��]b�z��^��OЖq�,�? NΕ�ua��� �,X�@/.����C ��7)}���S��YЄ��)�*�Ɂ��_0�)ۑ���jn�����j�pE*Kb-YF�N|B��,�%(gu��W��}�
��*�J,ʍ1�j{ڨ����<�g�vV�������Ne1,�x���G��J��;�3_-o�ɋ�3�ْ�?{��ڻ�@�.9�&���N2�c\ �� �D34:>��5A���~*7f�V�Zq���k�(�v��4ZU�2�3�΂�i�Ѥ�N`ǫI,���� ��a���oab[O����a�=�o����\�E�N�G�p/OO�y�(���6C��?*���.W�z$T{��!�zf�Fv0/�M`���jf�a��Q�f�6J����Я�@�ҥ��썘3#j��!s}D�D�x,-M�b��*�vW^������2Te�b}"��R,�p�Oh�����aZ�����}a��2�]�f�<7�R� �*�n�,�`XE��V�TE�QcS�%�A4�@��ց7$�p��5�c���<����%o��ϗ�g�Xۡd�!4w�4����2�R��q2���ف�<����.���.�Iu�}�b# /��P��\w��و�%Zdܤ�A<�T��%�1�G�GՓ�%(8Cڱ=���X �d�캐��/���لo�n��p���w�l��̀,�l
�Ɵ)��!�ЪAK$��D���~MU�1oS��(kG�\���e@�����¥��
�A��gI���,�m�|*(����[�`E`
�R;v���'��ڡ%���Ȗ2�s핖��;76Z[|oԵxUC�ؓ\�����{�,�&悧�&��&<�.fb>�s�P��\%	��[�/�Q ���Vӵ�H�+�ɓ��ec��sX�MT:�@C/㙭���ŭ��(��V�q��*><���l�X�<SYG�l�|��Bh ��YG�[]n�V(��OUԐ�`{ fg`�P�}5�鈎��~X&0%�6�f�c��8�\�%șv�o�Դ��D�.�h".�����D��X �5�0�4�t��*[?��>�ԏ�eV�S~�!E5�zF����0�`&�{����Sc��x@�ˀ^g;�I���~����a�����Z��F}aU�
�����,�d$N�Bm��a\f�49��u�<ڧC�O�8�l� t�ؾ.TQD��Lf�WK��������*j|�l��[l%,�$�����n�h��H[����Y*N����_�J_c���˥�Y�i~��}������*�n�PaY)+�#�~��Ya��&Vm���ƒg��-X�]��6�M�K�6
%����Ur�P�TV5b!�9���P&�L����؍�.�s4z��N���M:�(�����zc]	���hq���7�~�=��f?'�D�mlL+ާtt�z!��z�F��.�>�D���N�6�!Ύ�,�'�Rdӵ�3b�OͰJ>LF�u3�l�ل9��YG����E�
�e~���gE7c����ۅ?�0U`�#x0A�����X�8`�8���ǎ��wA���=�S!�d]G
�Ɯ�c1�Ԣ[*�)d���k�l&E���禘�]�M`}�F���~�X���}�6U��(S�<P$�f���d�J��6>%H�����k�Q���>���� ���eӱ�`��;�uI��D�x���/	��X.qH+^�b��}�<��$�|��U4�ms6�&�e��cN��_q�η�]Q�D��9�R��F'�g�UIk�Ƹ�R362�C���@߬>�у�)%���3�gS"����5倻��nQ�j#+?�M�x��g_��Y[��پ�9Jt�������Ɉ��@�`��"X�����|̺���U�^V�f�1Uϖ�C�)��LӬ!4j�	+1��}��t�/��b��$d��/1�?I	U�d�a��c6s�5b��NH�Y*d��4t���''�'G���	��T��1�QBֳ���`�_4��?�dC\�Q������@us�I���`�������P�-�%a�zDs�Ot�g��M���Z������p`�К��Z���`�,^�<ld�/m~��A>
-�n� R� ;�%�מ�|�]��7�=iy�ޑ/Mr����/�@%O��Vl��dN�M΁�F�M4iC��x�� ��ݺ�*O��ӧ��U�xb�IH�NG+�ӝ�?�t�՛�	V��ŗU�A��΁����pp�B����$V�#=f�K��9��8(����C���Ζ9A���k��'E����婏	��o�T/6���!������m҃w��]�|f�f�<_!~"� ��'�U�l"lD�cVuP|A�ߒ+.=&&�>O���c'dFK�N5h0&ǲ
���v�c��A��_��_�tHe�
?&f��+��Af�}m/��DJ�G���FH��vI NQ���/"���� ����܋'�`Zvy7�uAd7�W�=�֜o�)�f�GKVĪ0�����7�Vj �1D�FV�9��BlB,1L`��m�(<�]ȭ)����D�`2�9_	>���y�����)j/!>�-��m�%;�;�t�x���h��l�@�W?��t�PI��Ѫ,�b����Z#f؈ ��ƢACF!|B"�I�/ݬE��:���*��L���֪��~C�I��
���x ���2O�6%If"�(�J;e�*�,���.�:HT밠��5߮j���D��,3!��1{�K��3����u7`��h�@�RF�6M3��j���YFikZ+dj5�%$�7���+�mJYP�\�+i��޼d�ٽ7�Τq�N��5:���$��QJ̌D�W+r��a�>�����` �\P�֢�;hQ� ����l�o�%��p�������^��vc ;��dH��Oi)V���}IJs�M�S��TN��K^�J��YǶL�U|�o�Z��?Z�C�c�^�@���f�RV��z�(�ҙ����{�X�|�.��2C��d�9    �K�n���4n-a����J:� ���R��i T"�̈́�����Yav:۷��Z@E����\�i%V�q�D=�T��@��0�+8���fl�춂>(�v�/���!d[����eKΫ?#�~����[�sZ�N��I�7��遁ؤ��+��?,����y^�%�i��ɧ�KH�PqNF�����>�raoWeؑ���j+�"a7�1�bIf�������2�EW`������?�ogR~�Ș��R�Sd�XB�o���w6<�%#z�6��Gjf���'����A?���g�/���S��������iٜ?��E��H1��զT�H���s'a�e��7��'r/b�]>��΋�]�'�T���M`?��#"4	�;y�Z�-���`��*`�p����cP����m�Q["��U(����]"�A[C*\�RUE��K�MTSi0"����r���3�'f��-1�̅tcE��D�?����N���U�E*��;���6��ٻn��Ik/�i%��$Hq��2��Cp��Z�d�<���.���+��1ޅ�3��W�I��3��5�E (�s�U�D����Ԩ�e��@2\ZB����`���P�A1 F֎%� �URn.���")����.Ձ�����i���4��m�N�!|D%��\�2(�_|^ǀ�3��`�:�l���+�ۍE���k^�+waG��O8��Y�02i�O����:��1S���~c3yC4f�q����2H���ճU˘T糜���Kf���"m���R�ڊ���9jiug"K�n��\�E��T�/���3��^Ž�"*�@`�y����Y}y��}N��U'ʞ����uj�>�yV�Mԓ��%%0 ޱ���%��3�Z�jG��35'�y�V��*Ը�I��nu=����v��%_gˇ��^�-���[B�j܂��;�E���i�i�����6����HΙ��@����K_�r/�F�`w�%�W2���P���E��p[�c��5<��n�GD h��Y�|,2@8�N�+�%��V�� �r��[���=1m��8:�ӷ��Z00�z�d��,�����q�:�\>'�/�������c�t�Zj�H�V�{���uVCp��1=�kL�Ё+�����&°�r_�+z(����|�NXT�0���뻛��-�4������R�k�IԐtMx���]&c����q��?/84����i
�������Q^G'j�;���5�  "��#����'�b4��SI��h�%�_��pX���$pCMk矡[�%B}��	�����X�m���*<��j! ��eʚ�{-�B��0����z"I���Хӯ�}�$8��d��H�}F�qu�%ڋ<E�C�J�����F���i����M�&�O�F1��\/1+����4�n�
.'�[�O�+#q�H72
z%�YVH��jb�|*S
!]c7]�dv`ZXc|�d�G�����xw҅��O�ś߱�7��%��J4�_IDuU_��^h���a��)K�� ��3Sw�Ԑ?����$+�>�+�CUZ7�4E�Na������)���`�!g�X+'b<�|�B��8®9{���[�0E��bm a�X�s����I�g�A�R�4�� ~UX��I,�G-�z�q�K:=2��v��ӝƌ�GL9E��"��(M�9,�+�],�ky�p#�������?\����G�>��2wy��1h@���F�x��V��q�Ԙ�8C!9��v��H���[�� l���e�
31H��Lr������n�gYi���T���!�nR5�N��j�t�,��SbfD�nb���|��|�]4%��7����m���ߎO��F���V��M<�kH��z��˅���R�^�y#J=���!��`1��z/E� �j�B�eA$5/�����rzy�ZPs2ˡT�)���iӔ`U(z����4�������?1I��c�vy2���wO��Y�0��d��&�t}h�5L�ܗl��j�h�������g�E�%�!������/�E�����	c��1B/�Q�!�YvpJ]KL�2�Y6�/�{��;�4��э�а���Z�"�$�8M��Ό�4�E����s��q�G��2431����Y���C�^��^?Ċ�p��e�lSbhNgNm�q���S��F!?8��γ��[���.t8*�i6x�̜x�\�����l	�%ݨG@��6��QnJ/�/��ۭ]YA(S�̟�șjNcM7�P��%5Q��lI��e3@�u�bƩ8K���������	�\���
�\����6�!89��f�8��h~K�'`�ķPop"�ͪ!�k��\1�.ë����H�/����
 �)Ky��s���&�}�!�JP�5B�
���}���P[���m$�oj����N�]�>t2����*��K��_C+:��&7���=��_p��r�{�`!f���|ރ�6��_3���y�f�i����v�Z2C/ ��K1+An�s4HM�Y�.c��I0�b�x������2O�
z���X�I�EC�(��W���R�h%&�gΪ���#*�x��[M�9�eb���;/���;/��7 �����Ӽ�T���x���~f�kq��$����we�V��������@ŠD��MBk��J:!��*,f��|nn�N�;6[��-5� 	��S8�+�=�*���UK��������<Y�hQo��ha!�`�VL��_�ip[�\�Y�pN��`���Ubqe�'�����v-&͸���܆	J���X�ߝ��=����%��Xr�SS?�5"Z=�'�A=�!L���ZD��?�d����/_���.��$�n�|�W|t��?���8��΀mS7������RI{�e3������hhJQ�7� ����(��AP��P%�_z�������Ugʛx!ܖ��g�f^�|�	�㫩2��萶5�t�{|��&�%2;%B ��_%�kH	̫��L��4�}s�/�C<��7��ջ���=n[�0�-���vRD򎊉NWìV^̏��ׇu��?�3���q� *ܯ��o��	>��NpN\_?�����_���FJR�^�Ep�5��(g���{��	ԻX���K�P�lw������c�cyk i�ʍ��5'���dϠ�u/a���^֭AFo<ISC#�<����3��b*;��{����e�m���j�8�[��+�lݱ��f5�WE�%1�p�ʺ�����&^��UD�lx!��ރح�py����~$n�C��j́i슲wxs��I�\B3�i5����]�a���&x�� �]�n���b�7ѣ��=�Aj�_��
��9�7��-1�_���˯�^�іH�rVy���?
��\&S����)��f�=˄vخ���CtlK��#�"�w��L��(��
B�]hwL����-b�Iw����jڢ-+x�����l���u�c�^^4^Q̊���;Z���i�Z@��x�K��53�g��g�1�3�G�C�1�爝ݷEnh�x���ڊ;�@p��G�W����/:þ�.���]��h�@TZ�$�K����N|`W$�Q#1����$��vQ��J;I�� �#SNGm�Zp���%�Ipp X�r�^�7^|��9`/]�t�;��~��1hq�U�յ����Ex����zc�lvهD�ܼ�="��u��D��	��[�G�R
�9/k�aLLd��S�YX�*1�%$��(7���O���$R�ط�E��Jc!�t�3/3��Ih��KуȫH0oz]ZήP`���jn��}��5�f���FY(�M��f-^PziL|a%#�@��6&���I�#�0�B]R4XA��Y\�D4�|4x�kF��j��Ea�}{^�!��9�K��a-��qS�<��&�Z�*,K'{ApPP�Ih�L�1;�e["�c�ʹ��/QN��i�k�2T�PF�|��e�pJ�U{��%~0��������#�r��$��C�J�$º�0=�5�v&�B�L`�=��U5�Q�-z �  ��YWj-$�M��F�T�g����&���+4X�����D��Aվag�˳y�*ktK5��`����"cB��I;l�
�)�ﵞ��ap�M���d91��خ���^�mކc�S8h<my�]�������E}�j^q Ο{MQ2}���Y�}=F�U ��nW2:�GW,c��>v_�ǁ��@�Ū#�"� p��E��-�p>WJ�K
�o�ҫ��n�V�����C�O�}a�j�bm,�?b�d���
�0}k;j/,�]��o��6WY��
n�����E�\~�k�Ff�v,QR����^"Bl_���f�&j������I�����7�n��I#�'�>$���]��w���D�G�i�^鉡�Ƚ�w��vI"�5��~%aC��ě���b���٬d��,s��Q^tf�P!�y�o�8��UQ���dFu�����fe�>��+���o�eQ�pU�-�2�rw�ױ���.�C&xXIRw���ޥک���p�*Ĳ�u��P�CX�p�h�$<�c�&�H��e?Ǉѕ�����`��?����������6���]��P�v*=<���G��B{0	Ϝ���ߨ���_�������G��(��u�Ӯ�Q��O�
�:HȖ�Ъ� ��T�������4�,�,Y����/N�O��k�^������ؙ���*�>?�w��H|'��㉃3A��P��,��K����c��e�dܧ��I6�$�ʫe�pO@^�'�]�Q5�Xi|�<���aY\��"�+pJ����D=-���$��Q��؇�k�
*��+7��۵
1�qr0\����`�Ą��f�j��9��(�E�o�X��-���|b���`�3
���4�p����Y�O������W\�M	�ˈzN�?#�.|�T�i�+ kxH���g$�9����dī�@�i�EQH��������A����C�*������2��A�g�L4&�p�����=�;Xr������Z��'uf�=�o���9l@v��ܜ5o�B�T���`1=��"�:�%�����5��W�k�T}������X>��Ù%
7�D�Χ���oĖ@��|�ֽ�g��T|EW�-M3�|�u'ߏ:�$�F�Mlm"#�WT"^֕�cc��=��8!4�/T��=?!P�p+�C �/��]��'J�pA��XB��2B����Ğ�v'�A	� $�iK'��f���TF�Fse����Ij�@O�~c[�R�}�RF����4!2��d�`"�����|��3��װ�(Q �4|�oV��"���j��C_��S�F�j�
Q�(qA�K���B���/�W��{����[ų )ޭ��p���:���;54mj=�w�%/�?�;n-�B/&��-ϳ�*7�а�캠K���83�I��3sd�I;������+Ħ	ϥ�+p�o'�v�ɣ�Wn�ʠ��3�`�"%NT�Q3�*[��}(@�e�����Bk�$�.�����b��N���l�CF�K��H�x��J��X�@L2?�'b�̕�HK���a��옫���hv��:�A���6	�6��NC:Z0���z��1�	�����m3/�"�oFE��p�F���O�vhk�������:Q�ʓA���~j�(�"�.6��p�ۭ�~�.��i]�_z�n�X��z�A�ؙT��˝F%ߺ�NA��}K���;�`��W<:�0�Y0�+%��>�m��VY�|�X���`2iR�Q�5>'�C"��%�RR��4�s������cjt�82p%8G3��j`�+5r��Av"�d���R��@�)��z�B����7��t��CtU��߳�*�0�2��M,��+c��B�#�%��zG�%pL�%�م�)ߏ/iN�����"'L�a��7�\ 8~3�����Uy���˗�y�����|��������������z��?��[2�4��^���5��o� \��      z   �   x�m��
�0D��3<�ҹ��En�ؕ��4���C�q!�t�w� ����B�g5n�J���X�����Ac�������O�@3G��X�]�/�gU�fб�	���4���B:2GּGN,u��F���N8%r�A��R�E��<�Ƙ/�h]�      j   �   x�}��C!�3L�~DL蟥����B�g�c�l������4��p�^�v+$�բb1���aþ �37��t:����4e-�#!X��WƂ&JaN�����`0��e�r]Ņ��nŁ`��#�d��ۡ��Ф�������Թ�Gj���~       l      x�3�4������ V      {   �   x�U���0��1z���(��^�yS[Zu��(&���n�1�8�;��c���K����,�ur.Y6�,أaw[��`�4�3���(�䕂D����2��;�n��o,�]�	]�D�-1?� �����c7|�'���0�'o��?}����N7M�T��B���B@      }      x������ � �      �      x������ � �            x������ � �      �      x������ � �      �   4   x�3����M�4�� R
�ٙ
n���E��i@�B���y�ѱ\1z\\\ k
      �     x���MN�0�דSD�Īic7N��f�`ÆJH�Y8�T6M��6bQ�Z���R$�`�f3o~���nGP�5W�r"a|2Ie�M7�Hǌb)�Td�
�����lMx+ի��� (4+���c�b�b��U[���r��b��Sִ��Y��j�s3���4ɚ,�����;��,d�-mfxu1�|��ҝ�����2�_����a�� ��I�#� �6Mm��|�>�A�]<�"�yē9��|�'�0������H��T�Y�X_|v�Չ�>�c�A����      �     x��T�n�0=���J/{▶�6ڲ��T{�C�����=�V��C$�J{�ޛ7~�< .�27ٽ�8�ٻp����(b���ъ���Z-B��f��{�)�Uo�� ��{֖�(��8� �3�>J]9�@9��A�<�B�
�Ol7��i�jAde��i���x�֞�>H(,����
|
U����s	��#�� 	�d>Ϙy+�x���&y1YϾ@)�>Xh��E�X��C��x*�4�ߴX�W�5�*7�^���D��B��1��q�E����9� �Ӥcc8������H�s�%])Ƴ��.�x����%s*E�m�YCz܎^�N��K��N��Z�fO�v�vg�����6�E�EIԸ���
�\��U��n��x���)1�7*_����?�W$�vv�:<�R,�%B�t�u�:v�{C��\�&_�~;��hN���g��:����\n�����{Aᳰ/&Y=����?ݧW#9��c�����N�A#�%��~ϣ(�`��/      �   A  x�}�?O�0���cxn+�b�� ����p.�	Ƕ|��U�;�$l�g���;pup�jv1�4kc�z�g<�g�%_�E�M�/��Ï2�@~|������SB��x����ͮ�"�_1�6�<^�Q|��NL����_��>c�]�̘�dqJ��˖��˯��.}�NӐe�d��6}`�1������£�U����	�PED]%u87�8�o �\�ۜ1���F�����z�;����1N�Ƌ6g�7}тפa��QC�	�͓���j�S;�F{rpix�;d�Ί�!�V���ɖ�c
lP�iDb�����\E�pŲ�      �      x������ � �      �   �	  x��WY��H~���z���}��9m���hő�a��oRU����j�vKV)32����i,~��)��4)xzy����VV������il+������l�N��or4��P���ӟ��(N=��3Nz��3/�����S
�q�jN���叧j����!��\�t��Kˤ��:�M=�~� ]i�:�ء�)�Q�`�<*R��]�JŠ�x�����L?ow�EY�^EҎ<9zQ��IL�:��zG����R�W��v�~�3�l�7%9���P����x�).���tWdu6��Qs�pS�Y�Yњ=�7��a�G��n��3�W�P��^�}+P_�3j�n�obl�KM8Ҽ�t[���*Љm��V��ƈ�����8v*V��V��'��bS�d8�����J*�n�ĉ!|c�e�زÝ�Y�ŉ�[�_Ss��]��w���痧nJ�2]���	��ٟ!��{���φ�.��[ci� ���<�?P!�);��@����� �������ф�҄|�	�)M��L� S�����2 ���@F����#�/4:��{�۷}�>{s^>�_d[t­'/NI��5y���g���EA�B
-2<�
"KH���<Iq<A!������FC�X��ҝ��q�ۻ�h�D�bώ���l��[M�3[,�U�-�7æ�%p/A;�Rة�s={G+>��&�VY�؞�UxY�GpIg�D����O�B<8;����u$�@�r�p�?h7F(,�n���
��$��{S(�N#��D�9���T����T�/�ē��ﬤ5�.��';!��<�)RK$<GU��ǫ�X1�b����|\+�&J"5"O��)�F�0)ZWW}u���\=��S�z�z��PB!&��ϩ|��.��z�p͠[4���g]YwLw��!;��Y��K�Y��qM�z��Zy|�Ɣ}�p��57��N)?��������f��mBM�^�zQ �x� Fr,˲Ĝ)�Xazoe������:2&1��	�#��l�B�Tk�����E3L��C���$���W�D$5���
d^E�x��CX��Y�	t)���S3A�5�o����a�^u�t��l�a�2���#�Ѫ٪���F��[j����s�&|�U�]������ջT�����]u��"��V��I���;�y�6�����3m�l�P(Gck����]���N+�V�Z�����p�U��WM�.w�XѯVI��з/�M���4�:(�kxO/�BV*!q�}x���ӊd5|�S�B*.�����$��<(�*�s�!�3e�ũ_UY� y��,�S�;;��У@�${�v��C�<l_y��D��ȬQ84���cܕ�)�V���pcIZ�#mH)����(�6��/��F�.��#Q��]AͲ����o�	���2A�1�����.eD�����tt���m��,�2<BH1��UaZ��!��nZܕ�G�
��}� �7�r2�Z�@A�̿�瘡������'a,@��籷e�t�y�*b�r�4����T�����K�6����"�o�M�nk�^��*v�����_��P�iȏB��ި2�W����d�q��눤�CƵ]֘Ք��CE��p��H�Ǿ�bQ�G.L�i���	Z�'�zD8�wk���N�
������|Ц�t��@���ҫ�[A���BW<e����Q�z�/T����S��Fj@��� ��s)Eڑ@�oqHLB؎�;�(L"��30C':ف���<�����%�ߢVu�Ӧ}��L�.��FZ]�.�����;��;ntMG"�X����{5R�0�z��L����5;�@��O.Mp��������#�VL!��O��9?n��F���)z2�����k�����aGڞ���aOz�o�G;Y4���x�z�����m|l�����2����؞Ϡ����m�� [������ѧcw��d][6㻑l8����u�k.S�W�ײ��z�y���_��<Na5��0��u���͖�,H<����^��7���.Na@�^�~��믿����c5�`����X��G�.��y�����@oC��_����&X��6���H�z3���t꿻u}�Ϯk~L��O���6�2�Ь�vgUy�Z���ˌEf��5HǶ�K�}k���Or��OXb��!����;b�m�.���S	�CI��u{{��sm�tpA-�wS�K��c��/*�*rAڃoD�x�2t7�4�4��)��i��t��� cH�r�28��8����Nh�C}T�i��9��_J��&Nj�}kZ�����h�'3�G���$࿘��g. G �K>T�@E8��Y����d ��z\H�e�����2m�,9s�J��lN�C�u���6]�8�q.��O�0XWSW�q��)����5p��J�$/�/ߤ�[Ά4n\_�~��}
���,?�J8�X�5x'���]��v��o_?}��of�      �   =  x��UMo�0='�b�9����~��>:Kzۅ�[�,	�����Gٲ�;5ЛESz������3[S9������T���d��aӭ���FS��(9L�8(p'�q���<�6��H��k�E�K]pv�D�ݝ�����XY��t���|o�FJBI��K����C�E�1�ި�E����BzPF ���[#u ӍX�/�Ȃ@J����}-�='V��X��6�����d�tZ�e�!x������P�S���� k7��؊	 E��	���S��gj��Ծ�56d��JhͣS��-����Z���d�Y�������~m��\�oytPG����C��~OV���p@R<:=�^� �ٸ(E���_W���H�������hØ��)��m%[�lZP?��H0�r𐅪C/�
�Z[G�,��FjpCY,������7߫մA�����)-�R�^'���VY�=?I�iG2�'���7�*�sj�a�0�E�{���m}�����=~=��z[��۱��P�n�㯫�E;t�������_���<�t@8�ǩ�A���,<Y�*M(�W:����Z�      �      x������ � �      �      x������ � �      �      x�3�4�4�2�B�=... 
      �      x������ � �      �   �   x�}��n�0E����;�y���� ATZ!!+���Ñ�ĥ_�&���F���G�9�=�̒����8.Tɸ�S �#����gܞ��.�L#���a��]�IQ?�<����J��@�tyQ��� U/;̻V6�-+,��ŗZ6�3��Gܡ�!�Y��&iW�0���hÃ-��~h��p[���氟gO��ނa(w1{����+�?�m5��~�A��/�	#�>-i     