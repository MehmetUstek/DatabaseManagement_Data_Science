# Implement the following function get_month. It takes as input a month as an integer.
# It needs to compute: In the given month, how many payments were made with each different payment type?
# e.g.: Credit card -> 5000 payments, debit card -> 100 payments, voucher -> 300 payments, ...

# HINT: One of the MySQL functions we covered in the PS makes it easy to work with months.

SELECT COUNT(ORDERS.order_id), payment_type
FROM ORDERS, order_payments
where orders.order_id = order_payments.order_id and MONTH(ORDERS.order_purchase_timestamp) = 2
GROUP BY payment_type