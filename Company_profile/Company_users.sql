drop table company_users;

create table company_users(
    id uuid not null references company_profile(id),
    company_users_id uuid not null,
    user_id uuid not null ,
    role text references organization_role()

)
