drop table if exists oauth_client_details;
create table oauth_client_details (
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(256)
);

drop table if exists oauth_client_token;
create table oauth_client_token (
  token_id VARCHAR(256),
  token bytea,
  authentication_id VARCHAR(256),
  user_name VARCHAR(256),
  client_id VARCHAR(256)
);

drop table if exists oauth_access_token;
create table oauth_access_token (
  token_id VARCHAR(256),
  token bytea,
  authentication_id VARCHAR(256),
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication bytea,
  refresh_token VARCHAR(256)
);

drop table if exists oauth_refresh_token;
create table oauth_refresh_token (
  token_id VARCHAR(256),
  token bytea,
  authentication bytea
);

drop table if exists oauth_code;
create table oauth_code (
  code VARCHAR(256), authentication bytea
);

drop table if exists oauth_approvals;
create table oauth_approvals (
  userId VARCHAR(256),
  clientId VARCHAR(256),
  scope VARCHAR(256),
  status VARCHAR(10),
  expiresAt TIMESTAMP,
  lastModifiedAt TIMESTAMP
);

drop table if exists authority;
create table authority (
  id INTEGER PRIMARY KEY,
  authority VARCHAR(256)
);

drop table if exists credentials;
create table credentials (
  id  INTEGER PRIMARY KEY,
  enabled BOOLEAN NOT NULL,
  name VARCHAR(256) NOT NULL,
  password VARCHAR(256) NOT NULL,
  version INTEGER
);

drop table if exists credentials_authorities;
CREATE TABLE credentials_authorities (
  credentials_id BIGINT NOT NULL,
  authorities_id BIGINT NOT NULL
);