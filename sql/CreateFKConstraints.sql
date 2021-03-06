ALTER TABLE account_openid ADD CONSTRAINT account_openid_fk_account_id
    FOREIGN KEY (account_id)
    REFERENCES account (id);

ALTER TABLE source ADD CONSTRAINT source_fk_application_id
    FOREIGN KEY (application_id)
    REFERENCES application (id);

ALTER TABLE source ADD CONSTRAINT source_fk_account_id
    FOREIGN KEY (account_id)
    REFERENCES account (id);

ALTER TABLE fingerprint ADD CONSTRAINT fingerprint_fk_source_id
    FOREIGN KEY (source_id)
    REFERENCES source (id);

ALTER TABLE fingerprint ADD CONSTRAINT fingerprint_fk_format_id
    FOREIGN KEY (format_id)
    REFERENCES format (id);

ALTER TABLE fingerprint ADD CONSTRAINT fingerprint_fk_track_id
    FOREIGN KEY (track_id)
    REFERENCES track (id);

ALTER TABLE track_mbid ADD CONSTRAINT track_mbid_fk_track_id
    FOREIGN KEY (track_id)
    REFERENCES track (id);

ALTER TABLE submission ADD CONSTRAINT submission_fk_source_id
    FOREIGN KEY (source_id)
    REFERENCES source (id);

ALTER TABLE submission ADD CONSTRAINT submission_fk_format_id
    FOREIGN KEY (format_id)
    REFERENCES format (id);

