CREATE DATABASE rent_cars;

CREATE TABLE users
(
    id       SERIAL PRIMARY KEY,
    login    VARCHAR(128) NOT NULL UNIQUE,
    email    VARCHAR(128) NOT NULL,
    password VARCHAR(128) NOT NULL UNIQUE,
    role     VARCHAR(32)  NOT NULL
);

CREATE TABLE client_data
(
    id                SERIAL PRIMARY KEY,
    user_id           INT REFERENCES users (id) NOT NULL UNIQUE,
    firstname         VARCHAR(128),
    lastname          VARCHAR(128),
    birthday          TIMESTAMP,
    driver_licence_no VARCHAR(128),
    date_of_expiry    TIMESTAMP,
    driver_experience INT
);

CREATE TABLE car_category
(
    id        SERIAL PRIMARY KEY,
    category  VARCHAR(32) NOT NULL UNIQUE,
    day_price NUMERIC
);

CREATE TABLE car
(
    id              SERIAL PRIMARY KEY,
    brand           VARCHAR(128)                     NOT NULL,
    model           VARCHAR(128)                     NOT NULL,
    year_of_issue   TIMESTAMP                        NOT NULL,
    colour          VARCHAR(128)                     NOT NULL,
    passenger       INT                              NOT NULL,
    image           VARCHAR(128)                     NOT NULL,
    car_category_id INT REFERENCES car_category (id) NOT NULL
);

CREATE TABLE order
(
    id                SERIAL PRIMARY KEY,
    user_id           INT REFERENCES users (id) NOT NULL,
    car_id            INT REFERENCES car (id)   NOT NULL,
    start_date_of_use TIMESTAMP                 NOT NULL,
    expiration_date   TIMESTAMP                 NOT NULL,
    status            VARCHAR(128)              NOT NULL
);

CREATE TABLE extra_payment
(
    id          SERIAL PRIMARY KEY,
    order_id    INT REFERENCES order (id) NOT NULL UNIQUE,
    description TEXT,
    price       NUMERIC
)