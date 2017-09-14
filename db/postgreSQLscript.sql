CREATE TABLE "books" (
	"id" serial NOT NULL,
	"title" varchar(50) NOT NULL,
	"author" varchar(50) NOT NULL,
	"first_published" TIMESTAMP NOT NULL,
	"user_id" bigint NOT NULL,
	"created_on" TIMESTAMP NOT NULL,
	"is_deleted" BOOLEAN NOT NULL,
	CONSTRAINT books_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "users" (
	"id" serial(20) NOT NULL,
	"password" varchar(60) NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" varchar(50) NOT NULL,
	"role_id" bigserial NOT NULL,
	"is_deleted" BOOLEAN NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "roles" (
	"id" serial NOT NULL,
	"name" char(10) NOT NULL,
	"is_deleted" BOOLEAN NOT NULL,
	CONSTRAINT roles_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "permissions" (
	"id" serial NOT NULL,
	"name" char(20) NOT NULL,
	"is_deleted" BOOLEAN NOT NULL,
	CONSTRAINT permissions_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "subjects" (
	"id" serial NOT NULL,
	"title" serial(50) NOT NULL,
	"is_deleted" BOOLEAN NOT NULL,
	CONSTRAINT subjects_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "books_subjects" (
	"book_id" bigint NOT NULL,
	"subject_id" bigint NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "roles_permissions" (
	"role_id" bigint NOT NULL,
	"permission_id" bigint NOT NULL
) WITH (
  OIDS=FALSE
);



ALTER TABLE "books" ADD CONSTRAINT "books_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("role_id") REFERENCES "roles"("id");




ALTER TABLE "books_subjects" ADD CONSTRAINT "books_subjects_fk0" FOREIGN KEY ("book_id") REFERENCES "books"("id");
ALTER TABLE "books_subjects" ADD CONSTRAINT "books_subjects_fk1" FOREIGN KEY ("subject_id") REFERENCES "subjects"("id");

ALTER TABLE "roles_permissions" ADD CONSTRAINT "roles_permissions_fk0" FOREIGN KEY ("role_id") REFERENCES "roles"("id");
ALTER TABLE "roles_permissions" ADD CONSTRAINT "roles_permissions_fk1" FOREIGN KEY ("permission_id") REFERENCES "permissions"("id");

