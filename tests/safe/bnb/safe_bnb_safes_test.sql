-- Check that number of Safes on a specific date is correct.

with test_data as (
    select count(*) as total
    from {{ ref('safe_bnb_safes') }}
    where creation_time < '2023-02-14'
),

test_result as (
    select case when total = 36109 then true else false end as success
    from test_data
)

select *
from test_result
where success = false
