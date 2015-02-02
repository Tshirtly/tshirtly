CREATE TABLE tshirts (
id INTEGER PRIMARY KEY,
color TEXT,
img TEXT,
quantity INTEGER,
price INTEGER
);

CREATE TABLE users (
id INTEGER PRIMARY KEY,
name TEXT,
email TEXT
);


CREATE TABLE transactions (
id INTEGER PRIMARY KEY,
user_id INTEGER REFERENCES users,
tshirt_id INTEGER REFERENCES tshirts
);

