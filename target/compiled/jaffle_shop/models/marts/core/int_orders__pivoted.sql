



WITH payments AS (
    SELECT p.id AS id,
           p.order_id AS order_id,
           p.payment_method AS payment_method,
           p.amount AS amount,
           o.status AS status
    FROM RAW.JAFFLE_SHOP.stg_payments p
    JOIN RAW.JAFFLE_SHOP.stg_orders o
    ON p.order_id = o.order_id
),
pivoted AS (
    SELECT
        order_id,
        SUM(CASE WHEN payment_method = 'bank_transfer' THEN amount ELSE 0 END) AS bank_transfer_amount,
        SUM(CASE WHEN payment_method = 'coupon' THEN amount ELSE 0 END) AS coupon_amount,
        SUM(CASE WHEN payment_method = 'credit_card' THEN amount ELSE 0 END) AS credit_card_amount,
        SUM(CASE WHEN payment_method = 'gift_card' THEN amount ELSE 0 END) AS gift_card_amount
    FROM payments
    WHERE status = 'completed'
    GROUP BY 1
)

SELECT * FROM pivoted