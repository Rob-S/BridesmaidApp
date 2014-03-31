#DROP TABLE if exists eventdates;
CREATE TABLE eventdates (
   EventNbr integer unsigned NOT NULL auto_increment,
   PrimaryEventNbr integer unsigned,
   EventPrefix varchar(255) NOT NULL,
   EventType varchar(255) NOT NULL,
   EventDate date NOT NULL,
   PRIMARY KEY (EventNbr ASC),
   CONSTRAINT eventdates_fk1
      FOREIGN KEY (PrimaryEventNbr)
      REFERENCES eventdates (EventNbr),
   CONSTRAINT eventdates_fk2
      FOREIGN KEY (EventType)
      REFERENCES eventtypes (EventType)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8
COMMENT = 'Event Dates'
;
