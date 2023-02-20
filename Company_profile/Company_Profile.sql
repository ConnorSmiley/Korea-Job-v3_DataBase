drop table company_profile cascade;

create table company_profile
(
    id                          uuid      DEFAULT gen_random_uuid() primary key not null,
    company_profile_id          uuid      DEFAULT gen_random_uuid()             not null,
    company_profile_name        text,
    company_profile_email       text,
    company_profile_website     text,
    company_profile_description text[],
    company_profile_users       uuid references auth.users,
    created_at                  TIMESTAMP DEFAULT current_timestamp             not null,
    updated_at                  timestamp default current_timestamp             not null
);

select * from company_profile;

select company_profile_email, company_profile_name from company_profile
    full outer join auth.users on company_profile_email = auth.users.email ;

select auth.users.id from auth.users inner join company_profile on company_profile_email = auth.users.email ;

-- select company_profile_email from company_profile inner join auth.users using (company_profile_users);



CREATE FUNCTION insert_id_test() RETURNS trigger
    LANGUAGE plpgsql AS
$$BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO company_profile (company_profile_users)
        VALUES (auth.users.email);
        RETURN NEW;
    END IF;
END;$$;



create function public.insert_id_test()
    returns trigger as $$
begin
    insert into public.company_profile (company_profile_users)
    values (old.company_profile(email) );
    return new;
end;
$$ language plpgsql security definer;
create trigger on_auth_user_created
    after insert on auth.users
    for each row execute procedure public.handle_new_user();




CREATE OR REPLACE FUNCTION check_email_same() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.email <> (SELECT companr FROM company_profile WHERE id = NEW.other_id) THEN
        RAISE EXCEPTION 'Email address must be the same as other_table';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
when (_conditions_form_metadata(new.doc))

create trigger on_auth_user_created
    after insert on auth.users
    for each row execute procedure public.handle_new_user();

$BODY$ LANGUAGE plpgsql;










alter table company_profile
    alter column company_users type uuid;

select *
from company_profile;



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
    role         serial unique                       not null,
    created_at   TIMESTAMP DEFAULT current_timestamp not null,
    updated_at   timestamp default current_timestamp not null
);

drop table company_role;

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


drop table company_users_test cascade;
