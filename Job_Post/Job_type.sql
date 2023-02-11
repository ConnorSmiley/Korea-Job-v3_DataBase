drop table job_type;


create table job_type
(
    job_type_id uuid primary key                    not null,
    job_type    text unique,
    created_at  timestamp default current_timestamp not null,
    updated_at  timestamp default current_timestamp not null
);


ALTER TABLE job_board DROP COLUMN job_type;

ALTER TABLE job_type ADD COLUMN id uuid references job_board(post_id) not null;
