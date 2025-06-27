-- bulk of website sessions coming from--
select utm_source, utm_campaign, http_referer, count(distinct website_session_id) session_count
 from mavenfuzzyfactory.website_sessions
 where created_at < '2012-04-12'
 group by 1,2,3
 order by session_count desc; 
 
 -- calculating conversion rate from session to order-- 
--  using left join to deduce
select count(distinct website_sessions.website_session_id) tot_sess,
 count(distinct orders.order_id) tot_ord, 
 count(distinct orders.order_id)/count(distinct website_sessions.website_session_id)*100 CVR 
 from website_sessions
left join orders on 
orders.website_session_id = website_sessions.website_session_id
where website_sessions.created_at < '2012-04-12'
and utm_source = 'gsearch'
and utm_campaign = 'nonbrand';

-- Doing trend analysis
select year(created_at), monthname(created_at), week(created_at) week,
min(date(created_at)), count(distinct website_session_id) from website_sessions
where website_session_id between 100000 and 115000
group by 1,2,3
order by week;
 
--  pivoting data with count & case (mimicking excel pivot table)
select primary_product_id,order_id, items_purchased
from orders;
-- to know how many primary products where purchased splitted among 1 and 2 times it was purchased
select primary_product_id, 
count(distinct case when items_purchased = 1 then order_id else null end)  pp1,
count(distinct case when items_purchased = 2 then order_id else null end)  pp2
from orders where website_session_id between 100000 and 200000 
group by primary_product_id;

-- trend analysis of gsearch nonbrand from 2012-04-15 to 2012-05-10
select year(created_at) yr,week(created_at) week,min(date (created_at)), count(distinct website_session_id)
from website_sessions
where created_at <'2012-05-11'
and utm_source = 'gsearch'
and utm_campaign = 'nonbrand'
group by 1,2;

