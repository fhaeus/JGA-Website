CREATE DATABASE websiteDB;

CREATE TABLE roles(
  roleID int NOT NULL,
  title varchar(255) NOT NULL,
  PRIMARY KEY (roleID)
);

CREATE TABLE languages(
  languageID int NOT NULL,
  language varchar(255) NOT NULL,
  PRIMARY KEY (languageID)
);

CREATE TABLE media(
  mediaID int NOT NULL,
  path varchar(255) NOT NULL,
  discription varchar(255) NOT NULL,
  PRIMARY KEY (mediaID)
);

CREATE TABLE tags(
  tagID int NOT NULL,
  tag varchar(255),
  PRIMARY KEY (tagID)
);


CREATE TABLE users(
  userID int,
  firstName varchar(255) NOT NULL,
  lastName varchar(255) NOT NULL,
  mail varchar(255) NOT NULL,
  birthdate date NOT NULL,
  gender varchar(255) NOT NULL,
  nationality varchar(255) NOT NULL,
  phone varchar(255) NOT NULL,
  street varchar(255) NOT NULL,
  houseNumber varchar(255) NOT NULL,
  postalcode varchar(255) NOT NULL,
  place varchar(255) NOT NULL,
  password varchar(1000) NOT NULL,
  roleID int NOT NULL,
  PRIMARY KEY (userID),
  FOREIGN KEY (roleID) REFERENCES roles(roleID)
);

CREATE TABLE userLanguages(
  userLanguageID int NOT NULL,
  userID int NOT NULL,
  languageID int NOT NULL,
  PRIMARY KEY (userLanguageID),
  FOREIGN KEY (userID) REFERENCES users(userID),
  FOREIGN KEY (languageID) REFERENCES languages(languageID)
);

CREATE TABLE posts(
  postID int NOT NULL,
  title varchar(255) NOT NULL,
  text varchar(1000) NOT NULL,
  userID int NOT NULL,
  languageID int NOT NULL,
  PRIMARY KEY (postID),
  FOREIGN KEY (userID) REFERENCES users(userID),
  FOREIGN KEY (languageID) REFERENCES languages(languageID)
);

CREATE TABLE mediaPost(
  mediaPostID int NOT NULL,
  mediaID int NOT NULL,
  postID int NOT NULL,
  PRIMARY KEY (mediaPostID),
  FOREIGN KEY (mediaID) REFERENCES media(mediaID),
  FOREIGN KEY (postID) REFERENCES posts(postID)
);

CREATE TABLE tagPost(
  tagPostID int NOT NULL,
  tagID int,
  postID int,
  PRIMARY KEY (tagPostID),
  FOREIGN KEY (tagID) REFERENCES tags(tagID),
  FOREIGN KEY (postID) REFERENCES posts(postID)
);
