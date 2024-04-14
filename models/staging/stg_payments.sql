{{
    config(
        materialized='view'
    )
}}

select
    id,
    order_id,
    payment_method,
    amount

from raw.jaffle_shop.raw_payments
