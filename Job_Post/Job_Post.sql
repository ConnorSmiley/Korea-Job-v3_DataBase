drop table job_post;

create table job_post
(
    id                  uuid primary key DEFAULT gen_random_uuid() not null,
    post_id             uuid             DEFAULT gen_random_uuid() not null,
    job_board_id        serial unique                              not null,
    job_type            text                                       not null,
    job_title           text                                       not null,
    job_location        text                                       not null,
    job_salary          text                                       not null,
    Korean_level        text                                       not null,
    company_id          uuid             DEFAULT gen_random_uuid() not null,
    company_name        text                                       not null,
    company_website     text                                       not null,
    created_at          TIMESTAMP        DEFAULT current_timestamp not null,
    updated_at          timestamp        default current_timestamp not null,
    company_description text,
    company_users       text[]
);


INSERT INTO job_post(company_name, company_website, company_description, company_users, job_type, job_title, job_location, job_salary,
                     Korean_level)
VALUES ('Microsoft', 'www.web.com', 'company description', '{John_id}', 'work', 'Front End', 'Seoul', '40k won', 'none');

INSERT INTO job_post(company_name, company_website, company_description, company_users, job_type, job_title, job_location, job_salary,
                     Korean_level)
VALUES ('Amazon', 'www.web.com', 'company description', '{John_id}', 'work', 'Back End', 'Seoul', '45k won', 'none');

INSERT INTO job_post(company_name, company_website, company_description, company_users, job_type, job_title, job_location, job_salary,
                     Korean_level)
VALUES ('Google', 'www.web.com', 'company descrption', '{John_id}', 'work', 'IT', 'Seoul', '50k won', 'none');

INSERT INTO job_post(company_name, company_website, company_description, company_users, job_type, job_title, job_location, job_salary,
                     Korean_level)
VALUES ('Random Comp', 'www.web.com', 'company description', '{John_id}', 'work', 'Sys Admin', 'Seoul', '60k won', 'none');

INSERT INTO job_post(company_name, company_website, company_description, company_users, job_type, job_title, job_location, job_salary,
                     Korean_level)
VALUES ('Random Comp', 'www.web.com', 'company description', '{John_id}', 'work', 'Database', 'Seoul', '47k won', 'none');

INSERT INTO job_post(company_name, company_website, company_description, company_users, job_type, job_title, job_location, job_salary,
                     Korean_level)
VALUES ('Something', 'www.web.com', 'company description', '{John_id}', 'work', 'Stripper', 'Seoul', '47k won', 'none');

INSERT INTO job_post(company_name, company_website, company_description, company_users, job_type, job_title, job_location, job_salary,
                     Korean_level)
VALUES ('Other thing', 'www.web.com', 'company description', '{John_id}', 'work', 'Machine Learning', 'Seoul', '47k won', 'none');



