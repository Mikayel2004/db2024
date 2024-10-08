--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-2.pgdg120+1)

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

ALTER TABLE IF EXISTS ONLY anonymized_table_1.projectfeedback DROP CONSTRAINT IF EXISTS projectfeedback_projectid_fkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.projectfeedback DROP CONSTRAINT IF EXISTS projectfeedback_customerid_fkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.projectemployees DROP CONSTRAINT IF EXISTS projectemployees_projectid_fkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.projectemployees DROP CONSTRAINT IF EXISTS projectemployees_employeeid_fkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.joborders DROP CONSTRAINT IF EXISTS joborders_projectid_fkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.joborders DROP CONSTRAINT IF EXISTS joborders_employeeid_fkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.contactpersons DROP CONSTRAINT IF EXISTS contactpersons_customerid_fkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.projects DROP CONSTRAINT IF EXISTS projects_pkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.projectfeedback DROP CONSTRAINT IF EXISTS projectfeedback_pkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.projectemployees DROP CONSTRAINT IF EXISTS projectemployees_pkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.joborders DROP CONSTRAINT IF EXISTS joborders_pkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.employees DROP CONSTRAINT IF EXISTS employees_pkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.customers DROP CONSTRAINT IF EXISTS customers_pkey;
ALTER TABLE IF EXISTS ONLY anonymized_table_1.contactpersons DROP CONSTRAINT IF EXISTS contactpersons_pkey;
ALTER TABLE IF EXISTS anonymized_table_1.projects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS anonymized_table_1.projectfeedback ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS anonymized_table_1.projectemployees ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS anonymized_table_1.joborders ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS anonymized_table_1.employees ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS anonymized_table_1.customers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS anonymized_table_1.contactpersons ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS anonymized_table_1.projects_id_seq;
DROP TABLE IF EXISTS anonymized_table_1.projects;
DROP SEQUENCE IF EXISTS anonymized_table_1.projectfeedback_id_seq;
DROP TABLE IF EXISTS anonymized_table_1.projectfeedback;
DROP SEQUENCE IF EXISTS anonymized_table_1.projectemployees_id_seq;
DROP TABLE IF EXISTS anonymized_table_1.projectemployees;
DROP SEQUENCE IF EXISTS anonymized_table_1.joborders_id_seq;
DROP TABLE IF EXISTS anonymized_table_1.joborders;
DROP SEQUENCE IF EXISTS anonymized_table_1.employees_id_seq;
DROP TABLE IF EXISTS anonymized_table_1.employees;
DROP SEQUENCE IF EXISTS anonymized_table_1.customers_id_seq;
DROP TABLE IF EXISTS anonymized_table_1.customers;
DROP SEQUENCE IF EXISTS anonymized_table_1.contactpersons_id_seq;
DROP TABLE IF EXISTS anonymized_table_1.contactpersons;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contactpersons; Type: TABLE; Schema: anonymized_table_1; Owner: Miq
--

CREATE TABLE anonymized_table_1.contactpersons (
    id integer NOT NULL,
    customerid integer,
    name character varying(255),
    role character varying(100),
    phonenumber character varying(12),
    address character varying(255),
    city character varying(255),
    zip character varying(5)
);


ALTER TABLE anonymized_table_1.contactpersons OWNER TO Miq;

--
-- Name: contactpersons_id_seq; Type: SEQUENCE; Schema: anonymized_table_1; Owner: Miq
--

CREATE SEQUENCE anonymized_table_1.contactpersons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anonymized_table_1.contactpersons_id_seq OWNER TO Miq;

--
-- Name: contactpersons_id_seq; Type: SEQUENCE OWNED BY; Schema: anonymized_table_1; Owner: Miq
--

ALTER SEQUENCE anonymized_table_1.contactpersons_id_seq OWNED BY anonymized_table_1.contactpersons.id;


--
-- Name: customers; Type: TABLE; Schema: anonymized_table_1; Owner: Miq
--

