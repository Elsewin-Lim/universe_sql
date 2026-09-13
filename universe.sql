--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    orbital_period_years numeric(8,2) NOT NULL,
    is_periodic boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_type character varying(30),
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    distance_from_planet_km numeric(12,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    description text,
    planet_type character varying(30) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    star_type character varying(30) NOT NULL,
    temperature_in_kelvin integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Visible from Earth every 75 years', 75.32, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Great comet of 1997', 2533.00, true);
INSERT INTO public.comet VALUES (3, 'Encke', 'Shortest known orbital period', 3.30, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, 'barred spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy', 10000, 'spiral', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in the Local Group', 12000, 'spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting with a companion galaxy', 400, 'spiral', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Bright nucleus with a large bulge', 13250, 'lenticular', false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Radio galaxy with a dust lane', 12000, 'elliptical', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths only moon', true, 384400.00, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger moon of Mars', false, 9376.00, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars', false, 23463.00, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Most volcanically active body', true, 421700.00, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon with subsurface ocean', true, 671034.00, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system', true, 1070412.00, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered moon', true, 1882709.00, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Small inner moon of Jupiter', false, 181366.00, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Irregular moon of Jupiter', false, 11461000.00, 5);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Moon with a giant crater', true, 185539.00, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 'Icy moon with geysers', true, 237948.00, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 'Icy moon of Saturn', true, 294619.00, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 'Moon of Saturn', true, 377396.00, 6);
INSERT INTO public.moon VALUES (14, 'Rhea', 'Second largest moon of Saturn', true, 527108.00, 6);
INSERT INTO public.moon VALUES (15, 'Titan', 'Moon with a thick atmosphere', true, 1221870.00, 6);
INSERT INTO public.moon VALUES (16, 'Iapetus', 'Two-toned moon', true, 3560820.00, 6);
INSERT INTO public.moon VALUES (17, 'Miranda', 'Moon with extreme cliffs', true, 129390.00, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Brightest moon of Uranus', true, 191020.00, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'Dark moon of Uranus', true, 266000.00, 7);
INSERT INTO public.moon VALUES (20, 'Titania', 'Largest moon of Uranus', true, 435910.00, 7);
INSERT INTO public.moon VALUES (21, 'Oberon', 'Outermost major moon of Uranus', true, 583520.00, 7);
INSERT INTO public.moon VALUES (22, 'Triton', 'Retrograde moon of Neptune', true, 354759.00, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'Smallest planet', 'terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'Hottest planet', 'terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'Our home', 'terrestrial', 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'The red planet', 'terrestrial', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'Largest planet', 'gas giant', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Famous for its rings', 'gas giant', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'Tilted on its side', 'ice giant', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'Farthest planet', 'ice giant', 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', false, 'Exoplanet in the habitable zone', 'terrestrial', 4);
INSERT INTO public.planet VALUES (10, 'Proxima c', false, 'Candidate super-Earth', 'super-Earth', 4);
INSERT INTO public.planet VALUES (11, 'Sirius b1', false, 'Hypothetical planet', 'gas giant', 2);
INSERT INTO public.planet VALUES (12, 'Mirach b', false, 'Hypothetical planet', 'gas giant', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star', 'yellow dwarf', 5778, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', 'main sequence', 9940, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant in Orion', 'red supergiant', 3500, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Closest star to the Sun', 'red dwarf', 3042, 1);
INSERT INTO public.star VALUES (5, 'Alpheratz', 'Brightest star in Andromeda', 'blue subgiant', 13000, 2);
INSERT INTO public.star VALUES (6, 'Mirach', 'Red giant in Andromeda', 'red giant', 3800, 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

