drop table job_board;

create table job_board
(
    id                uuid primary key                    not null references company_account on delete cascade,
    job_board_id      uuid                                not null,
    job_board_post_id serial unique                       not null,
    job_type          uuid references job_type            not null,
    company_name      text                                not null,
    created_at        TIMESTAMP DEFAULT current_timestamp not null,
    updated_at        timestamp default current_timestamp not null
);

ALTER TABLE job_board
    DROP COLUMN job_type;

ALTER TABLE job_board
    ADD COLUMN skill_catergory text references job_post_skill_set (skill_category) not null;


ALTER TABLE job_post_skill_set
    DROP COLUMN skill_category;

ALTER TABLE job_post_skill_set
    ADD COLUMN skill_set text references job_skills (skill_set) not null;
