create table job_location
(
    id              uuid not null references job_board(post_id) on delete cascade,
    job_location_id uuid primary key not null,
    city            text not null,
    country         text not null,
    description     text[],

    CONSTRAINT job_location_fk
        FOREIGN KEY (job_location_id)
            REFERENCES job_board(post_id)

)
