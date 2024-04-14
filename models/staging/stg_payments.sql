{{
    config(
        materialized='view'
    )
}}

select
    id,
    order_id,
    payment_method,
    {{ cents_to_dollars('amount') }} AS amount_usd

from raw.jaffle_shop.raw_payments
