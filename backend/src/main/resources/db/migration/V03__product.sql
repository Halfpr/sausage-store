create table product
(
    id bigint generated by default as identity,
    name varchar(255) not null,
    picture_url varchar(255),
    price double precision
);
