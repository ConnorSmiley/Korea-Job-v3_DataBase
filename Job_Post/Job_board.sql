drop table job_board;

create table job_board
(
    id                  uuid                                not null references company_profile (id) on delete cascade,
    post_id             uuid                                not null,
    job_board_id        serial unique                       not null,
    job_type            text references job_type (job_type) not null,
    company_name        text                                not null,
    company_email       text                                not null,
    company_website     text                                not null,
    created_at          TIMESTAMP DEFAULT current_timestamp not null,
    updated_at          timestamp default current_timestamp not null,
    company_description text[],
    company_users       text[],
    primary key (post_id),

    CONSTRAINT post_owner_fk
        FOREIGN KEY (id)
            REFERENCES company_profile (id)

);




ALTER TABLE job_board DROP COLUMN job_type;

ALTER TABLE job_board ADD COLUMN skill_catergory text references job_post_skill_set(skill_category) not null;




ALTER TABLE job_post_skill_set DROP COLUMN skill_category;

ALTER TABLE job_post_skill_set ADD COLUMN skill_set text references job_skills(skill_set) not null;
