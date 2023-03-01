create table teaching_post
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


INSERT INTO teaching_post(company_name, company_website, company_description, company_users, job_type, job_title, job_location, job_salary,
                     Korean_level)
VALUES ('EPIK', 'www.web.com', 'company description', '{John_id}', 'teaching', 'teacher', 'Seoul', '40k won', 'none');

INSERT INTO teaching_post(company_name, company_website, company_description, company_users, job_type, job_title, job_location, job_salary,
                     Korean_level)
VALUES ('EPIK', 'www.web.com', 'company description', '{John_id}', 'teaching', 'teacher', 'Busan', '40k won', 'none');

INSERT INTO teaching_post(company_name, company_website, company_description, company_users, job_type, job_title, job_location, job_salary,
                     Korean_level)
VALUES ('EPIK', 'www.web.com', 'company description', '{John_id}', 'teaching', 'teacher', 'Daegu', '40k won', 'none');
