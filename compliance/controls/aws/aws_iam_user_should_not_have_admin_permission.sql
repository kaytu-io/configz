with users_with_admin_access as (
    select aws_iam_user.name as user_name,
        aws_iam_user.account_id,
        aws_iam_user.kaytu_account_id,
        aws_iam_user.kaytu_resource_id,
        split_part(attachments, '/', 2) as access
    from aws_iam_user,
        jsonb_array_elements_text(attached_policy_arns) as attachments
    where split_part(attachments, '/', 2) = 'AdministratorAccess'
    group by (
            aws_iam_user.name,
            aws_iam_user.account_id,
            aws_iam_user.kaytu_account_id,
            aws_iam_user.kaytu_resource_id,
            access
        )
)
select user_name,
    account_id,
    kaytu_account_id,
    kaytu_resource_id,
    'alarm' as status,
    'User ' || user_name || ' has ' || access as reason
from users_with_admin_access;