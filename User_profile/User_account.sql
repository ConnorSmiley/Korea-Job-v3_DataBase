drop table user_account;

select *
from user_account;
create table user_account
(
    id              uuid                                not null references auth.users,
    user_account_id uuid      default gen_random_uuid() not null,
    full_name       text                                not null,
    email           text unique                         not null,
    gender          smallint references gender (id),
    date_of_birth   date,
    website         text,
    resume          uuid references user_resume (user_resume_id),
    is_active       bool      default true,
    is_deleted      bool      default false,
    email_active    bool      default true,
    created_at      timestamp default current_timestamp not null,
    updated_at      timestamp default current_timestamp not null,
    last_login      timestamp default current_timestamp not null,
    primary key (user_account_id)

);

alter table user_account add column nationality text;


drop table user_resume;

create table user_resume
(
    id             uuid                           not null references auth.users on delete cascade,
    user_resume_id uuid default gen_random_uuid() primary key not null
);

drop table gender;

create table gender
(
    id           serial primary key,
    gender_value serial not null,
    gender_name  text
);

insert into gender(gender_name)
values ('rather not say');
DELETE
FROM gender;

select *
from gender;

alter table gender update column gender_value serial not null;
alter sequence gender_id_seq restart;

insert into gender(gender_name)
values ('rather not say')




