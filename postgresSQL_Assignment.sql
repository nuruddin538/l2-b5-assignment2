-- Active: 1747475735074@@127.0.0.1@5432@conservation_db

SELECT * FROM rangers;

SELECT * FROM species

SELECT * FROM sightings

-- 1. Register new ranger

INSERT INTO rangers (name, region) VALUES('Derek Fox', 'Coastal Plains');

-- 2. Count unique species sighted
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;

--3. Find sightings with "pass" in location
SELECT * FROM sightings WHERE LOCATION ILIKE '%pass%';

--4. Ranger name with total sightings
SELECT r.name, COUNT(s.sighting_id) AS total_sightings FROM rangers r LEFT JOIN sightings s ON r.ranger_id = s.ranger_id GROUP BY r.name;

--5. Species never sighted
SELECT common_name FROM species WHERE species_id NOT IN (
    SELECT DISTINCT species_id FROM sightings
)

--6. Most recent 2 sightings
SELECT sp.common_name, s.sighting_time, r.name FROM sightings s JOIN species sp ON s.species_id = sp.species_id JOIN rangers r ON s.ranger_id = r.ranger_id ORDER BY s.sighting_time DESC LIMIT 2;

--7. Update conservation_status before 1800
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

--8 Label sighting time of day
SELECT sighting_id,
    CASE 
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning' 
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
    FROM sightings;

--9.Delete rangers with no sightings
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
)