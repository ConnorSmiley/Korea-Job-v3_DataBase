drop table user_log;

create table user_log
(
    user_account_id  uuid                                not null references user_account (id) on delete cascade,
    last_login       TIMESTAMP DEFAULT current_timestamp not null,
    last_job_applied timestamp default current_timestamp,
    primary key (user_account_id),

    CONSTRAINT last_user_log_fk
        FOREIGN KEY (user_account_id)
            REFERENCES user_account (id)
);

