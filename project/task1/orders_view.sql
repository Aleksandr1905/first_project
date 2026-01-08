-- analysis.orderstatuslog source

-- analysis.orders source

CREATE OR REPLACE VIEW analysis.orders AS
with last_status as (
  select
  order_id,
  status_id,
  row_number() over (partition by order_id order by dttm desc) as rn
  from production.orderstatuslog )

SELECT
o.order_id,
    o.order_ts,
    o.user_id,
    o.bonus_payment,
    o.payment,
    o.cost,
    o.bonus_grant,
   ls.status_id as status
   FROM production.orders o
   left join last_status ls
   on o.order_id = ls.order_id and ls.rn = 1;