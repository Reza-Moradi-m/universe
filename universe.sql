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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    abbreviation character varying(10),
    brightest_star character varying(100),
    visible_season text,
    is_zodiacal boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size integer NOT NULL,
    classification text,
    has_black_hole boolean NOT NULL,
    age numeric(10,2) NOT NULL
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
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    diameter integer,
    orbit_period numeric(8,2),
    is_inhabitable boolean NOT NULL,
    planet_id integer
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
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    radius integer,
    temperature numeric(10,2),
    has_atmosphere boolean NOT NULL,
    star_id integer
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
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mass integer,
    luminosity numeric(10,2),
    is_main_sequence boolean NOT NULL,
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 'Rigel', 'Winter', false);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'UMa', 'Dubhe', 'Spring', false);
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'Cas', 'Beta Cassiopeiae', 'Autumn', false);
INSERT INTO public.constellation VALUES (4, 'Leo', 'Leo', 'Regulus', 'Spring', true);
INSERT INTO public.constellation VALUES (5, 'Taurus', 'Tau', 'Aldebaran', 'Winter', true);
INSERT INTO public.constellation VALUES (6, 'Pisces', 'Psc', 'Alpherg', 'Autumn', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Spiral', true, 13.60);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 'Spiral', false, 13.20);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000, 'Spiral', false, 12.50);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 150000, 'Elliptical', true, 13.10);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 80000, 'Elliptical', false, 12.80);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 70000, 'Spiral', false, 11.30);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Terrestrial', 3475, 27.32, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Irregular', 22, 0.32, false, 2);
INSERT INTO public.moon VALUES (3, 'Europa', 'Ice', 3138, 3.55, false, 3);
INSERT INTO public.moon VALUES (4, 'Titan', 'Terrestrial', 5150, 15.95, false, 4);
INSERT INTO public.moon VALUES (5, 'Triton', 'Ice', 2706, -5.88, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Ice', 5262, 7.15, false, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Ice', 4821, 16.69, false, 4);
INSERT INTO public.moon VALUES (8, 'Io', 'Rocky', 3643, 1.77, false, 3);
INSERT INTO public.moon VALUES (9, 'Deimos', 'Irregular', 12, 1.26, false, 2);
INSERT INTO public.moon VALUES (10, 'Luna', 'Terrestrial', 1737, 27.32, false, 1);
INSERT INTO public.moon VALUES (11, 'Enceladus', 'Ice', 504, 1.37, false, 4);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Ice', 1528, 4.52, false, 5);
INSERT INTO public.moon VALUES (13, 'Dione', 'Ice', 1123, 2.74, false, 4);
INSERT INTO public.moon VALUES (14, 'Hyperion', 'Irregular', 270, 21.28, false, 3);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'Irregular', 1469, 79.33, false, 5);
INSERT INTO public.moon VALUES (16, 'Phoebe', 'Irregular', 213, -550.48, false, 5);
INSERT INTO public.moon VALUES (17, 'Mimas', 'Ice', 396, 0.94, false, 4);
INSERT INTO public.moon VALUES (18, 'Tethys', 'Ice', 1060, 1.89, false, 4);
INSERT INTO public.moon VALUES (19, 'Miranda', 'Ice', 471, 1.41, false, 5);
INSERT INTO public.moon VALUES (20, 'Nereid', 'Irregular', 340, 360.14, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 6371, 288.15, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 3389, 218.15, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 69911, 165.00, false, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 58232, 134.00, false, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Ice Giant', 24622, 72.00, false, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Ice Giant', 25362, 58.00, false, 1);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 'Super-Earth', 25000, 298.00, true, 1);
INSERT INTO public.planet VALUES (8, 'HD 189733b', 'Hot Jupiter', 80000, 1200.00, true, 3);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1e', 'Rocky', 5000, 251.00, true, 5);
INSERT INTO public.planet VALUES (10, 'TOI 700d', 'Super-Earth', 10000, 228.00, true, 6);
INSERT INTO public.planet VALUES (11, '51 Pegasi b', 'Hot Jupiter', 100000, 1523.00, true, 2);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Hot Jupiter', 120000, 1130.00, true, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 1, 1.00, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 20, 100000.00, true, 1);
INSERT INTO public.star VALUES (3, 'Vega', 'A-type', 2, 50.10, true, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'M-type', 0, 0.00, true, 5);
INSERT INTO public.star VALUES (5, 'Sirius', 'A-type', 2, 23.60, true, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 'G-type', 1, 1.56, true, 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

