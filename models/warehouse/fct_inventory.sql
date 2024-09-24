with source as (
    select
    id as inventory_id,
    transaction_type,
    transaction_created_date,
    transaction_modified_date,
    product_id,
    quantity,
    purchase_order_id,
    customer_order_id,
    comments,
    current_timestamp() as  insertion_timestamp

   from {{ ref('stg_inventory_transactions') }}
),
unique_order as (
    select 
    *,
    row_number() over(partition by inventory_id) as row_numbers
    from source
)
select 
*
EXCEPT(row_numbers)
from unique_order
where row_numbers = 1