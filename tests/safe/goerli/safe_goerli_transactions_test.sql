-- Check that number of Safe transactions in specific date range is correct.

with test_data as (
    select count(*) as total
    from {{ ref('safe_goerli_transactions') }}
    where block_time > '2023-01-01'
        and block_time < '2023-02-01'
),

test_result as (
    select case when total = 13954 then true else false end as success
    from test_data
)

select *
from test_result
where success = false
