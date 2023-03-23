
CREATE TABLE items(
    id serial PRIMARY KEY,
    genre_id VARCHAR(100),
    author_id VARCHAR(100),
    label_id VARCHAR(100),
    source_id VARCHAR(100),
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id),
    FOREIGN KEY (source_id) REFERENCES sources (id),
)

CREATE TABLE books (
    id serial primary key,
    title VARCHAR(100),
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    FOREIGN KEY(id) REFERENCES items(id)
)

CREATE TABLE labels (
    id serial primary key,
    title VARCHAR(100),
    color VARCHAR(100),
)

CREATE TABLE sources(
    id serial PRIMARY KEY,
    name VARCHAR(255),
    PRIMARY KEY(id),
    
);

-- Create genre Table
CREATE TABLE genre(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
)

-- Create music_album Table
CREATE TABLE music_album(
    id SERIAL PRIMARY KEY,
    on_spotify BOOLEAN,
    publish_date DATE,
    genre_id INT REFERENCES genre(id)
)

-- Create Games Table
CREATE TABLE games (
  id INT,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY(id) REFERENCES item(id)
);

-- Create Authors Table
CREATE TABLE authors (
  id  INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  PRIMARY KEY(id)
);