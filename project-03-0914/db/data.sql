CREATE DATABASE project;
USE project;
DROP TABLE IF EXISTS task;
CREATE TABLE task (
  id tinyint(4) DEFAULT NULL,
  text varchar(4) DEFAULT NULL,
  is_archived tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES task WRITE;
INSERT INTO task VALUES (1,'eggs',0),(2,'ham',0),(3,'milk',0),(4,'eggs',0),(5,'ham',0),(6,'milk',0);

UNLOCK TABLES;
