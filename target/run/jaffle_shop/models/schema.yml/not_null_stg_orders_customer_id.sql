select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select customer_id
from RAW.JAFFLE_SHOP.stg_orders
where customer_id is null



      
    ) dbt_internal_test