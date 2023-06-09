/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


BEGIN;
SELECT * FROM animals;
UPDATE animals SET species = 'unspecified';

ROLLBACK;
SELECT * FROM animals;

BEGIN;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals WHERE species = 'digimon'; 

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals WHERE species = 'pokemon'; 

COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;


SELECT * FROM animals

BEGIN;
SELECT * FROM animals;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT before_weight_update;
UPDATE animals SET weight_kg = -1 * weight_kg;
ROLLBACK TO before_weight_update;
UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
COMMIT;

SELECT * FROM animals

BEGIN;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(*) as escape_attempts FROM animals WHERE escape_attempts > 0 GROUP BY neutered;
SELECT MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight FROM animals; 
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;



						
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id where owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id where species.name = 'Pokemon';
SELECT owners.full_name, animals.name from owners FULL JOIN animals ON animals.owner_id = owners.id;
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY  species.name;
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id JOIN owners ON owners.id = animals.owner_id 
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name AS name, COUNT(*) AS animal_count 
FROM animals JOIN owners ON animals.owner_id = owners.id
GROUP BY  owners.full_name ORDER BY animal_count DESC LIMIT 1;


  
SELECT animals.name
FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;

 
  
SELECT COUNT(DISTINCT animal_id) AS num_animals
FROM visits
WHERE vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
 
SELECT vets.name, COALESCE(species.name, 'none') AS specialty
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id
ORDER BY vets.name;

 
SELECT animals.name, visits.visit_date
FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
  AND visits.visit_date >= '2020-04-01'
  AND visits.visit_date <= '2020-08-30';
  
 
 SELECT animals.name, COUNT(*) AS num_visits
FROM visits
JOIN animals ON visits.animal_id = animals.id
GROUP BY animals.id
ORDER BY num_visits DESC
LIMIT 1;



SELECT animals.name, visits.visit_date 
FROM animals INNER JOIN visits ON animals.id=visits.animal_id
 ORDER BY visits.visit_date ASC 
 limit 1; 

 
 SELECT animals.*, vets.*, visits.visit_date
FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT vets.name, COUNT(visits.animal_id) 
FROM visits JOIN vets ON vets.id = visits.vet_id 
WHERE vet_id = '2' 
GROUP BY vets.name;


 SELECT species.name, COUNT(animals.species_id) 
FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id JOIN species ON species.id = animals.species_id
 WHERE vets.name = 'Maisy Smith' 
 GROUP BY species.name 
 ORDER BY COUNT(animals.species_id) DESC
 LIMIT 1;
 



