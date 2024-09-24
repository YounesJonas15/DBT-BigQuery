with source as(
    select * from {{ source('northwind', 'products') }}
)
select 
cast(supplier_ids as integer) as supplier_ids,
id,
product_code,
product_name,
description,
standard_cost,
list_price,
reorder_level,
target_level,
quantity_per_unit,
discontinued,
minimum_reorder_quantity,
category,
attachments,
current_timestamp() as insertion_timestamp
from source
where supplier_ids not like('%;%')
