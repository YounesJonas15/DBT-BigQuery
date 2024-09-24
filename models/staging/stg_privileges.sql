with source as(
    select * from {{ source('northwind', 'privileges') }}
)
select *,
current_timestamp() as insertion_timestamp
from source