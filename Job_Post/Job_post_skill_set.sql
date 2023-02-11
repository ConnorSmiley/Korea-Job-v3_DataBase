drop table job_post_skill_set;

create table job_post_skill_set
(
    id             uuid                                not null references company_profile (id) on delete cascade,
    post_id        uuid primary key                    not null,
    job_post_id    uuid references job_board (post_id) not null,
    skill_category text unique

);




