--
-- PostgreSQL database dump
--

\restrict NOIo50Nun8qM5F1txvIkPUFdmEdXa7unGjMmPgUPSM4tq01Xzdbh3chTEqxH7jr

-- Dumped from database version 18.4 (Debian 18.4-1.pgdg13+1)
-- Dumped by pg_dump version 18.4

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
-- Name: book_visibility; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.book_visibility AS ENUM (
    'PRIVATE',
    'PUBLIC',
    'FRIENDS',
    'UNLISTED'
);


ALTER TYPE public.book_visibility OWNER TO postgres;

--
-- Name: reading_list_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.reading_list_type AS ENUM (
    'STANDARD',
    'FAVORITES_YEAR',
    'FAVORITES_ALL'
);


ALTER TYPE public.reading_list_type OWNER TO postgres;

--
-- Name: reading_list_visibility; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.reading_list_visibility AS ENUM (
    'PRIVATE',
    'PUBLIC',
    'FRIENDS',
    'UNLISTED'
);


ALTER TYPE public.reading_list_visibility OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: app_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_settings (
    id integer DEFAULT 1 CONSTRAINT "AppSettings_id_not_null" NOT NULL,
    default_user_clerk_id text,
    updated_at timestamp(3) without time zone CONSTRAINT "AppSettings_updatedAt_not_null" NOT NULL
);


ALTER TABLE public.app_settings OWNER TO postgres;

--
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    id integer CONSTRAINT "User_id_not_null" NOT NULL,
    clerk_id text CONSTRAINT "User_clerkId_not_null" NOT NULL,
    email text CONSTRAINT "User_email_not_null" NOT NULL,
    name text,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT "User_createdAt_not_null" NOT NULL,
    profile_image_url text,
    updated_at timestamp(3) without time zone CONSTRAINT "User_updatedAt_not_null" NOT NULL,
    github_url text,
    instagram_url text,
    letterboxd_url text,
    linkedin_url text,
    spotify_url text
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_user_id_seq OWNER TO postgres;

--
-- Name: app_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_user_id_seq OWNED BY public.app_user.id;


--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id integer CONSTRAINT "Book_id_not_null" NOT NULL,
    owner_id integer CONSTRAINT "Book_ownerId_not_null" NOT NULL,
    isbn10 character varying(10) CONSTRAINT "Book_isbn10_not_null" NOT NULL,
    isbn13 character varying(13) CONSTRAINT "Book_isbn13_not_null" NOT NULL,
    title text CONSTRAINT "Book_title_not_null" NOT NULL,
    title_long text CONSTRAINT "Book_titleLong_not_null" NOT NULL,
    language text CONSTRAINT "Book_language_not_null" NOT NULL,
    synopsis text CONSTRAINT "Book_synopsis_not_null" NOT NULL,
    image text CONSTRAINT "Book_image_not_null" NOT NULL,
    edition text,
    page_count integer CONSTRAINT "Book_pageCount_not_null" NOT NULL,
    authors text[],
    binding text CONSTRAINT "Book_binding_not_null" NOT NULL,
    subjects text[],
    date_published text CONSTRAINT "Book_datePublished_not_null" NOT NULL,
    image_original text CONSTRAINT "Book_imageOriginal_not_null" NOT NULL,
    publisher text CONSTRAINT "Book_publisher_not_null" NOT NULL,
    visibility public.book_visibility DEFAULT 'PUBLIC'::public.book_visibility CONSTRAINT "Book_visibility_not_null" NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT "Book_createdAt_not_null" NOT NULL,
    read_date timestamp(3) without time zone,
    updated_at timestamp(3) without time zone CONSTRAINT "Book_updatedAt_not_null" NOT NULL
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.book_id_seq OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- Name: book_in_reading_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_in_reading_list (
    id integer CONSTRAINT "BookInReadingList_id_not_null" NOT NULL,
    book_id integer CONSTRAINT "BookInReadingList_bookId_not_null" NOT NULL,
    reading_list_id integer CONSTRAINT "BookInReadingList_readingListId_not_null" NOT NULL,
    "position" integer DEFAULT 0 CONSTRAINT "BookInReadingList_position_not_null" NOT NULL,
    notes text,
    added_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT "BookInReadingList_addedAt_not_null" NOT NULL
);


ALTER TABLE public.book_in_reading_list OWNER TO postgres;

--
-- Name: book_in_reading_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_in_reading_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.book_in_reading_list_id_seq OWNER TO postgres;

--
-- Name: book_in_reading_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_in_reading_list_id_seq OWNED BY public.book_in_reading_list.id;


