--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-cb-alter.sql

--Student ID:29584612  
--Student Name:Yeonsoo Kim
--Tutorial No:Tutorial 4

/* Comments for your marker:




*/

/*
Task 3:

Make the listed changes to the "live" database
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (a)
ALTER TABLE centre
    ADD centre_offspring_born NUMBER(6) DEFAULT 0;

-- (b)
ALTER TABLE animal
    ADD (animal_alive CHAR(1) DEFAULT 'Y',
        CONSTRAINT chk_animal_alive CHECK (animal_alive IN ('Y','N'))
        );

-- If animal ID 8 dies,
UPDATE animal
SET animal_alive = 'N'
WHERE animal_id = 8;

COMMIT;
    
/*
******* Explain here your selected approach and its advantage/s *********
I want to keep the information of animals even though they die. 
I can simply delete the data if an animal dies as an another approach,
however, with this approach, we will lose the information of the animal and all related data in breeding_event 
will be deleted as well. Moreover, in that case, the offsprings of the animal will lose their brevent_id because
the data of breeding_event is removed.
*/



-- (c)
ALTER TABLE centre
    ADD (centre_type VARCHAR2(20) DEFAULT 'Other',
        CONSTRAINT chk_centre_type CHECK (centre_type IN ('Zoo', 'Wildlife Park', 'Sanctuary', 'Nature Reserve', 'Other'))
        );
    
UPDATE centre
SET centre_type = 'Zoo'
WHERE centre_name LIKE '%Zoo%';

UPDATE centre
SET centre_type = 'Wildlife Park'
WHERE centre_name LIKE '%Park%';

UPDATE centre
SET centre_type = 'Sanctuary'
WHERE centre_name LIKE '%Sanctuary%';

UPDATE centre
SET centre_type = 'Nature Reserve'
WHERE centre_name LIKE '%Reserve%';

COMMIT;

