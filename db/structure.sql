CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "volunteers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" text(255), "host" varchar(255), "date" varchar(255), "contact" varchar(255), "active" boolean, "created_at" datetime, "updated_at" datetime, "organization_id" integer, "datetime" datetime);
CREATE TABLE "organizations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" text, "contact_information" text, "created_at" datetime, "updated_at" datetime, "geo_location" location, "description" text, "website" text);
CREATE INDEX "index_volunteers_on_organization_id_and_created_at" ON "volunteers" ("organization_id", "created_at");
CREATE TABLE "locations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "address" varchar(255), "latitude" float, "longitude" float, "created_at" datetime, "updated_at" datetime, "organization_id" integer);
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