--
-- Name: reading_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reading_list (
    id integer CONSTRAINT "ReadingList_id_not_null" NOT NULL,
    owner_id integer CONSTRAINT "ReadingList_ownerId_not_null" NOT NULL,
    title text CONSTRAINT "ReadingList_title_not_null" NOT NULL,
    description text,
    visibility public.reading_list_visibility DEFAULT 'PRIVATE'::public.reading_list_visibility CONSTRAINT "ReadingList_visibility_not_null" NOT NULL,
    type public.reading_list_type DEFAULT 'STANDARD'::public.reading_list_type CONSTRAINT "ReadingList_type_not_null" NOT NULL,
    year text,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP CONSTRAINT "ReadingList_createdAt_not_null" NOT NULL,
    updated_at timestamp(3) without time zone CONSTRAINT "ReadingList_updatedAt_not_null" NOT NULL,
    cover_image text
);


ALTER TABLE public.reading_list OWNER TO postgres;

--
-- Name: reading_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reading_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reading_list_id_seq OWNER TO postgres;

--
-- Name: reading_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reading_list_id_seq OWNED BY public.reading_list.id;


--
-- Name: app_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user ALTER COLUMN id SET DEFAULT nextval('public.app_user_id_seq'::regclass);


--
-- Name: book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- Name: book_in_reading_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_in_reading_list ALTER COLUMN id SET DEFAULT nextval('public.book_in_reading_list_id_seq'::regclass);


--
-- Name: reading_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reading_list ALTER COLUMN id SET DEFAULT nextval('public.reading_list_id_seq'::regclass);


--
-- Name: app_settings app_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT app_settings_pkey PRIMARY KEY (id);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: book_in_reading_list book_in_reading_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_in_reading_list
    ADD CONSTRAINT book_in_reading_list_pkey PRIMARY KEY (id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: reading_list reading_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reading_list
    ADD CONSTRAINT reading_list_pkey PRIMARY KEY (id);


--
-- Name: app_user_clerk_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX app_user_clerk_id_key ON public.app_user USING btree (clerk_id);


--
-- Name: app_user_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX app_user_email_key ON public.app_user USING btree (email);


--
-- Name: book_in_reading_list_book_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_in_reading_list_book_id_idx ON public.book_in_reading_list USING btree (book_id);


--
-- Name: book_in_reading_list_book_id_reading_list_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX book_in_reading_list_book_id_reading_list_id_key ON public.book_in_reading_list USING btree (book_id, reading_list_id);


--
-- Name: book_in_reading_list_reading_list_id_position_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_in_reading_list_reading_list_id_position_idx ON public.book_in_reading_list USING btree (reading_list_id, "position");


--
-- Name: book_isbn10_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_isbn10_idx ON public.book USING btree (isbn10);


--
-- Name: book_owner_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_owner_id_idx ON public.book USING btree (owner_id);


--
-- Name: book_owner_id_read_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_owner_id_read_date_idx ON public.book USING btree (owner_id, read_date);


--
-- Name: book_owner_isbn13_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX book_owner_isbn13_key ON public.book USING btree (owner_id, isbn13);


--
-- Name: book_read_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_read_date_idx ON public.book USING btree (read_date);


--
-- Name: book_title_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_title_idx ON public.book USING btree (title);


--
-- Name: book_visibility_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX book_visibility_idx ON public.book USING btree (visibility);


--
-- Name: reading_list_owner_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reading_list_owner_id_idx ON public.reading_list USING btree (owner_id);


--
-- Name: reading_list_type_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reading_list_type_idx ON public.reading_list USING btree (type);


--
-- Name: reading_list_type_year_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reading_list_type_year_idx ON public.reading_list USING btree (type, year);


--
-- Name: reading_list_visibility_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reading_list_visibility_idx ON public.reading_list USING btree (visibility);


--
-- Name: book_in_reading_list book_in_reading_list_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_in_reading_list
    ADD CONSTRAINT book_in_reading_list_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: book_in_reading_list book_in_reading_list_reading_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_in_reading_list
    ADD CONSTRAINT book_in_reading_list_reading_list_id_fkey FOREIGN KEY (reading_list_id) REFERENCES public.reading_list(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: book book_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.app_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: reading_list reading_list_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reading_list
    ADD CONSTRAINT reading_list_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.app_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: all_models; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION all_models FOR ALL TABLES WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION all_models OWNER TO postgres;

--
-- PostgreSQL database dump complete
--

\unrestrict NOIo50Nun8qM5F1txvIkPUFdmEdXa7unGjMmPgUPSM4tq01Xzdbh3chTEqxH7jr

