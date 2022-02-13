--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-02-13 10:36:23 GMT

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
-- TOC entry 210 (class 1259 OID 25235)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    libelle character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 25234)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 209
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 212 (class 1259 OID 25246)
-- Name: livres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livres (
    id integer NOT NULL,
    isbn character varying NOT NULL,
    titre character varying NOT NULL,
    datepub date NOT NULL,
    auteur character varying NOT NULL,
    editeur character varying NOT NULL,
    idcat integer
);


ALTER TABLE public.livres OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 25245)
-- Name: livres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.livres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.livres_id_seq OWNER TO postgres;

--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 211
-- Name: livres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.livres_id_seq OWNED BY public.livres.id;


--
-- TOC entry 3435 (class 2604 OID 25238)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3436 (class 2604 OID 25249)
-- Name: livres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livres ALTER COLUMN id SET DEFAULT nextval('public.livres_id_seq'::regclass);


--
-- TOC entry 3586 (class 0 OID 25235)
-- Dependencies: 210
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (id, libelle) VALUES (1, 'Fiction');
INSERT INTO public.categories (id, libelle) VALUES (2, 'Roman');
INSERT INTO public.categories (id, libelle) VALUES (3, 'Science');
INSERT INTO public.categories (id, libelle) VALUES (4, 'Polar');
INSERT INTO public.categories (id, libelle) VALUES (5, 'Thriller');
INSERT INTO public.categories (id, libelle) VALUES (6, 'Policier');
INSERT INTO public.categories (id, libelle) VALUES (7, 'Conte');
INSERT INTO public.categories (id, libelle) VALUES (8, 'Histoire');
INSERT INTO public.categories (id, libelle) VALUES (9, 'Love');


--
-- TOC entry 3588 (class 0 OID 25246)
-- Dependencies: 212
-- Data for Name: livres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (1, 'B6717', 'In The Room', '2007-01-08', 'Winsherter Mountain', 'Chateau Rouge', 2);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (2, 'HG189', 'Killer Outside', '2021-05-23', 'Gray Shark', 'The Gun House', 1);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (3, 'GT120', 'Fatest Car', '2020-04-02', 'Great Whale', 'A.Lange Sohne', 3);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (4, 'HN120', 'The Plug', '2021-07-03', 'Lord P', 'Jaeger LeCoultre', 4);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (5, 'HET12', 'The Dose', '2021-09-20', 'The Goat', 'Arsham Studio', 5);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (6, 'KJ180', 'Purple Drink', '2021-10-15', 'The Ice Drip', 'Santa Monica Studio', 6);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (7, 'KO999', 'The Roommate', '2020-08-17', 'A Cold Wall', 'Ubisoft', 7);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (8, 'QW199', 'The Standard', '2011-05-23', 'Charlmagne', 'Klei Ent', 8);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (9, 'RF189', 'The Lion', '2001-05-23', 'The Plug Goat', 'Universal Studio', 9);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (10, 'HJ157', 'Neck Pain', '2002-09-19', 'The OG', 'Paramount Studio', 2);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (11, 'B671X7', 'The Player', '2000-01-08', 'Green Montain', 'Chateau Rouge', 1);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (12, 'HO1E89', 'The Outside', '2011-05-23', 'Ryan Placer', 'Mont Blanc', 1);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (13, 'GM12Z0', 'Python', '2010-04-02', 'Chris Below', 'A.Lange Sohne', 3);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (14, 'HG120', 'Flask', '2001-07-03', 'Marie Mage', 'Jacque Marie Mage', 4);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (15, 'HGIT12', 'Dose', '2002-09-20', 'Morjias SH', 'Moncler', 5);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (16, 'KJ100', 'White', '2012-10-15', 'J.M.Weston', 'Santa Monica Studio', 6);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (17, 'KO79C9', 'The Law', '2013-08-17', 'A.C.W', 'Staple', 7);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (18, 'QO5199', 'The Village', '2015-05-23', '$Not', 'Under Neath', 8);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (19, 'RKK189', 'The Rook', '2017-05-23', 'Etienne Pillow', 'Universal', 9);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (20, 'UIO157', 'Life', '1990-09-19', 'Mr Hines', 'Paramount', 9);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (21, 'B6701X7', 'The P Power', '1998-01-08', 'Green Montain', 'Chateau Rouge', 1);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (22, 'HO1E809', 'Outside', '2000-05-23', 'Ryan Placer', 'Mont Blanc', 1);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (23, '7GM12Z0', 'Automation', '1994-04-02', 'Chris Below', 'A.Lange Sohne', 3);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (24, 'H5G120', 'Back Wood', '1789-07-03', 'Marie Mage', 'Jacque Marie Mage', 4);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (25, 'RHGIT12', 'Saratoga Square', '2005-09-20', 'Morjias SH', 'Moncler', 5);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (26, 'K0J100', 'The Triangle', '2020-10-15', 'J.M.Weston', 'Santa Monica Studio', 6);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (27, 'OKO79C9', '007', '1998-08-17', 'A.C.W', 'Staple', 7);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (28, 'PQO5199', 'Jason Wornes', '1978-05-23', '$Not', 'Under Neath', 8);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (29, 'LRKK189', 'The Gunpoint', '2012-05-23', 'Etienne Pillow', 'Universal', 9);
INSERT INTO public.livres (id, isbn, titre, datepub, auteur, editeur, idcat) VALUES (30, '7UIO157', 'Bullet', '1990-09-19', 'Mr Hines', 'Paramount', 9);


--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 209
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 9, true);


--
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 211
-- Name: livres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.livres_id_seq', 30, true);


--
-- TOC entry 3438 (class 2606 OID 25244)
-- Name: categories categories_libelle_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_libelle_key UNIQUE (libelle);


--
-- TOC entry 3440 (class 2606 OID 25242)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3442 (class 2606 OID 25255)
-- Name: livres livres_isbn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livres
    ADD CONSTRAINT livres_isbn_key UNIQUE (isbn);


--
-- TOC entry 3444 (class 2606 OID 25253)
-- Name: livres livres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livres
    ADD CONSTRAINT livres_pkey PRIMARY KEY (id);


--
-- TOC entry 3445 (class 2606 OID 25256)
-- Name: livres livres_idcat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livres
    ADD CONSTRAINT livres_idcat_fkey FOREIGN KEY (idcat) REFERENCES public.categories(id);


-- Completed on 2022-02-13 10:36:23 GMT

--
-- PostgreSQL database dump complete
--