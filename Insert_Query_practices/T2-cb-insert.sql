--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-insert.sql

--Student ID:29584612
--Student Name:Yeonsoo Kim
--Tutorial No:Tutorial 4

/* Comments for your marker:




*/

/*
Task 2 (b):

Load the ANIMAL and BREEDING_EVENT tables with your own test data using the 
supplied T2-cb-insert.sql file script file, and SQL commands which will  
insert as a minimum, the following sample data -
 - 12 animals, some of which must have been captured from the wild, i.e. 
      are not the offspring from a breeding event, and
- 4 breeding events
Your inserted rows must meet the assignment specification requirements
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- Insert into animal , captured from the wild
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (1, 'M', NULL, 'AUS10', 'Setonix', 'brachyurus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (2, 'F', NULL, 'AUS10', 'Setonix', 'brachyurus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (3, 'M', NULL, 'AUS20', 'Acinonyx','jubatus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (4, 'F', NULL, 'AUS20', 'Acinonyx','jubatus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (5, 'M', NULL, 'AUS30', 'Panthera','leo');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (6, 'F', NULL, 'AUS30', 'Panthera','leo');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (7, 'M', NULL, 'SAF30', 'Equus','grevyi');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (8, 'F', NULL, 'SAF30', 'Equus','grevyi');
    
COMMIT;

-- Insert into breeding_event
INSERT INTO breeding_event (brevent_id, brevent_date, mother_id, father_id) 
    VALUES (1, TO_DATE('01-Jan-2020', 'dd-Mon-yyyy'), 1, 2);
INSERT INTO breeding_event (brevent_id, brevent_date, mother_id, father_id) 
    VALUES (2, TO_DATE('05-Mar-2020', 'dd-Mon-yyyy'), 3, 4);
INSERT INTO breeding_event (brevent_id, brevent_date, mother_id, father_id) 
    VALUES (3, TO_DATE('10-May-2020', 'dd-Mon-yyyy'), 5, 6);
INSERT INTO breeding_event (brevent_id, brevent_date, mother_id, father_id) 
    VALUES (4, TO_DATE('20-Nov-2020', 'dd-Mon-yyyy'), 7, 8);
    
COMMIT;

--Insert into animal, bred in captivity
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (9, 'M', 1, 'AUS10', 'Setonix', 'brachyurus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (10, 'F', 2, 'AUS20', 'Acinonyx','jubatus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (11, 'M', 3, 'AUS30', 'Panthera','leo');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (12, 'F', 4, 'SAF30', 'Equus','grevyi');

COMMIT;



------- Edge cases -------

--- Insert into animal ---
-- Existing Primary Key
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (5, 'M', NULL, 'AUS10', 'Setonix', 'brachyurus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (6, 'F', NULL, 'AUS10', 'Setonix', 'brachyurus');

-- Wrong Gender
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (13, 'W', NULL, 'AUS10', 'Setonix', 'brachyurus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (14, 'Female', NULL, 'AUS10', 'Setonix', 'brachyurus');
    
-- Wrong Centre
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (15, 'M', NULL, 'AUA20', 'Setonix', 'brachyurus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (16, 'F', NULL, 'ABC20', 'Setonix', 'brachyurus');

-- Wrong Genus or species name
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (17, 'M', NULL, 'AUS10', 'Dog', 'brachyurus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (18, 'F', NULL, 'AUS10', 'Cat', 'brachyurus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (19, 'M', NULL, 'AUS10', 'Setonix', 'dog');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (20, 'F', NULL, 'AUS10', 'Setonix', 'cat');
    
-- Wrong brevent ID
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (21, 'M', 30, 'AUS10', 'Setonix', 'brachyurus');
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (22, 'F', 99, 'AUS10', 'Setonix', 'brachyurus');
    

--- Insert into breeding event ---
-- Existing Primary Key
INSERT INTO breeding_event (brevent_id, brevent_date, mother_id, father_id) 
    VALUES (1, TO_DATE('05-Dec-2020', 'dd-Mon-yyyy'), 1, 2);
INSERT INTO breeding_event (brevent_id, brevent_date, mother_id, father_id) 
    VALUES (2, TO_DATE('21-Mar-2020', 'dd-Mon-yyyy'), 3, 4);

-- Wrong mother or father ID
INSERT INTO breeding_event (brevent_id, brevent_date, mother_id, father_id) 
    VALUES (10, TO_DATE('05-Dec-2020', 'dd-Mon-yyyy'), 2, 44);
INSERT INTO breeding_event (brevent_id, brevent_date, mother_id, father_id) 
    VALUES (11, TO_DATE('21-Mar-2020', 'dd-Mon-yyyy'), 33, 4);
    
    
--- Insert into centre ---
-- Existing Centre ID
INSERT INTO CENTRE (CENTRE_ID,CENTRE_NAME,CENTRE_ADDRESS,CENTRE_DIRECTOR,CENTRE_PHONE_NO) 
    VALUES ('AUS40','Test Zoo','Bradley Head Rd, Mosman  NSW  2088, Australia','Sydney Major','61-2-54362000');

-- Existing Centre name
INSERT INTO CENTRE (CENTRE_ID,CENTRE_NAME,CENTRE_ADDRESS,CENTRE_DIRECTOR,CENTRE_PHONE_NO) 
    VALUES ('TES10','Taronga Zoo','Bradley Head Rd, Mosman  NSW  2088, Australia','Sydney Major','61-2-54362000');
    
--- Insert into species ---
-- Existing Primary Key
INSERT INTO SPECIES (SPEC_GENUS,SPEC_NAME,SPEC_POPULAR_NAME,SPEC_FAMILY,SPEC_NATURAL_RANGE) 
    VALUES ('Panthera','leo','Test Lion','FELIDAE','Test_decription');

-- Popular name duplicate
INSERT INTO SPECIES (SPEC_GENUS,SPEC_NAME,SPEC_POPULAR_NAME,SPEC_FAMILY,SPEC_NATURAL_RANGE) 
    VALUES ('Test_Panthera','Test_leo','Lion','FELIDAE','Test_description');


ROLLBACK; -- rollback not to insert wrong test data.
