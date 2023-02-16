drop table company_account;

create table company_account
(
    id                  uuid primary key                    not null references auth.users on delete cascade,
    company_info_id     uuid                                not null,
    company_name        text                                not null,
    company_email       text                                not null,
    company_website     text                                not null,
    company_image       uuid references company_image on delete cascade,
    company_description text[],
    company_users       uuid references company_users,
    created_at          TIMESTAMP DEFAULT current_timestamp not null,
    updated_at          timestamp default current_timestamp not null
);


create table company_image
(
    id               uuid primary key                    not null,
    company_image_id uuid                                not null,
    company_name     text[]                              not null,
    created_at       TIMESTAMP DEFAULT current_timestamp not null,
    updated_at       timestamp default current_timestamp not null
);

create table company_users
(
    id               uuid primary key                    not null,
    company_users_id uuid                                not null,
    company          text                                not null,
    company_username text                                not null,
    company_role     uuid references company_role        not null,
    created_at       TIMESTAMP DEFAULT current_timestamp not null,
    updated_at       timestamp default current_timestamp not null
);

create table company_role
(
    id           uuid primary key                    not null,
    company_role uuid                                not null,
    role         text                                not null,
    created_at   TIMESTAMP DEFAULT current_timestamp not null,
    updated_at   timestamp default current_timestamp not null
)


alter table company_account
    enable row level security;
create
    policy "Public profiles are viewable by everyone." on company_account
    for
    select using (true);
create
    policy "Users can insert their own profile." on company_account
    for insert with check (auth.uid() = id);
create
    policy "Users can update own profile." on company_account
    for
    update using (auth.uid() = id);

alter table company_account
    add column company_job_posts uuid references job_board (post_id) not null;


