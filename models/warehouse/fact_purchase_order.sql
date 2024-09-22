with sources as (
    select 
        c.id as customer_id,
        e.id as employee_id,
        pod.purchase_order_id,
        p.id as product_id,
        pod.quantity,
        pod.unit_cost,
        pod.date_received,
        pod.posted_to_inventory,
        pod.inventory_id,
        po.supplier_id,
        po.created_by,
        po.submitted_date,
        po.creation_date,
        po.status_id,
        po.expected_date,
        po.shipping_fee,
        po.taxes,
        po.payment_date,
        po.payment_amount,
        po.payment_method,
        po.notes,
        po.approved_by,
        po.approved_date,
        po.submitted_by

        from {{ ref('stg_purchase_orders') }} as po 
        left join {{ ref('stg_purchase_order_details') }} as pod 
        on po.id = pod.purchase_order_id
        left join {{ ref('stg_products') }} as p 
        on pod.product_id = p.id
        left join {{ ref('stg_order_details') }} as od 
        on p.id = od.product_id
        left join {{ ref('stg_orders') }} as o 
        on od.order_id = o.id
        left join {{ ref('stg_customer') }} as c
        on c.id = o.customer_id 
        left join {{ ref('stg_employees') }} as e 
        on e.id = po.created_by
)
select * from sources