CREATE TABLE anonymized_table_1.customers (
    id integer NOT NULL,
    name character varying(100),
    industry character varying(100)
);


ALTER TABLE anonymized_table_1.customers OWNER TO Miq;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: anonymized_table_1; Owner: Miq
--

CREATE SEQUENCE anonymized_table_1.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anonymized_table_1.customers_id_seq OWNER TO Miq;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: anonymized_table_1; Owner: Miq
--

ALTER SEQUENCE anonymized_table_1.customers_id_seq OWNED BY anonymized_table_1.customers.id;


--
-- Name: employees; Type: TABLE; Schema: anonymized_table_1; Owner: Miq
--

CREATE TABLE anonymized_table_1.employees (
    id integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    hourlywage numeric(5,2),
    hiredate date
);


ALTER TABLE anonymized_table_1.employees OWNER TO Miq;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: anonymized_table_1; Owner: Miq
--

CREATE SEQUENCE anonymized_table_1.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anonymized_table_1.employees_id_seq OWNER TO Miq;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: anonymized_table_1; Owner: Miq
--

ALTER SEQUENCE anonymized_table_1.employees_id_seq OWNED BY anonymized_table_1.employees.id;


--
-- Name: joborders; Type: TABLE; Schema: anonymized_table_1; Owner: Miq
--

CREATE TABLE anonymized_table_1.joborders (
    id integer NOT NULL,
    employeeid integer,
    projectid integer,
    description text,
    orderdatetime timestamp without time zone,
    quantity integer,
    price numeric(5,2)
);


ALTER TABLE anonymized_table_1.joborders OWNER TO Miq;

--
-- Name: joborders_id_seq; Type: SEQUENCE; Schema: anonymized_table_1; Owner: Miq
--

CREATE SEQUENCE anonymized_table_1.joborders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anonymized_table_1.joborders_id_seq OWNER TO Miq;

--
-- Name: joborders_id_seq; Type: SEQUENCE OWNED BY; Schema: anonymized_table_1; Owner: Miq
--

ALTER SEQUENCE anonymized_table_1.joborders_id_seq OWNED BY anonymized_table_1.joborders.id;


--
-- Name: projectemployees; Type: TABLE; Schema: anonymized_table_1; Owner: Miq
--

CREATE TABLE anonymized_table_1.projectemployees (
    id integer NOT NULL,
    projectid integer,
    employeeid integer,
    hours numeric(5,2)
);


ALTER TABLE anonymized_table_1.projectemployees OWNER TO Miq;

--
-- Name: projectemployees_id_seq; Type: SEQUENCE; Schema: anonymized_table_1; Owner: Miq
--

CREATE SEQUENCE anonymized_table_1.projectemployees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anonymized_table_1.projectemployees_id_seq OWNER TO Miq;

--
-- Name: projectemployees_id_seq; Type: SEQUENCE OWNED BY; Schema: anonymized_table_1; Owner: Miq
--

ALTER SEQUENCE anonymized_table_1.projectemployees_id_seq OWNED BY anonymized_table_1.projectemployees.id;


--
-- Name: projectfeedback; Type: TABLE; Schema: anonymized_table_1; Owner: Miq
--

CREATE TABLE anonymized_table_1.projectfeedback (
    id integer NOT NULL,
    projectid integer,
    customerid integer,
    feedback text
);


ALTER TABLE anonymized_table_1.projectfeedback OWNER TO Miq;

--
-- Name: projectfeedback_id_seq; Type: SEQUENCE; Schema: anonymized_table_1; Owner: Miq
--

CREATE SEQUENCE anonymized_table_1.projectfeedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anonymized_table_1.projectfeedback_id_seq OWNER TO Miq;

--
-- Name: projectfeedback_id_seq; Type: SEQUENCE OWNED BY; Schema: anonymized_table_1; Owner: Miq
--

