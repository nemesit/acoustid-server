BEGIN;

CREATE TABLE account (
    id serial NOT NULL,
    name varchar NOT NULL,
    apikey varchar NOT NULL,
    mbuser varchar,
    anonymous boolean DEFAULT false,
    created timestamp with time zone DEFAULT current_timestamp,
    lastlogin timestamp with time zone,
    submission_count int NOT NULL DEFAULT 0
);

CREATE TABLE account_stats_control (
    id serial NOT NULL,
    last_updated timestamp with time zone NOT NULL
);

CREATE TABLE account_openid (
    openid varchar NOT NULL,
    account_id int NOT NULL
);

CREATE TABLE application (
    id serial NOT NULL,
    name varchar NOT NULL,
    version varchar NOT NULL,
    apikey varchar NOT NULL,
    created timestamp with time zone DEFAULT current_timestamp,
    active boolean DEFAULT true,
    account_id int NOT NULL
);

CREATE TABLE format (
    id serial NOT NULL,
    name varchar NOT NULL
);

CREATE TABLE source (
    id serial NOT NULL,
    application_id int NOT NULL,
    account_id int NOT NULL
);

CREATE TABLE fingerprint (
    id serial NOT NULL,
    fingerprint int[] NOT NULL,
    length smallint NOT NULL CHECK (length > 0),
    bitrate smallint CHECK (bitrate > 0),
    format_id int,
    created timestamp with time zone NOT NULL DEFAULT current_timestamp,
    source_id int NOT NULL,
    track_id int NOT NULL
);

CREATE TABLE track (
    id serial NOT NULL,
    created timestamp with time zone DEFAULT current_timestamp
);

CREATE TABLE track_mbid (
    track_id int NOT NULL,
    mbid uuid NOT NULL,
    created timestamp with time zone DEFAULT current_timestamp
);

CREATE TABLE submission (
    id serial NOT NULL,
    fingerprint int[] NOT NULL,
    length smallint NOT NULL CHECK (length > 0),
    bitrate smallint CHECK (bitrate > 0),
    format_id int,
    created timestamp with time zone NOT NULL DEFAULT current_timestamp,
    source_id int NOT NULL,
    mbid uuid,
    handled boolean DEFAULT false,
    puid uuid
);

CREATE TABLE stats (
    id serial NOT NULL,
    name varchar NOT NULL,
    date date NOT NULL DEFAULT current_date,
    value int NOT NULL
);

COMMIT;

