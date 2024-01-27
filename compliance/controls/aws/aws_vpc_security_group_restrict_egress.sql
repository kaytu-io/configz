with egress_unfettered_rules as (
    select group_id,
        count(*) as num_unfettered_rules
    from aws_vpc_security_group_rule
    where type = 'egress'
        and (
            cidr_ipv4 = '0.0.0.0/0'
            or cidr_ipv6 = '::/0'
        )
    group by group_id
)
select arn as resource,
    kaytu_account_id as kaytu_account_id,
    kaytu_resource_id as kaytu_resource_id,
    case
        when egress_unfettered_rules.group_id is null then 'ok'
        else 'alarm'
    end as status,
    case
        when egress_unfettered_rules.group_id is null then sg.group_id || ' egress restricted'
        else sg.group_id || ' contains ' || egress_unfettered_rules.num_unfettered_rules || ' unfettered egress rules'
    end as reason,
    region,
    account_id
from aws_vpc_security_group as sg
    left join egress_unfettered_rules on egress_unfettered_rules.group_id = sg.group_id;