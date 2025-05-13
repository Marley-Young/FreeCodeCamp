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
    symbolism character varying(50),
    area_sq_deg integer NOT NULL,
    zodiac boolean
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
    constellation_id integer NOT NULL,
    type character varying(30) NOT NULL,
    name character varying(100) NOT NULL,
    mass_in_millions_of_solar_masses numeric(12,2),
    size_kpc numeric(8,1)
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
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    absolute_magnitude numeric(10,4),
    diameter_km integer NOT NULL,
    mass_quadrillions_kg numeric(20,4) NOT NULL,
    discovery_year integer
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
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    has_life boolean,
    description text,
    radius_earths numeric(10,4),
    mass_earths numeric(10,5)
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
    galaxy_id integer NOT NULL,
    spectral_type character varying(20),
    b_v_colour_index numeric(10,4),
    radial_velocity_kms numeric(10,4),
    parallax_mas numeric(10,4),
    distance_ly numeric(10,4) NOT NULL,
    absolute_magnitude numeric(10,4),
    mass_solar numeric(10,4),
    radius_solar numeric(10,4),
    temperature_kelvin integer,
    age_gyr numeric(10,4)
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

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'the Archer', 867, true);
INSERT INTO public.constellation VALUES (2, 'Aries', 'the Ram', 441, true);
INSERT INTO public.constellation VALUES (3, 'Taurus', 'the Bull', 797, true);
INSERT INTO public.constellation VALUES (4, 'Gemini', 'the Twins, Castor and Pollux', 514, true);
INSERT INTO public.constellation VALUES (5, 'Cancer', 'the Crab', 506, true);
INSERT INTO public.constellation VALUES (6, 'Leo', 'the Lion', 947, true);
INSERT INTO public.constellation VALUES (7, 'Virgo', 'the Maiden', 1294, true);
INSERT INTO public.constellation VALUES (8, 'Libra', 'the Balance', 538, true);
INSERT INTO public.constellation VALUES (9, 'Scorpio', 'the Scorpion', 497, true);
INSERT INTO public.constellation VALUES (10, 'Capricornus', 'the Sea-Goat', 414, true);
INSERT INTO public.constellation VALUES (11, 'Aquarius', 'the Water-Bearer', 980, true);
INSERT INTO public.constellation VALUES (12, 'Pisces', 'the Fishes', 889, true);
INSERT INTO public.constellation VALUES (13, 'Centaurus', 'the Centaur', 1060, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 'Sb; Sbc; SB(rs)bs', 'Milky Way', 1150000.00, 26.8);
INSERT INTO public.galaxy VALUES (2, 13, 'cD5; E5; BrCIG', 'ESO 383-G 076', 2150000.00, 540.9);
INSERT INTO public.galaxy VALUES (3, 2, 'dSph', 'Segue 2', 0.55, NULL);
INSERT INTO public.galaxy VALUES (4, 13, 'S0 pec or Ep', 'Centaurus A', NULL, 37.7);
INSERT INTO public.galaxy VALUES (5, 5, 'SA(r)c pec', 'NGC 2535', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 5, 'SA(r)c pec', 'NGC 2536', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 0.2000, 3469, 73460000.0000, NULL);
INSERT INTO public.moon VALUES (2, 6, 'Metis', 10.5000, 43, 36.0000, 1979);
INSERT INTO public.moon VALUES (3, 6, 'Adrastea', 12.0000, 16, 2.0000, 1979);
INSERT INTO public.moon VALUES (4, 6, 'Amalthea', 7.1000, 167, 2080.0000, 1892);
INSERT INTO public.moon VALUES (5, 6, 'Thebe', 9.0000, 99, 430.0000, 1979);
INSERT INTO public.moon VALUES (6, 6, 'Io', -1.7000, 3643, 89319000.0000, 1610);
INSERT INTO public.moon VALUES (7, 6, 'Europa', -1.4000, 3122, 47998000.0000, 1610);
INSERT INTO public.moon VALUES (8, 6, 'Ganymede', -2.1000, 5268, 148190000.0000, 1610);
INSERT INTO public.moon VALUES (9, 6, 'Callisto', -1.2000, 4821, 107590000.0000, 1610);
INSERT INTO public.moon VALUES (10, 6, 'Themisto', 13.3000, 9, 0.3800, 1975);
INSERT INTO public.moon VALUES (11, 6, 'Leda', 12.7000, 22, 5.2000, 1974);
INSERT INTO public.moon VALUES (12, 6, 'Ersa', 16.0000, 3, 0.0140, 2018);
INSERT INTO public.moon VALUES (13, 6, 'S/2018 J 2', 16.5000, 3, 0.0140, 2018);
INSERT INTO public.moon VALUES (14, 6, 'Himalia', 8.0000, 140, 4200.0000, 1904);
INSERT INTO public.moon VALUES (15, 6, 'Pandia', 16.2000, 3, 0.0140, 2017);
INSERT INTO public.moon VALUES (16, 6, 'Lysithea', 11.2000, 42, 39.0000, 1938);
INSERT INTO public.moon VALUES (17, 6, 'Elara', 9.7000, 80, 270.0000, 1905);
INSERT INTO public.moon VALUES (18, 6, 'Dia', 16.1000, 4, 0.0340, 2000);
INSERT INTO public.moon VALUES (19, 6, 'Carpo', 16.2000, 3, 0.0140, 2003);
INSERT INTO public.moon VALUES (20, 6, 'Valetudo', 17.0000, 1, 0.0005, 2018);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 5, 'Mercury', false, 'First planet from the Sun. Rocky planet with trace atmosphere', 0.3829, 0.05500);
INSERT INTO public.planet VALUES (2, 5, 'Venus', false, 'Second planet from the Sun. Thicker and denser atmosphere than Earth.', 0.9499, 0.81500);
INSERT INTO public.planet VALUES (3, 5, 'Earth', true, 'Home', 1.0000, 1.00000);
INSERT INTO public.planet VALUES (4, 5, 'Mars', false, 'Third planet from the Sun. Desert-like rocky planet.', 0.5330, 0.53100);
INSERT INTO public.planet VALUES (5, 5, 'Ceres', false, 'Dwarf planet in the middle main asteroid belt between the orbits of Mars and Jupiter', 0.0025, 0.00016);
INSERT INTO public.planet VALUES (6, 5, 'Jupiter', false, 'Fifth planet from the Sun and largest in solar system. Gas giant.', 10.9730, 317.80000);
INSERT INTO public.planet VALUES (7, 5, 'Saturn', false, 'Sixth planet from the Sun. Has rings.', 9.1402, 95.15900);
INSERT INTO public.planet VALUES (8, 5, 'Uranus', false, 'Seventh planet from the Sun. Cyan coloured ice giant.', 4.0070, 14.53600);
INSERT INTO public.planet VALUES (9, 5, 'Neptune', false, 'Eighth and farthest known planet from the Sun. Densest giant planet.', 3.8830, 17.14700);
INSERT INTO public.planet VALUES (10, 5, 'Pluto', false, 'Dwarf planet in Kupiter belt beyond Neptune.', 0.1868, 0.00218);
INSERT INTO public.planet VALUES (11, 3, 'Proxima Centauri b', false, 'Planet of Proxima Centauri', 1.3000, 1.07000);
INSERT INTO public.planet VALUES (13, 3, 'Proxima Centauri c', false, 'Planet of Proxima Centauri (disputed)', NULL, 7.00000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 1, 'G2V', 0.7100, -21.4000, 750.8100, 4.3440, 4.3800, 1.0788, 1.2175, 5804, 4.8000);
INSERT INTO public.star VALUES (2, 'Alpha Centauri B', 1, 'K1V', 0.8800, -18.6000, 750.8100, 4.3440, 5.7100, 0.9092, 0.8591, 5207, 5.3000);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'M5.5Ve', 1.8200, -22.2040, 768.0665, 4.2465, 15.6000, 0.1221, 0.1542, 2992, 4.8500);
INSERT INTO public.star VALUES (4, 'Beta Centauri Aa', 1, 'B1 III', -0.2300, 9.5900, 9.0400, 361.0000, -4.9000, 12.0200, 9.1600, 25000, 14.1000);
INSERT INTO public.star VALUES (5, 'Sun', 1, 'G2V', 0.6560, 251.0000, NULL, 0.0000, 4.8300, 1.0000, 1.0000, 5778, 4.6000);
INSERT INTO public.star VALUES (6, 'Beta Centauri Ab', 1, 'B1 III', -0.2300, 9.5900, 9.0400, 361.0000, -4.9000, 10.5800, 8.5600, 23000, 14.1000);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 13, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


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
-- Name: constellation constellation_symbolism_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_symbolism_key UNIQUE (symbolism);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

