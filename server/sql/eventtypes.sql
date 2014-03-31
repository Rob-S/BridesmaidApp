#DROP TABLE if exists eventtypes;
CREATE TABLE eventtypes (
   EventType varchar(255) NOT NULL,
   PRIMARY KEY (EventType ASC)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8
COMMENT = 'Event Types'
;
