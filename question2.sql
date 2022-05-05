# Consider the ORDER_COSTS table below. Using this table and the CUSTOMERS table, find the following:
# In which states do customers spend, on average, more than 164 on their orders? 
# Fetch those states and average order costs in those states. Results should be ordered from lowest cost to highest.

SELECT AVG(cost) as average , c.customer_state as state
FROM order_costs, customers as c
WHERE cost > 0 and order_costs.cid = c.customer_id
GROUP BY c.customer_state
HAVING average > 164
ORDER BY AVG(cost) ASC

