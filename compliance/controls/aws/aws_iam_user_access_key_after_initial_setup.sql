with used_credentials as (
    select user_arn
    from aws_iam_credential_report
    where (
            (
                access_key_1_active
                and user_creation_time <= (now() - interval '30' day)
                and access_key_1_last_rotated <= (now() - interval '60' minute)
            )
            or (
                access_key_2_active
                and user_creation_time < (now() - interval '30' day)
                and access_key_2_last_rotated < (now() - interval '60' minute)
            )
        )
    group by user_arn
)
select aws_iam_user.arn as resource,
    aws_iam_user.kaytu_account_id as kaytu_account_id,
    aws_iam_user.kaytu_resource_id as kaytu_resource_id,
    case
        when used_credentials.user_arn is null then 'ok'
        else 'alarm'
    end as status,
    case
        when used_credentials.user_arn is null then aws_iam_user.name || ' credential is not initialized recently'
        else aws_iam_user.name || ' credential is initialized recently'
    end as reason,
    aws_iam_user.region,
    aws_iam_user.account_id
from aws_iam_user
    left join used_credentials on used_credentials.user_arn = aws_iam_user.arn;