
  create or replace   view RAW.JAFFLE_SHOP.stg_customers
  
   as (
    -- noinspection SqlNoDataSourceInspectionForFile



select
    id as customer_id,
    first_name,
    last_name

from raw.jaffle_shop.raw_customers
  );

