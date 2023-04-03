--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    tries integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (250, 498, 127);
INSERT INTO public.games VALUES (251, 716, 128);
INSERT INTO public.games VALUES (252, 745, 128);
INSERT INTO public.games VALUES (253, 287, 127);
INSERT INTO public.games VALUES (254, 272, 127);
INSERT INTO public.games VALUES (255, 543, 127);
INSERT INTO public.games VALUES (256, 137, 129);
INSERT INTO public.games VALUES (257, 481, 129);
INSERT INTO public.games VALUES (258, 679, 130);
INSERT INTO public.games VALUES (259, 327, 130);
INSERT INTO public.games VALUES (260, 22, 129);
INSERT INTO public.games VALUES (261, 390, 129);
INSERT INTO public.games VALUES (262, 604, 129);
INSERT INTO public.games VALUES (230, 104, 121);
INSERT INTO public.games VALUES (231, 71, 121);
INSERT INTO public.games VALUES (232, 985, 122);
INSERT INTO public.games VALUES (233, 5, 122);
INSERT INTO public.games VALUES (234, 743, 121);
INSERT INTO public.games VALUES (235, 544, 121);
INSERT INTO public.games VALUES (236, 631, 121);
INSERT INTO public.games VALUES (237, 839, 123);
INSERT INTO public.games VALUES (238, 199, 124);
INSERT INTO public.games VALUES (239, 858, 124);
INSERT INTO public.games VALUES (240, 320, 123);
INSERT INTO public.games VALUES (241, 86, 123);
INSERT INTO public.games VALUES (242, 867, 123);
INSERT INTO public.games VALUES (243, 914, 125);
INSERT INTO public.games VALUES (244, 993, 125);
INSERT INTO public.games VALUES (245, 950, 126);
INSERT INTO public.games VALUES (246, 691, 126);
INSERT INTO public.games VALUES (247, 889, 125);
INSERT INTO public.games VALUES (248, 23, 125);
INSERT INTO public.games VALUES (249, 125, 125);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (127, 'user_1680548367060');
INSERT INTO public.users VALUES (128, 'user_1680548367059');
INSERT INTO public.users VALUES (129, 'user_1680548380099');
INSERT INTO public.users VALUES (130, 'user_1680548380098');
INSERT INTO public.users VALUES (121, 'user_1680548244149');
INSERT INTO public.users VALUES (122, 'user_1680548244148');
INSERT INTO public.users VALUES (123, 'user_1680548250287');
INSERT INTO public.users VALUES (124, 'user_1680548250286');
INSERT INTO public.users VALUES (125, 'user_1680548263892');
INSERT INTO public.users VALUES (126, 'user_1680548263891');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 262, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 130, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

