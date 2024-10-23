--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2024-10-23 18:13:23

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
-- TOC entry 215 (class 1259 OID 16456)
-- Name: properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.properties (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    photos character varying(255)[] NOT NULL,
    description text NOT NULL,
    total_area character varying(255) NOT NULL,
    bedrooms integer NOT NULL,
    bathrooms integer NOT NULL,
    target_closing_date character varying(255),
    property_type character varying(255),
    investment_minimum numeric(12,2),
    roi numeric(5,2),
    project_cost character varying(255),
    risk_level character varying(255),
    equity_investment character varying(255),
    senior_loan character varying(255)
);


ALTER TABLE public.properties OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16455)
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_id_seq OWNER TO postgres;

--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 214
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- TOC entry 217 (class 1259 OID 16471)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16470)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3178 (class 2604 OID 16459)
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- TOC entry 3179 (class 2604 OID 16474)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3330 (class 0 OID 16456)
-- Dependencies: 215
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.properties (id, name, photos, description, total_area, bedrooms, bathrooms, target_closing_date, property_type, investment_minimum, roi, project_cost, risk_level, equity_investment, senior_loan) FROM stdin;
9	Bellandur Tech Space Center	{/Assets/Office_Spaces/property7/image1.jpeg,/Assets/Office_Spaces/property7/image2.jpeg,/Assets/Office_Spaces/property7/image3.jpeg,/Assets/Office_Spaces/property7/image4.jpeg,/Assets/Office_Spaces/property7/image5.jpeg}	Tech-friendly building in the heart of the IT hub perfect for MNCs with dedicated server rooms and ample parking.	6000-7000	0	0	February End	Commercial Office	32000.00	15.50	8.5 Cr	Low-Medium risk	4.2 Cr	4.3 Cr
3	Indiranagar Prime Office Space	{/Assets/Office_Spaces/property1/image1.jpeg,/Assets/Office_Spaces/property1/image2.jpeg,/Assets/Office_Spaces/property1/image3.jpeg,/Assets/Office_Spaces/property1/image4.jpeg,/Assets/Office_Spaces/property1/image5.jpeg}	A well-connected office space in a sought-after location with high visibility spacious work areas and premium interiors.	4500-5500	0	0	November End	Commercial Office	20000.00	12.50	6.8 Cr	Medium risk	3 Cr	3.8 Cr
4	Koramangala Business Hub	{/Assets/Office_Spaces/property2/image1.jpeg,/Assets/Office_Spaces/property2/image2.jpeg,/Assets/Office_Spaces/property2/image3.jpeg,/Assets/Office_Spaces/property2/image4.jpeg,/Assets/Office_Spaces/property2/image5.jpeg}	Ideal for startups and growing businesses with coworking space potential furnished and with tech-enabled meeting rooms.	6000-7000	0	0	January End	Commercial Office	30000.00	15.00	8 Cr	Medium risk	4 Cr	4 Cr
5	Electronic City Corporate Park	{/Assets/Office_Spaces/property3/image1.jpeg,/Assets/Office_Spaces/property3/image2.jpeg,/Assets/Office_Spaces/property3/image3.jpeg,/Assets/Office_Spaces/property3/image4.jpeg,/Assets/Office_Spaces/property3/image5.jpeg}	Designed for IT companies equipped with fiber-optic internet state-of-the-art security and green energy solutions.	5500-6500	0	0	March End	Commercial Office	25000.00	13.00	7 Cr	Low-Medium risk	3.2 Cr	3.8 Cr
6	MG Road Commercial Tower	{/Assets/Office_Spaces/property4/image1.jpeg,/Assets/Office_Spaces/property4/image2.jpeg,/Assets/Office_Spaces/property4/image3.jpeg,/Assets/Office_Spaces/property4/image4.jpeg,/Assets/Office_Spaces/property4/image5.jpeg}	High-end office space in a prestigious business district excellent for financial and consulting firms.	5000-6000	0	0	February End	Commercial Office	35000.00	16.00	9 Cr	Medium-High risk	4 Cr	5 Cr
7	HSR Layout IT Office Space	{/Assets/Office_Spaces/property5/image1.jpeg,/Assets/Office_Spaces/property5/image2.jpeg,/Assets/Office_Spaces/property5/image3.jpeg,/Assets/Office_Spaces/property5/image4.jpeg,/Assets/Office_Spaces/property5/image5.jpeg}	A tech park designed with flexibility offering shared spaces conference rooms and wellness zones for employees.	5200-6200	0	0	December End	Commercial Office	27000.00	13.50	7.2 Cr	Medium risk	3.4 Cr	3.8 Cr
8	JP Nagar Business Center	{/Assets/Office_Spaces/property6/image1.jpeg,/Assets/Office_Spaces/property6/image2.jpeg,/Assets/Office_Spaces/property6/image3.jpeg,/Assets/Office_Spaces/property6/image4.jpeg,/Assets/Office_Spaces/property6/image5.jpeg}	An excellent choice for consulting firms with premium office layouts centrally air-conditioned and dedicated meeting rooms.	5800-6800	0	0	January End	Commercial Office	28000.00	14.00	7.8 Cr	Medium risk	3.6 Cr	4.2 Cr
10	Sarjapur Road Office Complex	{/Assets/Office_Spaces/property8/image1.jpeg,/Assets/Office_Spaces/property8/image2.jpeg,/Assets/Office_Spaces/property8/image3.jpeg,/Assets/Office_Spaces/property8/image4.jpeg,/Assets/Office_Spaces/property8/image5.jpeg}	Ideal for tech startups and SMBs offering fully customizable office layouts advanced security systems and flexible lease options.	5000-6000	0	0	March End	Commercial Office	26000.00	13.00	7.4 Cr	Medium risk	3.4 Cr	4 Cr
11	Sarjapur Road Luxury Residences	{/Assets/Residential_Apartments/property1/image1.jpeg,/Assets/Residential_Apartments/property1/image2.jpeg,/Assets/Residential_Apartments/property1/image3.jpeg,/Assets/Residential_Apartments/property1/image4.jpeg,/Assets/Residential_Apartments/property1/image5.jpeg}	Premium apartments with rooftop terrace gym 24/7 security and landscaped gardens.	1400-1600	3	3	April End	3BHK Apartments	18000.00	12.00	3.6 Cr	Low risk	2 Cr	1.6 Cr
12	Whitefield Family Homes	{/Assets/Residential_Apartments/property2/image1.jpeg,/Assets/Residential_Apartments/property2/image2.jpeg,/Assets/Residential_Apartments/property2/image3.jpeg,/Assets/Residential_Apartments/property2/image4.jpeg,/Assets/Residential_Apartments/property2/image5.jpeg}	Luxurious apartments in a vibrant neighborhood with shopping centers schools and parks nearby.	1200-1400	3	3	March End	3BHK Apartments	14000.00	10.50	3 Cr	Low-Medium risk	1.6 Cr	1.4 Cr
13	Yelahanka Green Apartments	{/Assets/Residential_Apartments/property3/image1.jpeg,/Assets/Residential_Apartments/property3/image2.jpeg,/Assets/Residential_Apartments/property3/image3.jpeg,/Assets/Residential_Apartments/property3/image4.jpeg,/Assets/Residential_Apartments/property3/image5.jpeg}	Eco-friendly apartments with solar power rainwater harvesting and spacious balconies overlooking green spaces.	1300-1500	3	3	April End	3BHK Apartments	15000.00	11.50	3.1 Cr	Low risk	1.7 Cr	1.4 Cr
14	Bannerghatta Road Premium Apartments	{/Assets/Residential_Apartments/property4/image1.jpeg,/Assets/Residential_Apartments/property4/image2.jpeg,/Assets/Residential_Apartments/property4/image3.jpeg,/Assets/Residential_Apartments/property4/image4.jpeg,/Assets/Residential_Apartments/property4/image5.jpeg}	A family-friendly complex with a fully equipped gym jogging track and dedicated childrens play areas.	1200-1400	3	3	February End	3BHK Apartments	17000.00	12.00	3.5 Cr	Low risk	2 Cr	1.5 Cr
15	Hennur Road Smart Homes	{/Assets/Residential_Apartments/property5/image1.jpeg,/Assets/Residential_Apartments/property5/image2.jpeg,/Assets/Residential_Apartments/property5/image3.jpeg,/Assets/Residential_Apartments/property5/image4.jpeg,/Assets/Residential_Apartments/property5/image5.jpeg}	Smart home-enabled apartments with app-controlled security lighting and energy systems.	1300-1500	3	3	March End	3BHK Apartments	16000.00	11.00	3.4 Cr	Low-Medium risk	1.8 Cr	1.6 Cr
16	Hebbal Waterside Residences	{/Assets/Residential_Apartments/property6/image1.jpeg,/Assets/Residential_Apartments/property6/image2.jpeg,/Assets/Residential_Apartments/property6/image3.jpeg,/Assets/Residential_Apartments/property6/image4.jpeg,/Assets/Residential_Apartments/property6/image5.jpeg}	Apartments with serene lakeside views infinity pool and multi-purpose sports courts.	1300-1600	3	3	April End	3BHK Apartments	17000.00	12.00	3.6 Cr	Low risk	2 Cr	1.6 Cr
18	Jayanagar Central Apartments	{/Assets/Residential_Apartments/property8/image1.jpeg,/Assets/Residential_Apartments/property8/image2.jpeg,/Assets/Residential_Apartments/property8/image3.jpeg,/Assets/Residential_Apartments/property8/image4.jpeg,/Assets/Residential_Apartments/property8/image5.jpeg}	Spacious homes in a prime residential area with clubhouses landscaped gardens and dedicated fitness zones.	1200-1400	3	3	March End	3BHK Apartments	16000.00	11.50	3.3 Cr	Low risk	1.8 Cr	1.5 Cr
19	Hoskote Agricultural Land	{/Assets/Agricultural_Land/property1/image1.jpeg,/Assets/Agricultural_Land/property1/image2.jpeg,/Assets/Agricultural_Land/property1/image3.jpeg,/Assets/Agricultural_Land/property1/image4.jpeg,/Assets/Agricultural_Land/property1/image5.jpeg}	Fertile land suitable for organic farming strategically located near future industrial expansion zones.	20 acres	0	0	March End	Agricultural Land	25000.00	17.00	5.2 Cr	High risk	3 Cr	2.2 Cr
20	Devanahalli Agricultural Property	{/Assets/Agricultural_Land/property2/image1.jpeg,/Assets/Agricultural_Land/property2/image2.jpeg,/Assets/Agricultural_Land/property2/image3.jpeg,/Assets/Agricultural_Land/property2/image4.jpeg,/Assets/Agricultural_Land/property2/image5.jpeg}	Well-irrigated land with road access close to the airport and upcoming business parks suitable for horticulture.	2.5 acres	0	0	February End	Agricultural Land	20000.00	16.50	5 Cr	High risk	3 Cr	2 Cr
21	Tumkur Agricultural Plot	{/Assets/Agricultural_Land/property3/image1.jpeg,/Assets/Agricultural_Land/property3/image2.jpeg,/Assets/Agricultural_Land/property3/image3.jpeg,/Assets/Agricultural_Land/property3/image4.jpeg,/Assets/Agricultural_Land/property3/image5.jpeg}	Potential for agricultural development and future real estate expansion close to major highways and industrial projects.	4 acres	0	0	April End	Agricultural Land	30000.00	18.00	6 Cr	High risk	3.5 Cr	2.5 Cr
22	Chikkaballapur Farmland	{/Assets/Agricultural_Land/property4/image1.jpeg,/Assets/Agricultural_Land/property4/image2.jpeg,/Assets/Agricultural_Land/property4/image3.jpeg,/Assets/Agricultural_Land/property4/image4.jpeg,/Assets/Agricultural_Land/property4/image5.jpeg}	Ideal for organic farming or vineyards located near a planned tourism development zone.	3 acres	0	0	January End	Agricultural Land	18000.00	15.50	4.5 Cr	High risk	2.5 Cr	2 Cr
23	Kanakapura Road Agricultural Land	{/Assets/Agricultural_Land/property5/image1.jpeg,/Assets/Agricultural_Land/property5/image2.jpeg,/Assets/Agricultural_Land/property5/image3.jpeg,/Assets/Agricultural_Land/property5/image4.jpeg,/Assets/Agricultural_Land/property5/image5.jpeg}	Premium land suitable for future development with good access to highways and tech park expansions.	2.5 acres	0	0	March End	Agricultural Land	20000.00	16.50	4.9 Cr	High risk	2.9 Cr	2 Cr
24	Mysore Road Agricultural Land	{/Assets/Agricultural_Land/property6/image1.jpeg,/Assets/Agricultural_Land/property6/image2.jpeg,/Assets/Agricultural_Land/property6/image3.jpeg,/Assets/Agricultural_Land/property6/image4.jpeg,/Assets/Agricultural_Land/property6/image5.jpeg}	Agricultural land with future potential for residential or industrial development located near infrastructure projects.	3.2 acres	0	0	February End	Agricultural Land	22000.00	17.00	5.6 Cr	High risk	3.2 Cr	2.4 Cr
25	Ramanagara Agricultural Estate	{/Assets/Agricultural_Land/property7/image1.jpeg,/Assets/Agricultural_Land/property7/image2.jpeg,/Assets/Agricultural_Land/property7/image3.jpeg,/Assets/Agricultural_Land/property7/image4.jpeg,/Assets/Agricultural_Land/property7/image5.jpeg}	Suitable for organic farming located in a growing tourist hub with future potential for eco-friendly resorts.	2.8 acres	0	0	April End	Agricultural Land	20000.00	16.00	5.2 Cr	High risk	3 Cr	2.2 Cr
26	Nandi Hills Agricultural Plot	{/Assets/Agricultural_Land/property8/image1.jpeg,/Assets/Agricultural_Land/property8/image2.jpeg,/Assets/Agricultural_Land/property8/image3.jpeg,/Assets/Agricultural_Land/property8/image4.jpeg,/Assets/Agricultural_Land/property8/image5.jpeg}	Prime land for agricultural use or vineyards with scenic views and proximity to luxury holiday resorts.	3 acres	0	0	February End	Agricultural Land	22000.00	17.50	5.4 Cr	High risk	3.1 Cr	2.3 Cr
27	Koramangala Luxury Boutique Hotel	{/Assets/Hotel_Spaces/property1/image1.jpeg,/Assets/Hotel_Spaces/property1/image2.jpeg,/Assets/Hotel_Spaces/property1/image3.jpeg,/Assets/Hotel_Spaces/property1/image4.jpeg,/Assets/Hotel_Spaces/property1/image5.jpeg}	A 35-room boutique hotel with a spa gourmet restaurant and event space located in a bustling commercial district.	8500	0	0	July End	Hotel	55000.00	16.00	13 Cr	Medium risk	6 Cr	7 Cr
28	Whitefield Business Boutique Hotel	{/Assets/Hotel_Spaces/property2/image1.jpeg,/Assets/Hotel_Spaces/property2/image2.jpeg,/Assets/Hotel_Spaces/property2/image3.jpeg,/Assets/Hotel_Spaces/property2/image4.jpeg,/Assets/Hotel_Spaces/property2/image5.jpeg}	40-room boutique hotel aimed at business travelers featuring conference facilities co-working spaces and a rooftop café.	9000	0	0	May End	Hotel	60000.00	15.50	14 Cr	Medium risk	6.5 Cr	7.5 Cr
29	MG Road Art Deco Hotel	{/Assets/Hotel_Spaces/property3/image1.jpeg,/Assets/Hotel_Spaces/property3/image2.jpeg,/Assets/Hotel_Spaces/property3/image3.jpeg,/Assets/Hotel_Spaces/property3/image4.jpeg,/Assets/Hotel_Spaces/property3/image5.jpeg}	A boutique hotel with 32 rooms featuring a unique Art Deco theme rooftop bar and gallery space for local artists.	8200	0	0	June End	Hotel	52000.00	15.00	12.5 Cr	Medium risk	5.5 Cr	7 Cr
30	Jayanagar Heritage Boutique Hotel	{/Assets/Hotel_Spaces/property4/image1.jpeg,/Assets/Hotel_Spaces/property4/image2.jpeg,/Assets/Hotel_Spaces/property4/image3.jpeg,/Assets/Hotel_Spaces/property4/image4.jpeg,/Assets/Hotel_Spaces/property4/image5.jpeg}	A heritage property converted into a 28-room boutique hotel with a fine dining restaurant and luxury suites.	7500	0	0	August End	Hotel	48000.00	14.50	11 Cr	Medium risk	4.5 Cr	6.5 Cr
31	Richmond Town Boutique Retreat	{/Assets/Hotel_Spaces/property5/image1.jpeg,/Assets/Hotel_Spaces/property5/image2.jpeg,/Assets/Hotel_Spaces/property5/image3.jpeg,/Assets/Hotel_Spaces/property5/image4.jpeg,/Assets/Hotel_Spaces/property5/image5.jpeg}	A wellness-focused boutique retreat with 40 rooms spa services yoga pavilion and an organic farm-to-table restaurant.	9000	0	0	May End	Hotel	60000.00	16.00	14 Cr	Medium risk	6.5 Cr	7.5 Cr
32	HSR Layout Boutique Business Hotel	{/Assets/Hotel_Spaces/property6/image1.jpeg,/Assets/Hotel_Spaces/property6/image2.jpeg,/Assets/Hotel_Spaces/property6/image3.jpeg,/Assets/Hotel_Spaces/property6/image4.jpeg,/Assets/Hotel_Spaces/property6/image5.jpeg}	A 30-room boutique hotel with modern business amenities offering exclusive executive suites a restaurant and a rooftop lounge.	8200	0	0	June End	Hotel	50000.00	15.00	12 Cr	Medium risk	5 Cr	7 Cr
33	Hebbal Lake Boutique Resort	{/Assets/Hotel_Spaces/property7/image1.jpeg,/Assets/Hotel_Spaces/property7/image2.jpeg,/Assets/Hotel_Spaces/property7/image3.jpeg,/Assets/Hotel_Spaces/property7/image4.jpeg,/Assets/Hotel_Spaces/property7/image5.jpeg}	A 50-room resort-style boutique hotel by the lake featuring luxury accommodations water sports facilities and a gourmet restaurant.	9500	0	0	April End	Hotel	65000.00	17.00	15 Cr	Medium-High risk	7 Cr	8 Cr
34	Lavelle Road Urban Boutique Hotel	{/Assets/Hotel_Spaces/property8/image1.jpeg,/Assets/Hotel_Spaces/property8/image2.jpeg,/Assets/Hotel_Spaces/property8/image3.jpeg,/Assets/Hotel_Spaces/property8/image4.jpeg,/Assets/Hotel_Spaces/property8/image5.jpeg}	A modern 35-room boutique hotel with urban chic design rooftop pool cocktail bar and event spaces catering to both leisure and business travelers.	8700	0	0	July End	Hotel	55000.00	15.50	13 Cr	Medium risk	6 Cr	7 Cr
35	Peenya Industrial Warehouse	{/Assets/Industrial_Warehouse/property1/image1.jpeg,/Assets/Industrial_Warehouse/property1/image2.jpeg,/Assets/Industrial_Warehouse/property1/image3.jpeg,/Assets/Industrial_Warehouse/property1/image4.jpeg,/Assets/Industrial_Warehouse/property1/image5.jpeg}	State-of-the-art warehouse facility with advanced inventory management systems close to major industrial zones.	16000	0	0	May End	Industrial	32000.00	13.50	7 Cr	Low risk	3.2 Cr	3.8 Cr
36	Nelamangala Logistics Warehouse	{/Assets/Industrial_Warehouse/property2/image1.jpeg,/Assets/Industrial_Warehouse/property2/image2.jpeg,/Assets/Industrial_Warehouse/property2/image3.jpeg,/Assets/Industrial_Warehouse/property2/image4.jpeg,/Assets/Industrial_Warehouse/property2/image5.jpeg}	Warehouse with climate control systems truck loading bays and close proximity to logistics hubs and highways.	14000	0	0	March End	Industrial	28000.00	12.50	6 Cr	Low risk	2.8 Cr	3.2 Cr
37	Jigani Manufacturing Warehouse	{/Assets/Industrial_Warehouse/property3/image1.jpeg,/Assets/Industrial_Warehouse/property3/image2.jpeg,/Assets/Industrial_Warehouse/property3/image3.jpeg,/Assets/Industrial_Warehouse/property3/image4.jpeg,/Assets/Industrial_Warehouse/property3/image5.jpeg}	High-tech facility designed for large-scale manufacturing and storage with secure access and dedicated office spaces.	17000	0	0	April End	Industrial	35000.00	13.00	7.2 Cr	Low risk	3.2 Cr	4 Cr
38	Hosur Road Industrial Warehouse	{/Assets/Industrial_Warehouse/property4/image1.jpeg,/Assets/Industrial_Warehouse/property4/image2.jpeg,/Assets/Industrial_Warehouse/property4/image3.jpeg,/Assets/Industrial_Warehouse/property4/image4.jpeg,/Assets/Industrial_Warehouse/property4/image5.jpeg}	Premium warehouse facility with 24/7 security easy highway access and a fully automated inventory tracking system.	18000	0	0	May End	Industrial	36000.00	13.50	7.5 Cr	Low risk	3.5 Cr	4 Cr
39	Yelahanka Distribution Center	{/Assets/Industrial_Warehouse/property5/image1.jpeg,/Assets/Industrial_Warehouse/property5/image2.jpeg,/Assets/Industrial_Warehouse/property5/image3.jpeg,/Assets/Industrial_Warehouse/property5/image4.jpeg,/Assets/Industrial_Warehouse/property5/image5.jpeg}	A modern warehouse optimized for distribution with dedicated loading bays forklift access and close proximity to major trade routes.	15500	0	0	June End	Industrial	31000.00	13.00	6.8 Cr	Low risk	3 Cr	3.8 Cr
40	Electronic City Warehouse Facility	{/Assets/Industrial_Warehouse/property6/image1.jpeg,/Assets/Industrial_Warehouse/property6/image2.jpeg,/Assets/Industrial_Warehouse/property6/image3.jpeg,/Assets/Industrial_Warehouse/property6/image4.jpeg,/Assets/Industrial_Warehouse/property6/image5.jpeg}	Advanced warehouse with integrated logistics management located near tech parks and key transport corridors.	15000	0	0	April End	Industrial	30000.00	13.00	6.6 Cr	Low risk	3 Cr	3.6 Cr
41	Doddaballapur Industrial Warehouse	{/Assets/Industrial_Warehouse/property7/image1.jpeg,/Assets/Industrial_Warehouse/property7/image2.jpeg,/Assets/Industrial_Warehouse/property7/image3.jpeg,/Assets/Industrial_Warehouse/property7/image4.jpeg,/Assets/Industrial_Warehouse/property7/image5.jpeg}	Well-constructed facility with full security features ideal for warehousing or small-scale manufacturing operations.	16500	0	0	May End	Industrial	34000.00	13.50	7.1 Cr	Low risk	3.4 Cr	3.7 Cr
42	Hebbal Industrial Warehouse	{/Assets/Industrial_Warehouse/property8/image1.jpeg,/Assets/Industrial_Warehouse/property8/image2.jpeg,/Assets/Industrial_Warehouse/property8/image3.jpeg,/Assets/Industrial_Warehouse/property8/image4.jpeg,/Assets/Industrial_Warehouse/property8/image5.jpeg}	Strategically located warehouse with advanced facilities providing excellent logistics support for manufacturing and distribution.	16000	0	0	June End	Industrial	32000.00	12.80	6.7 Cr	Low risk	3.2 Cr	3.5 Cr
43	Indiranagar High-Street Retail Space	{/Assets/Retail_Spaces/property1/image1.jpeg,/Assets/Retail_Spaces/property1/image2.jpeg,/Assets/Retail_Spaces/property1/image3.jpeg,/Assets/Retail_Spaces/property1/image4.jpeg,/Assets/Retail_Spaces/property1/image5.jpeg}	Prime ground-floor retail space on a bustling street with foot traffic glass façade and parking.	3000	0	0	June End	Commercial Retail	22000.00	12.50	6 Cr	Low risk	2.8 Cr	3.2 Cr
44	Whitefield Mall Retail Space	{/Assets/Retail_Spaces/property2/image1.jpeg,/Assets/Retail_Spaces/property2/image2.jpeg,/Assets/Retail_Spaces/property2/image3.jpeg,/Assets/Retail_Spaces/property2/image4.jpeg,/Assets/Retail_Spaces/property2/image5.jpeg}	Retail space located inside a modern mall featuring premium visibility anchor stores and ample parking.	2800	0	0	April End	Commercial Retail	21000.00	12.00	5.8 Cr	Low risk	2.7 Cr	3.1 Cr
45	MG Road Commercial Retail Space	{/Assets/Retail_Spaces/property3/image1.jpeg,/Assets/Retail_Spaces/property3/image2.jpeg,/Assets/Retail_Spaces/property3/image3.jpeg,/Assets/Retail_Spaces/property3/image4.jpeg,/Assets/Retail_Spaces/property3/image5.jpeg}	Retail unit in a high-end shopping district with dedicated parking and high visibility for fashion brands.	2600	0	0	May End	Commercial Retail	20000.00	12.00	5.6 Cr	Low risk	2.6 Cr	3 Cr
46	Jayanagar Plaza Retail Space	{/Assets/Retail_Spaces/property4/image1.jpeg,/Assets/Retail_Spaces/property4/image2.jpeg,/Assets/Retail_Spaces/property4/image3.jpeg,/Assets/Retail_Spaces/property4/image4.jpeg,/Assets/Retail_Spaces/property4/image5.jpeg}	Spacious retail area with premium frontage in a bustling market plaza ideal for electronics or lifestyle stores.	2700	0	0	June End	Commercial Retail	21000.00	12.00	5.7 Cr	Low risk	2.7 Cr	3 Cr
47	HSR Layout Premium Retail Space	{/Assets/Retail_Spaces/property5/image1.jpeg,/Assets/Retail_Spaces/property5/image2.jpeg,/Assets/Retail_Spaces/property5/image3.jpeg,/Assets/Retail_Spaces/property5/image4.jpeg,/Assets/Retail_Spaces/property5/image5.jpeg}	High-demand retail space in a residential-commercial neighborhood with parking and premium display windows.	2500	0	0	May End	Commercial Retail	20000.00	12.00	5.5 Cr	Low risk	2.5 Cr	3 Cr
48	BTM Layout High-Footfall Retail Space	{/Assets/Retail_Spaces/property6/image1.jpeg,/Assets/Retail_Spaces/property6/image2.jpeg,/Assets/Retail_Spaces/property6/image3.jpeg,/Assets/Retail_Spaces/property6/image4.jpeg,/Assets/Retail_Spaces/property6/image5.jpeg}	Located on a busy main road ideal for branded retail outlets or franchise chains with excellent foot traffic and parking.	2900	0	0	June End	Commercial Retail	22000.00	12.50	6 Cr	Low risk	2.8 Cr	3.2 Cr
49	Commercial Street Flagship Store Space	{/Assets/Retail_Spaces/property7/image1.jpeg,/Assets/Retail_Spaces/property7/image2.jpeg,/Assets/Retail_Spaces/property7/image3.jpeg,/Assets/Retail_Spaces/property7/image4.jpeg,/Assets/Retail_Spaces/property7/image5.jpeg}	Premium retail space in a historic shopping district with large glass storefront and access to high-end brands.	2800	0	0	April End	Commercial Retail	21000.00	12.00	5.9 Cr	Low risk	2.8 Cr	3.1 Cr
50	Bannerghatta Road Retail Outlet	{/Assets/Retail_Spaces/property8/image1.jpeg,/Assets/Retail_Spaces/property8/image2.jpeg,/Assets/Retail_Spaces/property8/image3.jpeg,/Assets/Retail_Spaces/property8/image4.jpeg,/Assets/Retail_Spaces/property8/image5.jpeg}	Ground-floor retail space in a rapidly developing commercial area ideal for grocery chains or retail franchises.	2650	0	0	May End	Commercial Retail	20000.00	12.00	5.6 Cr	Low risk	2.6 Cr	3 Cr
52	Indiranagar Creative Workspace	{/Assets/Co_Working_Space/property2/image1.jpeg,/Assets/Co_Working_Space/property2/image2.jpeg,/Assets/Co_Working_Space/property2/image3.jpeg,/Assets/Co_Working_Space/property2/image4.jpeg,/Assets/Co_Working_Space/property2/image5.jpeg}	Boutique co-working space with collaborative areas private meeting rooms and a café for professionals and startups.	3800	0	0	February End	Commercial Office	14000.00	13.00	4.6 Cr	Medium risk	2.2 Cr	2.4 Cr
53	Whitefield Tech Hub Co-working Space	{/Assets/Co_Working_Space/property3/image1.jpeg,/Assets/Co_Working_Space/property3/image2.jpeg,/Assets/Co_Working_Space/property3/image3.jpeg,/Assets/Co_Working_Space/property3/image4.jpeg,/Assets/Co_Working_Space/property3/image5.jpeg}	Premium co-working facility with event spaces dedicated desks and business-class amenities near the citys IT corridor.	4200	0	0	April End	Commercial Office	17000.00	14.00	5 Cr	Medium risk	2.6 Cr	2.4 Cr
54	Electronic City Co-working Space	{/Assets/Co_Working_Space/property4/image1.jpeg,/Assets/Co_Working_Space/property4/image2.jpeg,/Assets/Co_Working_Space/property4/image3.jpeg,/Assets/Co_Working_Space/property4/image4.jpeg,/Assets/Co_Working_Space/property4/image5.jpeg}	Modern co-working space with networking zones phone booths and high-speed internet perfect for tech startups and remote teams.	4300	0	0	May End	Commercial Office	17000.00	13.80	5.1 Cr	Medium risk	2.5 Cr	2.6 Cr
56	Bannerghatta Road Co-working Space	{/Assets/Co_Working_Space/property6/image1.jpeg,/Assets/Co_Working_Space/property6/image2.jpeg,/Assets/Co_Working_Space/property6/image3.jpeg,/Assets/Co_Working_Space/property6/image4.jpeg,/Assets/Co_Working_Space/property6/image5.jpeg}	Collaborative space with shared office facilities virtual office services and a café close to major tech parks.	3900	0	0	March End	Commercial Office	15000.00	13.00	4.7 Cr	Medium risk	2.2 Cr	2.5 Cr
57	Domlur Shared Workspace	{/Assets/Co_Working_Space/property7/image1.jpeg,/Assets/Co_Working_Space/property7/image2.jpeg,/Assets/Co_Working_Space/property7/image3.jpeg,/Assets/Co_Working_Space/property7/image4.jpeg,/Assets/Co_Working_Space/property7/image5.jpeg}	Flexible office space with private workstations meeting rooms and a shared kitchen catering to startups and freelancers.	4100	0	0	February End	Commercial Office	15000.00	13.50	4.9 Cr	Medium risk	2.3 Cr	2.6 Cr
58	Jayanagar Creative Co-working Space	{/Assets/Co_Working_Space/property8/image1.jpeg,/Assets/Co_Working_Space/property8/image2.jpeg,/Assets/Co_Working_Space/property8/image3.jpeg,/Assets/Co_Working_Space/property8/image4.jpeg,/Assets/Co_Working_Space/property8/image5.jpeg}	Boutique co-working space with shared work areas conference rooms and a coffee lounge ideal for freelancers and small businesses.	3800	0	0	March End	Commercial Office	14000.00	13.00	4.5 Cr	Medium risk	2.1 Cr	2.4 Cr
55	JP Nagar Innovation working Space	{/Assets/Co_Working_Space/property5/image1.jpeg,/Assets/Co_Working_Space/property5/image2.jpeg,/Assets/Co_Working_Space/property5/image3.jpeg,/Assets/Co_Working_Space/property5/image4.jpeg,/Assets/Co_Working_Space/property5/image5.jpeg}	Trendy co-working space with open workstations private cabins and fully equipped meeting rooms ideal for creative teams.	4000	0	0	April End	Commercial Office	15000.00	13.50	4.8 Cr	Medium risk	2.3 Cr	2.5 Cr
59	Whitefield Luxury Villa Project	{/Assets/Villa_Projects/property1/image1.jpeg,/Assets/Villa_Projects/property1/image2.jpeg,/Assets/Villa_Projects/property1/image3.jpeg,/Assets/Villa_Projects/property1/image4.jpeg,/Assets/Villa_Projects/property1/image5.jpeg}	Lavish villas with landscaped gardens home automation and access to a clubhouse with a pool.	3600	0	0	August End	Luxury Villas	38000.00	10.00	9 Cr	Low risk	4.2 Cr	4.8 Cr
60	Sarjapur Road Premium Villa Project	{/Assets/Villa_Projects/property2/image1.jpeg,/Assets/Villa_Projects/property2/image2.jpeg,/Assets/Villa_Projects/property2/image3.jpeg,/Assets/Villa_Projects/property2/image4.jpeg,/Assets/Villa_Projects/property2/image5.jpeg}	Smart villas with private lawns rooftop terraces and community amenities like a gym and spa.	3400	0	0	June End	Luxury Villas	32000.00	9.80	8.2 Cr	Low risk	3.9 Cr	4.3 Cr
61	Electronic City Luxury Villas	{/Assets/Villa_Projects/property3/image1.jpeg,/Assets/Villa_Projects/property3/image2.jpeg,/Assets/Villa_Projects/property3/image3.jpeg,/Assets/Villa_Projects/property3/image4.jpeg,/Assets/Villa_Projects/property3/image5.jpeg}	Gated community of luxury villas with solar-powered homes private swimming pools and parks.	3700	0	0	September End	Luxury Villas	39000.00	10.00	9.5 Cr	Low risk	4.5 Cr	5 Cr
62	Bannerghatta Luxury Villa Project	{/Assets/Villa_Projects/property4/image1.jpeg,/Assets/Villa_Projects/property4/image2.jpeg,/Assets/Villa_Projects/property4/image3.jpeg,/Assets/Villa_Projects/property4/image4.jpeg,/Assets/Villa_Projects/property4/image5.jpeg}	Modern villas with smart home integration private gardens and access to club facilities.	3300	0	0	May End	Luxury Villas	30000.00	9.50	8 Cr	Low risk	3.8 Cr	4.2 Cr
63	Hebbal Lake View Villas	{/Assets/Villa_Projects/property5/image1.jpeg,/Assets/Villa_Projects/property5/image2.jpeg,/Assets/Villa_Projects/property5/image3.jpeg,/Assets/Villa_Projects/property5/image4.jpeg,/Assets/Villa_Projects/property5/image5.jpeg}	Ultra-modern villas with lake views home automation and an infinity pool within a gated community.	3800	0	0	July End	Luxury Villas	40000.00	10.20	9.8 Cr	Low risk	4.6 Cr	5.2 Cr
64	Devanahalli Villa Retreat	{/Assets/Villa_Projects/property6/image1.jpeg,/Assets/Villa_Projects/property6/image2.jpeg,/Assets/Villa_Projects/property6/image3.jpeg,/Assets/Villa_Projects/property6/image4.jpeg,/Assets/Villa_Projects/property6/image5.jpeg}	Luxurious villas with private courtyards a clubhouse and green spaces located in a serene environment.	3500	0	0	June End	Luxury Villas	35000.00	10.00	8.7 Cr	Low risk	4.1 Cr	4.6 Cr
65	Jayanagar Luxury Villas	{/Assets/Villa_Projects/property7/image1.jpeg,/Assets/Villa_Projects/property7/image2.jpeg,/Assets/Villa_Projects/property7/image3.jpeg,/Assets/Villa_Projects/property7/image4.jpeg,/Assets/Villa_Projects/property7/image5.jpeg}	Exclusive gated community with luxurious villas private pools and access to a wellness center.	3400	0	0	May End	Luxury Villas	33000.00	9.70	8.3 Cr	Low risk	3.9 Cr	4.4 Cr
66	Hennur Road Luxury Villa Project	{/Assets/Villa_Projects/property8/image1.jpeg,/Assets/Villa_Projects/property8/image2.jpeg,/Assets/Villa_Projects/property8/image3.jpeg,/Assets/Villa_Projects/property8/image4.jpeg,/Assets/Villa_Projects/property8/image5.jpeg}	Spacious luxury villas with home automation landscaped gardens and easy access to tech parks and shopping districts.	3650	0	0	August End	Luxury Villas	34000.00	10.00	8.6 Cr	Low risk	4.2 Cr	4.4 Cr
51	Koramangala Start-Up working Space	{/Assets/Co_Working_Space/property1/image1.jpeg,/Assets/Co_Working_Space/property1/image2.jpeg,/Assets/Co_Working_Space/property1/image3.jpeg,/Assets/Co_Working_Space/property1/image4.jpeg,/Assets/Co_Working_Space/property1/image5.jpeg}	Co-working space with flexible workstations conference rooms and a business lounge located near popular eateries and tech hubs.	4500	0	0	March End	Commercial Office	16000.00	13.50	5.2 Cr	Medium risk	2.5 Cr	2.7 Cr
17	Kanakapura Road Residences	{/Assets/Residential_Apartments/property7/image1.jpeg,/Assets/Residential_Apartments/property7/image2.jpeg,/Assets/Residential_Apartments/property7/image3.jpeg,/Assets/Residential_Apartments/property7/image4.jpeg,/Assets/Residential_Apartments/property7/image5.jpeg}	Apartments offering excellent connectivity with proximity to metro stations shopping malls and hospitals.	1200-1400	3	3	February End	3BHK Apartments	15000.00	11.00	3.2 Cr	Low-Medium risk	1.7 Cr	1.5 Cr
\.


--
-- TOC entry 3332 (class 0 OID 16471)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, created_at) FROM stdin;
\.


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 214
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.properties_id_seq', 66, true);


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 3182 (class 2606 OID 16463)
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- TOC entry 3184 (class 2606 OID 16481)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3186 (class 2606 OID 16479)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2024-10-23 18:13:24

--
-- PostgreSQL database dump complete
--

