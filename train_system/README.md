```
Guest=# create database train_system;
CREATE DATABASE
Guest=# c\ train_system;
Invalid command \. Try \? for help.
Guest-# \c train_system;
You are now connected to database "train_system" as user "Guest".
train_system-# create table trains (id serial primary key, name varchar, time timestamp, city_id int);
ERROR:  syntax error at or near "c"
LINE 1: c
        ^
train_system=# CREATE TABLE trains (id serial primary key, name varchar, time timestamp, city_id int);
CREATE TABLE
train_system=# CREATE TABLE city (id serial primary key, name varchar);
CREATE TABLE
train_system=# \dt
        List of relations
 Schema |  Name  | Type  | Owner
--------+--------+-------+-------
 public | city   | table | Guest
 public | trains | table | Guest
(2 rows)

train_system=# SELECT * FROM city
train_system-# ;
 id | name
----+------
(0 rows)

train_system=# SELECT * FROM trains;
 id | name | time | city_id
----+------+------+---------
(0 rows)

train_system=# CREATE DATABASE trains_test WITH TEMPLATE trains;
ERROR:  template database "trains" does not exist
train_system=# CREATE DATABASE train_system_test WITH TEMPLATE train_system;
CREATE DATABASE
train_system=# \l
                                      List of databases
       Name        |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
-------------------+----------+----------+-------------+-------------+-----------------------
 Guest             | epicodus | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres          | epicodus | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 shelter           | Guest    | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 shelter_test      | Guest    | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 template0         | epicodus | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/epicodus          +
                   |          |          |             |             | epicodus=CTc/epicodus
 template1         | epicodus | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/epicodus          +
                   |          |          |             |             | epicodus=CTc/epicodus
 todo              | Guest    | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 todo_test         | Guest    | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 train_system      | Guest    | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 train_system_test | Guest    | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
(10 rows)

train_system=#
```
