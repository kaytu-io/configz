with public_buckets as (
    select distinct arn as arn
    from aws_s3_bucket
    where not block_public_acls
    union all
    select arn as arn
    from aws_s3_bucket,
        jsonb_array_elements(policy_std->'Statement') as s,
        jsonb_array_elements_text(s->'Principal'->'AWS') as p
    where (
            p = '*'
            and s->>'Effect' = 'Allow'
        )
)
select b.arn as resource,
    b.kaytu_account_id as kaytu_account_id,
    b.kaytu_resource_id as kaytu_resource_id,
    case
        when b.policy_std is null then 'info'
        when p.arn is not null then 'alarm'
        else 'ok'
    end as status,
    case
        when b.policy_std is null then title || ' does not have defined policy or insufficient access to the policy.'
        when p.arn is not null then title || ' publicly accessible.'
        else title || ' not publicly accessible.'
    end as reason,
    region,
    account_id
from aws_s3_bucket as b
    left join public_buckets as p on p.arn = b.arn;