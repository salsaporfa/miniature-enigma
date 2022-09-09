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
    name character varying(20) NOT NULL,
    description text,
    star_number integer NOT NULL,
    galaxy_type character varying(20),
    age_in_millions_of_years numeric,
    distance_from_earth_in_light_year numeric
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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    moon_type character varying(20),
    age_in_millions_of_years numeric,
    distance_from_earth_in_light_year numeric,
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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    moon_number integer NOT NULL,
    planet_type character varying(20),
    age_in_millions_of_years numeric,
    distance_from_earth_in_light_year numeric,
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
-- Name: scientist_discovery; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scientist_discovery (
    scientist_discovery_id integer NOT NULL,
    name character varying(15) NOT NULL,
    nationality character varying(10)
);


ALTER TABLE public.scientist_discovery OWNER TO freecodecamp;

--
-- Name: scientist_discovery_scientist_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scientist_discovery_scientist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scientist_discovery_scientist_id_seq OWNER TO freecodecamp;

--
-- Name: scientist_discovery_scientist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scientist_discovery_scientist_id_seq OWNED BY public.scientist_discovery.scientist_discovery_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    planet_number integer NOT NULL,
    star_type character varying(20),
    age_in_millions_of_years numeric,
    distance_from_earth_in_light_year numeric,
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: scientist_discovery scientist_discovery_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist_discovery ALTER COLUMN scientist_discovery_id SET DEFAULT nextval('public.scientist_discovery_scientist_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Cheese', 'Fermented milk galaxy', 2, 'Type-cD', 12412.2, 36.1);
INSERT INTO public.galaxy VALUES (3, 'Gender', 'Binary properties of human beings', 2, 'Type-cD', 19432.9, 42.9);
INSERT INTO public.galaxy VALUES (4, 'Music_gender', 'Different representation of music', 3, 'Type-cD', 12532.8, 22.4);
INSERT INTO public.galaxy VALUES (5, 'Vehicles', 'Something that moves ppl or things', 2, 'Ellipticals', 14542.5, 28.4);
INSERT INTO public.galaxy VALUES (6, 'Drinks', 'Liquid galaxy', 2, 'Spiral', 20542.5, 52.7);
INSERT INTO public.galaxy VALUES (1, 'Desert', 'A sweet galaxy', 2, 'Ellipticals', 13612.2, 26.3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Chocolate butter', '', false, false, '', NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Chocolate powder', '', false, false, '', NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'Choco icecream', '', false, false, '', NULL, NULL, 3);
INSERT INTO public.moon VALUES (4, 'Coco icecream', '', false, false, '', NULL, NULL, 4);
INSERT INTO public.moon VALUES (5, 'France', '', false, false, '', NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Italy', '', false, false, '', NULL, NULL, 6);
INSERT INTO public.moon VALUES (7, 'Britain', '', false, false, '', NULL, NULL, 7);
INSERT INTO public.moon VALUES (8, 'Denmark', '', false, false, '', NULL, NULL, 8);
INSERT INTO public.moon VALUES (9, 'iPhone', '', false, false, '', NULL, NULL, 9);
INSERT INTO public.moon VALUES (10, 'Windows', '', false, false, '', NULL, NULL, 10);
INSERT INTO public.moon VALUES (11, 'Radium', '', false, false, '', NULL, NULL, 11);
INSERT INTO public.moon VALUES (12, 'Nada', '', false, false, '', NULL, NULL, 12);
INSERT INTO public.moon VALUES (13, 'Rap God', '', false, false, '', NULL, NULL, 13);
INSERT INTO public.moon VALUES (14, 'Mía', '', false, false, '', NULL, NULL, 14);
INSERT INTO public.moon VALUES (15, 'Numb', '', false, false, '', NULL, NULL, 17);
INSERT INTO public.moon VALUES (16, 'Creep', '', false, false, '', NULL, NULL, 18);
INSERT INTO public.moon VALUES (17, 'Mountainbike', '', false, false, '', NULL, NULL, 19);
INSERT INTO public.moon VALUES (18, 'SUV', '', false, false, '', NULL, NULL, 20);
INSERT INTO public.moon VALUES (19, 'Heineken', '', false, false, '', NULL, NULL, 21);
INSERT INTO public.moon VALUES (20, 'Coca-Cola', '', false, false, '', NULL, NULL, 22);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'White chocolate', 'Sweet cocoa butter', true, true, 1, 'Rocky', 899.1, 26.3, 1);
INSERT INTO public.planet VALUES (2, 'Black chocolate', 'Bitter cocoa powder', false, true, 1, 'Rocky', 900.1, 26.3, 1);
INSERT INTO public.planet VALUES (3, 'With lactoce', 'Milkbased ice-cream', false, true, 1, 'Rocky', 890.2, 26.3, 2);
INSERT INTO public.planet VALUES (4, 'Vegan', 'No milk ice-cream', false, false, 1, 'Rocky', 877.4, 26.3, 2);
INSERT INTO public.planet VALUES (5, 'Roquefort', 'Frech blue cheese', true, true, 1, 'Rocky', 879.2, 36.1, 3);
INSERT INTO public.planet VALUES (6, 'Gorgonzola', 'Italian blue cheese', true, true, 1, 'Rocky', 877.8, 36.1, 3);
INSERT INTO public.planet VALUES (7, 'Cheddar', 'British cheese', false, true, 1, 'Rocky', 907.2, 36.1, 4);
INSERT INTO public.planet VALUES (8, 'Havarti', 'Danish cheese', false, false, 1, 'Rocky', 912.5, 36.1, 4);
INSERT INTO public.planet VALUES (9, 'Steve Jobs', 'Founder of Apple', false, false, 1, 'Rocky', 788.2, 42.9, 5);
INSERT INTO public.planet VALUES (10, 'Bill Gates', 'Founder of Microsoft', true, false, 1, 'Rocky', 768.9, 42.9, 5);
INSERT INTO public.planet VALUES (11, 'Marie Curie', 'Nobel price owner', false, true, 1, 'Rocky', 809.4, 42.9, 6);
INSERT INTO public.planet VALUES (12, 'Carmen Laforet', 'Spanish author', false, false, 1, 'Rocky', 812.1, 42.9, 6);
INSERT INTO public.planet VALUES (13, 'Eminem', 'American rapper', true, true, 1, 'Rocky', 765.4, 22.4, 7);
INSERT INTO public.planet VALUES (14, 'Bad Bunny', 'Latino rapper', true, false, 1, 'Rocky', 567.1, 22.4, 7);
INSERT INTO public.planet VALUES (15, 'Taylor Swift', 'American singer', true, false, 0, 'Rocky', 456.2, 22.4, 8);
INSERT INTO public.planet VALUES (16, 'The Weeknd', 'American singer', false, false, 0, 'Rocky', 673.1, 22.4, 8);
INSERT INTO public.planet VALUES (17, 'Linkin Park', 'American rock band', true, false, 1, 'Rocky', 879.1, 22.4, 9);
INSERT INTO public.planet VALUES (18, 'Radiohead', 'British rock band', false, false, 1, 'Rocky', 782.4, 22.4, 9);
INSERT INTO public.planet VALUES (21, 'Beer', 'Wheat alcohol', false, false, 1, 'Rocky', 822.1, 52.7, 12);
INSERT INTO public.planet VALUES (22, 'Gas drink', 'Drinks with gas', false, false, 1, 'Rocky', 851.6, 52.7, 13);
INSERT INTO public.planet VALUES (19, 'Bicycle', 'Two wheels', false, false, 1, 'Rocky', 822.1, 28.4, 10);
INSERT INTO public.planet VALUES (20, 'Cars', 'Four wheels', false, false, 1, 'Rocky', 892.6, 28.4, 11);


