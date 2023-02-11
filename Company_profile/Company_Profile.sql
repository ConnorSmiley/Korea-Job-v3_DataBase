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
