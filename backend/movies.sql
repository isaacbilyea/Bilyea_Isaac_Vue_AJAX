-- Create the database
CREATE DATABASE IF NOT EXISTS movies_db;
USE movies_db;

-- Create the directors table
CREATE TABLE directors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the movies table
CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    short_description TEXT,
    poster VARCHAR(255),
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES directors(id)
);

-- Insert directors
INSERT INTO directors (name) VALUES
('James Cameron'),
('Anthony Russo & Joe Russo'),
('J.J. Abrams'),
('Jon Favreau'),
('Colin Trevorrow'),
('Justin Lin'),
('Joss Whedon'),
('Sam Mendes');

-- Insert movies
INSERT INTO movies (title, short_description, poster, director_id) VALUES
('Avatar', 'A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following orders and protecting an alien civilization.', 'avatar.jpg', 1),
('Avatar: The Way of Water', 'Jake Sully lives with his newfound family formed on the planet of Pandora. Trouble returns, and Jake must work with Neytiri and the army of the Na’vi race.', 'avatar2.jpg', 1),
('Avengers: Endgame', 'After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more.', 'endgame.jpg', 2),
('Star Wars: The Force Awakens', 'Three decades after the defeat of the Galactic Empire, a new threat arises. The First Order attempts to rule the galaxy.', 'force_awakens.jpg', 3),
('The Lion King', 'After the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.', 'lion_king.jpg', 4),
('Jurassic World', 'A new theme park is built on the original site of Jurassic Park. Everything is going well until the park’s newest attraction escapes.', 'jurassic_world.jpg', 5),
('Furious 7', 'Deckard Shaw seeks revenge against Dominic Toretto and his family for his comatose brother.', 'furious7.jpg', 6),
('The Avengers', 'Earth’s mightiest heroes must come together to stop Loki and his alien army from enslaving humanity.', 'avengers.jpg', 7),
('Skyfall', 'Bond’s loyalty to M is tested as her past comes back to haunt her. As MI6 comes under attack, 007 must track down and destroy the threat.', 'skyfall.jpg', 8),
('Avengers: Infinity War', 'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos.', 'infinity_war.jpg', 2);