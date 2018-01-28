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

--
-- Name: test; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA test;


ALTER SCHEMA test OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE history (
    history_id integer NOT NULL,
    creationdate date NOT NULL,
    modificationdate date NOT NULL,
    byuserid integer NOT NULL,
    description text,
    event_type integer
);


ALTER TABLE history OWNER TO postgres;

--
-- Name: history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE history_history_id_seq OWNER TO postgres;

--
-- Name: history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE history_history_id_seq OWNED BY history.history_id;


--
-- Name: historytypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE historytypes (
    historytype_id integer NOT NULL,
    creationdate date NOT NULL,
    modificationdate date NOT NULL,
    name character varying(40) NOT NULL,
    purpose text NOT NULL,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE historytypes OWNER TO postgres;

--
-- Name: notes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE notes (
    note_id integer NOT NULL,
    creationdate date NOT NULL,
    modificationdate date NOT NULL,
    owner_id integer NOT NULL,
    private boolean DEFAULT true NOT NULL,
    locked boolean DEFAULT false,
    title character varying(40) NOT NULL,
    note text,
    deleted boolean DEFAULT false
);


ALTER TABLE notes OWNER TO postgres;

--
-- Name: notes_note_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE notes_note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notes_note_id_seq OWNER TO postgres;

--
-- Name: notes_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE notes_note_id_seq OWNED BY notes.note_id;


--
-- Name: sharewith; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sharewith (
    sharewith_id integer NOT NULL,
    creationdate date NOT NULL,
    note_id integer NOT NULL,
    noteowner integer NOT NULL,
    shared_id integer NOT NULL
);


ALTER TABLE sharewith OWNER TO postgres;

--
-- Name: sharewith_sharewith_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sharewith_sharewith_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sharewith_sharewith_id_seq OWNER TO postgres;

--
-- Name: sharewith_sharewith_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sharewith_sharewith_id_seq OWNED BY sharewith.sharewith_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    user_id integer NOT NULL,
    usertype integer,
    name character varying(40) NOT NULL,
    username character varying(40) NOT NULL,
    password character varying(40) NOT NULL,
    creationdate date NOT NULL,
    modificationdate date NOT NULL,
    private boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: usertypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usertypes (
    usertypes_id integer NOT NULL,
    creationdate date NOT NULL,
    modificationdate date NOT NULL,
    name character varying(40) NOT NULL,
    purpose text NOT NULL
);


ALTER TABLE usertypes OWNER TO postgres;

--
-- Name: usertypes_usertypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usertypes_usertypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usertypes_usertypes_id_seq OWNER TO postgres;

--
-- Name: usertypes_usertypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usertypes_usertypes_id_seq OWNED BY usertypes.usertypes_id;


--
-- Name: history history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history ALTER COLUMN history_id SET DEFAULT nextval('history_history_id_seq'::regclass);


--
-- Name: notes note_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notes ALTER COLUMN note_id SET DEFAULT nextval('notes_note_id_seq'::regclass);


--
-- Name: sharewith sharewith_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sharewith ALTER COLUMN sharewith_id SET DEFAULT nextval('sharewith_sharewith_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Name: usertypes usertypes_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usertypes ALTER COLUMN usertypes_id SET DEFAULT nextval('usertypes_usertypes_id_seq'::regclass);


--
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_pkey PRIMARY KEY (history_id);


--
-- Name: historytypes historytypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historytypes
    ADD CONSTRAINT historytypes_pkey PRIMARY KEY (historytype_id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: sharewith sharewith_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sharewith
    ADD CONSTRAINT sharewith_pkey PRIMARY KEY (sharewith_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: usertypes usertypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usertypes
    ADD CONSTRAINT usertypes_pkey PRIMARY KEY (usertypes_id);


--
-- Name: history fk_historytype; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history
    ADD CONSTRAINT fk_historytype FOREIGN KEY (event_type) REFERENCES historytypes(historytype_id);


--
-- Name: history history_byuserid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_byuserid_fkey FOREIGN KEY (byuserid) REFERENCES users(user_id);


--
-- Name: notes notes_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES users(user_id);


--
-- Name: sharewith sharewith_note_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sharewith
    ADD CONSTRAINT sharewith_note_id_fkey FOREIGN KEY (note_id) REFERENCES notes(note_id);


--
-- Name: sharewith sharewith_noteowner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sharewith
    ADD CONSTRAINT sharewith_noteowner_fkey FOREIGN KEY (noteowner) REFERENCES users(user_id);


--
-- Name: sharewith sharewith_shared_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sharewith
    ADD CONSTRAINT sharewith_shared_id_fkey FOREIGN KEY (shared_id) REFERENCES users(user_id);


--
-- Name: users users_usertype_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_usertype_fkey FOREIGN KEY (usertype) REFERENCES usertypes(usertypes_id);


--
-- PostgreSQL database dump complete
--

