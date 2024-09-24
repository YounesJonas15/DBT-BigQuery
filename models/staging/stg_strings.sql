with source as(
    select * from {{ source('northwind', 'strings') }}
)
select *,
current_timestamp() as insertion_timestamp
from source