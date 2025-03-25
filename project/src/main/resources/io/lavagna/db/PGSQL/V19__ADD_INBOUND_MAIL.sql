--
-- This file is part of lavagna.
--
-- lavagna is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- lavagna is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with lavagna.  If not, see <http://www.gnu.org/licenses/>.
--

CREATE TABLE LA_PROJECT_MAIL_TICKET_CONFIG (
    MAIL_CONFIG_ID SERIAL PRIMARY KEY NOT NULL,
    MAIL_CONFIG_NAME VARCHAR(128) NOT NULL,
    MAIL_CONFIG_PROJECT_ID_FK INTEGER NOT NULL,
    MAIL_CONFIG_ENABLED BOOLEAN DEFAULT TRUE NOT NULL,
    MAIL_CONFIG_LAST_CHECKED TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    MAIL_CONFIG_CONFIG TEXT,
    MAIL_CONFIG_PROPERTIES TEXT
);
-- CONSTRAINTS
ALTER TABLE LA_PROJECT_MAIL_TICKET_CONFIG ADD FOREIGN KEY(MAIL_CONFIG_PROJECT_ID_FK) REFERENCES LA_PROJECT(PROJECT_ID);
ALTER TABLE LA_PROJECT_MAIL_TICKET_CONFIG ADD CONSTRAINT "UNIQUE_LA_PROJECT_MAIL_TICKET_CONFIG_NAME" UNIQUE(MAIL_CONFIG_NAME, MAIL_CONFIG_PROJECT_ID_FK);

CREATE TABLE LA_PROJECT_MAIL_TICKET (
	MAIL_TICKET_ID SERIAL PRIMARY KEY NOT NULL,
	MAIL_TICKET_NAME VARCHAR(128) NOT NULL,
	MAIL_TICKET_ENABLED BOOLEAN DEFAULT TRUE NOT NULL,
	MAIL_TICKET_ALIAS VARCHAR(254) NOT NULL,
    MAIL_TICKET_USE_ALIAS BOOLEAN DEFAULT FALSE NOT NULL,
	MAIL_TICKET_COLUMN_ID_FK INTEGER NOT NULL,
	MAIL_TICKET_CONFIG_ID_FK INTEGER NOT NULL,
	MAIL_TICKET_METADATA TEXT
);
-- CONSTRAINTS
ALTER TABLE LA_PROJECT_MAIL_TICKET ADD FOREIGN KEY(MAIL_TICKET_COLUMN_ID_FK) REFERENCES LA_BOARD_COLUMN(BOARD_COLUMN_ID);
ALTER TABLE LA_PROJECT_MAIL_TICKET ADD FOREIGN KEY(MAIL_TICKET_CONFIG_ID_FK) REFERENCES LA_PROJECT_MAIL_TICKET_CONFIG(MAIL_CONFIG_ID);
ALTER TABLE LA_PROJECT_MAIL_TICKET ADD CONSTRAINT "UNIQUE_LA_PROJECT_MAIL_TICKET_NAME" UNIQUE(MAIL_TICKET_NAME, MAIL_TICKET_CONFIG_ID_FK);
ALTER TABLE LA_PROJECT_MAIL_TICKET ADD CONSTRAINT "UNIQUE_LA_PROJECT_MAIL_TICKET_ALIAS" UNIQUE(MAIL_TICKET_ALIAS, MAIL_TICKET_CONFIG_ID_FK);
