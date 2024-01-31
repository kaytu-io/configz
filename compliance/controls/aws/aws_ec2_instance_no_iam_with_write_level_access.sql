with iam_roles as (
    select r.arn as role_arn,
        i.arn as instance_arn
    from aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
    where i.arn is not null
),
iam_role_with_permission as (
    select arn
    from aws_iam_role,
        jsonb_array_elements(assume_role_policy_std->'Statement') as s,
        jsonb_array_elements_text(s->'Principal'->'Service') as service,
        jsonb_array_elements_text(s->'Action') as action
    where arn in (
            select role_arn
            from iam_roles
        )
        and s->>'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and (
            (
                action in (
                    'iam:addclientidtoopenidconnectprovider',
                    'iam:addroletoinstanceprofile',
                    'iam:addusertogroup',
                    'iam:changepassword',
                    'iam:createaccesskey',
                    'iam:createaccountalias',
                    'iam:creategroup',
                    'iam:createinstanceprofile',
                    'iam:createloginprofile',
                    'iam:createopenidconnectprovider',
                    'iam:createrole',
                    'iam:createsamlprovider',
                    'iam:createservicelinkedrole',
                    'iam:createservicespecificcredential',
                    'iam:createuser',
                    'iam:createvirtualmfadevice',
                    'iam:deactivatemfadevice',
                    'iam:deleteaccesskey',
                    'iam:deleteaccountalias',
                    'iam:deletegroup',
                    'iam:deleteinstanceprofile',
                    'iam:deleteloginprofile',
                    'iam:deleteopenidconnectprovider',
                    'iam:deleterole',
                    'iam:deletesamlprovider',
                    'iam:deletesshpublickey',
                    'iam:deleteservercertificate',
                    'iam:deleteservicelinkedrole',
                    'iam:deleteservicespecificcredential',
                    'iam:deletesigningcertificate',
                    'iam:deleteUser',
                    'iam:deletevirtualmfadevice',
                    'iam:enablemfadevice',
                    'iam:passrole',
                    'iam:removeclientidfromopenidconnectprovider',
                    'iam:removerolefrominstanceprofile',
                    'iam:removeuserfromgroup',
                    'iam:resetservicespecificcredential',
                    'iam:resyncmfadevice',
                    'iam:setsecuritytokenservicepreferences',
                    'iam:updateaccesskey',
                    'iam:updateaccountpasswordpolicy',
                    'iam:updategroup',
                    'iam:updateloginprofile',
                    'iam:updateopenidconnectproviderthumbprint',
                    'iam:updaterole',
                    'iam:updateroledescription',
                    'iam:updatesamlprovider',
                    'iam:updatesshpublicKey',
                    'iam:updateservercertificate',
                    'iam:updateservicespecificcredential',
                    'iam:updatesigningcertificate',
                    'iam:updateuser',
                    'iam:uploadsshpublicKey',
                    'iam:uploadservercertificate',
                    'iam:uploadsigningcertificate',
                    '*:*'
                )
            )
        )
)
select i.arn as resource,
    case
        when p.arn is null then 'ok'
        else 'alarm'
    end status,
    case
        when p.arn is null then title || ' has no IAM rite level access.'
        else title || ' has IAM write level access.'
    end as reason,
    i.account_id
from aws_ec2_instance as i
    left join iam_roles as r on r.instance_arn = i.arn
    left join iam_role_with_permission as p on p.arn = r.role_arn;