/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name text COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species varchar(255) COLLATE pg_catalog."default",
    CONSTRAINT animals_pkey PRIMARY KEY (id)
);

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR (50) NOT NULL,
	age INT NOT NULL
);
CREATE TABLE species(
		id SERIAL PRIMARY KEY,
		name VARCHAR(50) NOT NULL
);
ALTER TABLE animals
  DROP COLUMN species;
  SELECT * FROM animals
  
ALTER TABLE animals ADD species_id INT REFERENCES species(id);

ALTER TABLE animals
ADD CONSTRAINT species_id
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);
ALTER TABLE animals
ADD CONSTRAINT owner_id
FOREIGN KEY (owner_id)
REFERENCES owners(id);


CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE NOT NULL
);


CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    vet_id INTEGER NOT NULL,
    species_id INTEGER NOT NULL,
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (species_id) REFERENCES species(id)
);


CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animal_id INTEGER,
    vet_id INTEGER ,
    visit_date DATE,
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);
