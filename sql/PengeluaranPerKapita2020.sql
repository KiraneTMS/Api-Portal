--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

--
-- Name: kelompok; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.kelompok AS ENUM (
    'Padi-padian',
    'Umbi-umbian',
    'Ikan',
    'Daging',
    'Telur dan susu',
    'Kacang-kacangan',
    'Buah-buahan',
    'Minyak dan lemak',
    'Bahan minuman',
    'Bumbu-bumbuan',
    'Konsumsi lainnya',
    'Makanan dan minuman jadi',
    'Tembakau dan sirih'
);


ALTER TYPE public.kelompok OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: pengeluaranKelompokMakanan; Type: TABLE; Schema: public; Owner: Karenina
--

CREATE TABLE public."pengeluaranKelompokMakanan" (
    id integer NOT NULL,
    kelompok character varying NOT NULL,
    kota numeric NOT NULL,
    desa numeric NOT NULL,
    jumlah numeric NOT NULL
);


ALTER TABLE public."pengeluaranKelompokMakanan" OWNER TO "Karenina";

--
-- Name: pengeluaranKelompokNonMakanan; Type: TABLE; Schema: public; Owner: Karenina
--

CREATE TABLE public."pengeluaranKelompokNonMakanan" (
    id integer NOT NULL,
    kelompok character varying NOT NULL,
    kota numeric NOT NULL,
    desa numeric NOT NULL,
    jumlah numeric NOT NULL
);


ALTER TABLE public."pengeluaranKelompokNonMakanan" OWNER TO "Karenina";

--
-- Name: persentaseKelompokMakanan; Type: TABLE; Schema: public; Owner: Karenina
--

CREATE TABLE public."persentaseKelompokMakanan" (
    id integer NOT NULL,
    kelompok character varying NOT NULL,
    persentase double precision NOT NULL
);


ALTER TABLE public."persentaseKelompokMakanan" OWNER TO "Karenina";

--
-- Name: persentaseKelompokNonMakanan; Type: TABLE; Schema: public; Owner: Karenina
--

CREATE TABLE public."persentaseKelompokNonMakanan" (
    id integer NOT NULL,
    kelompok character varying NOT NULL,
    persentase double precision NOT NULL
);


ALTER TABLE public."persentaseKelompokNonMakanan" OWNER TO "Karenina";

--
-- Name: persentaseMenurutDaerah; Type: TABLE; Schema: public; Owner: Karenina
--

CREATE TABLE public."persentaseMenurutDaerah" (
    id integer NOT NULL,
    "namaDaerah" character varying NOT NULL,
    daerah character varying NOT NULL,
    makanan double precision NOT NULL,
    nonmakanan double precision NOT NULL
);


ALTER TABLE public."persentaseMenurutDaerah" OWNER TO "Karenina";

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    "permissionList" text[] DEFAULT ARRAY[]::text[] NOT NULL,
    role character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: pengeluaranKelompokMakanan; Type: TABLE DATA; Schema: public; Owner: Karenina
--

COPY public."pengeluaranKelompokMakanan" (id, kelompok, kota, desa, jumlah) FROM stdin;
2	Umbi-umbian	5666	4449	5381
3	Ikan	39863	30445	37663
4	Daging	34479	24.09	32053
5	Telur dan susu	40783	26601	37471
6	Sayur-sayuran	43272	36425	41673
7	Kacang-kacangan	13177	12625	13049
8	Buah-buahan	32997	23356	30746
9	Minyak dan lemak	12765	12.02	12591
10	Bahan minuman	18573	19069	18689
11	Bumbu-bumbuan	13162	11591	12795
12	Konsumsi lainnya	13125	11791	12813
13	Makanan dan minuman jadi	269941	188168	250843
14	Tembakau dan sirih	8178	90169	83739
1	Padi-padian	62877	77664	66331
\.


--
-- Data for Name: pengeluaranKelompokNonMakanan; Type: TABLE DATA; Schema: public; Owner: Karenina
--

COPY public."pengeluaranKelompokNonMakanan" (id, kelompok, kota, desa, jumlah) FROM stdin;
1	Perumahan dan Fasilitas rumah tangga	369627	206655	331566
2	Barang dan jasa	193461	91296	169601
3	Pakaian, alas kaki dan tutup kepala	40734	30579	38363
4	Barang-barang yang tahan lama	68189	38615	61282
5	Pajak dan asuransi	45667	20937	39892
6	Keperluan pesta dan upacara	30646	21108	28418
\.


--
-- Data for Name: persentaseKelompokMakanan; Type: TABLE DATA; Schema: public; Owner: Karenina
--

