drop table company_image;

create table company_image
(
    id               uuid                                not null references company_profile (id) on delete cascade,
    company_image_id text                                not null,
    created_at       TIMESTAMP DEFAULT current_timestamp not null,
    updated_at       timestamp default current_timestamp not null
)
