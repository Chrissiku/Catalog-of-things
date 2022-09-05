-- Create database items if not exists.
CREATE DATABASE IF NOT EXISTS items;

-- Create table item
CREATE TABLE Item(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  genre_id     INT NOT NULL,
  author_id    INT NOT NULL,
  label_id     INT NOT NULL,
  publish_date DATE NOT NULL,
  archived     BOOLEAN NOT NULL,
  CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES Labels (id),
  CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES Authors (id),
  CONSTRAINT genre_fk FOREIGN KEY (genre_id) REFERENCES Genres (id)
);


-- Create table Books
CREATE TABLE Book(
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  item_id INT NOT NULL,
  CONSTRAINT item_fk FOREIGN KEY (item_id) REFERENCES Items (id)
)

-- Create table Label
CREATE TABLE Labels(
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
)