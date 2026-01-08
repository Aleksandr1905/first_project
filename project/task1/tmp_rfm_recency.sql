with last_order as (
select
u.id as user_id,
max(order_ts) as last_order_ts
from
analysis.users u left join analysis.orders o
on u.id = o.user_id
and o.status = 4 and
o.order_ts >= '2022-01-01'
group by u.id)

insert into tmp_rfm_recency(
  user_id, recency)

select
user_id,
ntile(5) over(order by last_order_ts asc nulls first) as recency
from last_order
