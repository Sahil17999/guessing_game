--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    player_id integer NOT NULL,
    num_guesses integer DEFAULT 0 NOT NULL
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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 11);
INSERT INTO public.games VALUES (2, 2, 868);
INSERT INTO public.games VALUES (3, 2, 92);
INSERT INTO public.games VALUES (4, 3, 850);
INSERT INTO public.games VALUES (5, 3, 748);
INSERT INTO public.games VALUES (6, 2, 445);
INSERT INTO public.games VALUES (7, 2, 322);
INSERT INTO public.games VALUES (8, 2, 161);
INSERT INTO public.games VALUES (9, 4, 686);
INSERT INTO public.games VALUES (10, 4, 91);
INSERT INTO public.games VALUES (11, 5, 163);
INSERT INTO public.games VALUES (12, 5, 144);
INSERT INTO public.games VALUES (13, 4, 389);
INSERT INTO public.games VALUES (14, 4, 736);
INSERT INTO public.games VALUES (15, 4, 742);
INSERT INTO public.games VALUES (16, 6, 441);
INSERT INTO public.games VALUES (17, 6, 425);
INSERT INTO public.games VALUES (18, 7, 321);
INSERT INTO public.games VALUES (19, 7, 230);
INSERT INTO public.games VALUES (20, 6, 656);
INSERT INTO public.games VALUES (21, 6, 220);
INSERT INTO public.games VALUES (22, 6, 579);
INSERT INTO public.games VALUES (23, 8, 844);
INSERT INTO public.games VALUES (24, 8, 919);
INSERT INTO public.games VALUES (25, 9, 589);
INSERT INTO public.games VALUES (26, 9, 310);
INSERT INTO public.games VALUES (27, 8, 166);
INSERT INTO public.games VALUES (28, 8, 154);
INSERT INTO public.games VALUES (29, 8, 223);
INSERT INTO public.games VALUES (30, 10, 838);
INSERT INTO public.games VALUES (31, 10, 579);
INSERT INTO public.games VALUES (32, 11, 420);
INSERT INTO public.games VALUES (33, 11, 262);
INSERT INTO public.games VALUES (34, 10, 37);
INSERT INTO public.games VALUES (35, 10, 177);
INSERT INTO public.games VALUES (36, 10, 513);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'Sahil');
INSERT INTO public.players VALUES (2, 'user_1720291333852');
INSERT INTO public.players VALUES (3, 'user_1720291333851');
INSERT INTO public.players VALUES (4, 'user_1720291594777');
INSERT INTO public.players VALUES (5, 'user_1720291594776');
INSERT INTO public.players VALUES (6, 'user_1720291719490');
INSERT INTO public.players VALUES (7, 'user_1720291719489');
INSERT INTO public.players VALUES (8, 'user_1720291924809');
INSERT INTO public.players VALUES (9, 'user_1720291924808');
INSERT INTO public.players VALUES (10, 'user_1720292391335');
INSERT INTO public.players VALUES (11, 'user_1720292391334');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 36, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 11, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--
