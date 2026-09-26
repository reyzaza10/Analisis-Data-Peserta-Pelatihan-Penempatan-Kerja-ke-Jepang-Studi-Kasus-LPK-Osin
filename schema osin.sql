--
-- PostgreSQL database dump
--

\restrict GINBp5nCONQ8AkUSHOxvlb3Wu75jejl1J6tK2Zjcuib0XNEtrfxYAb9eggpVHNG

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-09-26 19:43:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16927)
-- Name: osin; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA osin;


ALTER SCHEMA osin OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 231 (class 1259 OID 17088)
-- Name: dokumen_paspor; Type: TABLE; Schema: osin; Owner: postgres
--

CREATE TABLE osin.dokumen_paspor (
    paspor_id integer NOT NULL,
    id_peserta integer,
    nomor_paspor character varying(30) NOT NULL,
    tanggal_terbit date NOT NULL,
    tanggal_kadaluarsa date NOT NULL
);


ALTER TABLE osin.dokumen_paspor OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17087)
-- Name: dokumen_paspor_paspor_id_seq; Type: SEQUENCE; Schema: osin; Owner: postgres
--

CREATE SEQUENCE osin.dokumen_paspor_paspor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE osin.dokumen_paspor_paspor_id_seq OWNER TO postgres;

--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 230
-- Name: dokumen_paspor_paspor_id_seq; Type: SEQUENCE OWNED BY; Schema: osin; Owner: postgres
--

ALTER SEQUENCE osin.dokumen_paspor_paspor_id_seq OWNED BY osin.dokumen_paspor.paspor_id;


--
-- TOC entry 235 (class 1259 OID 17125)
-- Name: keberangkatan; Type: TABLE; Schema: osin; Owner: postgres
--

CREATE TABLE osin.keberangkatan (
    keberangkatan_id integer NOT NULL,
    id_peserta integer,
    perusahaan_id integer,
    tanggal_berangkat date,
    status_kontrak character varying(50),
    jenis_job character varying(50),
    jumlah_gaji numeric
);


ALTER TABLE osin.keberangkatan OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17124)
-- Name: keberangkatan_keberangkatan_id_seq; Type: SEQUENCE; Schema: osin; Owner: postgres
--

CREATE SEQUENCE osin.keberangkatan_keberangkatan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE osin.keberangkatan_keberangkatan_id_seq OWNER TO postgres;

--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 234
-- Name: keberangkatan_keberangkatan_id_seq; Type: SEQUENCE OWNED BY; Schema: osin; Owner: postgres
--

ALTER SEQUENCE osin.keberangkatan_keberangkatan_id_seq OWNED BY osin.keberangkatan.keberangkatan_id;


--
-- TOC entry 229 (class 1259 OID 17066)
-- Name: matching_tables; Type: TABLE; Schema: osin; Owner: postgres
--

CREATE TABLE osin.matching_tables (
    matching_id integer NOT NULL,
    id_peserta integer,
    perusahaan_id integer,
    tanggal_interview date,
    hasil character varying(15),
    keterangan character varying(500),
    CONSTRAINT hasil_check CHECK (((hasil)::text = ANY (ARRAY[('lolos'::character varying)::text, ('tidak lolos'::character varying)::text])))
);


ALTER TABLE osin.matching_tables OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17065)
-- Name: matching_tables_matching_id_seq; Type: SEQUENCE; Schema: osin; Owner: postgres
--

CREATE SEQUENCE osin.matching_tables_matching_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE osin.matching_tables_matching_id_seq OWNER TO postgres;

--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 228
-- Name: matching_tables_matching_id_seq; Type: SEQUENCE OWNED BY; Schema: osin; Owner: postgres
--

ALTER SEQUENCE osin.matching_tables_matching_id_seq OWNED BY osin.matching_tables.matching_id;


--
-- TOC entry 233 (class 1259 OID 17106)
-- Name: pembayaran; Type: TABLE; Schema: osin; Owner: postgres
--

CREATE TABLE osin.pembayaran (
    pembayaran_id integer NOT NULL,
    id_peserta integer,
    skema character varying(50) NOT NULL,
    jumlah numeric NOT NULL,
    tanggal_bayar date,
    potongan_ke integer,
    CONSTRAINT skema_check CHECK (((skema)::text = ANY (ARRAY[('reguler'::character varying)::text, ('dana talang'::character varying)::text])))
);


ALTER TABLE osin.pembayaran OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17105)
-- Name: pembayaran_pembayaran_id_seq; Type: SEQUENCE; Schema: osin; Owner: postgres
--

CREATE SEQUENCE osin.pembayaran_pembayaran_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE osin.pembayaran_pembayaran_id_seq OWNER TO postgres;

--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 232
-- Name: pembayaran_pembayaran_id_seq; Type: SEQUENCE OWNED BY; Schema: osin; Owner: postgres
--

ALTER SEQUENCE osin.pembayaran_pembayaran_id_seq OWNED BY osin.pembayaran.pembayaran_id;


--
-- TOC entry 223 (class 1259 OID 16939)
-- Name: perusahaan_mitra; Type: TABLE; Schema: osin; Owner: postgres
--

CREATE TABLE osin.perusahaan_mitra (
    perusahaan_id integer NOT NULL,
    nama_perusahaan character varying(100) NOT NULL,
    lokasi character varying(100),
    bidang_industri character varying(100),
    kuota_peserta integer
);


ALTER TABLE osin.perusahaan_mitra OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16938)
-- Name: perusahaan_mitra_perusahaan_id_seq; Type: SEQUENCE; Schema: osin; Owner: postgres
--

CREATE SEQUENCE osin.perusahaan_mitra_perusahaan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE osin.perusahaan_mitra_perusahaan_id_seq OWNER TO postgres;

--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 222
-- Name: perusahaan_mitra_perusahaan_id_seq; Type: SEQUENCE OWNED BY; Schema: osin; Owner: postgres
--

ALTER SEQUENCE osin.perusahaan_mitra_perusahaan_id_seq OWNED BY osin.perusahaan_mitra.perusahaan_id;


--
-- TOC entry 225 (class 1259 OID 16961)
-- Name: peserta; Type: TABLE; Schema: osin; Owner: postgres
--

CREATE TABLE osin.peserta (
    id_peserta integer NOT NULL,
    nama character varying(50),
    nik character varying(16) NOT NULL,
    alamat character varying(100) NOT NULL,
    tanggal_lahir date,
    pendidikan_terakhir character varying(50),
    program_id integer,
    tanggal_daftar date DEFAULT CURRENT_DATE
);


ALTER TABLE osin.peserta OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16960)
-- Name: peserta_id_peserta_seq; Type: SEQUENCE; Schema: osin; Owner: postgres
--

CREATE SEQUENCE osin.peserta_id_peserta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE osin.peserta_id_peserta_seq OWNER TO postgres;

--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 224
-- Name: peserta_id_peserta_seq; Type: SEQUENCE OWNED BY; Schema: osin; Owner: postgres
--

ALTER SEQUENCE osin.peserta_id_peserta_seq OWNED BY osin.peserta.id_peserta;


--
-- TOC entry 221 (class 1259 OID 16929)
-- Name: program; Type: TABLE; Schema: osin; Owner: postgres
--

CREATE TABLE osin.program (
    program_id integer NOT NULL,
    nama_program character varying(50) CONSTRAINT program_nama_peserta_not_null NOT NULL,
    jenis_visa character varying(50) NOT NULL,
    durasi_kontrak character varying(50)
);


ALTER TABLE osin.program OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16928)
-- Name: program_program_id_seq; Type: SEQUENCE; Schema: osin; Owner: postgres
--

CREATE SEQUENCE osin.program_program_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE osin.program_program_id_seq OWNER TO postgres;

--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 220
-- Name: program_program_id_seq; Type: SEQUENCE OWNED BY; Schema: osin; Owner: postgres
--

ALTER SEQUENCE osin.program_program_id_seq OWNED BY osin.program.program_id;


--
-- TOC entry 227 (class 1259 OID 17023)
-- Name: tahap_pelatihan; Type: TABLE; Schema: osin; Owner: postgres
--

CREATE TABLE osin.tahap_pelatihan (
    tahap_id integer NOT NULL,
    id_peserta integer,
    jenis_tahap_belajar character varying(20),
    tanggal_mulai_belajar date NOT NULL,
    tanggal_selesai_belajar date NOT NULL,
    status character varying(20) NOT NULL,
    CONSTRAINT jenis_tahap_belajar_check CHECK (((jenis_tahap_belajar)::text = ANY ((ARRAY['bahasa'::character varying, 'fisik'::character varying, 'budaya'::character varying, 'tes kesehatan'::character varying])::text[]))),
    CONSTRAINT status_check CHECK (((status)::text = ANY ((ARRAY['lulus'::character varying, 'tidak'::character varying, 'sedang berlangsung'::character varying])::text[])))
);


ALTER TABLE osin.tahap_pelatihan OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17022)
-- Name: tahap_pelatihan_tahap_id_seq; Type: SEQUENCE; Schema: osin; Owner: postgres
--

CREATE SEQUENCE osin.tahap_pelatihan_tahap_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE osin.tahap_pelatihan_tahap_id_seq OWNER TO postgres;

--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 226
-- Name: tahap_pelatihan_tahap_id_seq; Type: SEQUENCE OWNED BY; Schema: osin; Owner: postgres
--

ALTER SEQUENCE osin.tahap_pelatihan_tahap_id_seq OWNED BY osin.tahap_pelatihan.tahap_id;


