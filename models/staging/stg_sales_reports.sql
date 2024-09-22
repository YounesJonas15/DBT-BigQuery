with source as(
    select * from {{ source('northwind', 'sales_reports') }}
)
select *,
current_timestamp() as insertion_timestamp
from source