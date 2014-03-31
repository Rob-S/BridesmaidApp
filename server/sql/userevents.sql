#DROP TABLE if exists userevents;
CREATE TABLE userevents (
   UserNbr integer unsigned NOT NULL,
   PrimaryEventNbr integer unsigned NOT NULL,
   UserRole varchar(255) NOT NULL,
   PRIMARY KEY (UserNbr ASC),
   CONSTRAINT userevents_fk1
      FOREIGN KEY (UserNbr)
      REFERENCES users (UserNbr),
   CONSTRAINT userevents_fk2
      FOREIGN KEY (PrimaryEventNbr)
      REFERENCES eventdates (EventNbr)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8
COMMENT = 'User Events'
;
