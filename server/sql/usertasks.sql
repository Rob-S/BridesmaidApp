#DROP TABLE if exists usertasks;
CREATE TABLE usertasks (
   UserNbr integer unsigned NOT NULL,
   TaskNbr integer unsigned NOT NULL,
   PRIMARY KEY (UserNbr ASC, TaskNbr ASC),
   CONSTRAINT usertasks_fk1
      FOREIGN KEY (UserNbr)
      REFERENCES users (UserNbr),
   CONSTRAINT usertasks_fk2
      FOREIGN KEY (TaskNbr)
      REFERENCES tasks (TaskNbr)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8
COMMENT = 'User Tasks'
;
