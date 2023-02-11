drop table user_education;


create table user_education
(
    id                 uuid                                               not null references auth.users on delete cascade,
    user_education_id  uuid primary key                                   not null,
    first_name         text                                               not null,
    last_name          text                                               not null,
    email              text references user_profile (email)               not null,
    education_level    text,
    major              text,
    school             text,
    gpa                text,
    location           text[],
    currently_enrolled bool,
    enrolled_from      date,
    enrolled_to        date,
    created_at         timestamp default current_timestamp                not null,
    updated_at         timestamp default current_timestamp                not null,
    resume_id          uuid references user_resume_basic (user_resume_id) not null,

    CONSTRAINT user_education_id_fk
        FOREIGN KEY (user_education_id)
            REFERENCES job_board (post_id)
)

