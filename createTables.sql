drop table public.company_profile;

create table public.company_profile
(
    id                  uuid                                not null references auth.users on delete cascade,
    company_name        text                                not null,
    company_email       text                                not null,
    company_website     text                                not null,
    created_at          TIMESTAMP DEFAULT current_timestamp not null,
    updated_at          timestamp default current_timestamp not null,
    company_description text[],
    company_users       text[],
    primary key (id)
);
alter table company_profile
    enable row level security;
create
    policy "Public profiles are viewable by everyone." on company_profile
    for
    select using (true);
create
    policy "Users can insert their own profile." on company_profile
    for insert with check (auth.uid() = id);
create
    policy "Users can update own profile." on company_profile
    for
    update using (auth.uid() = id);
-- inserts a row into public.company_profile
-- create function public.handle_company_profile()
--     returns trigger
--     language plpgsql
--     security definer set search_path = public
-- as
-- $$
-- begin
--     insert into public.company_profile (id)
--     values (new.id);
--     return new;
-- end;
-- $$;
-- --trigger the function every time a user is created
-- create trigger on_auth_user_created_company_profile
--     after insert
--     on auth.users
--     for each row
-- execute procedure public.handle_company_profile();


create table user_log
(
    user_account_id  uuid                                not null references user_profile (id) on delete cascade,
    last_login       TIMESTAMP DEFAULT current_timestamp not null,
    last_job_applied timestamp default current_timestamp,
    primary key (user_account_id),

    CONSTRAINT last_user_log_fk
        FOREIGN KEY (user_account_id)
            REFERENCES user_profile (id)
);



drop table public.user_profile;

create table public.user_profile
(
    id            uuid                                not null references auth.users on delete cascade,
    first_name    text,
    last_name     text,
    username      text,
    gender        boolean,
    date_of_birth date,
    is_active     boolean,
    website       text,
    email_active  boolean,
    avatar_url    text,
    created_at    TIMESTAMP DEFAULT current_timestamp not null,
    updated_at    timestamp default current_timestamp not null,
    primary key (id)
);
-- inserts a row into public.userProfile
create function public.handle_user_profile()
    returns trigger
    language plpgsql
    security definer set search_path = public
as
$$
begin
    insert into public.user_profile (id)
    values (new.id);
    return new;
end;
$$;
-- trigger the function every time a user is created
create trigger on_auth_user_created
    after insert
    on auth.users
    for each row
execute procedure public.handle_user_profile();



drop table public.job_post;

create table public.job_post
(
    id                  uuid                                not null references company_profile (id) on delete cascade,
    post_id             uuid                                not null,
    job_type            text                                not null,
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

-- inserts a row into public.job_post
-- create function public.handle_job_post()
-- returns trigger
-- language plpgsql
-- security definer set search_path = public
-- as $$
-- begin
--   insert into public.job_post (id)
--   values (new.id);
--   return new;
-- end;
-- $$;
-- -- trigger the function every time a user is created
-- create trigger on_auth_user_created_job_post
--   after insert on auth.users
--   for each row execute procedure public.handle_job_post();

drop table job_type;


create table job_type
(
    company_id  uuid not null references job_post (id) on delete cascade,
    job_type_id uuid not null,
    job_type    text not null references job_post (job_type),
    primary key (job_type_id),

    CONSTRAINT job_type_fk
        FOREIGN KEY (job_type_id)
            REFERENCES job_post (id)
);


create table job_location
(
    id              uuid not null references job_post (id) on delete cascade,
    job_location_id uuid not null,
    city            text not null,
    country         text not null,
    description     text[],
    primary key (id),


    CONSTRAINT job_location_fk
        FOREIGN KEY (job_location_id)
            REFERENCES job_post (post_id)

)






















