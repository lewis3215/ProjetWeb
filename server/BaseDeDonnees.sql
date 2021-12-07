PGDMP         3                y            web_project #   12.9 (Ubuntu 12.9-0ubuntu0.20.04.1) #   12.9 (Ubuntu 12.9-0ubuntu0.20.04.1) +    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16416    web_project    DATABASE     }   CREATE DATABASE web_project WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'fr_FR.UTF-8' LC_CTYPE = 'fr_FR.UTF-8';
    DROP DATABASE web_project;
                postgres    false            �            1259    16417    admins    TABLE     ^   CREATE TABLE public.admins (
    id integer NOT NULL,
    password text,
    last_log date
);
    DROP TABLE public.admins;
       public         heap    postgres    false            �            1259    16423    admins_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.admins_id_seq;
       public          postgres    false    202            �           0    0    admins_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;
          public          postgres    false    203            �            1259    16425    articles    TABLE     �   CREATE TABLE public.articles (
    id integer NOT NULL,
    name text,
    description text,
    price integer,
    image text
);
    DROP TABLE public.articles;
       public         heap    postgres    false            �            1259    16431    articles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.articles_id_seq;
       public          postgres    false    204            �           0    0    articles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;
          public          postgres    false    205            �            1259    16433    events    TABLE     �   CREATE TABLE public.events (
    id integer NOT NULL,
    nom text,
    description text,
    image text,
    created date,
    available_seats integer NOT NULL,
    localisation text,
    "from" date,
    "to" date
);
    DROP TABLE public.events;
       public         heap    postgres    false            �            1259    16439    events_id_seq    SEQUENCE     �   CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.events_id_seq;
       public          postgres    false    206            �           0    0    events_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;
          public          postgres    false    207            �            1259    16441    participations    TABLE     �   CREATE TABLE public.participations (
    id integer NOT NULL,
    "codeQr" text,
    user_id integer NOT NULL,
    event_id integer NOT NULL
);
 "   DROP TABLE public.participations;
       public         heap    postgres    false            �            1259    16447    participations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.participations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.participations_id_seq;
       public          postgres    false    208            �           0    0    participations_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.participations_id_seq OWNED BY public.participations.id;
          public          postgres    false    209            �            1259    16449    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    nom text,
    prenom text,
    mail text,
    password text,
    identity_card text,
    created date,
    last_log date,
    statut integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16455    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    210            �           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    211            5           2604    16496 	   admins id    DEFAULT     f   ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);
 8   ALTER TABLE public.admins ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            6           2604    16497    articles id    DEFAULT     j   ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);
 :   ALTER TABLE public.articles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            7           2604    16498 	   events id    DEFAULT     f   ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);
 8   ALTER TABLE public.events ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            8           2604    16499    participations id    DEFAULT     v   ALTER TABLE ONLY public.participations ALTER COLUMN id SET DEFAULT nextval('public.participations_id_seq'::regclass);
 @   ALTER TABLE public.participations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            9           2604    16500    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    211    210            �          0    16417    admins 
   TABLE DATA           8   COPY public.admins (id, password, last_log) FROM stdin;
    public          postgres    false    202   �-       �          0    16425    articles 
   TABLE DATA           G   COPY public.articles (id, name, description, price, image) FROM stdin;
    public          postgres    false    204   �-       �          0    16433    events 
   TABLE DATA           s   COPY public.events (id, nom, description, image, created, available_seats, localisation, "from", "to") FROM stdin;
    public          postgres    false    206   2       �          0    16441    participations 
   TABLE DATA           I   COPY public.participations (id, "codeQr", user_id, event_id) FROM stdin;
    public          postgres    false    208   N2       �          0    16449    users 
   TABLE DATA           o   COPY public.users (user_id, nom, prenom, mail, password, identity_card, created, last_log, statut) FROM stdin;
    public          postgres    false    210   t2       �           0    0    admins_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.admins_id_seq', 1, false);
          public          postgres    false    203            �           0    0    articles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.articles_id_seq', 10, true);
          public          postgres    false    205            �           0    0    events_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.events_id_seq', 4, true);
          public          postgres    false    207            �           0    0    participations_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.participations_id_seq', 4, true);
          public          postgres    false    209            �           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);
          public          postgres    false    211            ;           2606    16463    admins admins_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public            postgres    false    202            =           2606    16465    articles articles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_pkey;
       public            postgres    false    204            ?           2606    16467    events events_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    206            C           2606    16469 "   participations participations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.participations
    ADD CONSTRAINT participations_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.participations DROP CONSTRAINT participations_pkey;
       public            postgres    false    208            E           2606    16471    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    210            @           1259    16472    fki_event_id    INDEX     K   CREATE INDEX fki_event_id ON public.participations USING btree (event_id);
     DROP INDEX public.fki_event_id;
       public            postgres    false    208            A           1259    16473    fki_user_id    INDEX     I   CREATE INDEX fki_user_id ON public.participations USING btree (user_id);
    DROP INDEX public.fki_user_id;
       public            postgres    false    208            F           2606    16474    participations event_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.participations
    ADD CONSTRAINT event_id FOREIGN KEY (event_id) REFERENCES public.events(id) NOT VALID;
 A   ALTER TABLE ONLY public.participations DROP CONSTRAINT event_id;
       public          postgres    false    2879    206    208            G           2606    16479    participations user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.participations
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 @   ALTER TABLE ONLY public.participations DROP CONSTRAINT user_id;
       public          postgres    false    210    2885    208            �      x������ � �      �      x����v�6Ek�+���M �%�J3+v�L{f�4	Q�I��C��k��;�cs.(�v%/-�|@�>��s�%���}��In����t܆Y�WV��qL��(�� ���/k�Fw�7&��e׫�a�d��e�b�H�4Mv�O������i�vʵ&h�h͸�:�/+|�e�,�􀿥�cU�uU�,��bi��Y��������`�O��=e܋o�v��j/�4,����<�-;��F�4�1�v
A��;�r��D���$���e�:�^�����ӴYḪ�uE�Nz�I���TC:���p#tg $jF�E���2���=3�8�lD��\�u�ڪ� �>��Vg˝�ֽ#�˽�}^��#Xo��������PZт���8J�5|��tn&-�o�x��7�� Z��PO+�W�8(��Ǔ|�
�1�����<s�4�EhW�4ͪf]�M����$���҉�[�>8�v'l/Q��+�C�_%��f���I�MF��_�����_<%�*{j� _ۀ�����&(�I�ߧ��|�iV�u�6�*����ɱ�V��t:���͉��&j��;�`���Q1����5�n�-���(u�Z�%4z�	�v�����d_`��RV����v��Ҧ�ʺZ�$e��`�>p����������١�.��a��Z��ޑ��P��k�%�*l�C�sjv���u��s���a�����*���NV�/�W�v|�Ct�>�!Z��m���&�S�hl�m�٠ H�� �|�-e�����za��*�
�>+�Ƨ�����VEV�%��q��68�K�E�urgB�<N~�9��,�k���˃�R�)X���<_؝�
�|O?�����I�{7��X�>��b�>h*j��,�l�U5i��!�O����'�
��jP�v0���ss�4���0_��\�/qA��������@�
b������X3*'-u);��@����8Y6kD�,-�+&g.*J}��W���MÛ��c��������蜜      �   6   x�3�tK-.�,K�QpI-V�)��L-J-��"#8�˘�jCKK��=... x��      �      x�3���4�4����� �      �   �   x�u�K�P�����Z�쵋J$�+^K��8GŬN����`f�Oc@HȐ�m9�?^�J�?{h�w�?;d�˚*�~X�N����}?Ț&�˃]fو���qo���)��oy����h�/HogU4ʪ��)ɡj�ʚ��2�9d�9g�ŰGF=�ݽjln�9���J+��U$Iz~OSp     