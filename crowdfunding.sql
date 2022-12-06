CREATE TABLE campaign (
    cf_id INT NOT NULL,
    contact_id INT NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    goal NUMERIC(10,2) NOT NULL,
    pledged NUMERIC(10,2) NOT NULL,
    outcome VARCHAR(50) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(10) NOT NULL,
    currency INT NOT NULL,
    launch_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(10) NOT NULL,
    subcategory_id VARCHAR(10) NOT NULL,
    CONSTRAINT "pk_campaign"
	PRIMARY KEY (cf_id)
);

CREATE TABLE contacts (
    contact_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_contacts"
	PRIMARY KEY (contact_id)
);

CREATE TABLE category (
    category_id VARCHAR(10) NOT NULL,
    category_name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Category 
    PRIMARY KEY (category_id)
);

CREATE TABLE subcategory (
    subcategory_id VARCHAR(10) NOT NULL,
    subcategory_name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Subcategory
     PRIMARY KEY (subcategory_id)
);

CREATE TABLE backers (
	backer_id VARCHAR NOT NULL,
	cf_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL,
	CONSTRAINT pk_backers
	PRIMARY KEY (backer_id)
	
);

ALTER TABLE campaign ADD CONSTRAINT fk_Campaign_contact_id FOREIGN KEY(contact_id)
REFERENCES contacts (contact_id);

ALTER TABLE campaign ADD CONSTRAINT fk_Campaign_category_id FOREIGN KEY(category_id)
REFERENCES category (category_id);

ALTER TABLE campaign ADD CONSTRAINT fk_Campaign_subcategory_id FOREIGN KEY(subcategory_id)
REFERENCES subcategory (subcategory_id);

ALTER TABLE backers ADD CONSTRAINT fk_backers_cf_id FOREIGN KEY (cf_id)
REFERENCES campaign (cf_id);

SELECT * FROM contacts;
SELECT * FROM category;
SELECT * FROM subcategory;