with
    source as (
        select
            fi.inventory_id,
            fi.transaction_type,
            fi.transaction_created_date,
            fi.transaction_modified_date,
            fi.product_id,
            fi.quantity,
            fi.purchase_order_id,
            fi.customer_order_id,
            fi.comments,
            p.product_id as id_p,
            p.product_code,
            p.product_name,
            p.description,
            p.supplier_company,
            p.standard_cost,
            p.list_price,
            p.reorder_level,
            p.target_level,
            p.quantity_per_unit,
            p.discontinued,
            p.minimum_reorder_quantity,
            p.category,
            p.attachments,

        from {{ ref("fct_inventory") }} as fi
        left join {{ ref("dim_product") }} as p on fi.product_id = p.product_id
    )
select *
from source
