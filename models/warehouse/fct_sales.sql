with source as (
    select
        od.order_id,
        od.product_id,
        o.customer_id,
        o.employee_id,
        o.shipper_id,
        od.quantity,
        od.discount,
        od.status_id,
        od.date_allocated,
        od.purchase_order_id,
        od.inventory_id,
        o.order_date,
        o.shipped_date,
        o.paid_date

    from {{ ref('stg_orders') }} as o 
    join {{ ref('stg_order_details') }} as od 
    on o.id = od.order_id
),
unique_order as (
    select 
    *,
    row_number() over(partition by order_id, customer_id, employee_id, shipper_id, purchase_order_id, order_date, product_id) as row_numbers
    from source
)
select 
*
from unique_order
where row_numbers = 1