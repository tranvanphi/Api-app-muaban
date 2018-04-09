create database weathers;

use weather;

create table cities(
    id int primary key auto_increment not null,
    name varchar(100) null
)


create table weather(
    id int primary key auto_increment not null,
    weather varchar(100) null,
    `date` datetime null,
    id_city int not null,
    foreign key (id_city) references cities(id)
)

