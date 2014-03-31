#DROP TABLE if exists rules;
CREATE TABLE rules (
   DependentEventType varchar(255) NOT NULL,
   PredecessorEventType varchar(255) NOT NULL,
      # predecessor in dependency chain, not necessarily chronological
   MinFromCurrent smallint,
   MaxBeforeEvent smallint,
   PrefBeforeEvent smallint,
   MinBeforeEvent smallint,
   MaxBeforePref smallint,
   MaxAfterPref smallint,
   SundayPref tinyint(1) NOT NULL,
   MondayPref tinyint(1) NOT NULL,
   TuesdayPref tinyint(1) NOT NULL,
   WednesdayPref tinyint(1) NOT NULL,
   ThurdayPref tinyint(1) NOT NULL,
   FridayPref tinyint(1) NOT NULL,
   SaturdayPref tinyint(1) NOT NULL,
   PRIMARY KEY (DependentEventType ASC, PredecessorEventType ASC),
   CONSTRAINT rules_fk1
      FOREIGN KEY (DependentEventType)
      REFERENCES eventtypes (EventType),
   CONSTRAINT rules_fk2
      FOREIGN KEY (PredecessorEventType)
      REFERENCES eventtypes (EventType)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8
COMMENT = 'Rules'
;
