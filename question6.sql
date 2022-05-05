# Let us define "large products" as those products with weight > 400 and length > 10.
# Some orders that contain a large product can have large discrepancies between their order_delivered_carrier_date and 
# order_delivered_customer_date. 
# Let us define "strange orders that contain large products" as those orders which contain a large product and the 
# difference between their order_delivered_carrier_date and order_delivered_customer_date is larger than 20 days.

# For all "strange orders that contain large products", find their order IDs and the number of days difference between 
# their order_delivered_carrier_date and order_delivered_customer_date.
# Result should be like: "abc21312df" -> 32, "dhs230kdf8" -> 29, ...

# HINT: Using the same MySQL function as Question 1 may help.

SELECT DISTINCT order_items.order_id, DATEDIFF(o.order_delivered_customer_date,o.order_delivered_carrier_date) as date_diff, order_items.order_item_id
from orders o, order_items
where DATEDIFF(o.order_delivered_customer_date,o.order_delivered_carrier_date) > 20 and o.order_id = order_items.order_id and order_items.product_id IN(
(SELECT p.product_id
from products p
where p.product_weight_g > 400 and p.product_length_cm > 10) 
)
order by order_items.order_id
