with count_order as (
select
u.id as user_id,
count(o.order_id) as count_order
from
analysis.users u left join analysis.orders o
on u.id = o.user_id
and o.status = 4 and
o.order_ts >= '2022-01-01'
group by u.id)

insert into tmp_rfm_frequency(
  user_id, frequency)

select
user_id,
ntile(5) over(order by count_order asc) as frequency
from count_order
