
create type status as enum ('ACTIVE', 'INACTIVE');
create type role   as enum ('ADMIN', 'COMPANY', 'PROVIDER');

create table users (
    id             UUID          not null,
    name           varchar(255)  not null,
    email          varchar(255)  not null,
    password_hash  varchar       not null,
    role           role          not null,
    status         status        not null,
    created_at     timestamp     not null
)