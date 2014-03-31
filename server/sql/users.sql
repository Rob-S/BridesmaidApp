#DROP TABLE if exists users;
CREATE TABLE users (
   UserNbr integer unsigned NOT NULL auto_increment,
   FullName varchar(255) NOT NULL,
   PRIMARY KEY (UserNbr ASC)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8
COMMENT = 'Users'
;
