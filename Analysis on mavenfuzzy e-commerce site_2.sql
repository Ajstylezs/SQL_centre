use mavenfuzzyfactory;
select * from mavenfuzzyfactory.orders;
select distinct website_session_id, count(distinct order_id) from mavenfuzzyfactory.orders 
group by 1
order by 1 asc;

-- select * from mavenfuzzyfactory.website_pageviews;
select * from mavenfuzzyfactory.website_sessions ;
select * from mavenfuzzyfactory.products ;
select * from order_items;
-- inner join deals with the union or similarities between the  two tables -- 
select * from order_items inner join products
on order_items.product_id = products.product_id;
select * from mavenfuzzyfactory.website_pageviews ;


-- group by price_usd, primary_product_id
-- order by primary_product_id asc;


