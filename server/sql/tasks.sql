#DROP TABLE if exists tasks;
CREATE TABLE tasks (
   TaskNbr integer unsigned NOT NULL auto_increment,
   EventType varchar(255) NOT NULL,
   TaskName varchar(255) NOT NULL,
   PRIMARY KEY (TaskNbr ASC),
   CONSTRAINT tasks_fk1
      FOREIGN KEY (EventType)
      REFERENCES eventtypes (EventType)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8
COMMENT = 'Tasks'
;
