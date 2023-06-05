CREATE SCHEMA dw;
CREATE TABLE dw.user (
    id int PRIMARY KEY,
    name VARCHAR(100)
);


#GRANT SELECT ON ALL TABLES IN SCHEMA public TO read_user;
#GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO write_user;
#GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_user;
