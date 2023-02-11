drop table job_skills;


create table job_skills
(
    job_skills_id     uuid primary key                    not null,
    skill_set         text unique,

    created_at        timestamp default current_timestamp not null,
    updated_at        timestamp default current_timestamp not null
);



ALTER TABLE job_skills ADD COLUMN id uuid not null;
