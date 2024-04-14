

select
    id,
    order_id,
    payment_method,
    round(1.0 * amount / 100, 2) AS amount_usd

from raw.jaffle_shop.raw_payments