{{
    config(
        materialized='view'
    )
}}

select
    id,
    order_id,
    payment_method,
    {{% cents_to_dollars(amount, 2) %}} AS amount

from raw.jaffle_shop.raw_payments
