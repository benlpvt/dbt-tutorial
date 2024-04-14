
  create or replace   view RAW.JAFFLE_SHOP.stg_payments
  
   as (
    

select
    id,
    order_id,
    payment_method,
    amount

from raw.jaffle_shop.raw_payments
  );

