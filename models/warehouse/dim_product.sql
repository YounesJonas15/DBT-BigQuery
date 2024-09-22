/*product_id
product_code
product_name
description
supplier_company
standard_cost
list_price
reorder_level
target_level
quantity_per_unit
discontinued
minimum_reorder_quantity
category
attachments
insertion_timestamp
*/
with suppliers_source as (
    select 
    *
     from {{ ref('stg_suppliers') }}
),
products_source as (
    select 
    *
    from {{ ref('stg_products') }}
), products as (
select 
p.id as product_id,
p.product_code as product_code,
p.product_name,
p.description,
s.company as supplier_company,
p.standard_cost,
p.list_price,
p.reorder_level,
p.target_level,
p.quantity_per_unit,
p.discontinued,
p.minimum_reorder_quantity,
p.category,
p.attachments,
current_timestamp() as insertion_timestamp
from products_source as p join suppliers_source as s 
on p.supplier_ids = s.id
),
unique_product as (
    select
    *,
    row_number() over(partition by product_id) as row_numbers
    from products
)

select * from unique_product
where row_numbers = 1 