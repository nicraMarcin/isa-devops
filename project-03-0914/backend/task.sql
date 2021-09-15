BEGIN TRANSACTION;
DROP TABLE IF EXISTS "task";
CREATE TABLE IF NOT EXISTS "task" (
	"id"	INTEGER NOT NULL,
	"text"	VARCHAR(255),
	"is_archived"	BOOLEAN,
	CHECK(is_archived IN (0,1)),
	PRIMARY KEY("id")
);
INSERT INTO "task" ("id","text","is_archived") VALUES (1,'eggs',0),
 (2,'ham',0),
 (3,'milk',0),
 (4,'eggs',0),
 (5,'ham',0),
 (6,'milk',0);
COMMIT;
