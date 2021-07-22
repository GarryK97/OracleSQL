--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-dm.sql

--Student ID:29584612
--Student Name:Yeonsoo Kim
--Tutorial No:Tutorial 4

/* Comments for your marker:




*/

/*
Task 2 (c):

Complete the listed DML actions
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (i)
CREATE SEQUENCE animal_seq
START WITH      500
INCREMENT BY    1;

CREATE SEQUENCE brevent_seq
START WITH      500
INCREMENT BY    1;

-- (ii)
-- UPDATE animal (Transfer animals to 'Kruger National Park')
UPDATE animal 
SET centre_id = (SELECT centre_id FROM centre WHERE centre_name = 'Kruger National Park')
WHERE centre_id = (SELECT centre_id FROM centre WHERE centre_name = 'SanWild Wildlife Sanctuary');

-- DELETE centre
DELETE FROM centre
WHERE centre_name = 'SanWild Wildlife Sanctuary';

COMMIT;

-- (iii)
-- Insert for 'Australia Zoo'
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (animal_seq.NEXTVAL, 'F', NULL, 
    (SELECT centre_id FROM centre WHERE centre_name = 'Australia Zoo'), 
    (SELECT spec_genus FROM species WHERE spec_popular_name = 'Tasmanian Devil'), 
    (SELECT spec_name FROM species WHERE spec_popular_name = 'Tasmanian Devil') );
    
-- Insert for 'Werribee Open Range Zoo'
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (animal_seq.NEXTVAL, 'M', NULL, 
    (SELECT centre_id FROM centre WHERE centre_name = 'Werribee Open Range Zoo'), 
    (SELECT spec_genus FROM species WHERE spec_popular_name = 'Tasmanian Devil'), 
    (SELECT spec_name FROM species WHERE spec_popular_name = 'Tasmanian Devil') );

COMMIT;

-- (iv)
-- Insert new breeding event
INSERT INTO breeding_event (brevent_id, brevent_date, mother_id, father_id) 
    VALUES (brevent_seq.NEXTVAL, TO_DATE('10-Feb-2021', 'dd-Mon-yyyy'),
    (SELECT animal_id 
    FROM animal 
    WHERE centre_id = (SELECT centre_id FROM centre WHERE centre_name = 'Australia Zoo')
    AND spec_genus = (SELECT spec_genus FROM species WHERE spec_popular_name = 'Tasmanian Devil') 
    AND spec_name = (SELECT spec_name FROM species WHERE spec_popular_name = 'Tasmanian Devil')
    ),
    (SELECT animal_id 
    FROM animal 
    WHERE centre_id = (SELECT centre_id FROM centre WHERE centre_name = 'Werribee Open Range Zoo')
    AND spec_genus = (SELECT spec_genus FROM species WHERE spec_popular_name = 'Tasmanian Devil') 
    AND spec_name = (SELECT spec_name FROM species WHERE spec_popular_name = 'Tasmanian Devil')
    ) );

-- Insert new offsprings
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (animal_seq.NEXTVAL, 'F', brevent_seq.CURRVAL, 
    (SELECT centre_id FROM centre WHERE centre_name = 'Australia Zoo'), 
    (SELECT spec_genus FROM species WHERE spec_popular_name = 'Tasmanian Devil'),
    (SELECT spec_name FROM species WHERE spec_popular_name = 'Tasmanian Devil'));
    
INSERT INTO animal (animal_id, animal_sex, brevent_id, centre_id, spec_genus, spec_name) 
    VALUES (animal_seq.NEXTVAL, 'M', brevent_seq.CURRVAL, 
    (SELECT centre_id FROM centre WHERE centre_name = 'Australia Zoo'), 
    (SELECT spec_genus FROM species WHERE spec_popular_name = 'Tasmanian Devil'),
    (SELECT spec_name FROM species WHERE spec_popular_name = 'Tasmanian Devil'));
    
COMMIT;
    

