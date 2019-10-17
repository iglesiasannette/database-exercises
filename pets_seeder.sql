
-- # BASIC JOIN
-- # list the name and address of a pet

SELECT owners.address, COUNT(owners.address) AS `number of pets at address` FROM pets
JOIN owners ON owners.id = pets.owner_id
GROUP BY owners.address;

-- # TODO: List the pet name, pet age, and owner name

select p.pet_name, p.age, o.name
from pets as p
join owners as o
on p.owner_id = o.id;

-- # BASIC JOIN WITH ALIASES

SELECT p.pet_name, o.address
FROM pets AS p
JOIN owners AS o ON o.id = p.owner_id;


-- # JOIN WITH GROUP BY
-- # List the number of pets at each addres

SELECT owners.address, COUNT(owners.address) AS `number of pets at address`
FROM pets
JOIN owners ON owners.id = pets.owner_id
GROUP BY owners.address;


-- # TODO: Write a query that will return the address and the age of each pet
-- # TODO: (CHALLENGE) list of the type of each pet's toy and the pet's name (edited)


