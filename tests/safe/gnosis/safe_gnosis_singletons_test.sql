-- Check that at least the official singletons are part of the return set.

with test_data as (
    select count(*) as num_official
    from {{ ref('safe_gnosis_singletons') }}
    where address in (
        '0xb6029ea3b2c51d09a50b53ca8012feeb05bda35a',
        '0x34cfac646f301356faa8b21e94227e3583fe3f5f',
        '0x6851d6fdfafd08c0295c392436245e5bc78b0185',
        '0xd9db270c1b5e3bd161e8c8503c55ceabee709552',
        '0x3e5c63644e683549055b9be8653de26e0b4cd36e')
),

test_result as (
    select case when num_official = 5 then true else false end as success
    from test_data
)

select *
from test_result
where success = false
