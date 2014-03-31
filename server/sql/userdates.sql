#DROP TABLE if exists userdates;
CREATE TABLE userdates (
   UserNbr integer unsigned NOT NULL,
   UnavailDate date NOT NULL,
   PRIMARY KEY (UserNbr ASC),
   CONSTRAINT userdates_fk1
      FOREIGN KEY (UserNbr)
      REFERENCES users (UserNbr)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8
COMMENT = 'User Dates'
;
