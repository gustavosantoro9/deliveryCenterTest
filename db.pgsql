--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: register; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.register (
    excode character varying(50) NOT NULL,
    storeid integer NOT NULL,
    subtotal character varying(50) NOT NULL,
    deliveryfee character varying(50) NOT NULL,
    totalshipping character varying(50) NOT NULL,
    total character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    state character varying NOT NULL,
    city character varying(50) NOT NULL,
    district character varying(50) NOT NULL,
    street character varying(50) NOT NULL,
    complement character varying(50) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    dtordercreate character varying(50) NOT NULL,
    postalcode character varying(50) NOT NULL,
    number character varying(50) NOT NULL,
    customerid character varying(50) NOT NULL,
    customername character varying(50) NOT NULL,
    customeremail character varying(50) NOT NULL,
    customercontact character varying(50) NOT NULL,
    itemid character varying(50) NOT NULL,
    itemname character varying(50) NOT NULL,
    itemprice double precision NOT NULL,
    itemquantity integer NOT NULL,
    itemtotal double precision NOT NULL,
    paymenttype character varying(50) NOT NULL,
    paymentvalue double precision NOT NULL
);


ALTER TABLE public.register OWNER TO postgres;

--
-- Data for Name: register; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.register (excode, storeid, subtotal, deliveryfee, totalshipping, total, country, state, city, district, street, complement, latitude, longitude, dtordercreate, postalcode, number, customerid, customername, customeremail, customercontact, itemid, itemname, itemprice, itemquantity, itemtotal, paymenttype, paymentvalue) FROM stdin;
9987071	282	49.9	5.14	5.14	55.04	BR	São Paulo	Cidade de Testes	Vila de Testes	Rua Fake de Testes	galpao	-23.6290370000000003	-46.7126889999999975	2019-06-24T16:45:32.000-04:00	85045020	3454	136226073	JOHN DOE	john@doe.com	41999999999	IT4801901403	Produto de Testes	49.8999999999999986	1	49.8999999999999986	credit_card	55.0399999999999991
9987071	282	49.9	5.14	5.14	55.04	BR	São Paulo	Cidade de Testes	Vila de Testes	Rua Fake de Testes	galpao	-23.6290370000000003	-46.7126889999999975	2019-06-24T16:45:32.000-04:00	85045020	3454	136226073	JOHN DOE	john@doe.com	41999999999	IT4801901403	Produto de Testes	49.8999999999999986	1	49.8999999999999986	credit_card	55.0399999999999991
\.


--
-- PostgreSQL database dump complete
--

