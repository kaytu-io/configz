select arn as resource,
    kaytu_account_id as kaytu_account_id,
    kaytu_resource_id as kaytu_resource_id,
    case
        when logging is not null then 'ok'
        else 'alarm'
    end as status,
    case
        when logging is not null then name || ' has logging'
        else name || ' does not have logging'
    end as reason,
    region,
    account_id
from aws_s3_bucket