--
-- Data for Name: scientist_discovery; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scientist_discovery VALUES (1, 'Juanito', 'German');
INSERT INTO public.scientist_discovery VALUES (2, 'Paquito', 'German');
INSERT INTO public.scientist_discovery VALUES (3, 'Fulanito', 'German');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Chocolate', 'The product of cocoa', 2, 'Red dwarf', 3732.1, 26.3, 1);
INSERT INTO public.star VALUES (2, 'Ice-cream', 'Frozen milk', 2, 'Red dwarf', 10293.2, 26.3, 1);
INSERT INTO public.star VALUES (3, 'Blue cheese', 'Cheese with mold', 2, 'Red dwarf', 10302.1, 36.1, 2);
INSERT INTO public.star VALUES (4, 'Normal cheese', 'Cheese without mold', 2, 'Red dwarf', 8964.4, 36.1, 2);
INSERT INTO public.star VALUES (5, 'Male', 'Man or boy', 2, 'Red dwarf', 9001.2, 42.9, 3);
INSERT INTO public.star VALUES (6, 'Female', 'Woman or girl', 2, 'Red dwarf', 8237.2, 42.9, 3);
INSERT INTO public.star VALUES (7, 'Rap', 'Strong rithem songs', 2, 'Red dwarf', 12222.2, 22.4, 4);
INSERT INTO public.star VALUES (8, 'Pop', 'Songs for the majority', 2, 'Red dwarf', 11293.1, 22.4, 4);
INSERT INTO public.star VALUES (9, 'Rock', 'Strong rithem & melody', 2, 'Red dwarf', 10231.8, 22.4, 4);
INSERT INTO public.star VALUES (10, 'With engine', 'Artificial force moving', 1, 'Red dwarf', 9021.1, 28.4, 5);
INSERT INTO public.star VALUES (11, 'Without engine', 'Natural force moving', 1, 'Red dwarf', 10023.4, 28.4, 5);
INSERT INTO public.star VALUES (12, 'Alcoholic', 'Drinks for adults', 1, 'Red dwarf', 19221.8, 52.7, 6);
INSERT INTO public.star VALUES (13, 'Non-alcoholic', 'Drinks for everyone', 1, 'Red dwarf', 16273.8, 52.7, 6);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- Name: scientist_discovery_scientist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scientist_discovery_scientist_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: scientist_discovery constraint_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist_discovery
    ADD CONSTRAINT constraint_name UNIQUE (name);


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
-- Name: scientist_discovery scientist_discovery_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist_discovery
    ADD CONSTRAINT scientist_discovery_pkey PRIMARY KEY (scientist_discovery_id);


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
