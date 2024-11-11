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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    distance_from_earth integer,
    has_life boolean,
    age_in_millions_year integer,
    description text
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    type character varying(255) NOT NULL,
    estimated_population integer,
    description text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    radius_km numeric(10,5),
    is_spherical boolean,
    orbit_period_days integer,
    description text,
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
    name character varying(255) NOT NULL,
    has_life boolean,
    radium_km numeric(10,5),
    orbit_period_days integer,
    description text,
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
    name character varying(255) NOT NULL,
    mass_in_solar_masses numeric(10,5) NOT NULL,
    is_spheriacl boolean,
    temperature integer,
    description text,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, true, 13000, 'The galaxy containing our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, false, 10000, 'The nearest large galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Spiral', 28000000, false, 13000, 'A beautiful spiral galaxy located in the Virgo cluster.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 53000000, false, 13000, 'A giant elliptical galaxy in the Virgo cluster.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Spiral', 23000000, false, 10000, 'A face-on spiral galaxy in the Canes Venatici constellation.');
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Spiral', 3000000, false, 10000, 'A smaller spiral galaxy, also part of the Local Group.');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 2000, 'A barred spiral galaxy', 'Milky Way');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 3000, 'A giant elliptical galaxy', 'M87');
INSERT INTO public.galaxy_type VALUES (3, 'Magellanic', 4000, 'An irregular galaxy', 'Magellanic');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth', 11.00000, true, 0, 'One of Mars'' two moons, orbiting extremely close to the planet.', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.00000, true, 0, 'One of Mars'' two moons, orbiting extremely close to the planet.', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.20000, true, 1, 'The smaller of Mars'' two moons, located farther from the planet.', 2);
INSERT INTO public.moon VALUES (4, 'Europa', 1560.00000, true, 4, 'One of Jupiter''s moons, with a subsurface ocean beneath its icy crust.', 3);
INSERT INTO public.moon VALUES (5, 'Io', 1821.00000, true, 2, 'A volcanic moon of Jupiter, with active eruptions and extreme sulfuric terrain.', 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2631.00000, true, 7, 'The largest moon in the Solar System, orbiting Jupiter.', 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 2408.00000, true, 17, 'A large moon of Jupiter, with a heavily cratered surface.', 4);
INSERT INTO public.moon VALUES (8, 'Titan', 2575.00000, true, 16, 'Saturn''s largest moon, known for its thick atmosphere and methane lakes.', 5);
INSERT INTO public.moon VALUES (9, 'Rhea', 763.00000, true, 5, 'Saturn''s second-largest moon, mostly composed of ice.', 5);
INSERT INTO public.moon VALUES (10, 'Enceladus', 252.00000, true, 1, 'A moon of Saturn with geysers that erupt water vapor into space.', 5);
INSERT INTO public.moon VALUES (11, 'Triton', 1353.00000, true, 6, 'Neptune''s largest moon, known for its retrograde orbit and icy surface.', 6);
INSERT INTO public.moon VALUES (12, 'Miranda', 471.00000, true, 1, 'A moon of Uranus, characterized by strange geological features.', 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 735.00000, true, 79, 'A moon of Saturn, famous for its distinct two-tone coloration.', 5);
INSERT INTO public.moon VALUES (14, 'Mimas', 396.00000, true, 22, 'A small, icy moon of Saturn, known for its large impact crater.', 5);
INSERT INTO public.moon VALUES (15, 'Hyperion', 180.00000, true, 21, 'An irregularly shaped moon of Saturn, with a sponge-like appearance.', 5);
INSERT INTO public.moon VALUES (16, 'Ariel', 578.00000, true, 3, 'A moon of Uranus with an icy surface and signs of geological activity.', 6);
INSERT INTO public.moon VALUES (17, 'Titania', 788.00000, true, 9, 'The largest moon of Uranus, covered by ice and rock with impact craters.', 6);
INSERT INTO public.moon VALUES (18, 'Charon', 606.00000, true, 6, 'The largest moon of Pluto, sharing a unique binary orbit with the dwarf planet.', 7);
INSERT INTO public.moon VALUES (19, 'New', 34.00000, true, 10, 'The largest one', 5);
INSERT INTO public.moon VALUES (20, 'old', 25.00000, true, 9, 'The smallest one', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 6371.00000, 365, 'The only known planet to support life.', 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 3389.00000, 687, 'The fourth planet from the Sun, known for its red appearance.', 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 6052.00000, 225, 'The second planet from the Sun, often referred to as Earth'' s twin.', 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 69911.00000, 4333, 'The largest planet in the Solar System, with a prominent Great Red Spot.', 1);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 58232.00000, 10759, 'The sixth planet from the Sun, famous for its ring system.', 1);
INSERT INTO public.planet VALUES (6, 'Mercury', false, 2439.00000, 88, 'The smallest planet in the Solar System and the closest to the Sun.', 1);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 24764.00000, 60190, 'The eighth and farthest planet from the Sun, known for its deep blue color.', 1);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 25362.00000, 30660, 'The seventh planet from the Sun, notable for its axial tilt.', 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', false, 13400.00000, 290, 'An exoplanet located in the habitable zone of its star, Kepler-22.', 2);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', false, 13200.00000, 4, 'A hot Jupiter located 150 light-years away, known for its atmospheric properties.', 3);
INSERT INTO public.planet VALUES (11, 'Proxima b', false, 7500.00000, 11, 'An exoplanet orbiting the star Proxima Centauri in the habitable zone.', 5);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1 d', false, 12000.00000, 12, 'A potentially habitable exoplanet in the TRAPPIST-1 system.', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.00000, true, 5778, 'The star at the center of our Solar System.', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1.10000, true, 5790, 'The closest star system to the Sun.', 2);
INSERT INTO public.star VALUES (3, 'Sirius', 2.10000, true, 9940, 'The brightest star in the night sky, located in the constellation Canis Major.', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 20.00000, true, 3500, 'A red supergiant star in the Orion constellation.', 4);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 0.12000, true, 3050, 'The closest known exoplanetary system to the Solar System.', 2);
INSERT INTO public.star VALUES (6, 'Rigel', 21.00000, true, 12000, 'A blue supergiant star in the constellation Orion.', 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy_type galaxy_type_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_type_key UNIQUE (type);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

