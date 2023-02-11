drop table user_applied;


create table user_applied
(
    id              uuid primary key not null,
    user_applied_id uuid             not null references user_profile (user_profile_id) on delete cascade,
    job_id          uuid             not null references job_board (post_id),

    CONSTRAINT user_applied_fk
        FOREIGN KEY (user_applied_id)
            REFERENCES user_profile (user_profile_id)
)
