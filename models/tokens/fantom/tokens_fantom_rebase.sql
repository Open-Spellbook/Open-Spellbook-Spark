{{ config( alias='rebase', tags=['static'])}}

SELECT LOWER(contract_address) as contract_address, symbol, decimals 
FROM (VALUES
        ('0xfa1FBb8Ef55A4855E5688C0eE13aC3f202486286', 'FHM', 9)
     ) AS temp_table (contract_address, symbol, decimals)