--
-- TOC entry 4898 (class 2604 OID 17091)
-- Name: dokumen_paspor paspor_id; Type: DEFAULT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.dokumen_paspor ALTER COLUMN paspor_id SET DEFAULT nextval('osin.dokumen_paspor_paspor_id_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 17128)
-- Name: keberangkatan keberangkatan_id; Type: DEFAULT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.keberangkatan ALTER COLUMN keberangkatan_id SET DEFAULT nextval('osin.keberangkatan_keberangkatan_id_seq'::regclass);


--
-- TOC entry 4897 (class 2604 OID 17069)
-- Name: matching_tables matching_id; Type: DEFAULT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.matching_tables ALTER COLUMN matching_id SET DEFAULT nextval('osin.matching_tables_matching_id_seq'::regclass);


--
-- TOC entry 4899 (class 2604 OID 17109)
-- Name: pembayaran pembayaran_id; Type: DEFAULT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.pembayaran ALTER COLUMN pembayaran_id SET DEFAULT nextval('osin.pembayaran_pembayaran_id_seq'::regclass);


--
-- TOC entry 4893 (class 2604 OID 16942)
-- Name: perusahaan_mitra perusahaan_id; Type: DEFAULT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.perusahaan_mitra ALTER COLUMN perusahaan_id SET DEFAULT nextval('osin.perusahaan_mitra_perusahaan_id_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 16964)
-- Name: peserta id_peserta; Type: DEFAULT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.peserta ALTER COLUMN id_peserta SET DEFAULT nextval('osin.peserta_id_peserta_seq'::regclass);


--
-- TOC entry 4892 (class 2604 OID 16932)
-- Name: program program_id; Type: DEFAULT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.program ALTER COLUMN program_id SET DEFAULT nextval('osin.program_program_id_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 17026)
-- Name: tahap_pelatihan tahap_id; Type: DEFAULT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.tahap_pelatihan ALTER COLUMN tahap_id SET DEFAULT nextval('osin.tahap_pelatihan_tahap_id_seq'::regclass);


--
-- TOC entry 5091 (class 0 OID 17088)
-- Dependencies: 231
-- Data for Name: dokumen_paspor; Type: TABLE DATA; Schema: osin; Owner: postgres
--

COPY osin.dokumen_paspor (paspor_id, id_peserta, nomor_paspor, tanggal_terbit, tanggal_kadaluarsa) FROM stdin;
1	1	B1234567	2026-05-01	2031-05-01
2	3	B7654321	2026-05-10	2031-05-10
3	6	B5479144	2026-02-15	2031-02-15
4	7	B5408072	2026-03-14	2031-03-14
5	9	B2876828	2026-03-25	2031-03-25
6	16	B1156287	2026-04-15	2031-04-15
7	17	B3607983	2026-04-26	2031-04-26
8	19	B3970445	2026-04-29	2031-04-29
9	20	B5682940	2026-03-20	2031-03-20
10	22	B3919694	2026-04-10	2031-04-10
11	23	B5107776	2026-05-28	2031-05-28
12	25	B4934149	2026-05-28	2031-05-28
13	28	B1873851	2026-03-28	2031-03-28
14	5	B5661367	2026-04-03	2031-04-03
15	8	B7069199	2026-03-25	2031-03-25
16	9	B5687865	2026-06-12	2031-06-12
17	10	B9020058	2025-06-21	2030-06-21
18	14	B7582781	2026-04-15	2031-04-15
19	17	B8613056	2025-11-18	2030-11-18
20	18	B2783105	2026-02-09	2031-02-09
21	19	B1758959	2026-03-23	2031-03-23
22	20	B1377389	2026-01-03	2031-01-03
23	22	B4939049	2025-10-05	2030-10-05
24	23	B9214365	2025-12-28	2030-12-28
25	27	B3135929	2026-01-12	2031-01-12
26	32	B7211227	2026-01-20	2031-01-20
27	34	B7272726	2026-03-04	2031-03-04
28	36	B2096090	2026-01-05	2031-01-05
29	41	B9111901	2026-05-15	2031-05-15
30	45	B6137420	2025-11-05	2030-11-05
31	49	B1810196	2026-07-07	2031-07-07
32	50	B4762441	2025-10-14	2030-10-14
33	60	B6478810	2026-02-23	2031-02-23
34	61	B5969634	2025-11-21	2030-11-21
35	62	B1329794	2026-01-11	2031-01-11
36	63	B4524715	2026-04-09	2031-04-09
37	67	B3561409	2025-07-26	2030-07-26
38	68	B3761804	2025-11-02	2030-11-02
39	71	B7308974	2026-06-18	2031-06-18
40	73	B1156488	2025-11-03	2030-11-03
41	74	B2336818	2026-04-21	2031-04-21
42	75	B3535380	2026-02-22	2031-02-22
43	78	B7275356	2025-12-02	2030-12-02
44	81	B9075094	2025-12-25	2030-12-25
45	82	B4718684	2026-07-12	2031-07-12
46	84	B9834658	2025-12-23	2030-12-23
47	88	B2846164	2025-12-13	2030-12-13
48	92	B1519461	2026-05-02	2031-05-02
49	100	B1209568	2025-12-10	2030-12-10
50	102	B6620611	2025-05-31	2030-05-31
51	103	B3671301	2025-07-30	2030-07-30
52	106	B1671064	2026-05-14	2031-05-14
53	107	B6344405	2026-06-18	2031-06-18
54	110	B1728076	2025-12-06	2030-12-06
55	111	B9193041	2026-03-15	2031-03-15
56	112	B6371319	2025-11-30	2030-11-30
57	115	B9065348	2025-11-12	2030-11-12
58	116	B5220177	2025-12-14	2030-12-14
59	117	B3295162	2025-10-07	2030-10-07
60	118	B7258144	2025-10-28	2030-10-28
61	119	B7389115	2026-02-08	2031-02-08
62	120	B8847707	2025-11-30	2030-11-30
63	122	B6422395	2026-06-05	2031-06-05
64	124	B1800178	2025-07-28	2030-07-28
65	127	B6188400	2026-02-09	2031-02-09
66	128	B7133907	2026-07-04	2031-07-04
67	129	B7300964	2025-12-24	2030-12-24
\.


--
-- TOC entry 5095 (class 0 OID 17125)
-- Dependencies: 235
-- Data for Name: keberangkatan; Type: TABLE DATA; Schema: osin; Owner: postgres
--

COPY osin.keberangkatan (keberangkatan_id, id_peserta, perusahaan_id, tanggal_berangkat, status_kontrak, jenis_job, jumlah_gaji) FROM stdin;
1	1	1	2026-06-01	aktif	operator produksi	8500000
2	3	2	2026-06-15	aktif	teknisi pertanian	9200000
3	6	6	2026-03-09	aktif	pekerja perikanan	8500000
4	7	8	2026-04-09	aktif	caregiver	8700000
5	9	1	2026-04-16	aktif	operator produksi	8100000
6	16	3	2026-05-02	aktif	caregiver	8600000
7	17	3	2026-05-17	aktif	caregiver	9000000
8	19	7	2026-05-19	aktif	operator precision machine	9000000
9	20	4	2026-04-16	aktif	pekerja konstruksi	9000000
10	22	3	2026-04-25	aktif	caregiver	8900000
11	23	4	2026-06-26	aktif	pekerja konstruksi	9300000
12	25	4	2026-06-22	aktif	pekerja konstruksi	8200000
13	28	2	2026-04-14	aktif	pekerja pertanian	8100000
14	5	8	2026-04-23	aktif	caregiver	9100000
15	8	3	2026-04-06	aktif	caregiver	9400000
16	9	8	2026-07-05	aktif	caregiver	9200000
17	10	7	2025-07-13	aktif	operator precision machine	8000000
18	14	4	2026-05-04	aktif	pekerja konstruksi	9100000
19	17	4	2025-12-13	aktif	pekerja konstruksi	8600000
20	18	4	2026-03-08	aktif	pekerja konstruksi	9500000
21	19	5	2026-04-12	aktif	operator pengolahan makanan	9200000
22	20	3	2026-01-17	aktif	caregiver	9600000
23	22	5	2025-10-24	aktif	operator pengolahan makanan	9800000
24	23	5	2026-01-18	aktif	operator pengolahan makanan	9200000
25	27	5	2026-02-03	aktif	operator pengolahan makanan	8700000
26	32	2	2026-02-11	aktif	pekerja pertanian	9100000
27	34	8	2026-03-21	aktif	caregiver	8100000
28	36	5	2026-01-20	aktif	operator pengolahan makanan	9300000
29	41	2	2026-06-08	aktif	pekerja pertanian	9500000
30	45	6	2025-11-24	aktif	pekerja perikanan	9100000
31	50	5	2025-10-30	aktif	operator pengolahan makanan	8400000
32	60	3	2026-03-12	aktif	caregiver	8500000
33	61	7	2025-12-11	aktif	operator precision machine	9700000
34	62	5	2026-02-08	aktif	operator pengolahan makanan	8300000
35	63	6	2026-05-03	aktif	pekerja perikanan	9400000
36	67	4	2025-08-12	aktif	pekerja konstruksi	9700000
37	68	3	2025-11-19	aktif	caregiver	8800000
38	71	1	2026-07-06	aktif	operator produksi	7900000
39	73	3	2025-11-17	aktif	caregiver	8400000
40	74	1	2026-05-08	aktif	operator produksi	9300000
41	75	6	2026-03-19	aktif	pekerja perikanan	8500000
42	78	3	2025-12-28	aktif	caregiver	8000000
43	81	6	2026-01-13	aktif	pekerja perikanan	8200000
44	84	6	2026-01-17	aktif	pekerja perikanan	7900000
45	88	8	2025-12-29	aktif	caregiver	9500000
46	92	5	2026-05-20	aktif	operator pengolahan makanan	9400000
47	100	8	2025-12-26	aktif	caregiver	8500000
48	102	5	2025-06-22	aktif	operator pengolahan makanan	9000000
49	103	3	2025-08-23	aktif	caregiver	9000000
50	106	4	2026-06-01	aktif	pekerja konstruksi	8700000
51	107	1	2026-07-02	aktif	operator produksi	9100000
52	110	5	2025-12-27	aktif	operator pengolahan makanan	8400000
53	111	5	2026-04-06	aktif	operator pengolahan makanan	7800000
54	112	6	2025-12-23	aktif	pekerja perikanan	8600000
55	115	5	2025-12-03	aktif	operator pengolahan makanan	8800000
56	116	5	2026-01-09	aktif	operator pengolahan makanan	8500000
57	117	3	2025-10-31	aktif	caregiver	8500000
58	118	1	2025-11-20	aktif	operator produksi	9300000
59	119	5	2026-02-28	aktif	operator pengolahan makanan	9200000
60	120	1	2025-12-24	aktif	operator produksi	8900000
61	122	6	2026-07-03	aktif	pekerja perikanan	8900000
62	124	5	2025-08-18	aktif	operator pengolahan makanan	9400000
63	127	5	2026-03-07	aktif	operator pengolahan makanan	9500000
64	129	1	2026-01-05	aktif	operator produksi	8600000
\.


--
-- TOC entry 5089 (class 0 OID 17066)
-- Dependencies: 229
-- Data for Name: matching_tables; Type: TABLE DATA; Schema: osin; Owner: postgres
--

COPY osin.matching_tables (matching_id, id_peserta, perusahaan_id, tanggal_interview, hasil, keterangan) FROM stdin;
2	1	1	2026-04-15	lolos	Diterima sebagai operator produksi
3	2	3	2026-04-20	tidak lolos	Dialihkan ke perusahaan lain
4	3	2	2026-04-25	lolos	Diterima sebagai teknisi pertanian
5	6	6	2026-02-02	lolos	diterima langsung
6	7	8	2026-03-01	lolos	diterima langsung
7	9	3	2026-02-23	tidak lolos	dialihkan ke perusahaan lain
8	9	1	2026-03-15	lolos	diterima setelah dialihkan
9	11	4	2026-05-05	tidak lolos	dialihkan ke perusahaan lain
10	11	6	2026-05-17	tidak lolos	belum lolos, menunggu penjadwalan ulang
11	16	3	2026-04-04	lolos	diterima langsung
12	17	5	2026-03-28	tidak lolos	dialihkan ke perusahaan lain
13	17	3	2026-04-15	lolos	diterima setelah dialihkan
14	19	2	2026-04-03	tidak lolos	dialihkan ke perusahaan lain
15	19	7	2026-04-17	lolos	diterima setelah dialihkan
16	20	4	2026-03-09	lolos	diterima langsung
17	22	3	2026-03-25	lolos	diterima langsung
18	23	4	2026-05-18	lolos	diterima langsung
19	25	4	2026-05-14	lolos	diterima langsung
20	28	2	2026-03-10	lolos	diterima langsung
21	5	8	2026-03-20	lolos	diterima langsung
22	8	5	2026-02-19	tidak lolos	dialihkan ke perusahaan lain
23	8	3	2026-03-09	lolos	diterima setelah dialihkan
24	9	8	2026-06-04	lolos	diterima langsung
25	10	7	2025-06-10	lolos	diterima langsung
26	11	1	2025-11-06	tidak lolos	dialihkan ke perusahaan lain
27	11	2	2025-11-24	tidak lolos	belum lolos, menunggu penjadwalan ulang
28	14	5	2026-03-20	tidak lolos	dialihkan ke perusahaan lain
29	14	4	2026-04-06	lolos	diterima setelah dialihkan
30	15	6	2026-10-08	tidak lolos	dialihkan ke perusahaan lain
31	17	4	2025-11-09	lolos	diterima langsung
32	18	4	2026-01-25	lolos	diterima langsung
33	19	5	2026-03-11	lolos	diterima langsung
34	20	3	2025-12-20	lolos	diterima langsung
35	21	1	2026-11-29	tidak lolos	dialihkan ke perusahaan lain
36	22	5	2025-09-23	lolos	diterima langsung
37	23	5	2025-12-17	lolos	diterima langsung
38	27	5	2025-12-27	lolos	diterima langsung
39	28	4	2026-10-29	tidak lolos	dialihkan ke perusahaan lain
40	30	3	2025-09-16	tidak lolos	dialihkan ke perusahaan lain
41	30	2	2025-10-07	tidak lolos	belum lolos, menunggu penjadwalan ulang
42	32	2	2026-01-06	lolos	diterima langsung
43	34	3	2026-02-08	tidak lolos	dialihkan ke perusahaan lain
44	34	8	2026-02-18	lolos	diterima setelah dialihkan
45	36	5	2025-12-19	lolos	diterima langsung
46	40	4	2026-07-29	tidak lolos	dialihkan ke perusahaan lain
47	41	2	2026-04-30	lolos	diterima langsung
48	45	6	2025-10-21	lolos	diterima langsung
49	46	2	2026-08-31	tidak lolos	dialihkan ke perusahaan lain
50	47	3	2026-03-15	tidak lolos	dialihkan ke perusahaan lain
51	47	4	2026-03-26	tidak lolos	belum lolos, menunggu penjadwalan ulang
52	49	2	2026-06-20	lolos	diterima langsung
53	50	5	2025-09-28	lolos	diterima langsung
54	51	8	2026-07-07	tidak lolos	dialihkan ke perusahaan lain
55	52	1	2026-04-13	tidak lolos	dialihkan ke perusahaan lain
56	52	7	2026-04-29	tidak lolos	belum lolos, menunggu penjadwalan ulang
57	54	3	2026-08-07	tidak lolos	dialihkan ke perusahaan lain
58	60	3	2026-02-12	lolos	diterima langsung
59	61	7	2025-11-03	lolos	diterima langsung
60	62	5	2025-12-27	lolos	diterima langsung
61	63	6	2026-03-25	lolos	diterima langsung
62	67	4	2025-07-13	lolos	diterima langsung
63	68	3	2025-10-18	lolos	diterima langsung
64	71	4	2026-05-11	tidak lolos	dialihkan ke perusahaan lain
65	71	1	2026-06-02	lolos	diterima setelah dialihkan
66	73	3	2025-10-26	lolos	diterima langsung
67	74	1	2026-04-04	lolos	diterima langsung
68	75	6	2026-02-14	lolos	diterima langsung
69	78	3	2025-11-17	lolos	diterima langsung
70	79	3	2025-12-18	tidak lolos	dialihkan ke perusahaan lain
71	79	6	2025-12-31	tidak lolos	belum lolos, menunggu penjadwalan ulang
72	81	6	2025-12-12	lolos	diterima langsung
73	82	2	2026-06-29	lolos	diterima langsung
74	84	6	2025-12-15	lolos	diterima langsung
75	85	4	2026-10-07	tidak lolos	dialihkan ke perusahaan lain
76	88	8	2025-12-01	lolos	diterima langsung
77	89	7	2025-07-10	tidak lolos	dialihkan ke perusahaan lain
78	89	6	2025-07-26	tidak lolos	belum lolos, menunggu penjadwalan ulang
79	92	6	2026-04-01	tidak lolos	dialihkan ke perusahaan lain
80	92	5	2026-04-20	lolos	diterima setelah dialihkan
81	94	8	2025-10-31	tidak lolos	dialihkan ke perusahaan lain
82	94	3	2025-11-16	tidak lolos	belum lolos, menunggu penjadwalan ulang
83	99	7	2025-08-30	tidak lolos	dialihkan ke perusahaan lain
84	99	5	2025-09-20	tidak lolos	belum lolos, menunggu penjadwalan ulang
85	100	2	2025-11-15	tidak lolos	dialihkan ke perusahaan lain
86	100	8	2025-12-02	lolos	diterima setelah dialihkan
87	101	3	2026-01-19	tidak lolos	dialihkan ke perusahaan lain
88	101	6	2026-01-29	tidak lolos	belum lolos, menunggu penjadwalan ulang
89	102	5	2025-05-22	lolos	diterima langsung
90	103	3	2025-07-19	lolos	diterima langsung
91	104	2	2026-10-08	tidak lolos	dialihkan ke perusahaan lain
92	106	4	2026-04-30	lolos	diterima langsung
93	107	1	2026-06-10	lolos	diterima langsung
94	108	3	2026-09-19	tidak lolos	dialihkan ke perusahaan lain
95	110	5	2025-11-25	lolos	diterima langsung
96	111	5	2026-03-01	lolos	diterima langsung
97	112	6	2025-11-17	lolos	diterima langsung
98	115	5	2025-10-30	lolos	diterima langsung
99	116	2	2025-11-08	tidak lolos	dialihkan ke perusahaan lain
100	116	5	2025-11-28	lolos	diterima setelah dialihkan
101	117	3	2025-09-28	lolos	diterima langsung
102	118	1	2025-10-17	lolos	diterima langsung
103	119	5	2026-01-27	lolos	diterima langsung
104	120	4	2025-11-04	tidak lolos	dialihkan ke perusahaan lain
105	120	1	2025-11-17	lolos	diterima setelah dialihkan
106	122	6	2026-05-18	lolos	diterima langsung
107	124	5	2025-07-17	lolos	diterima langsung
108	127	5	2026-02-01	lolos	diterima langsung
109	128	4	2026-06-22	lolos	diterima langsung
110	129	7	2025-11-27	tidak lolos	dialihkan ke perusahaan lain
111	129	1	2025-12-10	lolos	diterima setelah dialihkan
112	130	6	2026-10-05	tidak lolos	dialihkan ke perusahaan lain
\.


--
-- TOC entry 5093 (class 0 OID 17106)
-- Dependencies: 233
-- Data for Name: pembayaran; Type: TABLE DATA; Schema: osin; Owner: postgres
--

COPY osin.pembayaran (pembayaran_id, id_peserta, skema, jumlah, tanggal_bayar, potongan_ke) FROM stdin;
17	1	reguler	15000000	2026-01-20	0
18	2	dana talang	25000000	2026-01-25	8
19	3	dana talang	25000000	2026-02-05	8
22	4	dana talang	25000000	2025-08-29	8
23	5	dana talang	25000000	2025-09-03	8
24	6	reguler	15000000	2025-10-02	0
25	7	dana talang	25000000	2025-10-02	8
26	8	reguler	15000000	2025-08-27	0
27	9	dana talang	25000000	2025-09-21	8
28	10	reguler	15000000	2025-09-18	0
29	11	reguler	15000000	2026-01-04	0
30	12	reguler	15000000	2025-08-27	0
31	13	reguler	15000000	2025-11-30	0
32	14	dana talang	25000000	2025-11-12	8
33	15	reguler	15000000	2025-12-22	0
34	16	dana talang	25000000	2025-10-23	8
35	17	dana talang	25000000	2025-10-23	8
36	18	dana talang	25000000	2025-08-11	8
37	19	dana talang	25000000	2025-11-04	8
38	20	dana talang	25000000	2025-10-01	8
39	21	reguler	15000000	2025-10-28	0
40	22	dana talang	25000000	2025-10-24	8
41	23	dana talang	25000000	2025-12-13	8
42	24	reguler	15000000	2025-11-26	0
43	25	dana talang	25000000	2025-12-07	8
44	26	dana talang	25000000	2025-08-25	8
45	27	reguler	15000000	2025-12-11	0
46	28	dana talang	25000000	2025-09-29	8
47	1	dana talang	25000000	2025-04-20	8
48	2	dana talang	25000000	2025-12-01	8
49	3	dana talang	25000000	2026-01-06	8
51	5	dana talang	25000000	2025-11-14	8
52	6	dana talang	25000000	2025-07-27	8
55	9	dana talang	25000000	2026-01-17	8
56	10	dana talang	25000000	2025-01-14	8
58	12	dana talang	25000000	2026-03-11	8
60	14	dana talang	25000000	2025-10-14	8
64	18	dana talang	25000000	2025-09-30	8
65	19	dana talang	25000000	2025-11-15	8
68	22	dana talang	25000000	2025-04-23	8
70	24	dana talang	25000000	2025-08-02	8
71	25	dana talang	25000000	2026-02-26	8
74	28	dana talang	25000000	2026-06-05	8
75	29	dana talang	25000000	2025-04-17	8
76	30	dana talang	25000000	2025-04-29	8
79	33	dana talang	25000000	2025-10-07	8
80	34	dana talang	25000000	2025-10-02	8
84	38	dana talang	25000000	2025-03-23	8
86	40	dana talang	25000000	2026-04-18	8
88	42	dana talang	25000000	2025-11-02	8
89	43	dana talang	25000000	2025-04-07	8
90	44	dana talang	25000000	2026-03-06	8
91	45	dana talang	25000000	2025-06-10	8
92	46	dana talang	25000000	2026-04-21	8
93	47	dana talang	25000000	2025-11-13	8
96	50	dana talang	25000000	2025-05-26	8
97	51	dana talang	25000000	2026-02-22	8
98	52	dana talang	25000000	2025-11-15	8
99	53	dana talang	25000000	2025-10-08	8
102	56	dana talang	25000000	2025-03-12	8
104	58	dana talang	25000000	2025-09-02	8
105	59	dana talang	25000000	2026-06-04	8
106	60	dana talang	25000000	2025-10-04	8
107	61	dana talang	25000000	2025-06-30	8
108	62	dana talang	25000000	2025-08-19	8
109	63	dana talang	25000000	2025-10-31	8
110	64	dana talang	25000000	2025-12-13	8
111	65	dana talang	25000000	2025-06-07	8
112	66	dana talang	25000000	2025-10-22	8
114	68	dana talang	25000000	2025-05-21	8
116	70	dana talang	25000000	2026-01-26	8
117	71	dana talang	25000000	2025-12-14	8
118	72	dana talang	25000000	2025-07-24	8
119	73	dana talang	25000000	2025-06-16	8
121	75	dana talang	25000000	2025-09-10	8
122	76	dana talang	25000000	2025-02-26	8
123	77	dana talang	25000000	2025-07-08	8
124	78	dana talang	25000000	2025-06-26	8
128	82	dana talang	25000000	2026-02-07	8
132	86	dana talang	25000000	2025-09-18	8
136	90	dana talang	25000000	2025-08-25	8
50	4	reguler	15000000	2026-02-13	0
133	87	reguler	15000000	2025-12-17	0
134	88	reguler	15000000	2025-07-22	0
53	7	reguler	15000000	2025-04-20	0
54	8	reguler	15000000	2025-10-14	0
135	89	reguler	15000000	2025-02-21	0
57	11	reguler	15000000	2025-06-08	0
59	13	reguler	15000000	2025-03-19	0
137	91	dana talang	25000000	2025-05-19	8
139	93	dana talang	25000000	2025-11-10	8
143	97	dana talang	25000000	2025-11-12	8
144	98	dana talang	25000000	2025-04-12	8
146	100	dana talang	25000000	2025-07-04	8
147	101	dana talang	25000000	2025-09-13	8
148	102	dana talang	25000000	2025-02-04	8
150	104	dana talang	25000000	2026-05-18	8
152	106	dana talang	25000000	2025-12-12	8
154	108	dana talang	25000000	2026-04-23	8
155	109	dana talang	25000000	2025-05-27	8
159	113	dana talang	25000000	2025-03-31	8
161	115	dana talang	25000000	2025-06-16	8
162	116	dana talang	25000000	2025-07-20	8
164	118	dana talang	25000000	2025-05-27	8
165	119	dana talang	25000000	2025-09-28	8
167	121	dana talang	25000000	2025-09-07	8
168	122	dana talang	25000000	2026-01-03	8
169	123	dana talang	25000000	2025-06-24	8
172	126	dana talang	25000000	2026-02-25	8
173	127	dana talang	25000000	2025-08-31	8
174	128	dana talang	25000000	2026-02-23	8
175	129	dana talang	25000000	2025-07-08	8
153	107	reguler	15000000	2026-01-04	0
163	117	reguler	15000000	2025-05-04	0
138	92	reguler	15000000	2025-10-25	0
61	15	reguler	15000000	2026-05-17	0
62	16	reguler	15000000	2025-08-02	0
63	17	reguler	15000000	2025-07-21	0
171	125	reguler	15000000	2025-11-18	0
140	94	reguler	15000000	2025-06-07	0
66	20	reguler	15000000	2025-08-04	0
67	21	reguler	15000000	2026-06-18	0
141	95	reguler	15000000	2025-09-02	0
69	23	reguler	15000000	2025-07-30	0
113	67	reguler	15000000	2025-02-23	0
142	96	reguler	15000000	2026-04-19	0
72	26	reguler	15000000	2025-03-30	0
73	27	reguler	15000000	2025-08-09	0
115	69	reguler	15000000	2025-11-14	0
156	110	reguler	15000000	2025-07-03	0
157	111	reguler	15000000	2025-10-09	0
77	31	reguler	15000000	2025-12-30	0
78	32	reguler	15000000	2025-09-14	0
145	99	reguler	15000000	2025-04-16	0
158	112	reguler	15000000	2025-06-26	0
81	35	reguler	15000000	2025-08-01	0
82	36	reguler	15000000	2025-08-01	0
83	37	reguler	15000000	2025-09-08	0
120	74	reguler	15000000	2025-11-17	0
85	39	reguler	15000000	2025-07-30	0
176	130	reguler	15000000	2026-05-17	0
87	41	reguler	15000000	2025-12-17	0
160	114	reguler	15000000	2025-11-25	0
149	103	reguler	15000000	2025-03-13	0
166	120	reguler	15000000	2025-06-18	0
125	79	reguler	15000000	2025-07-25	0
126	80	reguler	15000000	2026-03-09	0
127	81	reguler	15000000	2025-07-06	0
94	48	reguler	15000000	2025-03-28	0
95	49	reguler	15000000	2026-02-11	0
151	105	reguler	15000000	2025-10-29	0
129	83	reguler	15000000	2026-01-19	0
130	84	reguler	15000000	2025-08-09	0
131	85	reguler	15000000	2026-06-06	0
100	54	reguler	15000000	2026-04-01	0
101	55	reguler	15000000	2025-08-02	0
170	124	reguler	15000000	2025-03-20	0
103	57	reguler	15000000	2026-02-06	0
\.


--
-- TOC entry 5083 (class 0 OID 16939)
-- Dependencies: 223
-- Data for Name: perusahaan_mitra; Type: TABLE DATA; Schema: osin; Owner: postgres
--

COPY osin.perusahaan_mitra (perusahaan_id, nama_perusahaan, lokasi, bidang_industri, kuota_peserta) FROM stdin;
1	Nippon Kikai Co., Ltd.	Osaka, Jepang	Manufaktur	5
2	Sakura Agri Corp.	Aichi, Jepang	Pertanian	8
3	Tokyo Care Center	Tokyo, Jepang	Caregiver	4
4	Yamato Kensetsu	Nagoya, Jepang	Konstruksi	6
5	Fuji Food Processing	Shizuoka, Jepang	Pengolahan Makanan	7
6	Hokkaido Fishery Ltd.	Hokkaido, Jepang	Perikanan	5
7	Kansai Precision Co.	Kyoto, Jepang	Manufaktur	4
8	Midori Kaigo Service	Chiba, Jepang	Caregiver	6
9	nippon kikai co., ltd.	osaka, jepang	manufaktur	6
10	sakura agri corp.	aichi, jepang	pertanian	10
11	tokyo care center	tokyo, jepang	caregiver	5
12	yamato kensetsu	nagoya, jepang	konstruksi	8
13	fuji food processing	shizuoka, jepang	pengolahan makanan	9
14	hokkaido fishery ltd.	hokkaido, jepang	perikanan	6
15	kansai precision co.	kyoto, jepang	manufaktur	5
16	midori kaigo service	chiba, jepang	caregiver	7
\.


--
-- TOC entry 5085 (class 0 OID 16961)
-- Dependencies: 225
-- Data for Name: peserta; Type: TABLE DATA; Schema: osin; Owner: postgres
--

COPY osin.peserta (id_peserta, nama, nik, alamat, tanggal_lahir, pendidikan_terakhir, program_id, tanggal_daftar) FROM stdin;
2	Dewi Lestari	3212010203040002	cirebon, jawa barat	2001-11-02	sma	2	2026-01-15
3	Rian Saputra	3212010203040003	indramayu, jawa barat	2000-07-21	d3 teknik	3	2026-02-01
4	Dewi Nugraha	32112517039004	cirebon, jawa barat	1999-10-14	sma	1	2025-08-24
5	Hendra Saputra	32108123069005	subang, jawa barat	2000-04-25	d3 teknik	1	2025-08-24
6	Hadi Susanto	32104027059006	brebes, jawa barat	2003-10-07	sma	1	2025-09-28
7	Hendra Utama	32111220019007	kuningan, jawa barat	1998-06-13	d3 teknik	1	2025-09-24
8	Putri Putra	32125212019008	cirebon, jawa barat	2000-11-06	d3 pertanian	3	2025-08-17
9	Yuni Wijaya	32115023039009	bandung, jawa barat	1998-12-24	d3 teknik	3	2025-09-15
10	Agus Santoso	32104325029010	tegal, jawa barat	2000-03-22	d3 pertanian	3	2025-09-12
11	Yusuf Gunawan	32122426089011	cirebon, jawa barat	2001-04-03	d3 teknik	1	2025-12-29
12	Oki Maulana	32109713029012	karawang, jawa barat	2003-07-14	d3 pertanian	3	2025-08-14
13	Ayu Ashari	32128113019013	tegal, jawa barat	1998-02-25	smk	1	2025-11-13
14	Tika Utama	32103120019014	indramayu, jawa barat	2005-09-28	s1	1	2025-08-15
15	Zaki Permana	32112218079015	majalengka, jawa barat	2002-08-11	sma	1	2025-11-26
16	Rina Kurnia	32113513029016	tegal, jawa barat	2000-05-10	s1	1	2025-10-27
17	Joko Kurnia	32113415129017	bandung, jawa barat	2004-09-01	sma	1	2025-09-08
18	Wulan Setiawan	32109023019018	majalengka, jawa barat	2003-07-26	smk	2	2025-09-10
19	Indah Gunawan	32126022119019	tegal, jawa barat	2003-01-04	d3 teknik	1	2025-12-27
20	Yuni Permana	32106319099020	subang, jawa barat	2004-06-13	d3 teknik	3	2025-09-02
21	Ahmad Hidayat	32114616079021	brebes, jawa barat	2003-08-15	d3 pertanian	3	2025-09-24
22	Ayu Ashari	32121228049022	karawang, jawa barat	2005-07-08	smk	3	2025-08-02
23	Anisa Maulana	32128024039023	bandung, jawa barat	2005-05-25	smk	3	2025-10-10
24	Nur Santoso	32121223069024	tegal, jawa barat	2005-07-02	smk	2	2025-11-08
25	Yusuf Susanto	32108424039025	brebes, jawa barat	1998-07-19	s1	3	2025-08-07
26	Dimas Susanto	32114223059026	cirebon, jawa barat	2005-01-24	s1	1	2025-10-29
27	Oki Wijaya	32128816089027	subang, jawa barat	2003-03-20	s1	3	2025-08-30
28	Nur Santoso	32112413129028	subang, jawa barat	1999-10-26	sma	2	2025-12-15
29	irfan susanto	32102412092542	sumedang, jawa barat	2006-01-17	smk	1	2025-04-18
30	lestari pratama	32111311093181	subang, jawa barat	2003-03-18	sma	2	2025-11-28
31	maya ramadhan	32125427076146	bandung, jawa barat	2006-08-12	d3 teknik	1	2025-12-31
32	ayu wijaya	32126223036604	majalengka, jawa barat	2004-07-02	sma	2	2026-02-10
33	sari santoso	32103119118301	subang, jawa barat	2003-11-12	sma	3	2025-11-06
34	lina susanto	32111814023887	majalengka, jawa barat	2000-11-08	sma	2	2025-07-23
35	anisa yulianto	32102724117428	karawang, jawa barat	2003-07-04	d3 pertanian	2	2025-04-16
36	bayu yulianto	32101312047164	majalengka, jawa barat	2001-06-20	d3 teknik	2	2025-10-04
37	eko nugraha	32126521036827	kuningan, jawa barat	2005-09-25	s1	1	2026-01-12
38	yeni gunawan	32118612042673	kuningan, jawa barat	2004-04-11	smk	2	2025-01-06
39	yeni susanto	32123722122391	kadipaten, jawa barat	1999-03-05	sma	1	2025-06-03
40	nur saputra	32112816059211	kuningan, jawa barat	2006-06-09	s1	1	2026-03-01
41	irfan putra	32126110084000	brebes, jawa barat	1997-03-06	smk	2	2025-03-09
42	lutfi nugraha	32102113098408	tegal, jawa barat	1997-02-15	d3 teknik	2	2025-10-11
43	taufik wijaya	32107921035146	majalengka, jawa barat	2004-04-24	sma	1	2026-05-10
44	novi saputra	32119620095840	tegal, jawa barat	1998-02-26	smk	3	2025-07-25
45	lina nugraha	32120714099434	brebes, jawa barat	2004-12-11	sma	1	2025-07-11
46	siti putra	32112213035290	indramayu, jawa barat	1999-04-10	d3 teknik	2	2025-09-22
47	lestari putra	32115716046614	kuningan, jawa barat	1999-07-12	sma	3	2025-11-11
48	bayu permana	32128020041564	subang, jawa barat	2000-06-06	sma	1	2025-07-30
49	intan kurnia	32119920129096	majalengka, jawa barat	2001-12-20	smk	1	2026-06-14
50	rina susanto	32123127011308	cikampek, jawa barat	2005-11-08	d3 pertanian	1	2025-04-18
51	sari susanto	32103925115707	indramayu, jawa barat	2006-11-21	smk	1	2025-07-20
52	gilang utama	32110219028748	indramayu, jawa barat	2001-08-03	s1	3	2025-07-26
53	candra nugraha	32105721049157	bandung, jawa barat	2003-01-06	sma	3	2026-02-24
54	yusuf susanto	32106116121192	kadipaten, jawa barat	2001-05-12	sma	1	2025-03-24
55	putri firmansyah	32113623096170	kuningan, jawa barat	2002-07-01	d3 pertanian	3	2025-08-01
56	panji susanto	32112219087461	cirebon, jawa barat	1999-11-06	sma	1	2026-05-29
57	panji halim	32110310127763	karawang, jawa barat	2003-12-17	smk	1	2025-04-12
58	oki susanto	32120424076112	indramayu, jawa barat	1999-01-14	d3 pertanian	3	2025-04-20
59	andi saputra	32106417101615	cikampek, jawa barat	2001-03-21	d3 teknik	2	2025-12-25
60	dewi saputra	32127519085564	sumedang, jawa barat	2000-08-17	smk	2	2025-09-12
61	fauzan ramadhan	32100319129271	cirebon, jawa barat	2000-08-07	d3 teknik	2	2025-09-28
62	budi yulianto	32107422014488	indramayu, jawa barat	2006-03-14	sma	2	2025-09-23
63	rian santoso	32117923024398	karawang, jawa barat	2002-05-27	d3 pertanian	1	2025-07-24
64	fauzan pratama	32119211082025	indramayu, jawa barat	2001-04-24	sma	3	2025-07-27
65	novi susanto	32112823083174	bandung, jawa barat	1999-01-26	d3 teknik	3	2025-09-03
66	joko firmansyah	32120812111554	bandung, jawa barat	2005-09-11	smk	3	2025-03-19
67	rizky ashari	32112027112985	subang, jawa barat	2001-05-19	d3 teknik	1	2025-07-27
68	oki putra	32126917112647	cikampek, jawa barat	2004-01-04	sma	2	2026-04-09
69	intan saputra	32105421041613	sumedang, jawa barat	2002-03-02	smk	3	2025-12-14
70	farhan santoso	32108322125442	karawang, jawa barat	2001-11-10	d3 pertanian	3	2025-10-25
71	nur saputra	32122215072860	cirebon, jawa barat	2003-10-12	d3 pertanian	2	2025-04-03
72	sandi setiawan	32126615022782	karawang, jawa barat	2004-04-10	smk	3	2026-03-02
73	wulan yulianto	32120716083997	brebes, jawa barat	2000-01-13	s1	1	2025-06-04
74	bayu ashari	32125724031382	indramayu, jawa barat	2006-08-15	smk	1	2026-04-19
75	hendra santoso	32116026021889	tegal, jawa barat	2003-11-26	smk	1	2025-11-07
76	maulana nugraha	32123314059228	bandung, jawa barat	2000-10-09	s1	2	2025-03-20
77	panji wijaya	32127111116894	bandung, jawa barat	2005-09-19	sma	1	2026-02-01
78	jefri permana	32100011043447	subang, jawa barat	2006-11-14	d3 pertanian	2	2025-05-20
79	arif setiawan	32106810043446	bandung, jawa barat	1998-02-21	smk	3	2026-02-20
80	muhammad susanto	32109517031956	cirebon, jawa barat	1997-10-18	smk	1	2025-11-06
81	fajar nugraha	32111811026497	kadipaten, jawa barat	2001-12-02	d3 teknik	2	2025-10-03
82	yeni permana	32109822064918	karawang, jawa barat	2005-08-16	s1	2	2026-03-28
83	irfan saputra	32101511031698	kadipaten, jawa barat	1998-12-02	sma	3	2025-07-28
84	andi pratama	32104419082636	majalengka, jawa barat	1998-11-07	d3 teknik	1	2025-03-02
85	sandi yulianto	32101523018150	tegal, jawa barat	1998-06-16	sma	2	2026-02-04
86	bagas wijaya	32125115086688	tegal, jawa barat	2001-10-06	d3 teknik	3	2025-08-30
87	rani wijaya	32120522122411	karawang, jawa barat	1997-06-07	d3 teknik	1	2026-06-02
88	wahyu putra	32107924116297	majalengka, jawa barat	2004-08-23	d3 teknik	2	2025-09-27
89	lutfi nugraha	32105215112665	kuningan, jawa barat	2003-03-05	d3 teknik	2	2025-06-26
90	dewi firmansyah	32122028107900	kuningan, jawa barat	2006-04-22	smk	2	2025-08-11
91	yuni saputra	32119925021624	subang, jawa barat	2005-04-06	smk	2	2025-10-27
92	rina yulianto	32118211055495	karawang, jawa barat	2003-01-01	sma	1	2025-12-03
93	lestari ashari	32110815032128	cikampek, jawa barat	2000-08-21	s1	2	2025-06-03
94	sari gunawan	32111718127162	cikampek, jawa barat	2001-07-22	smk	2	2025-10-19
95	rani kurnia	32115522012397	brebes, jawa barat	2002-03-17	d3 teknik	2	2025-02-15
96	maya santoso	32128019049101	kadipaten, jawa barat	2000-09-03	d3 pertanian	2	2025-05-19
97	ilham rahman	32115124067976	karawang, jawa barat	1998-03-21	d3 teknik	2	2025-11-06
98	yuni wijaya	32118720089610	tegal, jawa barat	2000-05-14	d3 teknik	1	2026-01-19
99	eka rahman	32106020046195	kadipaten, jawa barat	2001-03-19	sma	2	2025-12-11
100	novi setiawan	32105115017907	cirebon, jawa barat	1997-06-28	smk	2	2025-07-22
101	doni pratama	32106023107629	bandung, jawa barat	1998-01-22	d3 pertanian	2	2025-06-13
102	putri rahman	32100918124969	bandung, jawa barat	1999-01-12	smk	2	2025-11-11
103	yuni gunawan	32129424083727	majalengka, jawa barat	1998-06-21	smk	2	2025-09-04
104	dimas yulianto	32111924051027	sumedang, jawa barat	2001-05-14	smk	2	2025-02-17
105	eko utama	32128325074283	kadipaten, jawa barat	2000-05-20	sma	2	2025-07-01
106	wulan susanto	32129626059550	sumedang, jawa barat	2004-09-19	smk	1	2025-06-19
107	krisna saputra	32117618091337	cirebon, jawa barat	1997-04-28	s1	2	2025-07-23
108	galih gunawan	32123425027510	cirebon, jawa barat	1998-05-11	s1	1	2026-03-07
109	rani pratama	32128310015225	tegal, jawa barat	2004-01-04	smk	1	2025-06-27
110	dewi ashari	32109911034613	cirebon, jawa barat	2006-06-24	smk	2	2026-02-03
111	devi kurnia	32122414057852	karawang, jawa barat	2000-03-01	d3 teknik	2	2026-01-09
112	made utama	32124419025223	kuningan, jawa barat	2002-07-09	smk	3	2025-08-02
113	nur nugraha	32129215033951	tegal, jawa barat	2000-12-06	smk	2	2026-05-27
114	budi putra	32117720059077	cirebon, jawa barat	1997-07-25	d3 pertanian	1	2025-09-16
115	agus putra	32103613065009	sumedang, jawa barat	2003-10-25	sma	1	2025-12-13
116	taufik nugraha	32128410012580	kadipaten, jawa barat	2000-05-01	s1	2	2025-07-14
117	wulan kurnia	32129324127498	majalengka, jawa barat	1997-11-13	d3 pertanian	2	2025-02-11
118	zaki firmansyah	32121610062786	tegal, jawa barat	1999-02-11	d3 pertanian	1	2025-08-23
119	maulana nugraha	32113927012646	subang, jawa barat	1998-09-01	d3 pertanian	1	2025-05-16
120	farhan kurnia	32122513093152	subang, jawa barat	2003-10-10	d3 teknik	1	2025-10-20
121	jefri susanto	32100621034908	sumedang, jawa barat	2005-06-16	d3 teknik	1	2025-11-03
122	budi putra	32119824062789	tegal, jawa barat	2000-11-24	smk	1	2025-05-28
123	sari susanto	32129214075576	brebes, jawa barat	2006-02-13	d3 pertanian	2	2025-08-24
124	taufik setiawan	32127419038137	brebes, jawa barat	2003-10-08	sma	3	2026-04-13
125	sari hidayat	32127419098162	tegal, jawa barat	2005-12-22	d3 pertanian	1	2025-11-02
126	galih halim	32107816078974	karawang, jawa barat	2004-10-19	d3 teknik	2	2025-04-09
127	fitri permana	32126023113562	tegal, jawa barat	2001-09-07	s1	3	2025-04-10
128	fajar halim	32100710043870	bandung, jawa barat	2005-10-09	s1	2	2025-06-27
129	joko pratama	32113613102032	sumedang, jawa barat	2000-08-20	d3 pertanian	1	2025-09-07
130	panji rahman	32103417117386	cikampek, jawa barat	2006-04-14	d3 teknik	1	2025-01-27
131	rina maulana	32117927047346	kuningan, jawa barat	2004-05-12	smk	1	2025-03-08
132	tika ramadhan	32115225094349	kuningan, jawa barat	2004-11-05	d3 teknik	2	2026-05-10
133	ilham kurnia	32115910072409	kadipaten, jawa barat	1999-04-11	smk	2	2025-10-24
134	fauzan hidayat	32118222083165	subang, jawa barat	1999-01-12	d3 teknik	3	2025-12-04
135	andi utama	32115915104729	brebes, jawa barat	2004-12-17	d3 teknik	3	2025-12-28
136	lestari yulianto	32111318092473	sumedang, jawa barat	2003-08-11	s1	2	2026-04-13
137	farhan setiawan	32112027055090	indramayu, jawa barat	1999-06-12	d3 pertanian	1	2025-05-25
138	agus kurnia	32117919033324	brebes, jawa barat	2006-04-11	sma	2	2025-06-27
139	taufik ashari	32105715068292	bandung, jawa barat	2006-06-10	smk	2	2025-09-29
140	eko hidayat	32112817023271	kadipaten, jawa barat	1997-01-25	d3 pertanian	3	2025-06-22
141	andi wijaya	32129022014546	bandung, jawa barat	2003-08-24	smk	3	2025-03-28
142	novi rahman	32109716127102	indramayu, jawa barat	1997-10-28	s1	1	2025-11-21
143	ahmad ashari	32128821104201	bandung, jawa barat	1998-09-11	s1	2	2025-06-12
144	muhammad ramadhan	32111324122396	majalengka, jawa barat	2006-06-18	s1	3	2025-07-15
145	gilang putra	32129012072203	bandung, jawa barat	1999-09-18	s1	2	2025-05-02
146	andi saputra	32110924052974	kadipaten, jawa barat	1999-07-03	s1	3	2025-05-17
147	krisna gunawan	32105121096363	brebes, jawa barat	1998-01-22	smk	1	2025-09-22
148	yusuf kurnia	32124926081518	indramayu, jawa barat	1998-03-20	s1	1	2025-06-09
149	yusuf halim	32124720041336	kuningan, jawa barat	2004-10-02	smk	2	2025-09-03
150	siti utama	32104816072621	sumedang, jawa barat	2001-04-28	smk	2	2025-12-25
151	wulan gunawan	32107714041118	cikampek, jawa barat	2004-07-15	d3 pertanian	2	2025-06-14
152	yuni santoso	32109728023928	subang, jawa barat	2006-06-15	d3 teknik	3	2025-03-15
153	nur firmansyah	32102914101796	cirebon, jawa barat	1998-10-11	smk	1	2025-11-16
154	lestari yulianto	32117215017787	indramayu, jawa barat	1998-11-20	d3 teknik	2	2026-02-18
155	maulana permana	32108012013559	kuningan, jawa barat	1999-09-25	sma	1	2025-08-21
156	doni putra	32114014051148	tegal, jawa barat	2004-02-21	d3 teknik	1	2026-02-19
1	Ahmad Fauzan	3212010203040001	indramayu, jawa barat	2002-05-14	smk	1	2026-01-10
157	intan setiawan	32127010064974	bandung, jawa barat	2004-04-21	d3 teknik	3	2025-07-03
158	reza firmansyah	32111821046341	karawang, jawa barat	2001-05-16	smk	3	2026-05-08
\.


--
-- TOC entry 5081 (class 0 OID 16929)
-- Dependencies: 221
-- Data for Name: program; Type: TABLE DATA; Schema: osin; Owner: postgres
--

COPY osin.program (program_id, nama_program, jenis_visa, durasi_kontrak) FROM stdin;
1	Magang	Visa Magang	3 tahun
2	Tokutei Ginou	Visa Tokutei Ginou	5 tahun
3	Engineering	Visa Engineering	5 tahun (dapat diperpanjang)
\.


--
-- TOC entry 5087 (class 0 OID 17023)
-- Dependencies: 227
-- Data for Name: tahap_pelatihan; Type: TABLE DATA; Schema: osin; Owner: postgres
--

COPY osin.tahap_pelatihan (tahap_id, id_peserta, jenis_tahap_belajar, tanggal_mulai_belajar, tanggal_selesai_belajar, status) FROM stdin;
6	1	bahasa	2026-01-20	2026-03-20	lulus
7	1	fisik	2026-03-21	2026-04-10	lulus
8	2	bahasa	2026-01-25	2026-03-25	sedang berlangsung
9	3	tes kesehatan	2026-02-05	2026-02-10	lulus
48	4	bahasa	2025-08-29	2025-10-04	lulus
49	4	fisik	2025-10-06	2025-11-14	lulus
50	5	bahasa	2025-08-29	2025-09-29	lulus
51	5	fisik	2025-10-01	2025-11-01	lulus
52	5	budaya	2025-11-03	2025-12-12	sedang berlangsung
53	6	bahasa	2025-10-03	2025-10-25	lulus
54	6	fisik	2025-10-27	2025-11-23	lulus
55	6	budaya	2025-11-25	2025-12-18	lulus
56	6	tes kesehatan	2025-12-20	2026-01-21	sedang berlangsung
57	7	bahasa	2025-09-29	2025-11-06	lulus
58	7	fisik	2025-11-08	2025-12-20	lulus
59	7	budaya	2025-12-22	2026-01-21	lulus
60	7	tes kesehatan	2026-01-23	2026-02-18	tidak
61	8	bahasa	2025-08-22	2025-09-30	lulus
62	8	fisik	2025-10-02	2025-11-05	lulus
63	8	budaya	2025-11-07	2025-12-13	sedang berlangsung
64	9	bahasa	2025-09-20	2025-10-13	lulus
65	9	fisik	2025-10-15	2025-11-24	lulus
66	9	budaya	2025-11-26	2025-12-25	lulus
67	9	tes kesehatan	2025-12-27	2026-02-05	tidak
68	10	bahasa	2025-09-17	2025-10-26	lulus
69	10	fisik	2025-10-28	2025-11-30	lulus
70	10	budaya	2025-12-02	2025-12-28	tidak
71	11	bahasa	2026-01-03	2026-02-10	lulus
72	11	fisik	2026-02-12	2026-03-11	lulus
73	11	budaya	2026-03-13	2026-04-02	lulus
74	11	tes kesehatan	2026-04-04	2026-04-26	tidak
75	12	bahasa	2025-08-30	2025-10-02	sedang berlangsung
76	13	bahasa	2025-12-02	2025-12-24	lulus
77	13	fisik	2025-12-26	2026-01-29	tidak
78	14	bahasa	2025-11-13	2025-12-28	lulus
79	14	fisik	2025-12-30	2026-02-13	lulus
80	14	budaya	2026-02-15	2026-03-21	sedang berlangsung
81	15	bahasa	2025-12-19	2026-01-24	lulus
82	15	fisik	2026-01-26	2026-02-17	lulus
83	16	bahasa	2025-10-25	2025-11-20	lulus
84	16	fisik	2025-11-22	2026-01-02	lulus
85	16	budaya	2026-01-04	2026-02-15	lulus
86	16	tes kesehatan	2026-02-17	2026-03-19	lulus
87	17	bahasa	2025-10-22	2025-12-06	lulus
88	17	fisik	2025-12-08	2026-01-17	lulus
89	17	budaya	2026-01-19	2026-02-24	lulus
90	17	tes kesehatan	2026-02-26	2026-03-18	tidak
91	18	bahasa	2025-08-06	2025-08-30	lulus
92	18	fisik	2025-09-01	2025-10-11	lulus
93	18	budaya	2025-10-13	2025-11-10	lulus
94	19	bahasa	2025-11-07	2025-12-22	lulus
95	19	fisik	2025-12-24	2026-01-14	lulus
96	19	budaya	2026-01-16	2026-02-16	lulus
97	19	tes kesehatan	2026-02-18	2026-03-16	tidak
98	20	bahasa	2025-09-26	2025-10-30	lulus
99	20	fisik	2025-11-01	2025-12-02	lulus
100	20	budaya	2025-12-04	2026-01-02	lulus
101	20	tes kesehatan	2026-01-04	2026-02-18	lulus
102	21	bahasa	2025-10-25	2025-11-30	lulus
103	21	fisik	2025-12-02	2025-12-25	lulus
104	21	budaya	2025-12-27	2026-01-28	tidak
105	22	bahasa	2025-10-21	2025-12-01	lulus
106	22	fisik	2025-12-03	2026-01-05	lulus
107	22	budaya	2026-01-07	2026-02-06	lulus
108	22	tes kesehatan	2026-02-08	2026-03-12	tidak
109	23	bahasa	2025-12-15	2026-01-23	lulus
110	23	fisik	2026-01-25	2026-02-24	lulus
111	23	budaya	2026-02-26	2026-03-20	lulus
112	23	tes kesehatan	2026-03-22	2026-05-05	lulus
113	24	bahasa	2025-11-22	2026-01-06	lulus
114	24	fisik	2026-01-08	2026-02-19	tidak
115	25	bahasa	2025-12-05	2026-01-18	lulus
116	25	fisik	2026-01-20	2026-02-16	lulus
117	25	budaya	2026-02-18	2026-03-30	lulus
118	25	tes kesehatan	2026-04-01	2026-04-29	tidak
119	26	bahasa	2025-08-21	2025-09-23	lulus
120	26	fisik	2025-09-25	2025-10-27	tidak
121	27	bahasa	2025-12-08	2026-01-07	tidak
122	28	bahasa	2025-09-29	2025-10-29	lulus
123	28	fisik	2025-10-31	2025-12-14	lulus
124	28	budaya	2025-12-16	2026-01-17	lulus
125	28	tes kesehatan	2026-01-19	2026-02-16	sedang berlangsung
126	1	bahasa	2025-04-23	2025-05-24	lulus
127	1	fisik	2025-05-26	2025-06-14	sedang berlangsung
128	2	bahasa	2025-12-03	2026-01-08	lulus
129	2	fisik	2026-01-10	2026-02-17	lulus
130	3	bahasa	2026-01-05	2026-02-01	lulus
131	3	fisik	2026-02-03	2026-03-09	lulus
132	4	bahasa	2026-02-15	2026-03-27	lulus
133	4	fisik	2026-03-29	2026-04-27	lulus
134	4	budaya	2026-04-29	2026-06-05	lulus
135	5	bahasa	2025-11-11	2025-12-05	lulus
136	5	fisik	2025-12-07	2026-01-18	lulus
137	5	budaya	2026-01-20	2026-02-16	lulus
138	5	tes kesehatan	2026-02-18	2026-03-12	sedang berlangsung
139	6	bahasa	2025-07-28	2025-08-28	lulus
140	7	bahasa	2025-04-21	2025-05-14	lulus
141	7	fisik	2025-05-16	2025-06-06	lulus
142	7	budaya	2025-06-08	2025-07-06	lulus
143	8	bahasa	2025-10-09	2025-11-11	lulus
144	8	fisik	2025-11-13	2025-12-16	lulus
145	8	budaya	2025-12-18	2026-01-14	lulus
146	8	tes kesehatan	2026-01-16	2026-02-05	lulus
147	9	bahasa	2026-01-17	2026-02-10	lulus
148	9	fisik	2026-02-12	2026-03-09	lulus
149	9	budaya	2026-03-11	2026-04-10	lulus
150	9	tes kesehatan	2026-04-12	2026-05-23	sedang berlangsung
151	10	bahasa	2025-01-11	2025-02-18	lulus
152	10	fisik	2025-02-20	2025-03-21	lulus
153	10	budaya	2025-03-23	2025-04-30	lulus
154	10	tes kesehatan	2025-05-02	2025-05-22	sedang berlangsung
155	11	bahasa	2025-06-08	2025-07-15	lulus
156	11	fisik	2025-07-17	2025-08-19	lulus
157	11	budaya	2025-08-21	2025-09-29	lulus
158	11	tes kesehatan	2025-10-01	2025-10-30	lulus
159	12	bahasa	2026-03-06	2026-04-07	lulus
160	12	fisik	2026-04-09	2026-05-18	lulus
161	12	budaya	2026-05-20	2026-06-25	sedang berlangsung
162	13	bahasa	2025-03-14	2025-04-17	lulus
163	13	fisik	2025-04-19	2025-05-23	lulus
164	13	budaya	2025-05-25	2025-06-29	lulus
165	14	bahasa	2025-10-16	2025-11-17	lulus
166	14	fisik	2025-11-19	2025-12-23	lulus
167	14	budaya	2025-12-25	2026-01-29	lulus
168	14	tes kesehatan	2026-01-31	2026-03-05	lulus
169	15	bahasa	2026-05-15	2026-06-07	lulus
170	15	fisik	2026-06-09	2026-07-19	lulus
171	15	budaya	2026-07-21	2026-08-21	lulus
172	15	tes kesehatan	2026-08-23	2026-09-26	lulus
173	16	bahasa	2025-07-30	2025-09-10	lulus
174	17	bahasa	2025-07-16	2025-08-05	lulus
175	17	fisik	2025-08-07	2025-09-02	lulus
176	17	budaya	2025-09-04	2025-09-22	lulus
177	17	tes kesehatan	2025-09-24	2025-11-01	lulus
178	18	bahasa	2025-09-27	2025-10-23	lulus
179	18	fisik	2025-10-25	2025-11-23	lulus
180	18	budaya	2025-11-25	2025-12-13	lulus
181	18	tes kesehatan	2025-12-15	2026-01-10	lulus
182	19	bahasa	2025-11-16	2025-12-17	lulus
183	19	fisik	2025-12-19	2026-01-11	lulus
184	19	budaya	2026-01-13	2026-02-01	lulus
185	19	tes kesehatan	2026-02-03	2026-02-23	lulus
186	20	bahasa	2025-08-04	2025-08-29	lulus
187	20	fisik	2025-08-31	2025-10-04	lulus
188	20	budaya	2025-10-06	2025-11-17	lulus
189	20	tes kesehatan	2025-11-19	2025-12-07	lulus
190	21	bahasa	2026-06-19	2026-07-30	lulus
191	21	fisik	2026-08-01	2026-09-10	lulus
192	21	budaya	2026-09-12	2026-10-16	lulus
193	21	tes kesehatan	2026-10-18	2026-11-09	tidak
194	22	bahasa	2025-04-23	2025-05-28	lulus
195	22	fisik	2025-05-30	2025-06-19	lulus
196	22	budaya	2025-06-21	2025-07-30	lulus
197	22	tes kesehatan	2025-08-01	2025-09-04	lulus
198	23	bahasa	2025-07-25	2025-08-21	lulus
199	23	fisik	2025-08-23	2025-09-29	lulus
200	23	budaya	2025-10-01	2025-11-06	lulus
201	23	tes kesehatan	2025-11-08	2025-11-30	lulus
202	24	bahasa	2025-07-31	2025-08-24	lulus
203	24	fisik	2025-08-26	2025-09-15	lulus
204	24	budaya	2025-09-17	2025-10-23	lulus
205	25	bahasa	2026-03-01	2026-03-23	lulus
206	25	fisik	2026-03-25	2026-04-25	lulus
207	25	budaya	2026-04-27	2026-05-26	lulus
208	26	bahasa	2025-03-29	2025-04-29	lulus
209	26	fisik	2025-05-01	2025-06-12	lulus
210	26	budaya	2025-06-14	2025-07-10	sedang berlangsung
211	27	bahasa	2025-08-06	2025-08-25	lulus
212	27	fisik	2025-08-27	2025-10-07	lulus
213	27	budaya	2025-10-09	2025-11-09	lulus
214	27	tes kesehatan	2025-11-11	2025-12-13	lulus
215	28	bahasa	2026-06-03	2026-07-05	lulus
216	28	fisik	2026-07-07	2026-08-04	lulus
217	28	budaya	2026-08-06	2026-09-17	lulus
218	28	tes kesehatan	2026-09-19	2026-10-21	lulus
219	29	bahasa	2025-04-17	2025-05-16	lulus
220	29	fisik	2025-05-18	2025-06-09	lulus
221	29	budaya	2025-06-11	2025-07-20	lulus
222	30	bahasa	2025-04-25	2025-05-29	lulus
223	30	fisik	2025-05-31	2025-07-02	lulus
224	30	budaya	2025-07-04	2025-08-05	lulus
225	30	tes kesehatan	2025-08-07	2025-09-01	sedang berlangsung
226	31	bahasa	2025-12-30	2026-01-26	lulus
227	31	fisik	2026-01-28	2026-03-03	tidak
228	32	bahasa	2025-09-17	2025-10-06	lulus
229	32	fisik	2025-10-08	2025-10-26	lulus
230	32	budaya	2025-10-28	2025-11-21	lulus
231	32	tes kesehatan	2025-11-23	2025-12-26	tidak
232	33	bahasa	2025-10-03	2025-10-30	lulus
233	33	fisik	2025-11-01	2025-11-22	lulus
234	33	budaya	2025-11-24	2025-12-31	lulus
235	34	bahasa	2025-09-28	2025-10-26	lulus
236	34	fisik	2025-10-28	2025-12-08	lulus
237	34	budaya	2025-12-10	2025-12-31	lulus
238	34	tes kesehatan	2026-01-02	2026-01-22	tidak
239	35	bahasa	2025-07-29	2025-08-30	lulus
240	35	fisik	2025-09-01	2025-09-25	lulus
241	35	budaya	2025-09-27	2025-10-25	lulus
242	36	bahasa	2025-08-01	2025-09-07	lulus
243	36	fisik	2025-09-09	2025-09-28	lulus
244	36	budaya	2025-09-30	2025-10-26	lulus
245	36	tes kesehatan	2025-10-28	2025-12-08	sedang berlangsung
246	37	bahasa	2025-09-08	2025-10-06	lulus
247	37	fisik	2025-10-08	2025-11-09	lulus
248	37	budaya	2025-11-11	2025-12-10	sedang berlangsung
249	38	bahasa	2025-03-24	2025-04-13	lulus
250	38	fisik	2025-04-15	2025-05-09	lulus
251	38	budaya	2025-05-11	2025-06-01	lulus
252	39	bahasa	2025-08-01	2025-08-24	lulus
253	39	fisik	2025-08-26	2025-09-20	lulus
254	39	budaya	2025-09-22	2025-10-17	lulus
255	39	tes kesehatan	2025-10-19	2025-11-10	lulus
256	40	bahasa	2026-04-14	2026-05-03	lulus
257	40	fisik	2026-05-05	2026-06-01	lulus
258	40	budaya	2026-06-03	2026-06-28	lulus
259	40	tes kesehatan	2026-06-30	2026-07-21	lulus
260	41	bahasa	2025-12-19	2026-01-06	lulus
261	41	fisik	2026-01-08	2026-02-05	lulus
262	41	budaya	2026-02-07	2026-03-10	lulus
263	41	tes kesehatan	2026-03-12	2026-04-20	lulus
264	42	bahasa	2025-10-30	2025-11-30	lulus
265	42	fisik	2025-12-02	2025-12-20	lulus
266	42	budaya	2025-12-22	2026-02-02	tidak
267	43	bahasa	2025-04-08	2025-05-08	lulus
268	43	fisik	2025-05-10	2025-05-30	lulus
269	44	bahasa	2026-03-07	2026-04-13	lulus
270	44	fisik	2026-04-15	2026-05-23	lulus
271	44	budaya	2026-05-25	2026-06-24	lulus
272	45	bahasa	2025-06-09	2025-07-03	lulus
273	45	fisik	2025-07-05	2025-07-24	lulus
274	45	budaya	2025-07-26	2025-08-30	lulus
275	45	tes kesehatan	2025-09-01	2025-10-13	lulus
276	46	bahasa	2026-04-24	2026-05-27	lulus
277	46	fisik	2026-05-29	2026-06-28	lulus
278	46	budaya	2026-06-30	2026-07-21	lulus
279	46	tes kesehatan	2026-07-23	2026-08-12	lulus
280	47	bahasa	2025-11-12	2025-12-03	lulus
281	47	fisik	2025-12-05	2025-12-29	lulus
282	47	budaya	2025-12-31	2026-01-22	lulus
283	47	tes kesehatan	2026-01-24	2026-02-26	lulus
284	48	bahasa	2025-03-25	2025-04-17	lulus
285	48	fisik	2025-04-19	2025-05-27	tidak
286	49	bahasa	2026-02-06	2026-03-07	lulus
287	49	fisik	2026-03-09	2026-04-04	lulus
288	49	budaya	2026-04-06	2026-05-06	lulus
289	49	tes kesehatan	2026-05-08	2026-06-06	lulus
290	50	bahasa	2025-05-25	2025-07-01	lulus
291	50	fisik	2025-07-03	2025-08-10	lulus
292	50	budaya	2025-08-12	2025-08-31	lulus
293	50	tes kesehatan	2025-09-02	2025-09-20	lulus
294	51	bahasa	2026-02-25	2026-03-15	lulus
295	51	fisik	2026-03-17	2026-04-05	lulus
296	51	budaya	2026-04-07	2026-05-15	lulus
297	51	tes kesehatan	2026-05-17	2026-06-21	tidak
298	52	bahasa	2025-11-11	2025-12-19	lulus
299	52	fisik	2025-12-21	2026-01-21	lulus
300	52	budaya	2026-01-23	2026-03-01	lulus
301	52	tes kesehatan	2026-03-03	2026-03-26	lulus
302	53	bahasa	2025-10-08	2025-11-01	lulus
303	53	fisik	2025-11-03	2025-11-23	lulus
304	53	budaya	2025-11-25	2025-12-29	lulus
305	54	bahasa	2026-04-02	2026-04-27	lulus
306	54	fisik	2026-04-29	2026-06-04	lulus
307	54	budaya	2026-06-06	2026-07-03	lulus
308	54	tes kesehatan	2026-07-05	2026-07-29	lulus
309	55	bahasa	2025-08-02	2025-09-06	lulus
310	55	fisik	2025-09-08	2025-10-17	lulus
311	55	budaya	2025-10-19	2025-11-08	lulus
312	55	tes kesehatan	2025-11-10	2025-12-22	tidak
313	56	bahasa	2025-03-07	2025-04-03	lulus
314	56	fisik	2025-04-05	2025-04-24	lulus
315	56	budaya	2025-04-26	2025-06-05	sedang berlangsung
316	57	bahasa	2026-02-09	2026-03-08	lulus
317	57	fisik	2026-03-10	2026-04-02	lulus
318	58	bahasa	2025-09-04	2025-09-25	lulus
319	58	fisik	2025-09-27	2025-11-04	lulus
320	58	budaya	2025-11-06	2025-12-18	lulus
321	58	tes kesehatan	2025-12-20	2026-01-09	lulus
322	59	bahasa	2026-06-07	2026-07-15	lulus
323	59	fisik	2026-07-17	2026-08-11	tidak
324	60	bahasa	2025-10-02	2025-10-27	lulus
325	60	fisik	2025-10-29	2025-12-02	lulus
326	60	budaya	2025-12-04	2025-12-28	lulus
327	60	tes kesehatan	2025-12-30	2026-01-25	lulus
328	61	bahasa	2025-07-01	2025-07-22	lulus
329	61	fisik	2025-07-24	2025-08-19	lulus
330	61	budaya	2025-08-21	2025-09-14	lulus
331	61	tes kesehatan	2025-09-16	2025-10-16	lulus
332	62	bahasa	2025-08-16	2025-09-06	lulus
333	62	fisik	2025-09-08	2025-10-09	lulus
334	62	budaya	2025-10-11	2025-11-05	lulus
335	62	tes kesehatan	2025-11-07	2025-12-07	sedang berlangsung
336	63	bahasa	2025-11-01	2025-12-11	lulus
337	63	fisik	2025-12-13	2026-01-15	lulus
338	63	budaya	2026-01-17	2026-02-20	lulus
339	63	tes kesehatan	2026-02-22	2026-03-12	lulus
340	64	bahasa	2025-12-08	2026-01-03	lulus
341	64	fisik	2026-01-05	2026-01-26	lulus
342	64	budaya	2026-01-28	2026-02-22	lulus
343	65	bahasa	2025-06-08	2025-07-16	lulus
344	65	fisik	2025-07-18	2025-08-18	lulus
345	65	budaya	2025-08-20	2025-09-21	tidak
346	66	bahasa	2025-10-24	2025-12-01	lulus
347	66	fisik	2025-12-03	2025-12-30	lulus
348	66	budaya	2026-01-01	2026-01-29	lulus
349	67	bahasa	2025-02-20	2025-03-30	lulus
350	67	fisik	2025-04-01	2025-04-28	lulus
351	67	budaya	2025-04-30	2025-05-26	lulus
352	67	tes kesehatan	2025-05-28	2025-07-04	lulus
353	68	bahasa	2025-05-24	2025-06-15	lulus
354	68	fisik	2025-06-17	2025-07-20	lulus
355	68	budaya	2025-07-22	2025-08-24	lulus
356	68	tes kesehatan	2025-08-26	2025-09-30	lulus
357	69	bahasa	2025-11-11	2025-12-09	lulus
358	69	fisik	2025-12-11	2026-01-01	lulus
359	69	budaya	2026-01-03	2026-02-06	lulus
360	69	tes kesehatan	2026-02-08	2026-03-13	lulus
361	70	bahasa	2026-01-24	2026-02-26	lulus
362	70	fisik	2026-02-28	2026-03-30	lulus
363	70	budaya	2026-04-01	2026-04-29	lulus
364	71	bahasa	2025-12-16	2026-01-20	lulus
365	71	fisik	2026-01-22	2026-02-27	lulus
366	71	budaya	2026-03-01	2026-03-20	lulus
367	71	tes kesehatan	2026-03-22	2026-04-21	lulus
368	72	bahasa	2025-07-27	2025-08-27	lulus
369	72	fisik	2025-08-29	2025-09-17	lulus
370	72	budaya	2025-09-19	2025-10-17	lulus
371	73	bahasa	2025-06-18	2025-07-19	lulus
372	73	fisik	2025-07-21	2025-08-25	lulus
373	73	budaya	2025-08-27	2025-09-17	lulus
374	73	tes kesehatan	2025-09-19	2025-10-09	lulus
375	74	bahasa	2025-11-16	2025-12-18	lulus
376	74	fisik	2025-12-20	2026-01-28	lulus
377	74	budaya	2026-01-30	2026-02-25	lulus
378	74	tes kesehatan	2026-02-27	2026-03-18	sedang berlangsung
379	75	bahasa	2025-09-09	2025-10-05	lulus
380	75	fisik	2025-10-07	2025-11-18	lulus
381	75	budaya	2025-11-20	2025-12-26	lulus
382	75	tes kesehatan	2025-12-28	2026-01-25	lulus
383	76	bahasa	2025-02-22	2025-03-16	lulus
384	76	fisik	2025-03-18	2025-04-23	lulus
385	76	budaya	2025-04-25	2025-05-17	lulus
386	77	bahasa	2025-07-06	2025-08-17	lulus
387	77	fisik	2025-08-19	2025-09-06	lulus
388	77	budaya	2025-09-08	2025-10-08	lulus
389	78	bahasa	2025-06-24	2025-07-23	lulus
390	78	fisik	2025-07-25	2025-08-30	lulus
391	78	budaya	2025-09-01	2025-10-07	lulus
392	78	tes kesehatan	2025-10-09	2025-11-07	lulus
393	79	bahasa	2025-07-28	2025-08-28	lulus
394	79	fisik	2025-08-30	2025-09-20	lulus
395	79	budaya	2025-09-22	2025-10-24	lulus
396	79	tes kesehatan	2025-10-26	2025-12-07	lulus
397	80	bahasa	2026-03-12	2026-04-04	lulus
398	80	fisik	2026-04-06	2026-05-08	lulus
399	80	budaya	2026-05-10	2026-06-02	lulus
400	80	tes kesehatan	2026-06-04	2026-07-03	tidak
401	81	bahasa	2025-07-02	2025-08-07	lulus
402	81	fisik	2025-08-09	2025-09-14	lulus
403	81	budaya	2025-09-16	2025-10-18	lulus
404	81	tes kesehatan	2025-10-20	2025-12-01	lulus
405	82	bahasa	2026-02-08	2026-03-18	lulus
406	82	fisik	2026-03-20	2026-04-09	lulus
407	82	budaya	2026-04-11	2026-05-13	lulus
408	82	tes kesehatan	2026-05-15	2026-06-12	lulus
409	83	bahasa	2026-01-14	2026-02-04	lulus
410	83	fisik	2026-02-06	2026-03-06	lulus
411	83	budaya	2026-03-08	2026-04-09	tidak
412	84	bahasa	2025-08-07	2025-08-26	lulus
413	84	fisik	2025-08-28	2025-10-08	lulus
414	84	budaya	2025-10-10	2025-11-06	lulus
415	84	tes kesehatan	2025-11-08	2025-11-30	tidak
416	85	bahasa	2026-06-01	2026-06-24	lulus
417	85	fisik	2026-06-26	2026-07-20	lulus
418	85	budaya	2026-07-22	2026-08-13	lulus
419	85	tes kesehatan	2026-08-15	2026-09-21	lulus
420	86	bahasa	2025-09-21	2025-10-20	lulus
421	86	fisik	2025-10-22	2025-11-10	lulus
422	87	bahasa	2025-12-18	2026-01-05	lulus
423	87	fisik	2026-01-07	2026-02-10	lulus
424	87	budaya	2026-02-12	2026-03-19	lulus
425	87	tes kesehatan	2026-03-21	2026-04-12	lulus
426	88	bahasa	2025-07-19	2025-08-17	lulus
427	88	fisik	2025-08-19	2025-09-09	lulus
428	88	budaya	2025-09-11	2025-10-21	lulus
429	88	tes kesehatan	2025-10-23	2025-11-15	lulus
430	89	bahasa	2025-02-16	2025-03-07	lulus
431	89	fisik	2025-03-09	2025-04-20	lulus
432	89	budaya	2025-04-22	2025-05-21	lulus
433	89	tes kesehatan	2025-05-23	2025-06-20	lulus
434	90	bahasa	2025-08-28	2025-09-27	lulus
435	90	fisik	2025-09-29	2025-11-10	tidak
436	91	bahasa	2025-05-21	2025-06-13	lulus
437	91	fisik	2025-06-15	2025-07-06	lulus
438	91	budaya	2025-07-08	2025-07-27	lulus
439	92	bahasa	2025-10-25	2025-12-01	lulus
440	92	fisik	2025-12-03	2026-01-12	lulus
441	92	budaya	2026-01-14	2026-02-19	lulus
442	92	tes kesehatan	2026-02-21	2026-03-18	lulus
443	93	bahasa	2025-11-08	2025-11-26	lulus
444	94	bahasa	2025-06-02	2025-07-09	lulus
445	94	fisik	2025-07-11	2025-08-17	lulus
446	94	budaya	2025-08-19	2025-09-14	lulus
447	94	tes kesehatan	2025-09-16	2025-10-20	lulus
448	95	bahasa	2025-08-29	2025-10-02	lulus
449	95	fisik	2025-10-04	2025-11-08	lulus
450	95	budaya	2025-11-10	2025-12-17	lulus
451	96	bahasa	2026-04-18	2026-05-13	lulus
452	96	fisik	2026-05-15	2026-06-12	lulus
453	96	budaya	2026-06-14	2026-07-08	lulus
454	96	tes kesehatan	2026-07-10	2026-08-10	tidak
455	97	bahasa	2025-11-07	2025-11-25	lulus
456	97	fisik	2025-11-27	2026-01-05	lulus
457	97	budaya	2026-01-07	2026-01-27	lulus
458	98	bahasa	2025-04-14	2025-05-12	lulus
459	98	fisik	2025-05-14	2025-06-12	tidak
460	99	bahasa	2025-04-15	2025-05-06	lulus
461	99	fisik	2025-05-08	2025-06-06	lulus
462	99	budaya	2025-06-08	2025-07-14	lulus
463	99	tes kesehatan	2025-07-16	2025-08-23	lulus
464	100	bahasa	2025-07-02	2025-07-24	lulus
465	100	fisik	2025-07-26	2025-08-18	lulus
466	100	budaya	2025-08-20	2025-09-23	lulus
467	100	tes kesehatan	2025-09-25	2025-11-06	lulus
468	101	bahasa	2025-09-12	2025-10-01	lulus
469	101	fisik	2025-10-03	2025-11-04	lulus
470	101	budaya	2025-11-06	2025-11-25	lulus
471	101	tes kesehatan	2025-11-27	2026-01-03	lulus
472	102	bahasa	2025-02-01	2025-02-26	lulus
473	102	fisik	2025-02-28	2025-03-20	lulus
474	102	budaya	2025-03-22	2025-04-14	lulus
475	102	tes kesehatan	2025-04-16	2025-05-09	lulus
476	103	bahasa	2025-03-13	2025-04-07	lulus
477	103	fisik	2025-04-09	2025-05-19	lulus
478	103	budaya	2025-05-21	2025-06-12	lulus
479	103	tes kesehatan	2025-06-14	2025-07-04	lulus
480	104	bahasa	2026-05-15	2026-06-14	lulus
481	104	fisik	2026-06-16	2026-07-23	lulus
482	104	budaya	2026-07-25	2026-08-28	lulus
483	104	tes kesehatan	2026-08-30	2026-09-23	lulus
484	105	bahasa	2025-10-29	2025-12-02	lulus
485	105	fisik	2025-12-04	2026-01-15	lulus
486	105	budaya	2026-01-17	2026-02-13	lulus
487	106	bahasa	2025-12-09	2026-01-08	lulus
488	106	fisik	2026-01-10	2026-02-08	lulus
489	106	budaya	2026-02-10	2026-03-20	lulus
490	106	tes kesehatan	2026-03-22	2026-04-12	lulus
491	107	bahasa	2026-01-02	2026-01-23	lulus
492	107	fisik	2026-01-25	2026-03-08	lulus
493	107	budaya	2026-03-10	2026-04-21	lulus
494	107	tes kesehatan	2026-04-23	2026-05-31	lulus
495	108	bahasa	2026-04-18	2026-05-27	lulus
496	108	fisik	2026-05-29	2026-07-08	lulus
497	108	budaya	2026-07-10	2026-08-03	lulus
498	108	tes kesehatan	2026-08-05	2026-09-05	lulus
499	109	bahasa	2025-05-30	2025-07-09	lulus
500	109	fisik	2025-07-11	2025-08-13	lulus
501	110	bahasa	2025-07-02	2025-07-24	lulus
502	110	fisik	2025-07-26	2025-09-01	lulus
503	110	budaya	2025-09-03	2025-10-05	lulus
504	110	tes kesehatan	2025-10-07	2025-11-18	lulus
505	111	bahasa	2025-10-04	2025-11-06	lulus
506	111	fisik	2025-11-08	2025-11-28	lulus
507	111	budaya	2025-11-30	2026-01-10	lulus
508	111	tes kesehatan	2026-01-12	2026-02-21	lulus
509	112	bahasa	2025-06-27	2025-08-05	lulus
510	112	fisik	2025-08-07	2025-08-30	lulus
511	112	budaya	2025-09-01	2025-09-22	lulus
512	112	tes kesehatan	2025-09-24	2025-11-04	sedang berlangsung
513	113	bahasa	2025-04-02	2025-04-27	lulus
514	113	fisik	2025-04-29	2025-05-22	lulus
515	114	bahasa	2025-11-26	2025-12-27	lulus
516	114	fisik	2025-12-29	2026-01-26	lulus
517	114	budaya	2026-01-28	2026-02-17	lulus
518	114	tes kesehatan	2026-02-19	2026-03-23	lulus
519	115	bahasa	2025-06-17	2025-07-24	lulus
520	115	fisik	2025-07-26	2025-09-01	lulus
521	115	budaya	2025-09-03	2025-09-23	lulus
522	115	tes kesehatan	2025-09-25	2025-10-14	sedang berlangsung
523	116	bahasa	2025-07-20	2025-08-15	lulus
524	116	fisik	2025-08-17	2025-09-07	lulus
525	116	budaya	2025-09-09	2025-10-04	lulus
526	116	tes kesehatan	2025-10-06	2025-10-29	tidak
527	117	bahasa	2025-05-07	2025-06-17	lulus
528	117	fisik	2025-06-19	2025-07-23	lulus
529	117	budaya	2025-07-25	2025-08-15	lulus
530	117	tes kesehatan	2025-08-17	2025-09-18	sedang berlangsung
531	118	bahasa	2025-05-22	2025-06-20	lulus
532	118	fisik	2025-06-22	2025-07-15	lulus
533	118	budaya	2025-07-17	2025-08-15	lulus
534	118	tes kesehatan	2025-08-17	2025-09-27	sedang berlangsung
535	119	bahasa	2025-09-27	2025-11-02	lulus
536	119	fisik	2025-11-04	2025-12-06	lulus
537	119	budaya	2025-12-08	2025-12-29	lulus
538	119	tes kesehatan	2025-12-31	2026-01-18	lulus
539	120	bahasa	2025-06-14	2025-07-14	lulus
540	120	fisik	2025-07-16	2025-08-10	lulus
541	120	budaya	2025-08-12	2025-09-18	lulus
542	120	tes kesehatan	2025-09-20	2025-10-24	lulus
543	121	bahasa	2025-09-08	2025-10-04	lulus
544	122	bahasa	2025-12-30	2026-02-02	lulus
545	122	fisik	2026-02-04	2026-03-14	lulus
546	122	budaya	2026-03-16	2026-04-10	lulus
547	122	tes kesehatan	2026-04-12	2026-05-11	sedang berlangsung
548	123	bahasa	2025-06-19	2025-07-16	sedang berlangsung
549	124	bahasa	2025-03-20	2025-04-17	lulus
550	124	fisik	2025-04-19	2025-05-12	lulus
551	124	budaya	2025-05-14	2025-06-09	lulus
552	124	tes kesehatan	2025-06-11	2025-07-07	lulus
553	125	bahasa	2025-11-21	2025-12-19	tidak
554	126	bahasa	2026-02-23	2026-03-27	lulus
555	126	fisik	2026-03-29	2026-04-16	lulus
556	126	budaya	2026-04-18	2026-05-06	tidak
557	127	bahasa	2025-08-26	2025-09-30	lulus
558	127	fisik	2025-10-02	2025-10-24	lulus
559	127	budaya	2025-10-26	2025-12-04	lulus
560	127	tes kesehatan	2025-12-06	2026-01-12	lulus
561	128	bahasa	2026-02-24	2026-03-16	lulus
562	128	fisik	2026-03-18	2026-04-05	lulus
563	128	budaya	2026-04-07	2026-05-14	lulus
564	128	tes kesehatan	2026-05-16	2026-06-07	lulus
565	129	bahasa	2025-07-08	2025-07-26	lulus
566	129	fisik	2025-07-28	2025-08-18	lulus
567	129	budaya	2025-08-20	2025-09-28	lulus
568	129	tes kesehatan	2025-09-30	2025-11-10	lulus
569	130	bahasa	2026-05-13	2026-06-24	lulus
570	130	fisik	2026-06-26	2026-07-22	lulus
571	130	budaya	2026-07-24	2026-09-04	lulus
572	130	tes kesehatan	2026-09-06	2026-09-28	sedang berlangsung
\.


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 230
-- Name: dokumen_paspor_paspor_id_seq; Type: SEQUENCE SET; Schema: osin; Owner: postgres
--

SELECT pg_catalog.setval('osin.dokumen_paspor_paspor_id_seq', 67, true);


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 234
-- Name: keberangkatan_keberangkatan_id_seq; Type: SEQUENCE SET; Schema: osin; Owner: postgres
--

SELECT pg_catalog.setval('osin.keberangkatan_keberangkatan_id_seq', 64, true);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 228
-- Name: matching_tables_matching_id_seq; Type: SEQUENCE SET; Schema: osin; Owner: postgres
--

SELECT pg_catalog.setval('osin.matching_tables_matching_id_seq', 112, true);


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 232
-- Name: pembayaran_pembayaran_id_seq; Type: SEQUENCE SET; Schema: osin; Owner: postgres
--

SELECT pg_catalog.setval('osin.pembayaran_pembayaran_id_seq', 176, true);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 222
-- Name: perusahaan_mitra_perusahaan_id_seq; Type: SEQUENCE SET; Schema: osin; Owner: postgres
--

SELECT pg_catalog.setval('osin.perusahaan_mitra_perusahaan_id_seq', 16, true);


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 224
-- Name: peserta_id_peserta_seq; Type: SEQUENCE SET; Schema: osin; Owner: postgres
--

SELECT pg_catalog.setval('osin.peserta_id_peserta_seq', 158, true);


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 220
-- Name: program_program_id_seq; Type: SEQUENCE SET; Schema: osin; Owner: postgres
--

SELECT pg_catalog.setval('osin.program_program_id_seq', 3, true);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 226
-- Name: tahap_pelatihan_tahap_id_seq; Type: SEQUENCE SET; Schema: osin; Owner: postgres
--

SELECT pg_catalog.setval('osin.tahap_pelatihan_tahap_id_seq', 572, true);


--
-- TOC entry 4918 (class 2606 OID 17146)
-- Name: dokumen_paspor dokumen_paspor_nomor_paspor_key; Type: CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.dokumen_paspor
    ADD CONSTRAINT dokumen_paspor_nomor_paspor_key UNIQUE (nomor_paspor);


--
-- TOC entry 4920 (class 2606 OID 17097)
-- Name: dokumen_paspor dokumen_paspor_pkey; Type: CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.dokumen_paspor
    ADD CONSTRAINT dokumen_paspor_pkey PRIMARY KEY (paspor_id);


--
-- TOC entry 4924 (class 2606 OID 17131)
-- Name: keberangkatan keberangkatan_pkey; Type: CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.keberangkatan
    ADD CONSTRAINT keberangkatan_pkey PRIMARY KEY (keberangkatan_id);


--
-- TOC entry 4916 (class 2606 OID 17074)
-- Name: matching_tables matching_tables_pkey; Type: CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.matching_tables
    ADD CONSTRAINT matching_tables_pkey PRIMARY KEY (matching_id);


--
-- TOC entry 4922 (class 2606 OID 17116)
-- Name: pembayaran pembayaran_pkey; Type: CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.pembayaran
    ADD CONSTRAINT pembayaran_pkey PRIMARY KEY (pembayaran_id);


--
-- TOC entry 4908 (class 2606 OID 16946)
-- Name: perusahaan_mitra perusahaan_mitra_pkey; Type: CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.perusahaan_mitra
    ADD CONSTRAINT perusahaan_mitra_pkey PRIMARY KEY (perusahaan_id);


--
-- TOC entry 4910 (class 2606 OID 16972)
-- Name: peserta peserta_nik_key; Type: CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.peserta
    ADD CONSTRAINT peserta_nik_key UNIQUE (nik);


--
-- TOC entry 4912 (class 2606 OID 16970)
-- Name: peserta peserta_pkey; Type: CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.peserta
    ADD CONSTRAINT peserta_pkey PRIMARY KEY (id_peserta);


--
-- TOC entry 4906 (class 2606 OID 16937)
-- Name: program program_pkey; Type: CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (program_id);


--
-- TOC entry 4914 (class 2606 OID 17032)
-- Name: tahap_pelatihan tahap_pelatihan_pkey; Type: CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.tahap_pelatihan
    ADD CONSTRAINT tahap_pelatihan_pkey PRIMARY KEY (tahap_id);


--
-- TOC entry 4929 (class 2606 OID 17100)
-- Name: dokumen_paspor dokumen_paspor_id_peserta_fkey; Type: FK CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.dokumen_paspor
    ADD CONSTRAINT dokumen_paspor_id_peserta_fkey FOREIGN KEY (id_peserta) REFERENCES osin.peserta(id_peserta);


--
-- TOC entry 4931 (class 2606 OID 17132)
-- Name: keberangkatan keberangkatan_id_peserta_fkey; Type: FK CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.keberangkatan
    ADD CONSTRAINT keberangkatan_id_peserta_fkey FOREIGN KEY (id_peserta) REFERENCES osin.peserta(id_peserta);


--
-- TOC entry 4932 (class 2606 OID 17137)
-- Name: keberangkatan keberangkatan_perusahaan_id_fkey; Type: FK CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.keberangkatan
    ADD CONSTRAINT keberangkatan_perusahaan_id_fkey FOREIGN KEY (perusahaan_id) REFERENCES osin.perusahaan_mitra(perusahaan_id);


--
-- TOC entry 4927 (class 2606 OID 17075)
-- Name: matching_tables matching_tables_id_peserta_fkey; Type: FK CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.matching_tables
    ADD CONSTRAINT matching_tables_id_peserta_fkey FOREIGN KEY (id_peserta) REFERENCES osin.peserta(id_peserta);


--
-- TOC entry 4928 (class 2606 OID 17080)
-- Name: matching_tables matching_tables_perusahaan_id_fkey; Type: FK CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.matching_tables
    ADD CONSTRAINT matching_tables_perusahaan_id_fkey FOREIGN KEY (perusahaan_id) REFERENCES osin.perusahaan_mitra(perusahaan_id);


--
-- TOC entry 4930 (class 2606 OID 17117)
-- Name: pembayaran pembayaran_id_peserta_fkey; Type: FK CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.pembayaran
    ADD CONSTRAINT pembayaran_id_peserta_fkey FOREIGN KEY (id_peserta) REFERENCES osin.peserta(id_peserta);


--
-- TOC entry 4925 (class 2606 OID 16973)
-- Name: peserta peserta_program_id_fkey; Type: FK CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.peserta
    ADD CONSTRAINT peserta_program_id_fkey FOREIGN KEY (program_id) REFERENCES osin.program(program_id);


--
-- TOC entry 4926 (class 2606 OID 17033)
-- Name: tahap_pelatihan tahap_pelatihan_id_peserta_fkey; Type: FK CONSTRAINT; Schema: osin; Owner: postgres
--

ALTER TABLE ONLY osin.tahap_pelatihan
    ADD CONSTRAINT tahap_pelatihan_id_peserta_fkey FOREIGN KEY (id_peserta) REFERENCES osin.peserta(id_peserta);


-- Completed on 2026-09-26 19:43:37

--
-- PostgreSQL database dump complete
--

\unrestrict GINBp5nCONQ8AkUSHOxvlb3Wu75jejl1J6tK2Zjcuib0XNEtrfxYAb9eggpVHNG

