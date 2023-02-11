drop table user_resume_basic;


create table user_resume_basic
(
    id             uuid                                not null references auth.users on delete cascade,
    user_resume_id uuid primary key                    not null,
    first_name     text,
    last_name      text,
    location       text,
    summary        text,
    created_at     timestamp default current_timestamp not null,
    updated_at     timestamp default current_timestamp not null,


    CONSTRAINT user_applied_id_fk
        FOREIGN KEY (user_resume_id)
            REFERENCES job_board (post_id)
);


ALTER TABLE user_resume_basic DROP COLUMN location;
ALTER TABLE user_resume_basic ADD COLUMN location text references job_location(job_location_id) not null;
