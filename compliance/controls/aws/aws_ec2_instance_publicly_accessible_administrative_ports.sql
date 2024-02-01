select arn as resource,
    kaytu_account_id as kaytu_account_id,
    kaytu_resource_id as kaytu_resource_id,
    'ok' as status,
    case
        when public_ip_address is null then instance_id || ' not publicly accessible.'
        else instance_id || ' publicly accessible.'
    end as reason,
    region,
    account_id
from aws_ec2_instance
where public_ip_address is not null;