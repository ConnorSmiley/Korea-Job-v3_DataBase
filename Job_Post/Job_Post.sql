drop table job_post;

create table job_post
(
    id                  uuid primary key                    not null references company_account (id) on delete cascade,
    post_id             uuid                                not null,
    job_board_id        serial unique                       not null,
    job_type            text references job_type (job_type) not null,
    company_id          uuid references company_account     not null,
    company_name        uuid references company_account     not null,
    company_website     text                                not null,
    created_at          TIMESTAMP DEFAULT current_timestamp not null,
    updated_at          timestamp default current_timestamp not null,
    company_description text[],
    company_users       text[]
);
