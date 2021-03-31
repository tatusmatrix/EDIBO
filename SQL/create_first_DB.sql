create database world;

use world;

CREATE TABLE IF NOT EXISTS Artists
(   pkArtistId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(120) NULL);

insert into Artists(Name) values("First Artist");
insert into Artists(Name) values('Second Artist');

UPDATE artists SET Name = 'Second One One Artist' WHERE (pKArtistId = 2);

 CREATE TABLE IF NOT EXISTS Albums
(    pkAlbumId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Title NVARCHAR(160)  NOT NULL,
    fkArtistId INT NOT NULL,
    CONSTRAINT FK_ArtistId_Albums FOREIGN KEY (fkArtistId) REFERENCES artists (pkArtistId)
    ON DELETE NO ACTION ON UPDATE NO ACTION);  

CREATE TABLE IF NOT EXISTS Employees
(   pkEmployeeId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    LastName NVARCHAR(20)  NOT NULL,
    FirstName NVARCHAR(20)  NOT NULL,
    Title NVARCHAR(30),
    skReportsTo INTEGER NOT NULL,
    BirthDate DATETIME,
    HireDate DATETIME,
    Address NVARCHAR(70),
    City NVARCHAR(40),
    State NVARCHAR(40),
    Country NVARCHAR(40),
    PostalCode NVARCHAR(10),
    Phone NVARCHAR(24),
	Fax NVARCHAR(24),
    Email NVARCHAR(60),
    CONSTRAINT SK_EmployeeId_Employees FOREIGN KEY (skReportsTo) REFERENCES Employees (pkEmployeeId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Genres
(    pkGenreId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(120)
);

CREATE TABLE IF NOT EXISTS Customers
(   pkCustomerId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FirstName NVARCHAR(40)  NOT NULL,
    LastName NVARCHAR(20)  NOT NULL,
    Company NVARCHAR(80),
    Address NVARCHAR(70),
    City NVARCHAR(40),
    State NVARCHAR(40),
    Country NVARCHAR(40),
    PostalCode NVARCHAR(10),
    Phone NVARCHAR(24),
    Fax NVARCHAR(24),
    Email NVARCHAR(60)  NOT NULL,
    fkSupportRepId INTEGER NOT NULL,
    CONSTRAINT FK_SupportRepId_Customers FOREIGN KEY (fkSupportRepId) REFERENCES Employees(pkEmployeeId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Invoices
(   pkInvoiceId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fkCustomerId INTEGER  NOT NULL,
    InvoiceDate DATETIME  NOT NULL,
    BillingAddress NVARCHAR(70),
    BillingCity NVARCHAR(40),
    BillingState NVARCHAR(40),
    BillingCountry NVARCHAR(40),
    BillingPostalCode NVARCHAR(10),
    Total NUMERIC(10,2)  NOT NULL,
    CONSTRAINT FK_CustomerId_Invoices FOREIGN KEY (fkCustomerId) REFERENCES Customers (pkCustomerId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS Media_types
(
    pkMediaTypeId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(120)
);


CREATE TABLE IF NOT EXISTS Playlists
(
    pkPlaylistId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(120)
);

CREATE TABLE IF NOT EXISTS Tracks
(   pkTrackId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(200)  NOT NULL,
    fkAlbumId INTEGER NOT NULL,
    fkMediaTypeId INTEGER  NOT NULL,
    fkGenreId INTEGER NOT NULL,
    Composer NVARCHAR(220),
    Milliseconds INTEGER  NOT NULL,
    Bytes INTEGER,
    UnitPrice NUMERIC(10,2)  NOT NULL,
    CONSTRAINT FK_AlbumId_Tracks FOREIGN KEY (fkAlbumId) REFERENCES Albums (pkAlbumId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_GenreId_Tracks FOREIGN KEY (fkGenreId) REFERENCES Genres (pkGenreId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_MediaTypeId_Tracks FOREIGN KEY (fkMediaTypeId) REFERENCES Media_types (pkMediaTypeId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS Invoice_items
(   pkInvoiceLineId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fkInvoiceId INTEGER  NOT NULL,
    fkTrackId INTEGER  NOT NULL,
    UnitPrice NUMERIC(10,2)  NOT NULL,
    Quantity INTEGER  NOT NULL,
    CONSTRAINT FK_InvoiceId_Invoice_items FOREIGN KEY (fkInvoiceId) REFERENCES Invoices (pkInvoiceId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_TrackId_Invoice_items FOREIGN KEY (fkTrackId) REFERENCES Tracks (pkTrackId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION);