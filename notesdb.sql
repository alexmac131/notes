--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: usertypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usertypes (usertypes_id, creationdate, modificationdate, name, purpose) VALUES (1, '2018-01-27', '2018-01-27', 'admin', 'admin user');
INSERT INTO usertypes (usertypes_id, creationdate, modificationdate, name, purpose) VALUES (2, '2018-01-27', '2018-01-27', 'user', 'general user');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (user_id, usertype, name, username, password, creationdate, modificationdate, private, enabled) VALUES (1, NULL, 'Alex Mackinnon', 'alexmac', 'alexmac', '2018-01-27', '2018-01-27', false, true);
INSERT INTO users (user_id, usertype, name, username, password, creationdate, modificationdate, private, enabled) VALUES (2, NULL, 'admin', 'admin', 'admin', '2018-01-27', '2018-01-27', true, true);
INSERT INTO users (user_id, usertype, name, username, password, creationdate, modificationdate, private, enabled) VALUES (3, NULL, 'Bob Mckenzie', 'bob', 'beer', '2018-01-27', '2018-01-27', true, true);
INSERT INTO users (user_id, usertype, name, username, password, creationdate, modificationdate, private, enabled) VALUES (4, NULL, 'Doug Mckenzie', 'doug', 'beer', '2018-01-27', '2018-01-27', true, true);
INSERT INTO users (user_id, usertype, name, username, password, creationdate, modificationdate, private, enabled) VALUES (5, NULL, 'Getty Lee', 'getty', 'rush', '2018-01-27', '2018-01-27', false, true);


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: notes_history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: sharewith; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('history_history_id_seq', 1, false);


--
-- Name: notes_history_noteshistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('notes_history_noteshistory_id_seq', 1, false);


--
-- Name: notes_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('notes_note_id_seq', 1, false);


--
-- Name: sharewith_sharewith_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sharewith_sharewith_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_user_id_seq', 5, true);


--
-- Name: usertypes_usertypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usertypes_usertypes_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

