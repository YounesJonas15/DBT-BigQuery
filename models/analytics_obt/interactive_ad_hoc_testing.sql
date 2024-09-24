select
customer_id
from {{ ref('dim_customer') }}
group by 1
having count(*) > 1