with cognito_access as (
    select role_id,
        count(*) as num_cognito_access
    from aws_iam_role,
        jsonb_array_elements(assume_role_policy->'Statement') as stmt
    where stmt->'Principal'->>'Federated' = 'cognito-identity.amazonaws.com'
    group by role_id
    having count(*) > 0
)
select role.arn as resource,
    role.kaytu_account_id as kaytu_account_id,
    role.kaytu_resource_id as kaytu_resource_id,
    case
        when cognito_access.role_id is null then 'ok'
        else 'alarm'
    end as status,
    case
        when cognito_access.role_id is null then cognito_access.role_id || ' has cognito access'
        else role.role_id || ' contains ' || cognito_access.num_cognito_access || ' cognito access'
    end as reason,
    role.region,
    role.account_id
from aws_iam_role as role
    left join cognito_access on cognito_access.role_id = role.role_id;