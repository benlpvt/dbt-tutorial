
  
    

        create or replace transient table RAW.JAFFLE_SHOP.stg_customers
         as
        (select
        id as customer_id,
        first_name,
        last_name

    from raw.jaffle_shop.raw_customers
        );
      
  