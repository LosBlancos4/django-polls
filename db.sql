PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2022-03-28 08:46:14.830294');
INSERT INTO django_migrations VALUES(2,'auth','0001_initial','2022-03-28 08:46:14.837751');
INSERT INTO django_migrations VALUES(3,'admin','0001_initial','2022-03-28 08:46:14.847664');
INSERT INTO django_migrations VALUES(4,'admin','0002_logentry_remove_auto_add','2022-03-28 08:46:14.855303');
INSERT INTO django_migrations VALUES(5,'admin','0003_logentry_add_action_flag_choices','2022-03-28 08:46:14.859733');
INSERT INTO django_migrations VALUES(6,'contenttypes','0002_remove_content_type_name','2022-03-28 08:46:14.867652');
INSERT INTO django_migrations VALUES(7,'auth','0002_alter_permission_name_max_length','2022-03-28 08:46:14.872450');
INSERT INTO django_migrations VALUES(8,'auth','0003_alter_user_email_max_length','2022-03-28 08:46:14.877300');
INSERT INTO django_migrations VALUES(9,'auth','0004_alter_user_username_opts','2022-03-28 08:46:14.880320');
INSERT INTO django_migrations VALUES(10,'auth','0005_alter_user_last_login_null','2022-03-28 08:46:14.885112');
INSERT INTO django_migrations VALUES(11,'auth','0006_require_contenttypes_0002','2022-03-28 08:46:14.886140');
INSERT INTO django_migrations VALUES(12,'auth','0007_alter_validators_add_error_messages','2022-03-28 08:46:14.889357');
INSERT INTO django_migrations VALUES(13,'auth','0008_alter_user_username_max_length','2022-03-28 08:46:14.893621');
INSERT INTO django_migrations VALUES(14,'auth','0009_alter_user_last_name_max_length','2022-03-28 08:46:14.897479');
INSERT INTO django_migrations VALUES(15,'auth','0010_alter_group_name_max_length','2022-03-28 08:46:14.902202');
INSERT INTO django_migrations VALUES(16,'auth','0011_update_proxy_permissions','2022-03-28 08:46:14.906212');
INSERT INTO django_migrations VALUES(17,'auth','0012_alter_user_first_name_max_length','2022-03-28 08:46:14.910283');
INSERT INTO django_migrations VALUES(18,'sessions','0001_initial','2022-03-28 08:46:14.911971');
INSERT INTO django_migrations VALUES(19,'polls','0001_initial','2022-03-28 08:46:20.147753');
INSERT INTO django_migrations VALUES(20,'polls','0002_account','2022-03-29 06:02:34.812601');
INSERT INTO django_migrations VALUES(21,'polls','0003_secretalgorithms','2022-03-29 08:00:18.886467');
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0));
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type VALUES(1,'admin','logentry');
INSERT INTO django_content_type VALUES(2,'auth','permission');
INSERT INTO django_content_type VALUES(3,'auth','group');
INSERT INTO django_content_type VALUES(4,'auth','user');
INSERT INTO django_content_type VALUES(5,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(6,'sessions','session');
INSERT INTO django_content_type VALUES(7,'polls','question');
INSERT INTO django_content_type VALUES(8,'polls','choice');
INSERT INTO django_content_type VALUES(9,'polls','account');
INSERT INTO django_content_type VALUES(10,'polls','secretalgorithms');
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES(5,2,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(6,2,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(8,2,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES(9,3,'add_group','Can add group');
INSERT INTO auth_permission VALUES(10,3,'change_group','Can change group');
INSERT INTO auth_permission VALUES(11,3,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(12,3,'view_group','Can view group');
INSERT INTO auth_permission VALUES(13,4,'add_user','Can add user');
INSERT INTO auth_permission VALUES(14,4,'change_user','Can change user');
INSERT INTO auth_permission VALUES(15,4,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES(16,4,'view_user','Can view user');
INSERT INTO auth_permission VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES(21,6,'add_session','Can add session');
INSERT INTO auth_permission VALUES(22,6,'change_session','Can change session');
INSERT INTO auth_permission VALUES(23,6,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(24,6,'view_session','Can view session');
INSERT INTO auth_permission VALUES(25,7,'add_question','Can add question');
INSERT INTO auth_permission VALUES(26,7,'change_question','Can change question');
INSERT INTO auth_permission VALUES(27,7,'delete_question','Can delete question');
INSERT INTO auth_permission VALUES(28,7,'view_question','Can view question');
INSERT INTO auth_permission VALUES(29,8,'add_choice','Can add choice');
INSERT INTO auth_permission VALUES(30,8,'change_choice','Can change choice');
INSERT INTO auth_permission VALUES(31,8,'delete_choice','Can delete choice');
INSERT INTO auth_permission VALUES(32,8,'view_choice','Can view choice');
INSERT INTO auth_permission VALUES(33,9,'add_account','Can add account');
INSERT INTO auth_permission VALUES(34,9,'change_account','Can change account');
INSERT INTO auth_permission VALUES(35,9,'delete_account','Can delete account');
INSERT INTO auth_permission VALUES(36,9,'view_account','Can view account');
INSERT INTO auth_permission VALUES(37,10,'add_secretalgorithms','Can add secret algorithms');
INSERT INTO auth_permission VALUES(38,10,'change_secretalgorithms','Can change secret algorithms');
INSERT INTO auth_permission VALUES(39,10,'delete_secretalgorithms','Can delete secret algorithms');
INSERT INTO auth_permission VALUES(40,10,'view_secretalgorithms','Can view secret algorithms');
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO auth_user VALUES(1,'pbkdf2_sha256$320000$jgDG7TuT8B0lncv0Ni548D$6hvLnSi0u1xP2VbBy3is6681qq1rcvvMgNxrMZzsRBo=','2022-03-29 09:28:42.275235',1,'admin','','admin@example.com',1,1,'2022-03-28 08:48:42.094208','');
INSERT INTO auth_user VALUES(2,'pbkdf2_sha256$320000$oLxBC9xOxSRPo57u39UiEr$g5BnGWNU0kE4Q9KmE38tCLrQ16X23F4oBd6Vg0EcH5A=','2022-03-29 08:00:37.873816',0,'john','','John.Batman@example.com',0,1,'2022-03-29 06:19:47.889818','');
INSERT INTO auth_user VALUES(3,'pbkdf2_sha256$320000$25aOPmvEGrLeIe5yX4YEkI$N77A37w7PFyyzfVd6V7Bg1kR0cJUAN8mVVYCli07EyA=','2022-03-29 06:27:17.452730',0,'jessica','','Jessica@example.com',0,1,'2022-03-29 06:20:57.493556','');
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session VALUES('td6ksdc83hresmvezmnhoskgxztrwrk3','e30:1nYsIc:hgVJ54VeUTN4VOAtH2aGdUUpbqWJbAQ2AwEcMvbScEg','2022-04-11 16:32:58.389519');
INSERT INTO django_session VALUES('3m8y4sfqeimpj8trcwwbto7yjx5g4a1x','e30:1nYsLi:5Alq0PQCBTjMrKxVOl3BaUjOTJmwTB1O3Bl1fFGaKPQ','2022-04-11 16:36:10.998527');
INSERT INTO django_session VALUES('y8rh3282relz68qvgydx2nr7yqmcwtjb','e30:1nYsMI:T2IJG1QTLQbjCWUM4z0wWG1A2stiwC5D0w-J-t8zviE','2022-04-11 16:36:46.150465');
INSERT INTO django_session VALUES('85tahasp7n4v1670966nb72m4huco2ya','e30:1nYsRp:lNetyT6Wi6XOD7FM-R6fvPdTDmOVfNaahqmgKQ0mcXA','2022-04-11 16:42:29.844683');
INSERT INTO django_session VALUES('3dl6x8rzjc29izmdatz780i11506kbsy','e30:1nYsTr:FnAGMng7XdGzrpnbd2JSH3fZUy43mRWPnzpC1keWE7Y','2022-04-11 16:44:35.924156');
CREATE TABLE IF NOT EXISTS "polls_question" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "question_text" varchar(200) NOT NULL, "pub_date" datetime NOT NULL);
INSERT INTO polls_question VALUES(1,'What''s new?','2022-03-28 11:46:37.068143');
CREATE TABLE IF NOT EXISTS "polls_choice" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "choice_text" varchar(200) NOT NULL, "votes" integer NOT NULL, "question_id" bigint NOT NULL REFERENCES "polls_question" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO polls_choice VALUES(1,'Not much',3,1);
INSERT INTO polls_choice VALUES(2,'The Sky',5,1);
INSERT INTO polls_choice VALUES(3,'OKOK',2,1);
CREATE TABLE IF NOT EXISTS "polls_account" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "feedback" text NOT NULL, "owner_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO polls_account VALUES(1,'I did not get the point',2);
INSERT INTO polls_account VALUES(2,'ok',2);
INSERT INTO polls_account VALUES(3,'I did not get the point',2);
INSERT INTO polls_account VALUES(4,'); DELETE FROM polls_secretalgorithms',2);
INSERT INTO polls_account VALUES(5,'oki); DELETE FROM polls_secretalgorithms; --',2);
INSERT INTO polls_account VALUES(6,',oki); DELETE FROM polls_secretalgorithms; --)',2);
INSERT INTO polls_account VALUES(7,'oki); DELETE FROM polls_secretalgorithms;',2);
INSERT INTO polls_account VALUES(8,'''; DELETE FROM polls_secretalgorithms; --',2);
INSERT INTO polls_account VALUES(9,'; DELETE FROM polls_secretalgorithms; --',1);
INSERT INTO polls_account VALUES(10,'); DELETE FROM polls_secretalgorithms; --',1);
INSERT INTO polls_account VALUES(11,'ok',1);
CREATE TABLE IF NOT EXISTS "polls_secretalgorithms" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "algorithm" text NOT NULL, "owner_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('django_migrations',21);
INSERT INTO sqlite_sequence VALUES('django_admin_log',0);
INSERT INTO sqlite_sequence VALUES('django_content_type',10);
INSERT INTO sqlite_sequence VALUES('auth_permission',40);
INSERT INTO sqlite_sequence VALUES('auth_group',0);
INSERT INTO sqlite_sequence VALUES('auth_user',3);
INSERT INTO sqlite_sequence VALUES('polls_question',1);
INSERT INTO sqlite_sequence VALUES('polls_choice',3);
INSERT INTO sqlite_sequence VALUES('polls_account',11);
INSERT INTO sqlite_sequence VALUES('polls_secretalgorithms',1);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "polls_choice_question_id_c5b4b260" ON "polls_choice" ("question_id");
CREATE INDEX "polls_account_owner_id_ba1db95c" ON "polls_account" ("owner_id");
CREATE INDEX "polls_secretalgorithms_owner_id_339e3bbf" ON "polls_secretalgorithms" ("owner_id");
COMMIT;