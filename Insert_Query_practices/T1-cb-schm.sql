--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-cb-schm.sql

--Student ID: 29584612
--Student Name: Yeonsoo Kim
--Tutorial No: Tutorial 4

/* Comments for your marker:




*/

/*
Using the model and details supplied, and the supplied T1-cb-schm.sql
file, create an SQL schema file which can be used to create this database in
Oracle.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

DROP TABLE species CASCADE CONSTRAINTS;
DROP TABLE animal CASCADE CONSTRAINTS;
DROP TABLE centre CASCADE CONSTRAINTS;
DROP TABLE breeding_event CASCADE CONSTRAINTS;


CREATE TABLE species (
    spec_genus          VARCHAR2(20) NOT NULL,
    spec_name           VARCHAR2(20) NOT NULL,
    spec_popular_name   VARCHAR2(40) NOT NULL,
    spec_family         VARCHAR2(20) NOT NULL,
    spec_natural_range  VARCHAR2(100) NOT NULL
);

ALTER TABLE species
    ADD CONSTRAINT species_pk PRIMARY KEY (spec_genus, spec_name);

ALTER TABLE species
    ADD CONSTRAINT species_popular_name_unique UNIQUE (spec_popular_name);

COMMENT ON COLUMN species.spec_genus IS
    'The species genus';
    
COMMENT ON COLUMN species.spec_name IS
    'The species name';
    
COMMENT ON COLUMN species.spec_popular_name IS
    'The species popular name';
    
COMMENT ON COLUMN species.spec_family IS
    'The species family name';
    
COMMENT ON COLUMN species.spec_natural_range IS
    'Description of the natural range of the species';



CREATE TABLE animal (
    animal_id   NUMBER(6) NOT NULL,
    animal_sex  CHAR(1) NOT NULL,
    brevent_id  NUMBER(6),
    centre_id   CHAR(6) NOT NULL,
    spec_genus  VARCHAR2(20) NOT NULL,
    spec_name   VARCHAR2(20) NOT NULL
);

ALTER TABLE animal
    ADD CONSTRAINT chk_animal_sex CHECK (animal_sex IN ('F', 'M'));
    
ALTER TABLE animal
    ADD CONSTRAINT animal_pk PRIMARY KEY (animal_id);

COMMENT ON COLUMN animal.animal_id IS
    'The identifier for the animal';
    
COMMENT ON COLUMN animal.animal_sex IS
    'The animal sex (M or F)';
    
COMMENT ON COLUMN animal.brevent_id IS
    'The id of the breeding event which produced the animal. Animals from the wild will have no brevent_id assigned';
    
COMMENT ON COLUMN animal.centre_id IS
    'The "home" center where the animal is normally located';
    
COMMENT ON COLUMN animal.spec_genus IS
    'The species genus for the animal';
    
COMMENT ON COLUMN animal.spec_name IS
    'The species name for the animal';




CREATE TABLE centre (
    centre_id       CHAR(6) NOT NULL,
    centre_name     VARCHAR2(40) NOT NULL,
    centre_address  VARCHAR2(100) NOT NULL,
    centre_director VARCHAR2(30) NOT NULL,
    centre_phone_no VARCHAR2(20) NOT NULL
);

ALTER TABLE centre
    ADD CONSTRAINT centre_pk PRIMARY KEY (centre_id);
    
ALTER TABLE centre
    ADD CONSTRAINT centre_nk UNIQUE (centre_name);

COMMENT ON COLUMN centre.centre_id IS
    'The identifier for the center';
    
COMMENT ON COLUMN centre.centre_name IS
    'The centre name';
    
COMMENT ON COLUMN centre.centre_address IS
    'The centre address';
    
COMMENT ON COLUMN centre.centre_director IS
    'The name of the centres director';
    
COMMENT ON COLUMN centre.centre_phone_no IS
    'The centres phone contact number';


CREATE TABLE breeding_event(
    brevent_id      NUMBER(6) NOT NULL,
    brevent_date    DATE NOT NULL,
    mother_id       NUMBER(6) NOT NULL,
    father_id       NUMBER(6) NOT NULL
);

ALTER TABLE breeding_event
    ADD CONSTRAINT breeding_event_pk PRIMARY KEY (brevent_id);

COMMENT ON COLUMN breeding_event.brevent_id IS
    'The identifier for the breeding event';
    
COMMENT ON COLUMN breeding_event.brevent_date IS
    'The date on which the breeding event took place';
    
COMMENT ON COLUMN breeding_event.mother_id IS
    'The animal_id of the animal who was the mother';
    
COMMENT ON COLUMN breeding_event.father_id IS
    'The animal_id of the animal who was the father';
    
    
-- Adding Foreign keys

ALTER TABLE animal
    ADD CONSTRAINT animal_breeding_event_fk FOREIGN KEY (brevent_id)
        REFERENCES breeding_event (brevent_id);
        
ALTER TABLE animal
    ADD CONSTRAINT animal_centre_fk FOREIGN KEY (centre_id)
        REFERENCES centre (centre_id);
        
ALTER TABLE animal
    ADD CONSTRAINT animal_species_fk FOREIGN KEY (spec_genus, spec_name)
        REFERENCES species (spec_genus, spec_name);


ALTER TABLE breeding_event
    ADD CONSTRAINT breeding_event_animal_fk FOREIGN KEY (mother_id)
        REFERENCES animal (animal_id);
        
ALTER TABLE breeding_event
    ADD CONSTRAINT breeding_event_animal_fk2 FOREIGN KEY (father_id)
        REFERENCES animal (animal_id);

