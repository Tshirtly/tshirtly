CREATE TABLE tshirts (
id INTEGER PRIMARY KEY,
color TEXT,
img TEXT,
price INTEGER,
user_id INTEGER REFERENCES users
);

CREATE TABLE users (
id INTEGER PRIMARY KEY,
name TEXT
);
