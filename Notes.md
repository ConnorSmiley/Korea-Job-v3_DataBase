select * from userprofile


<!-- rename column -->
alter table userprofile
rename column avatarurl to avatar_url


<!-- Rename table -->
ALTER TABLE table_name
RENAME TO new_table_name;




<Company Profile>

create table public.company_profile (
  id uuid not null references auth.users on delete cascade,
  company_name text not null,
  company_email text not null,
  company_website text not null,
  created_at  TIMESTAMP DEFAULT current_timestamp not null,
  updated_at  timestamp default current_timestamp not null,
  company_description text[],
  company_users text[],
  primary key (id)
);

-- inserts a row into public.company_profile
create function public.handle_company_profile()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.company_profile (id)
  values (new.id);
  return new;
end;
$$;
-- trigger the function every time a user is created
create trigger on_auth_user_created_company_profile
  after insert on auth.users
  for each row execute procedure public.handle_company_profile();



<Job Posts>

create table public.job_post (
  id uuid not null references auth.users on delete cascade,
  company_name text not null,
  company_email text not null,
  company_website text not null,
  created_at TIMESTAMP DEFAULT current_timestamp not null ,
  updated_at timestamp default current_timestamp not null ,
  company_description text[],
  company_users text[],
  primary key (id)
);

-- inserts a row into public.job_post
create function public.handle_job_post()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.job_post (id)
  values (new.id);
  return new;
end;
$$;
-- trigger the function every time a user is created
create trigger on_auth_user_created_job_post
  after insert on auth.users
  for each row execute procedure public.handle_job_post();





<User Profile>


create table public.user_profile (
  id uuid not null references auth.users on delete cascade,
  first_name text,
  last_name text,
  username text,
  website text,
  avatar_url text,

  primary key (id)
);

-- inserts a row into public.userProfile
create function public.handle_user_profile()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.user_profile (id)
  values (new.id);
  return new;
end;
$$;
-- trigger the function every time a user is created
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_user_profile();
