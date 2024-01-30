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
    name character varying(30) NOT NULL,
    apparent_magnitude numeric NOT NULL,
    diameter numeric,
    distance numeric
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
    planet_id integer NOT NULL,
    diameter numeric,
    distance_from_planet numeric
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
    star_id integer NOT NULL,
    mass numeric,
    radius numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_info (
    planet_info_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    number_of_moons integer
);


ALTER TABLE public.planet_info OWNER TO freecodecamp;

--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_info_planet_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_info_planet_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_info_planet_info_id_seq OWNED BY public.planet_info.planet_info_id;


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
    galaxy_id integer NOT NULL,
    spectral_type character varying(10),
    luminosity numeric
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_info planet_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info ALTER COLUMN planet_info_id SET DEFAULT nextval('public.planet_info_planet_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -20.9, 100000, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 3.44, 220000, 2540000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5.72, 60000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 6.4, 70000, 2500000);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 6.94, 95000, 11600000);
INSERT INTO public.galaxy VALUES (6, 'Messier 83', 7.54, 55000, 14700000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3474.8, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.2, 9378);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.4, 23460);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 5262.4, 1070400);
INSERT INTO public.moon VALUES (5, 'Titan', 6, 5150, 1221870);
INSERT INTO public.moon VALUES (6, 'Europa', 5, 3121.6, 671034);
INSERT INTO public.moon VALUES (7, 'Io', 5, 3643.2, 421700);
INSERT INTO public.moon VALUES (8, 'Callisto', 5, 4820.6, 1882700);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504.2, 238037);
INSERT INTO public.moon VALUES (10, 'Triton', 8, 2706.8, 354759);
INSERT INTO public.moon VALUES (11, 'Charon', 9, 1208, 19571);
INSERT INTO public.moon VALUES (12, 'Titania', 8, 1577.8, 435840);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 763.8, 527040);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1468, 3560820);
INSERT INTO public.moon VALUES (15, 'Dione', 6, 560.4, 377396);
INSERT INTO public.moon VALUES (16, 'Ariel', 8, 1157.8, 191020);
INSERT INTO public.moon VALUES (17, 'Umbriel', 8, 1169.4, 266300);
INSERT INTO public.moon VALUES (18, 'Miranda', 8, 472, 129900);
INSERT INTO public.moon VALUES (19, 'Oberon', 8, 1522.8, 584270);
INSERT INTO public.moon VALUES (20, 'Proteus', 10, 420, 117647);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.055, 0.383);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.815, 0.949);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.107, 0.532);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 317.8, 11.209);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 95.2, 9.449);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 14.6, 4.007);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 17.2, 3.883);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 2, 5, 1.6);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 3, 0.69, 1.35);
INSERT INTO public.planet VALUES (11, 'TrES-4b', 4, 0.919, 1.706);
INSERT INTO public.planet VALUES (12, 'PSR B1620-26 b', 5, 2.5, 1.43);


--
-- Data for Name: planet_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_info VALUES (1, 1, 'Smallest', 'Mercury is the smallest planet in the Solar System and the closest to the Sun.', false, true, 4500, 0);
INSERT INTO public.planet_info VALUES (2, 2, 'Hottest', 'Venus is the second planet from the Sun and the hottest planet in our solar system.', false, true, 4500, 0);
INSERT INTO public.planet_info VALUES (3, 3, 'Life', 'Earth is the third planet from the Sun and the only known planet to support life.', true, true, 4500, 1);
INSERT INTO public.planet_info VALUES (4, 4, 'Color', 'Mars is often called the Red Planet due to its reddish appearance.', false, true, 4500, 2);
INSERT INTO public.planet_info VALUES (5, 5, 'Larger', 'Jupiter is the largest planet in our Solar System and has a strong magnetic field.', false, true, 4500, 79);
INSERT INTO public.planet_info VALUES (6, 6, 'Ice', 'Saturn is known for its prominent ring system, composed mostly of ice particles.', false, true, 4500, 82);
INSERT INTO public.planet_info VALUES (7, 7, 'Unique', 'Uranus is the seventh planet from the Sun and has a unique rotation axis nearly parallel to its orbit.', false, true, 4500, 27);
INSERT INTO public.planet_info VALUES (8, 8, 'Farthest', 'Neptune is the eighth and farthest known planet from the Sun in our Solar System.', false, true, 4500, 14);
INSERT INTO public.planet_info VALUES (9, 9, 'Habitable', 'Kepler-452b is an exoplanet orbiting within the habitable zone of the star Kepler-452.', false, true, 6500, 0);
INSERT INTO public.planet_info VALUES (10, 10, 'Osiris', 'HD 209458 b, also known as Osiris, is an exoplanet discovered by the radial velocity method.', false, true, 5000, 1);
INSERT INTO public.planet_info VALUES (11, 11, 'Extrasolar', 'TrES-4b is an extrasolar planet orbiting the star GSC 02652-01324.', false, true, 8000, 0);
INSERT INTO public.planet_info VALUES (12, 12, 'Expoplanet', 'PSR B1620-26 b is a gas giant exoplanet that orbits the binary star PSR B1620-26.', false, true, 10000, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'G2V', 1.1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 'K1V', 0.45);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'A1V', 25.4);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A0V', 40.12);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 1, 'M1-2Ia-Iab', 105000);
INSERT INTO public.star VALUES (7, 'Rigel', 1, 'B8Ia', 120000);
INSERT INTO public.star VALUES (8, 'Polaris', 1, 'F7Ib', 2000);
INSERT INTO public.star VALUES (9, 'Antares', 1, 'M1.5Iab-Ib', 6500);
INSERT INTO public.star VALUES (10, 'Aldebaran', 1, 'K5III', 518);
INSERT INTO public.star VALUES (11, 'Spica', 1, 'B1III-IV', 12000);
INSERT INTO public.star VALUES (12, 'Arcturus', 1, 'K0III', 170);
INSERT INTO public.star VALUES (13, 'Proxima Centauri', 1, 'M5.5Ve', 0.0017);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_info_planet_info_id_seq', 12, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


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
-- Name: planet_info planet_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_pkey PRIMARY KEY (planet_info_id);


--
-- Name: planet_info planet_info_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_planet_id_key UNIQUE (planet_id);


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
-- Name: planet_info planet_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

