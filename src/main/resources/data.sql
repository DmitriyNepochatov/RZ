CREATE TABLE IF NOT EXISTS contact
(
    contact_id double precision,
    addr1 character varying(255) COLLATE pg_catalog."default",
    addr2 character varying(255) COLLATE pg_catalog."default",
    city character varying(255) COLLATE pg_catalog."default",
    home_phone bigint,
    updated timestamp without time zone,
    work_phone double precision,
    zip double precision,
    CONSTRAINT contact_pkey PRIMARY KEY (contact_id)
);

CREATE TABLE IF NOT EXISTS ref_diag
(
    diag_id bigint,
    descr character varying(255) COLLATE pg_catalog."default",
    time_est timestamp without time zone,
    CONSTRAINT ref_diag_pkey PRIMARY KEY (diag_id)
);

CREATE TABLE IF NOT EXISTS workers
(
    worker_id bigint,
    dob timestamp without time zone,
    first_name character varying(255) COLLATE pg_catalog."default",
    gender character varying(255) COLLATE pg_catalog."default",
    last_name character varying(255) COLLATE pg_catalog."default",
    manager_id bigint,
    contact_id double precision,
    CONSTRAINT workers_pkey PRIMARY KEY (worker_id),
    CONSTRAINT fko9e40iqw2hkejw5agxgc5xflw FOREIGN KEY (contact_id)
        REFERENCES contact (contact_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS job
(
    position_id bigint,
    active_indctr character varying(255) COLLATE pg_catalog."default",
    from_date timestamp without time zone,
    manager_id bigint,
    office character varying(255) COLLATE pg_catalog."default",
    office_city character varying(255) COLLATE pg_catalog."default",
    position character varying(255) COLLATE pg_catalog."default",
    salary real,
    to_date timestamp without time zone,
    worker_id bigint,
    CONSTRAINT job_pkey PRIMARY KEY (position_id),
    CONSTRAINT fkru3ti6su6ed1jbblhtb81met FOREIGN KEY (worker_id)
        REFERENCES workers (worker_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS medicine
(
    visit_id bigint,
    recovery_date timestamp without time zone,
    visit_date timestamp without time zone,
    ref_diag_id bigint,
    worker_id bigint,
    CONSTRAINT medicine_pkey PRIMARY KEY (visit_id),
    CONSTRAINT fkiyhvtle7xwas7btdwh09pkwju FOREIGN KEY (ref_diag_id)
        REFERENCES ref_diag (diag_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fks0cysgv2pgqd43xwrlihx1m5w FOREIGN KEY (worker_id)
        REFERENCES workers (worker_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001001, 1812346982, '1691 FORESTVILLE ROAD', NULL, 'UNIONVILLE', 46246, NULL, 135142679);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001002, 1812346983, '17 S MILLER ST', NULL, 'SEBEWAING', 46246, '2012-10-24', 135142674);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001003, 1812346112, '170 S BROWN ROAD', NULL, 'PIGEON', 46242, NULL, 1235142674);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001004, 1812346933, '1700 W ACKERMAN ROAD', NULL, 'UNIONVILLE', 46221, NULL, 1235142847);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001005, 1814546922, '1706 KIEL ROAD', NULL, 'UNIONVILLE', 46221, NULL, 1235184671);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001006, 1815676944, '1710 W DICKERSON ROAD', NULL, 'UNIONVILLE', 46221, NULL, 123184671);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001007, 1813468249, '1727 W HOPPE ROAD', NULL, 'UNIONVILLE', 46221, NULL, 123184671);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001008, 1865326982, '173 W CASS CITY ROAD', NULL, 'UNIONVILLE', 46221, NULL, 123184622);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001009, 1813468249, '1733 ELMWOOD ROAD', '14', 'UNIONVILLE', 46221, NULL, 145184621);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001010, 1865346182, '1744 KIEL ROAD', NULL, 'UNIONVILLE', 46221, NULL, 145184694);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001011, 1813468249, '1755 E HOPPE ROAD', 'B-19', 'UNIONVILLE', 46221, '2011-10-24', 1451846944);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001012, 1865346882, '1777 POINTE AUX BARQUES ROAD', NULL, 'UNIONVILLE', 46221, '2011-11-13', 1451846978);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001013, 1813468249, '1755 E HOPPE ROAD', 'B-19', 'UNIONVILLE', 46221, '2011-10-24', 1451846926);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001014, 1865346962, '1777 POINTE AUX BARQUES ROAD', NULL, 'PORT AUSTIN', 46221, '2011-11-13', 1451846937);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001015, 1815434631, '1815 W DICKERSON ROAD', NULL, 'ELKTON', 46246, NULL, 1471846937);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001016, 1865346913, '1835 W HOPPE ROAD', NULL, 'UNIONVILLE', 46221, '2011-11-13', 2471846348);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001017, 1815434631, '1815 W DICKERSON ROAD', NULL, 'ELKTON', 46246, NULL, 1649813487);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001018, 1865346913, '1835 W HOPPE ROAD', NULL, 'UNIONVILLE', 46221, '2011-11-13', 1649813489);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001019, 1833434631, '1856 W KINDE ROAD', NULL, 'KINDEN', 46252, NULL, 164923489);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001020, 1844346913, '1866 W HOPPE ROAD', NULL, 'UNIONVILLE', 46221, NULL, 0);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001021, 1833434635, '1974 E DICKERSON ROAD', NULL, 'UNIONVILLE', 46221, NULL, 0);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001022, 1844346911, '1975 E CASS CITY ROAD', NULL, 'UNIONVILLE', 46221, NULL, 164923974);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001023, 1833434635, '1986 N MOORE ROAD', NULL, 'UNIONVILLE', 46221, NULL, 1649239741);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001024, 1844346911, '1975 E CASS CITY ROAD', NULL, NULL, 46246, NULL, 1649239951);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001025, 1833434635, '1997 E CASS CITY ROAD', NULL, 'UNIONVILLE', 46221, NULL, 1564134879);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001026, 1844346911, '20 W BAY CITY FORESTVILLE ROAD', 'F-12', 'UNIONVILLE', 46221, NULL, 1564134134);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001027, 1833434636, '2005 W ACKERMAN ROAD', NULL, 'UNIONVILLE', 46221, NULL, 1564134197);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001028, 1844347757, '2009 W DICKERSON ROAD', 'F-12', 'UNIONVILLE', 46221, NULL, 0);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001029, 1833434626, '2030 E DICKERSON ROAD', NULL, 'UNIONVILLE', 46221, NULL, 1123134197);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001030, 1844347751, '2032 E HOPPE ROAD', 'K-14', 'UNIONVILLE', 46221, NULL, 0);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001031, 1833434626, '204 RERNE ST', NULL, 'UNIONVILLE', 46221, NULL, 1333134197);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001032, 1844347751, '2050 N ELKTON ROAD', 'K-14', 'ELECTRON', 46246, NULL, 1333135438);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001033, 1833434699, '2053 E HOPPE ROAD', NULL, 'UNIONVILLE', 46221, NULL, 1333135499);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001034, 1844347722, '2060 CROWN ROAD', 'C-14', 'ELECTRON', 46246, NULL, 1333131279);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001035, 1833434699, '2053 E HOPPE ROAD', NULL, 'SEBEWAING', 46254, NULL, 1333131277);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001036, 1844347722, '2060 CROWN ROAD', 'K-17', 'SEBEWAING', 46254, NULL, 1943131277);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001037, 1833434699, '2090 GRINDSTONE ROAD', NULL, 'SEBEWAING', 46254, NULL, 0);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001038, 1844347722, '210 S CENTER ST', '11', 'SEBEWAING', 46254, NULL, 1943139467);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001039, 1833434699, '2140 W CASS CITY ROAD', NULL, 'FILION', 46254, NULL, 1943136412);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001040, 1844347722, '2169 N FARVER ROAD', 'BOX-11', 'FILION', 46254, NULL, 0);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001041, 1833434699, '2180 W ACKERMAN ROAD', NULL, 'FILION', 46254, NULL, 1943136976);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001042, 1844347722, '2219 UNIONVILLE ROAD', 'BOX-7', 'FILION', 46254, NULL, 0);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001043, 1833434699, '2227 W DICKERSON ROAD', NULL, 'FILION', 46254, NULL, 1942486976);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001044, 1844347722, '2255 UNIONVILLE ROAD', 'BOX-9', 'FILION', 46254, NULL, 1942486226);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001045, 1833434313, '2267 E HOPPE ROAD', NULL, 'FILION', 46254, NULL, 0);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001046, 1844347432, '2270 W ACKERMAN ROAD', 'BOX-9', 'FILION', 46254, NULL, 1942484688);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001047, 1833434313, '2271 E FILION ROAD', NULL, 'FILION', 46254, NULL, 1942484614);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001048, 1844347432, '2285 NOTTER ROAD', 'BOX-9', 'PIGEON', 46242, NULL, 194248464);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001049, 1833434313, '2271 E FILION ROAD', NULL, 'FILION', 46254, NULL, 0);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001050, 1844347432, '2285 NOTTER ROAD', 'S-112', 'PIGEON', 46242, NULL, 1294248465);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001051, 1844347722, '208 E SEBEWAING ST', 'D-11', 'SEBEWAING', 46254, NULL, 1294248775);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001052, 1833434631, '1867 S UNIONVILLE ROAD', NULL, 'BAY PORT', 46222, NULL, 1294248979);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001053, 1844346913, '1866 W HOPPE ROAD', NULL, 'ELKTON', 46246, NULL, 0);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001054, 1833434626, '2030 E DICKERSON ROAD', NULL, 'UNIONVILLE', 46221, NULL, 1946348947);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001055, 1844347751, '2032 E HOPPE ROAD', 'K-14', 'UNIONVILLE', 46221, NULL, 0);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001056, 1833434699, '2069 W BAY CITY FORESTVILLE ROAD', NULL, 'SEBEWAING', 46254, NULL, 1946348948);