COPY public."persentaseKelompokMakanan" (id, kelompok, persentase) FROM stdin;
2	Umbi-umbian	0.41
3	Ikan	2.84
4	Daging	2.42
5	Telur dan susu	2.83
6	Sayur-sayuran	3.15
7	Kacang-kacangan	0.98
8	Buah-buahan	2.32
9	Minyak dan lemak	0.95
10	Bahan minuman	1.41
11	Bumbu-bumbuan	0.97
12	Konsumsi lainnya	18.93
13	Makanan dan minuman jadi	6.32
14	Tembakau dan sirih	49.5
1	Padi-padian	5.01
\.


--
-- Data for Name: persentaseKelompokNonMakanan; Type: TABLE DATA; Schema: public; Owner: Karenina
--

COPY public."persentaseKelompokNonMakanan" (id, kelompok, persentase) FROM stdin;
1	Perumahan dan Fasilitas rumah tangga	25.02
2	Barang dan jasa	12.8
3	Pakaian, alas kaki dan tutup kepala	2.9
4	Barang-barang yang tahan lama	4.63
5	Pajak dan asuransi	3.01
6	Keperluan pesta dan upacara	2.14
\.


--
-- Data for Name: persentaseMenurutDaerah; Type: TABLE DATA; Schema: public; Owner: Karenina
--

COPY public."persentaseMenurutDaerah" (id, "namaDaerah", daerah, makanan, nonmakanan) FROM stdin;
1	Bogor	kabupaten	51.28	48.72
2	Sukabumi	kabupaten	59.91	40.09
3	Cianjur	kabupaten	55.33	44.67
4	Bandung	kabupaten	48.01	51.99
5	Garut	kabupaten	58.96	41.04
6	Tasikmalaya	kabupaten	59.69	40.31
7	Ciamis	kabupaten	55.76	44.24
8	Kuningan	kabupaten	53.05	46.95
9	Cirebon	kabupaten	57.26	42.74
10	Majalengka	kabupaten	55.29	44.71
11	Sumedang	kabupaten	50.85	49.15
12	Indramayu	kabupaten	57.2	42.8
13	Subang	kabupaten	54.63	45.37
14	Purwakarta	kabupaten	49.2	50.8
15	Karawang	kabupaten	52.99	47.01
16	Bekasi	kabupaten	47.21	52.79
17	Bandung Barat	kabupaten	53.5	46.5
18	Pangandaran	kabupaten	56.2	43.8
19	Bogor	kota	42.07	57.93
20	Sukabumi	kota	49.98	50.02
21	Bandung	kota	42.14	57.86
22	Cirebon	kota	44.37	55.63
23	Bekasi	kota	42.84	57.16
24	Depok	kota	41.84	58.16
25	Cimahi	kota	43.48	56.52
26	Tasikmalaya	kota	49.84	50.16
27	Banjar	kota	54.91	45.09
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, name, email, password, "permissionList", role) FROM stdin;
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: user UQ_e12875dfb3b1d92d7d7c5377e22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e22" UNIQUE (email);


--
-- Name: pengeluaranKelompokMakanan kelompokMakanan_pkey; Type: CONSTRAINT; Schema: public; Owner: Karenina
--

ALTER TABLE ONLY public."pengeluaranKelompokMakanan"
    ADD CONSTRAINT "kelompokMakanan_pkey" PRIMARY KEY (id);


--
-- Name: pengeluaranKelompokNonMakanan kelompokNonMakanan_pkey; Type: CONSTRAINT; Schema: public; Owner: Karenina
--

ALTER TABLE ONLY public."pengeluaranKelompokNonMakanan"
    ADD CONSTRAINT "kelompokNonMakanan_pkey" PRIMARY KEY (id);


--
-- Name: persentaseKelompokNonMakanan persentaseKelompokMakanan_pkey; Type: CONSTRAINT; Schema: public; Owner: Karenina
--

ALTER TABLE ONLY public."persentaseKelompokNonMakanan"
    ADD CONSTRAINT "persentaseKelompokMakanan_pkey" PRIMARY KEY (id);


--
-- Name: persentaseKelompokMakanan persentaseKelompokMakanan_pkey1; Type: CONSTRAINT; Schema: public; Owner: Karenina
--

ALTER TABLE ONLY public."persentaseKelompokMakanan"
    ADD CONSTRAINT "persentaseKelompokMakanan_pkey1" PRIMARY KEY (id);


--
-- Name: persentaseMenurutDaerah persentaseMenurutDaerah_pkey; Type: CONSTRAINT; Schema: public; Owner: Karenina
--

ALTER TABLE ONLY public."persentaseMenurutDaerah"
    ADD CONSTRAINT "persentaseMenurutDaerah_pkey" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

