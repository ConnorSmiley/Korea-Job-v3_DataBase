-- Create a table for public profiles
create table profiles
(
    id         uuid references auth.users not null primary key,
    updated_at timestamp with time zone,
    username   text unique,
    full_name  text,
    avatar_url text,
    website    text,

    constraint username_length check (char_length(username) >= 3)
);
-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table profiles
    enable row level security;

create policy "Public profiles are viewable by everyone." on profiles
    for select using (true);

create policy "Users can insert their own profile." on profiles
    for insert with check (auth.uid() = id);

create policy "Users can update own profile." on profiles
    for update using (auth.uid() = id);

-- This trigger automatically creates a profile entry when a new user signs up via Supabase Auth.
-- See https://supabase.com/docs/guides/auth/managing-user-data#using-triggers for more details.


select *
from company_account;


create function public.company_user()
    returns trigger as
$$
begin
    if (raw_user_meta_data !== null) Then
    insert into public.company_users (id, company_user_email)
    values (new.id, new.raw_app_meta_data ->> company_users.company_user_email);
    return new;
end;
$$ language plpgsql security definer;
create trigger on_auth_user_created
    after insert
    on auth.users
    for each row
execute procedure public.company_user();



-- Set up Storage!
insert into storage.buckets (id, name)
values ('avatars', 'avatars');

-- Set up access controls for storage.
-- See https://supabase.com/docs/guides/storage#policy-examples for more details.
create policy "Avatar images are publicly accessible." on storage.objects
    for select using (bucket_id = 'avatars');

create policy "Anyone can upload an avatar." on storage.objects
    for insert with check (bucket_id = 'avatars');

create policy "Anyone can update their own avatar." on storage.objects
    for update using (auth.uid() = owner) with check (bucket_id = 'avatars');


CREATE OR REPLACE FUNCTION update_user_metadata()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.raw_user_meta_data->>'email' != OLD.raw_user_meta_data->>'email' THEN
        -- perform some action when email is updated
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER user_metadata_trigger
    AFTER UPDATE ON your_table_name
    FOR EACH ROW
EXECUTE FUNCTION update_user_metadata();
