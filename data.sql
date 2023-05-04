/* Populate database with sample data. */

SELECT * FROM animals;
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23, 'unknown');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Gabumon', '2018-11-15', 2, true, 8, 'unknown');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04, 'unknown');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Devimon', '2017-05-12', 5, true, 11, 'unknown');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Charmander', '2020-02-08', 0, false, -11, 'unknown');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Plantmon', '2021-11-15', 2, true, -5.7, 'unknown');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Squirtle', '1993-04-02', 3, false, -12.13, 'unknown');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Angemon', '2005-06-12', 1, true, -45, 'unknown');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4, 'unknown');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Blossom', '1998-10-13', 3, true, 17, 'unknown');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Ditto', '2022-05-14', 4, true, 22, 'unknown');



INSERT INTO owners (full_name, age) VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);
SELECT * FROM owners

INSERT INTO species (name) VALUES
    ('Pokemon'),
    ('Digimon');
SELECT * FROM species 	

BEGIN
SELECT * FROM animals

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';


BEGIN;
SELECT * FROM animals
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

