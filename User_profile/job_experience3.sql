drop table user_experience3;


create table user_experience3
(
    id                 uuid                                               not null references auth.users on delete cascade,
    user_experience_id uuid primary key                                   not null,
    resume_id          uuid references user_resume_basic (user_resume_id) not null,
    job_title text,
    company text,
    location_city text,
    location_country text,
    description text[],
    created_at         timestamp default current_timestamp                not null,
    updated_at         timestamp default current_timestamp                not null

)

