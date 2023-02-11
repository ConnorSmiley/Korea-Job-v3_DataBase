drop table user_skills;


create table user_skills
(
    id                uuid                                not null references auth.users on delete cascade,
    user_skills_id    uuid primary key                    not null,
    skill_set         text references job_skills(skill_set),
    years_experience  int,
    skill_set1        text references job_skills(skill_set),
    years_experience1 int,
    skill_set2        text references job_skills(skill_set),
    years_experience2 int,
    skill_set3        text references job_skills(skill_set),
    years_experience3 int,
    summary           text,

    created_at        timestamp default current_timestamp not null,
    updated_at        timestamp default current_timestamp not null,

    CONSTRAINT user_skill_id_fk
        FOREIGN KEY (user_skills_id)
            REFERENCES user_resume_basic (user_resume_id)
);


ALTER TABLE user_resume_basic
    ADD COLUMN email text unique;

