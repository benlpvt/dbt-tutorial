{{
    config(
        materialized='view'
    )
}}

{% set payment_methods = ['bank_transfer', 'coupon', 'credit_card', 'gift_card'] %}

WITH payments AS (
    SELECT p.id AS id,
           p.order_id AS order_id,
           p.payment_method AS payment_method,
           p.amount AS amount,
           o.status AS status
    FROM {{ ref('stg_payments') }} p
    JOIN {{ ref('stg_orders') }} o
    ON p.order_id = o.order_id
),
pivoted AS (
    SELECT
        order_id,
        {% for payment_method in payment_methods -%}
        SUM(CASE WHEN payment_method = '{{ payment_method }}' THEN amount ELSE 0 END) AS {{ payment_method }}_amount
        {%- if not loop.last -%}
            ,
        {% endif -%}
        {%- endfor %}
    FROM payments
    WHERE status = 'completed'
    GROUP BY 1
)

SELECT * FROM pivoted
