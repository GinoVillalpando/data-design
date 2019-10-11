-- The statement below sets the collation of the database to utf8
-- ALTER DATABASE your_database_name_CHANGE_ME CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- this is a comment in SQL (yes, the space is needed!)
-- these statements will drop the tables and re-add them
-- this is akin to reformatting and reinstalling Windows (OS X never needs a reinstall...) ;)
-- never ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever
-- do this on live data!!!!
DROP TABLE IF EXISTS `like`;
DROP TABLE IF EXISTS tweet;
DROP TABLE IF EXISTS profile;

-- the CREATE TABLE function is a function that takes tons of arguments to layout the table's schema
CREATE TABLE profile (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	profileId BINARY(16) NOT NULL,
	profileMessageamount VARCHAR(32),
	profileName VARCHAR(32) NOT NULL,
	profileEmail VARCHAR(128) NOT NULL,
	-- to make something optional, exclude the not null
	profileHash CHAR(97) NOT NULL,
	profilePhone VARCHAR(32),
	profileJoinedDate VARCHAR(32) NOT NULL,
	profileLastseen VARCHAR(32) NOT NULL,
	-- to make sure duplicate data cannot exist, create a unique index
	UNIQUE(profileName),
	UNIQUE(profileEmail),
	-- this officiates the primary key for the entity
	PRIMARY KEY(profileId)
);

-- create the like entity (a weak entity from an m-to-n for profile --> tweet)
CREATE TABLE message (
	-- these are still foreign keys
	messageId BINARY(16) NOT NULL,
	messageSenderProfileId BINARY(16) NOT NULL,
	messageReceiverProfileId BINARY(16) NOT NULL,
	messageContent VARCHAR(320) NOT NULL,
	messageDateTime DATETIME(6) NOT NULL,
	messageSenderProfileName VARCHAR(16) NOT NULL,
	messageReceiverProfileName VARCHAR(16) NOT NULL,
	-- index the foreign keys
	INDEX(messageSenderProfileId),
	INDEX(messageReceiverProfileId),
	-- create the foreign key relations
	FOREIGN KEY(messageSenderProfileId) REFERENCES profile(profileId),
	FOREIGN KEY(messageReceiverProfileId) REFERENCES profile(profileId),
	-- finally, create a composite foreign key with the two foreign keys
	PRIMARY KEY(messageSenderProfileId, messageReceiverProfileId)
);