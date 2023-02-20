drop table company_users cascade;
drop table company_users;

create table company_users
(
    id                 uuid primary key DEFAULT gen_random_uuid() not null,
    company_users_id   uuid references company_profile,
    first_name         text,
    last_name          text,
    user_id            uuid references company_profile,
    company_user_email uuid references company_profile,
    created_at         TIMESTAMP        DEFAULT current_timestamp not null,
    updated_at         timestamp        default current_timestamp not null

);


select *
from company_users;



ALTER TABLE company_users;
DROP
COLUMN company_role;

ALTER TABLE company_users
    ADD COLUMN company_role uuid;

select *
from company_users;

select *
from company_users_test;

drop table company_users_test;

create table company_users_test
(
    id                   uuid primary key not null references auth.users (id),
    company_user_test_id uuid             not null,
    company              text
);


alter table company_users_test
    add column id uuid primary key not null;

ALTER TABLE company_users_test
    DROP COLUMN id;

drop table company_users_test








select company_profile_email from company_profile inner join auth.users on company_profile_email = auth.users.email ;

select auth.users.id from auth.users inner join company_profile on company_profile_email = auth.users.email ;


select * from company_users;
select * from company_profile;

select auth.users.id from auth.users inner join company_profile on company_profile_email = auth.users.email inner join company_users on user_id = company_profile_id
