INSERT INTO contact (contact_id, work_phone, addr1, addr2, city, zip, updated, home_phone) VALUES (2001057, 1844347722, '208 E SEBEWAING ST', 'D-11', 'SEBEWAING', 46254, NULL, 1946228948);

INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001001, 'Hip TB-hist POS', '1998-05-31');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001002, 'Hip TB-oth test POS', '2012-08-22');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001003, 'Knee TB-exam NOS', '2012-08-22');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001004, 'Knee TB-no exam', '2012-08-27');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001005, 'Limb bone TB-hist POS', '2012-08-17');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001006, 'Limb bone TB-oth test', '2012-05-27');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001007, 'Mastoid TB-exam NOS', '2012-05-27');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001008, 'Mastoid TB-no exam', '2012-07-27');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001009, 'Large intestine CA NE', '2012-08-08');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001010, 'Colon CA NOS', '2012-08-08');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001011, 'Rectosigmoid junction CA', '2012-07-18');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001012, 'Maxillary sinus CA', '2012-03-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001013, 'Ethmoid sinus CA', '2012-03-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001014, 'Frontal sinus CA', '2012-03-22');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001015, 'Sphenoid sinus CA', '2012-04-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001016, 'Accessory sinus CA NEC', '2012-03-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001017, 'Accessory sinus CA NOS', '2012-03-22');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001018, 'Glottis CA', '2012-04-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001019, 'Spleen lymphoid mal NEC', '2012-06-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001020, 'Mult lymphoid mal NEC', '2012-09-22');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001021, 'SHIGELLA FLEXNERI', '2012-10-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001022, 'SHIGELLA BOYDII', '2012-06-13');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001023, 'SHIGELLA SONNEI', '2012-09-02');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001024, 'C. PERFRINGENS FOOD POIS', '2012-11-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001025, 'CLOSTR FOOD POISON NEC', '2012-03-13');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001026, 'V. PARAHAEM FOOD POISON', '2012-09-07');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001027, 'BACT FOOD POISONING NEC*', '2012-12-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001028, 'V. VULNIFICUS FOOD POIS', '2012-03-13');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001029, 'INTEST TRICHOMONIASIS', '2012-09-07');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001030, 'CRYPTOSPORIDIOSIS', '2012-12-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001031, 'PROTOZOAL INTEST DIS NEC', '2012-12-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001032, 'ROTAVIRUS ENTERITIS', '2012-12-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001033, 'ADENOVIRUS ENTERITIS', '2012-12-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001034, 'NORWALK VIRUS ENTERITIS', '2012-12-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001035, 'SRV ENTERITIS NEC', '2012-12-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001036, 'CALCIVIRUS ENTERITI', '2012-12-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001037, 'ASTROVIRUS ENTERITIS', '2012-12-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001038, 'CNS TB NEC-HIST POS', '2012-12-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001039, 'CNS TB NEC-OTH TEST POS', '2012-12-28');
INSERT INTO ref_diag (diag_id, descr, time_est) VALUES (3001040, 'AIDS', '2012-10-24');

INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (1121, 'John', 'Snow', 'M', '1992-01-18', NULL, 3335);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (1122, 'Tina', 'Willow', 'F', '1995-08-09', NULL, 3336);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (1123, 'Utah', 'Jackson', NULL, '1987-05-22', NULL, 3336);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (1124, 'Wesley', 'Cooper', 'M', '1990-04-01', NULL, 3337);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (1125, 'Sarah', 'Nine', 'F', '1983-05-03', NULL, 3337);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001001, 'NIKOLA', 'TESLA', 'M', '1986-09-27', 2001001, 6001006);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001002, 'JANICE', 'PRILL', 'F', '1990-09-27', 2001002, 6001006);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001003, 'JERI', 'THOMPSON', 'M', '1986-09-21', 2001003, 6001006);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001004, 'KAREN', 'DUFTY', 'F', '1986-08-24', 2001004, 6001006);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001005, 'JEFF', 'WANLESS', 'M', '1986-06-27', 2001005, 6001006);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001006, 'CHRISTINE', 'BECKER', 'F', '1985-09-27', 2001006, 6001007);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001007, 'CATHY', 'HEINITZ', 'F', '1986-09-27', 2001007, 6001007);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001008, 'LICI', 'KATNIK', 'F', '1981-10-27', 2001008, 6001018);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001009, 'TOMMY', 'HARE', 'M', '1985-09-13', 2001009, 6001018);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001010, 'MATILDA', 'FINAN', 'F', '1986-01-21', 2001010, 6001018);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001011, 'DAWAN', 'HARTMAN', 'M', '1987-03-24', 2001011, 6001018);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001012, 'LINDA', 'WILLIMS', 'F', '1984-04-17', 2001012, 6001018);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001013, 'DEBRA', 'SYTRON', 'F', '1982-09-02', 2001013, 6001018);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001015, 'CINDY', 'USTIN', 'F', '1990-09-29', 2001015, 6001018);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001016, 'HELEN', 'DECKER', 'F', '1986-02-17', 2001016, 6001018);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001017, 'CLARENCE', 'INSWORTH', 'M', '1988-01-06', 2001017, 6001018);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001018, 'JONATAN', 'SHUGER', 'M', '1983-11-04', 2001018, 6001007);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001019, 'KYLE', 'BROWNE', 'M', '1983-11-04', 2001019, 6001029);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001020, 'TYRIN', 'GRAHAM', 'M', '1986-11-04', 2001020, 6001029);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001021, 'GEORGE', 'CLARK', 'U', '1987-10-02', 2001021, 6001029);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001022, 'JOSEPH', 'GREKOR', 'M', '1982-01-01', 2001022, 6001029);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001023, 'TROY', 'MEIER', 'M', '1983-05-07', 2001023, 6001029);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001024, 'HOSS', 'MEIER', 'M', '1983-02-04', 2001024, 6001029);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001025, 'JAMES', 'CARTER', 'M', '1986-03-03', 2001025, 6001029);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001026, 'JEFFREY', 'HAMMOND', 'M', '1983-04-14', 2001026, 6001029);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001027, 'HUNTER', 'MARTIN', 'M', '1987-05-15', 2001028, 6001029);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001028, 'DYLAN', 'MARTIN', 'M', '1982-07-16', 2001029, 6001029);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001029, 'JASON', 'MCDONALD', 'M', '1981-04-16', 2001030, 6001030);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001030, 'ROY', 'FOOTE', 'M', '1984-04-19', 2001032, 6001030);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001031, 'MALCOLM', 'MORRIS', 'M', '1989-07-13', 2001033, 6001040);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001032, 'SHANON', 'HARRIS', 'F', '1990-06-09', 2001035, 6001040);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001033, 'DOMONIC', 'HOUSTON', NULL, '1988-08-14', 2001036, 6001040);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001034, 'ROBERT', 'BREWER', 'M', '1978-09-22', 2001037, 6001040);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001035, 'RICHIE', 'SMITH', 'M', '1979-04-21', 2001038, 6001040);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001036, 'HECTOR', 'MCKINNON', 'M', '1974-01-17', 2001038, 6001040);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001037, 'JOSEPH', 'LOPEREN', 'M', '1987-01-04', 2001040, 6001040);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001038, 'BRANDON', 'POPIELARZ', 'M', '1982-03-05', 2001041, 6001040);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001039, 'TROY', 'BROWN', 'M', '1981-04-07', 2001042, 6001040);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001040, 'WESLEY', 'DARROW', 'M', '1986-05-10', 2001043, 6001030);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001041, 'CHARLES', 'DVENPORT', 'M', '1991-06-10', 2001044, 6001030);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001042, 'THOMAS', 'CARPER', 'M', '1989-06-10', 2001045, 6001030);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001043, 'CHARLY', 'SCHADE', 'F', '1981-06-10', 2001046, 6001007);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (6001014, 'MARILIN', 'RENAN', 'F', '1981-07-27', 2001014, 6001018);
INSERT INTO workers (worker_id, first_name, last_name, gender, dob, contact_id, manager_id) VALUES (1, NULL, 'PAVLENKO', NULL, NULL, NULL, 0);

INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001008, 6001037, 'C# DEVELOPER', 534.96, '2009-03-19', 'TIME IS MONEY', 'SEBEWAING', NULL, 'Y', 4001009);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001009, 6001038, 'C# DEVELOPER', 678.73, '2008-06-18', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001009);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001010, 6001039, 'C# DEVELOPER', 1102.22, '2004-02-22', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001009);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001011, 6001040, 'C# DEVELOPER TEAM LEAD', 1021.77, '2007-01-14', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001011);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001012, 6001041, 'WEB DESIGNER', 802.22, '2008-08-08', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001003);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001013, 6001042, 'WEB DESIGNER', 615.77, '2010-11-01', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001003);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001014, 6001043, 'WEB DESIGNER', 706.21, '2009-11-09', 'TIME IS MONEY', 'SEBEWAING', NULL, 'Y', 4001011);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001015, 6001001, 'AUTOMATION QA ENGINEER', 621.44, '2009-06-10', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001002);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001016, 6001002, 'AUTOMATION QA ENGINEER', 499.34, '2012-03-19', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001002);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001017, 6001003, 'AUTOMATION QA ENGINEER', 519.21, '2011-11-01', 'TIME IS MONEY', 'SEBEWAING', NULL, 'Y', 4001002);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001018, 6001004, 'AUTOMATION QA ENGINEER', 621.17, '2009-09-18', 'TIME IS MONEY', 'SEBEWAING', NULL, 'Y', 4001002);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001019, 6001005, 'AUTOMATION QA ENGINEER', 588.21, '2011-09-21', 'TIME IS MONEY', 'SEBEWAING', NULL, 'Y', 4001002);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001020, 6001006, 'AUTOMATION QA TEAM LEAD', 979.17, '2009-09-18', 'TIME IS MONEY', 'SEBEWAING', NULL, 'Y', 4001003);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001021, 6001007, 'PRODUCT MANAGER', 1132.78, '2008-04-12', 'TIME IS MONEY', 'SEBEWAING', NULL, 'Y', 0);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001022, 6001008, 'JAVA DEVELOPER', 554.37, '2009-04-11', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001005);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001023, 6001009, 'JAVA DEVELOPER', 542.11, '2010-10-17', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001005);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001024, 6001013, 'JAVA DEVELOPER', 845.22, '2008-09-02', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001005);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001025, 6001014, 'JAVA DEVELOPER', 645.84, '2008-09-02', 'EASYSTEP', 'ELECTRON', NULL, 'Y', 4001005);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001026, 6001015, 'JAVA DEVELOPER', 545.75, '2009-09-02', 'EASYSTEP', 'ELECTRON', NULL, 'Y', 4001005);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001027, 6001016, 'JAVA DEVELOPER', 499.35, '2012-01-01', 'EASYSTEP', 'ELECTRON', NULL, 'Y', 4001005);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001028, 6001017, 'JAVA DEVELOPER', 515.21, '2012-02-03', 'EASYSTEP', 'ELECTRON', NULL, 'Y', 4001005);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001029, 6001018, 'JAVA DEVELOPER TEAM LEAD', 1101.87, '2008-09-02', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001011);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001030, 6001010, 'JAVA DEVELOPER', 631.64, '2010-11-22', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001005);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001031, 6001011, 'JAVA DEVELOPER', 599.99, '2011-12-06', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001005);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001032, 6001012, 'JAVA DEVELOPER', 739.75, '2010-05-01', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001005);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001033, 6001019, 'QA ENGINEER', 388.21, '2012-02-03', 'QUALITY AS A RULE', 'ELECTRON', NULL, 'Y', 4001007);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001034, 6001020, 'QA ENGINEER', 489.21, '2012-02-18', 'QUALITY AS A RULE', 'ELECTRON', NULL, 'Y', 4001007);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001035, 6001021, 'QA ENGINEER', 565.21, '2012-01-11', 'QUALITY AS A RULE', 'ELECTRON', NULL, 'Y', 4001007);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001036, 6001022, 'QA ENGINEER', 615.21, '2011-09-07', 'EASYSTEP', 'ELECTRON', NULL, 'Y', 4001007);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001037, 6001023, 'QA ENGINEER', 715.21, '2011-08-16', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001007);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001038, 6001024, 'QA ENGINEER', 915.21, '2007-05-13', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001007);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001039, 6001025, 'QA ENGINEER', 515.21, '2010-01-08', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001007);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001040, 6001026, 'QA ENGINEER', 815.21, '2010-07-15', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001007);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001041, 6001027, 'QA ENGINEER', 715.21, '2009-11-07', 'EASYSTEP', 'ELECTRON', NULL, 'Y', 4001007);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001042, 6001028, 'QA ENGINEER', 815.21, '2010-11-08', 'EASYSTEP', 'ELECTRON', NULL, 'Y', 4001007);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001043, 6001029, 'QA ENGINEER TEAM LEAD', 975.21, '2008-02-03', 'EASYSTEP', 'ELECTRON', NULL, 'Y', 4001003);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001044, 6001030, 'PRODUCT MANAGER', 915.21, '2010-01-14', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 0);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001045, 6001031, 'C# DEVELOPER', 644.91, '2010-11-13', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001009);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001046, 6001032, 'C# DEVELOPER', 764.43, '2010-05-11', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001009);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001047, 6001033, 'C# DEVELOPER', 846.34, '2008-04-17', 'CRYSTALBRAIN', 'UNIONVILLE', NULL, 'Y', 4001009);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001048, 6001034, 'C# DEVELOPER', 912.49, '2002-03-06', 'TIME IS MONEY', 'SEBEWAING', NULL, 'Y', 4001009);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001049, 6001035, 'C# DEVELOPER', 1011.76, '2003-08-04', 'TIME IS MONEY', 'SEBEWAING', NULL, 'Y', 4001009);
INSERT INTO job (position_id, worker_id, position, salary, from_date, office, office_city, to_date, active_indctr, manager_id) VALUES (4001050, 6001036, 'C# DEVELOPER', 643.88, '2010-07-01', 'TIME IS MONEY', 'SEBEWAING', NULL, 'Y', 4001009);

INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001001, 3001021, 6001012, '2011-08-08', '2011-09-08');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001002, 3001002, 6001012, '2011-08-12', '2011-09-08');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001003, 3001017, 6001012, '2011-08-15', '2011-09-08');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001004, 3001018, 6001003, '2011-09-11', '2011-09-13');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001005, 3001037, 6001005, '2011-09-12', '2011-11-13');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001006, 3001009, 6001003, '2011-09-27', '2011-10-01');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001007, 3001005, 6001034, '2011-10-15', '2011-10-28');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001008, 3001002, 6001034, '2011-10-18', '2011-10-23');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001009, 3001006, 6001026, '2011-10-25', '2011-10-29');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001010, 3001007, 6001026, '2011-11-02', '2011-11-03');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001011, 3001016, 6001019, '2011-11-07', '2011-11-11');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001012, 3001024, 6001021, '2011-11-07', '2011-11-19');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001013, 3001024, 6001022, '2011-11-07', '2011-11-19');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001014, 3001007, 6001022, '2011-11-09', '2011-11-14');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001015, 3001025, 6001009, '2011-11-11', '2011-11-13');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001016, 3001028, 6001009, '2011-11-13', '2011-11-18');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001017, 3001004, 6001014, '2011-11-15', '2011-12-04');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001018, 3001005, 6001019, '2011-11-15', '2011-11-16');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001019, 3001040, 6001022, '2011-11-19', '2011-11-24');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001020, 3001034, 6001038, '2011-11-20', '2011-11-29');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001021, 3001006, 6001042, '2011-11-24', '2011-11-28');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001022, 3001016, 6001009, '2011-11-27', '2011-11-30');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001023, 3001019, 6001006, '2011-12-01', '2011-12-02');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001024, 3001025, 6001004, '2011-12-11', '2011-12-13');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001025, 3001007, 6001022, '2011-12-13', '2011-12-15');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001026, 3001034, 6001014, '2011-12-17', '2011-12-19');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001027, 3001021, 6001001, '2011-12-22', '2011-12-27');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001028, 3001036, 6001037, '2011-12-24', '2011-12-28');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001029, 3001008, 6001034, '2011-12-26', '2012-01-11');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001030, 3001012, 6001004, '2012-01-04', '2012-01-13');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001031, 3001019, 6001012, '2012-01-08', '2012-02-03');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001032, 3001023, 6001011, '2012-01-12', '2012-01-24');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001033, 3001026, 6001015, '2012-01-23', '2012-01-25');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001034, 3001033, 6001038, '2012-01-24', '2012-01-24');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001035, 3001033, 6001040, '2012-01-26', '2012-01-29');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001036, 3001037, 6001018, '2012-01-28', '2012-02-11');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001037, 3001031, 6001031, '2012-01-30', '2012-01-30');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001038, 3001005, 6001041, '2012-02-02', '2012-02-06');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001039, 3001016, 6001019, '2012-02-07', '2012-03-01');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001040, 3001037, 6001012, '2012-02-16', '2012-02-18');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001041, 3001016, 6001008, '2012-02-17', '2012-02-24');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001042, 3001002, 6001031, '2012-02-24', '2012-03-01');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001043, 3001006, 6001027, '2012-02-27', '2012-02-28');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001044, 3001015, 6001024, '2012-03-01', '2012-03-08');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001045, 3001037, 6001031, '2012-03-03', '2012-03-07');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001046, 3001002, 6001004, '2012-03-04', '2012-03-08');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001047, 3001007, 6001019, '2012-03-06', '2012-03-14');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001048, 3001016, 6001026, '2012-03-08', '2012-03-13');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001049, 3001014, 6001034, '2012-03-11', '2012-03-11');
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001050, 3001014, 6001019, '2012-03-12', NULL);
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001051, 3001024, 6001020, '2012-03-13', NULL);
INSERT INTO medicine (visit_id, ref_diag_id, worker_id, visit_date, recovery_date) VALUES (5001052, 3001038, 6001030, '2012-03-18', NULL);