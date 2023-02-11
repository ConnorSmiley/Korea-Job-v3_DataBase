drop table public.user_account;

create table public.user_account
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
    insert into public.user_account (id)
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
