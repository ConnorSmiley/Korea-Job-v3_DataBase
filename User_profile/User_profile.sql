drop table user_profile;

create table user_profile
(
    user_profile_id uuid                                not null references auth.users on delete cascade,
    first_name      text                                not null,
    last_name       text                                not null,
    email           text unique,
    salary          text,
    created_at      timestamp default current_timestamp not null,
    updated_at      timestamp default current_timestamp not null,
    organization    text[],
--     resume text[] references user_resume_basic
    primary key (user_profile_id)

);


alter table user_profile add column resume uuid references user_resume_basic(user_resume_id);
