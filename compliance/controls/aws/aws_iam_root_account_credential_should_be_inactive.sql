with used_credentials as (
    select user_arn
    from aws_iam_credential_report
    where password_last_used is not null
        and password_last_used <= (current_date - interval '30' day)
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
        when used_credentials.user_arn is null then aws_iam_user.name || ' credential is not used recently'
        else aws_iam_user.name || ' credential is used recently'
    end as reason,
    aws_iam_user.region,
    aws_iam_user.account_id
from aws_iam_user
    left join used_credentials on used_credentials.user_arn = aws_iam_user.arn;