ALTER SEQUENCE anonymized_table_1.projectfeedback_id_seq OWNED BY anonymized_table_1.projectfeedback.id;


--
-- Name: projects; Type: TABLE; Schema: anonymized_table_1; Owner: Miq
--

CREATE TABLE anonymized_table_1.projects (
    id integer NOT NULL,
    name character varying(100),
    value numeric(5,2),
    startdate date,
    enddate date
);


ALTER TABLE anonymized_table_1.projects OWNER TO Miq;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: anonymized_table_1; Owner: Miq
--

CREATE SEQUENCE anonymized_table_1.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anonymized_table_1.projects_id_seq OWNER TO Miq;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: anonymized_table_1; Owner: Miq
--

ALTER SEQUENCE anonymized_table_1.projects_id_seq OWNED BY anonymized_table_1.projects.id;


--
-- Name: contactpersons id; Type: DEFAULT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.contactpersons ALTER COLUMN id SET DEFAULT nextval('anonymized_table_1.contactpersons_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.customers ALTER COLUMN id SET DEFAULT nextval('anonymized_table_1.customers_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.employees ALTER COLUMN id SET DEFAULT nextval('anonymized_table_1.employees_id_seq'::regclass);


--
-- Name: joborders id; Type: DEFAULT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.joborders ALTER COLUMN id SET DEFAULT nextval('anonymized_table_1.joborders_id_seq'::regclass);


--
-- Name: projectemployees id; Type: DEFAULT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.projectemployees ALTER COLUMN id SET DEFAULT nextval('anonymized_table_1.projectemployees_id_seq'::regclass);


--
-- Name: projectfeedback id; Type: DEFAULT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.projectfeedback ALTER COLUMN id SET DEFAULT nextval('anonymized_table_1.projectfeedback_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.projects ALTER COLUMN id SET DEFAULT nextval('anonymized_table_1.projects_id_seq'::regclass);


--
-- Data for Name: contactpersons; Type: TABLE DATA; Schema: anonymized_table_1; Owner: Miq
--

COPY anonymized_table_1.contactpersons (id, customerid, name, role, phonenumber, address, city, zip) FROM stdin;
133	1	Dave	HoD	555-55-5555	1, Landing Street	York	23456
146	2	Mark	Ops Lead	222-22-2222	2, Times Square	London	86421
122	3	Peter	Analyst	444-44-4444	3, Garden Street	Brussels	53864
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: anonymized_table_1; Owner: Miq
--

COPY anonymized_table_1.customers (id, name, industry) FROM stdin;
1	Zydus Cadilla	Pharma
2	HDFC	Finance
3	ICICI	Finance
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: anonymized_table_1; Owner: Miq
--

COPY anonymized_table_1.employees (id, firstname, lastname, hourlywage, hiredate) FROM stdin;
\.


--
-- Data for Name: joborders; Type: TABLE DATA; Schema: anonymized_table_1; Owner: Miq
--

COPY anonymized_table_1.joborders (id, employeeid, projectid, description, orderdatetime, quantity, price) FROM stdin;
\.


--
-- Data for Name: projectemployees; Type: TABLE DATA; Schema: anonymized_table_1; Owner: Miq
--

COPY anonymized_table_1.projectemployees (id, projectid, employeeid, hours) FROM stdin;
\.


--
-- Data for Name: projectfeedback; Type: TABLE DATA; Schema: anonymized_table_1; Owner: Miq
--

COPY anonymized_table_1.projectfeedback (id, projectid, customerid, feedback) FROM stdin;
5	2455	1	Amazing Work!
6	9855	2	Nice job!
7	4924	2	Fantastic!
8	3965	3	Well done.
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: anonymized_table_1; Owner: Miq
--

COPY anonymized_table_1.projects (id, name, value, startdate, enddate) FROM stdin;
2455	Project 1	100.00	2024-01-01	2024-06-30
9855	Project 2	150.00	2024-02-01	2024-03-01
4924	Project 3	200.00	2024-03-03	2024-08-31
3965	Project 4	250.00	2024-04-01	2024-09-12
\.


--
-- Name: contactpersons_id_seq; Type: SEQUENCE SET; Schema: anonymized_table_1; Owner: Miq
--

SELECT pg_catalog.setval('anonymized_table_1.contactpersons_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: anonymized_table_1; Owner: Miq
--

SELECT pg_catalog.setval('anonymized_table_1.customers_id_seq', 3, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: anonymized_table_1; Owner: Miq
--

SELECT pg_catalog.setval('anonymized_table_1.employees_id_seq', 1, false);


--
-- Name: joborders_id_seq; Type: SEQUENCE SET; Schema: anonymized_table_1; Owner: Miq
--

SELECT pg_catalog.setval('anonymized_table_1.joborders_id_seq', 1, false);


--
-- Name: projectemployees_id_seq; Type: SEQUENCE SET; Schema: anonymized_table_1; Owner: Miq
--

SELECT pg_catalog.setval('anonymized_table_1.projectemployees_id_seq', 1, false);


--
-- Name: projectfeedback_id_seq; Type: SEQUENCE SET; Schema: anonymized_table_1; Owner: Miq
--

SELECT pg_catalog.setval('anonymized_table_1.projectfeedback_id_seq', 8, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: anonymized_table_1; Owner: Miq
--

SELECT pg_catalog.setval('anonymized_table_1.projects_id_seq', 1, false);


--
-- Name: contactpersons contactpersons_pkey; Type: CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.contactpersons
    ADD CONSTRAINT contactpersons_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: joborders joborders_pkey; Type: CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.joborders
    ADD CONSTRAINT joborders_pkey PRIMARY KEY (id);


--
-- Name: projectemployees projectemployees_pkey; Type: CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.projectemployees
    ADD CONSTRAINT projectemployees_pkey PRIMARY KEY (id);


--
-- Name: projectfeedback projectfeedback_pkey; Type: CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.projectfeedback
    ADD CONSTRAINT projectfeedback_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: contactpersons contactpersons_customerid_fkey; Type: FK CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.contactpersons
    ADD CONSTRAINT contactpersons_customerid_fkey FOREIGN KEY (customerid) REFERENCES anonymized_table_1.customers(id);


--
-- Name: joborders joborders_employeeid_fkey; Type: FK CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.joborders
    ADD CONSTRAINT joborders_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES anonymized_table_1.employees(id);


--
-- Name: joborders joborders_projectid_fkey; Type: FK CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.joborders
    ADD CONSTRAINT joborders_projectid_fkey FOREIGN KEY (projectid) REFERENCES anonymized_table_1.projects(id);


--
-- Name: projectemployees projectemployees_employeeid_fkey; Type: FK CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.projectemployees
    ADD CONSTRAINT projectemployees_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES anonymized_table_1.employees(id);


--
-- Name: projectemployees projectemployees_projectid_fkey; Type: FK CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.projectemployees
    ADD CONSTRAINT projectemployees_projectid_fkey FOREIGN KEY (projectid) REFERENCES anonymized_table_1.projects(id);


--
-- Name: projectfeedback projectfeedback_customerid_fkey; Type: FK CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.projectfeedback
    ADD CONSTRAINT projectfeedback_customerid_fkey FOREIGN KEY (customerid) REFERENCES anonymized_table_1.customers(id);


--
-- Name: projectfeedback projectfeedback_projectid_fkey; Type: FK CONSTRAINT; Schema: anonymized_table_1; Owner: Miq
--

ALTER TABLE ONLY anonymized_table_1.projectfeedback
    ADD CONSTRAINT projectfeedback_projectid_fkey FOREIGN KEY (projectid) REFERENCES anonymized_table_1.projects(id);


--
-- PostgreSQL database dump complete
--

