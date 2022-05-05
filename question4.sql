# Consider the PRODUCTS table below and the ORDER_ITEMS table from earlier. 
# For each product category other than {"moveis_decoracao", "beleza_saude"}, find the minimum price that was paid for
# an item from that category. Limit the result to retrieve only 6 rows.

# The result should be like: category1 -> minprice1, category2 -> minprice2, ...

SELECT p.product_category_name, MIN(price) as min_price
FROM products p, order_items o
WHERE o.product_id = p.product_id
group by p.product_category_name
having p.product_category_name != "moveis_decoracao" and p.product_category_name != "beleza_saude"
LIMIT 6

