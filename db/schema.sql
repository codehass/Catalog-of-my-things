CREATE TABLE books (
    id serial primary key,
    title VARCHAR(100),
    publisher VARCHAR(100),
    cover_state VARCHAR(100)
)

CREATE TABLE labels (
    id serial primary key,
    title VARCHAR(100),
    color VARCHAR(100),
)