use mavenfuzzyfactory ;
select * from mavenfuzzyfactory.order_items;

use portfolio;
-- select * from portfolio.whisker ;
create table whisker (
user_id serial primary key,
first_name char(255),
last_name char(59),
Age int,
Target float,
Performance float,
percentage_achvd float
);
select * from portfolio.whisker ;
insert into whisker ( first_name, last_name, age, Target , Performance)
values ('Alex', 'Syril', 34, 150000,130000),
('Maxwell', 'Arnold',29, 400000,230000)
;
-- delete column percentage_achvd ;
alter table whisker drop  percentage_achvd;
-- delete row -- 
delete from whisker where user_id = 2;



