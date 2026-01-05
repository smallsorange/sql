WITH
sales_agg AS (
  SELECT merchant_id, SUM(sale_amount) AS total_sales_amount
  FROM sales_underline
  GROUP BY merchant_id
),
refunds_agg AS (
  SELECT merchant_id, SUM(refund_amount) AS total_refund_amount
  FROM refunds_underline
  GROUP BY merchant_id
),
satisfaction_agg AS (
  SELECT merchant_id, AVG(satisfaction_score) AS average_satisfaction_score
  FROM satisfaction_underline
  GROUP BY merchant_id
)
SELECT
    m.merchant_id,
    m.merchant_name,
    s.total_sales_amount,
    r.total_refund_amount,
    sa.average_satisfaction_score
FROM merchants_underline m
LEFT JOIN sales_agg s ON m.merchant_id = s.merchant_id
LEFT JOIN refunds_agg r ON m.merchant_id = r.merchant_id
LEFT JOIN satisfaction_agg sa ON m.merchant_id = sa.merchant_id;

-- 消除笛卡尔积
