CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "volunteers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" text(255), "host" varchar(255), "date" varchar(255), "contact" varchar(255), "active" boolean, "created_at" datetime, "updated_at" datetime, "organization_id" integer, "datetime" datetime);
CREATE TABLE "organizations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" text, "contact_information" text, "created_at" datetime, "updated_at" datetime, "geo_location" location, "description" text, "website" text, "distance" float, "address" text, "apply" text);
CREATE INDEX "index_volunteers_on_organization_id_and_created_at" ON "volunteers" ("organization_id", "created_at");
CREATE TABLE "locations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "address" varchar(255), "latitude" float, "longitude" float, "created_at" datetime, "updated_at" datetime, "organization_id" integer);
CREATE TABLE "tags" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "taggings_count" integer DEFAULT 0);
CREATE TABLE "taggings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "tag_id" integer, "taggable_id" integer, "taggable_type" varchar(255), "tagger_id" integer, "tagger_type" varchar(255), "context" varchar(128), "created_at" datetime);
CREATE UNIQUE INDEX "index_tags_on_name" ON "tags" ("name");
CREATE UNIQUE INDEX "taggings_idx" ON "taggings" ("tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
INSERT INTO schema_migrations (version) VALUES ('20140522170728');

INSERT INTO schema_migrations (version) VALUES ('20140522172421');

INSERT INTO schema_migrations (version) VALUES ('20140523162919');

INSERT INTO schema_migrations (version) VALUES ('20140523163449');

INSERT INTO schema_migrations (version) VALUES ('20140526153201');

INSERT INTO schema_migrations (version) VALUES ('20140526162916');

INSERT INTO schema_migrations (version) VALUES ('20140526195658');

INSERT INTO schema_migrations (version) VALUES ('20140526201614');

INSERT INTO schema_migrations (version) VALUES ('20140526213256');

INSERT INTO schema_migrations (version) VALUES ('20140527021903');

INSERT INTO schema_migrations (version) VALUES ('20140527222252');

INSERT INTO schema_migrations (version) VALUES ('20140527222253');

INSERT INTO schema_migrations (version) VALUES ('20140527222254');

INSERT INTO schema_migrations (version) VALUES ('20140529025149');

INSERT INTO schema_migrations (version) VALUES ('20140601172259');

INSERT INTO schema_migrations (version) VALUES ('20140602202659');

INSERT INTO schema_migrations (version) VALUES ('20140609203318');
