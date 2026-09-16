select categories.item_category_name,
sum(sales.item_price*sales.item_cnt_day) as revenue
from sales
inner join items
on sales.item_id = item.item_id
inner join categories
on items.item_category_id = categories.item_category_id
group by categories.item_category_name
order by revenue desc
limit 10;
--Топ-10 товаров по выручке (с названием, категориями)--
select items.item_name,
categories.item_category_name,
sum(sales.item_price*sales.item_cnt_day) as revenue,
sum (item_cnt_day) as units_sold
from sales
inner join items
on sales.item_id = items.item_id
inner join categories
on items.item_category_id = categories.item_category_id
group by items.item_id, items.item_name, categories.item_category_id
order by revenue desc
limit 10;
