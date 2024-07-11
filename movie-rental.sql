CREATE DATABASE MovieRentalDB;

USE MovieRentalDB;


-- Create the Movies table
CREATE TABLE Movies (
    MovieID CHAR(36) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL UNIQUE,
    Genre VARCHAR(100),
    ReleaseDate DATE,
    Rating DECIMAL(3, 2)
);

-- Insert data for 100 movies with UUID MovieID
INSERT INTO Movies (MovieID, Title, Genre, ReleaseDate, Rating)
VALUES
    (UUID(), 'The Dark Knight', 'Action', '2008-07-18', 9.0),
    (UUID(), 'Interstellar', 'Sci-Fi', '2014-11-07', 8.6),
    (UUID(), 'The Shawshank Redemption', 'Drama', '1994-09-23', 9.3),
    (UUID(), 'Pulp Fiction', 'Crime', '1994-10-14', 8.9),
    (UUID(), 'Fight Club', 'Drama', '1999-10-15', 8.8),
    (UUID(), 'The Godfather', 'Crime', '1972-03-24', 9.2),
    (UUID(), 'Forrest Gump', 'Drama', '1994-07-06', 8.8),
    (UUID(), 'The Matrix', 'Sci-Fi', '1999-03-31', 8.7),
    (UUID(), 'The Lord of the Rings: The Fellowship of the Ring', 'Adventure', '2001-12-19', 8.8),
    (UUID(), 'The Lord of the Rings: The Return of the King', 'Adventure', '2003-12-17', 8.9),
    (UUID(), 'The Dark Knight Rises', 'Action', '2012-07-20', 8.4),
    (UUID(), 'Gladiator', 'Action', '2000-05-05', 8.5),
    (UUID(), 'The Silence of the Lambs', 'Crime', '1991-02-14', 8.6),
    (UUID(), 'Goodfellas', 'Biography', '1990-09-19', 8.7),
    (UUID(), 'Schindler\'s List', 'Biography', '1993-12-15', 8.9),
    (UUID(), 'Saving Private Ryan', 'Drama', '1998-07-24', 8.6),
    (UUID(), 'The Departed', 'Crime', '2006-10-06', 8.5),
    (UUID(), 'Inglourious Basterds', 'Adventure', '2009-08-21', 8.3),
    (UUID(), 'The Prestige', 'Drama', '2006-10-20', 8.5),
    (UUID(), 'The Green Mile', 'Crime', '1999-12-10', 8.6),
    (UUID(), 'The Pianist', 'Biography', '2003-12-25', 8.5),
    (UUID(), 'American History X', 'Drama', '1998-10-30', 8.5),
    (UUID(), 'American Beauty', 'Drama', '1999-10-01', 8.3),
    (UUID(), 'The Revenant', 'Adventure', '2015-12-25', 8.0),
    (UUID(), 'Django Unchained', 'Drama', '2012-12-25', 8.4),
    (UUID(), 'The Lion King', 'Animation', '1994-06-24', 8.5),
    (UUID(), 'Titanic', 'Drama', '1997-12-19', 7.8),
    (UUID(), 'Avatar', 'Action', '2009-12-18', 7.8),
    (UUID(), 'Braveheart', 'Biography', '1995-05-24', 8.3),
    (UUID(), 'Jurassic Park', 'Adventure', '1993-06-11', 8.1),
    (UUID(), 'The Truman Show', 'Comedy', '1998-06-05', 8.1),
    (UUID(), 'Toy Story', 'Animation', '1995-11-22', 8.3),
    (UUID(), 'Finding Nemo', 'Animation', '2003-05-30', 8.1),
    (UUID(), 'The Incredibles', 'Animation', '2004-11-05', 8.0),
    (UUID(), 'Ratatouille', 'Animation', '2007-06-29', 8.0),
    (UUID(), 'Up', 'Animation', '2009-05-29', 8.2),
    (UUID(), 'Toy Story 3', 'Animation', '2010-06-18', 8.3),
    (UUID(), 'Inside Out', 'Animation', '2015-06-19', 8.1),
    (UUID(), 'Coco', 'Animation', '2017-11-22', 8.4),
    (UUID(), 'The Sound of Music', 'Biography', '1965-03-02', 8.0),
    (UUID(), 'La La Land', 'Drama', '2016-12-09', 8.0),
    (UUID(), 'The Shape of Water', 'Adventure', '2017-12-22', 7.3),
    (UUID(), 'The Grand Budapest Hotel', 'Comedy', '2014-03-28', 8.1),
    (UUID(), 'Birdman', 'Comedy', '2014-10-17', 7.7),
    (UUID(), 'Whiplash', 'Drama', '2014-10-15', 8.5),
    (UUID(), 'Black Swan', 'Drama', '2010-12-17', 8.0),
    (UUID(), 'The Social Network', 'Biography', '2010-10-01', 7.7),
    (UUID(), 'Her', 'Drama', '2014-01-10', 8.0),
    (UUID(), 'The Big Lebowski', 'Comedy', '1998-03-06', 8.1),
    (UUID(), 'No Country for Old Men', 'Crime', '2007-11-21', 8.1),
    (UUID(), 'Drive', 'Crime', '2011-09-16', 7.8),
    (UUID(), 'Oldboy', 'Action', '2003-11-21', 8.4),
    (UUID(), 'Kill Bill: Vol. 1', 'Action', '2003-10-10', 8.1),
    (UUID(), 'Kill Bill: Vol. 2', 'Action', '2004-04-16', 8.0),
    (UUID(), 'Blade Runner 2049', 'Sci-Fi', '2017-10-06', 8.0),
    (UUID(), 'Mad Max: Fury Road', 'Action', '2015-05-15', 8.1),
    (UUID(), 'The Martian', 'Adventure', '2015-10-02', 8.0),
    (UUID(), 'Gravity', 'Sci-Fi', '2013-10-04', 7.7),
    (UUID(), 'Arrival', 'Sci-Fi', '2016-11-11', 7.9),
    (UUID(), 'Ex Machina', 'Drama', '2015-04-24', 7.7),
    (UUID(), 'The Wolf of Wall Street', 'Biography', '2013-12-25', 8.2),
    (UUID(), 'Catch Me If You Can', 'Biography', '2002-12-25', 8.1),
    (UUID(), 'The King\'s Speech', 'Biography', '2010-12-25', 8.0),
    (UUID(), '1917', 'Drama', '2019-12-25', 8.3),
    (UUID(), 'Dunkirk', 'Drama', '2017-07-21', 7.8),
    (UUID(), 'The Irishman', 'Biography', '2019-11-27', 7.9),
    (UUID(), 'The Intouchables', 'Biography', '2011-11-02', 8.5);


select * from Movies;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID CHAR(36) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL UNIQUE,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255),
    MembershipDate DATE
);


-- Insert data for 50 customers with UUID CustomerID
INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber, Address, MembershipDate)
VALUES
    (UUID(), 'John Doe', 'johndoe@example.com', '+1234567890', '123 Main St, Anytown', '2023-01-15'),
    (UUID(), 'Jane Smith', 'janesmith@example.com', '+1987654321', '456 Oak Ave, Anycity', '2022-12-10'),
    (UUID(), 'Michael Johnson', 'michaeljohnson@example.com', '+1122334455', '789 Elm Rd, Anyville', '2023-02-20'),
    (UUID(), 'Emily Brown', 'emilybrown@example.com', '+1567890123', '321 Pine Blvd, Anytown', '2022-11-05'),
    (UUID(), 'William Lee', 'williamlee@example.com', '+1789456123', '654 Cedar Ln, Anyplace', '2023-03-18'),
    (UUID(), 'Sophia Garcia', 'sophiagarcia@example.com', '+1654321897', '987 Maple Ave, Anycity', '2023-04-25'),
    (UUID(), 'James Martinez', 'jamesmartinez@example.com', '+1346895702', '741 Birch St, Anytown', '2023-05-30'),
    (UUID(), 'Olivia Robinson', 'oliviarobinson@example.com', '+1987456321', '852 Willow Rd, Anyville', '2022-10-12'),
    (UUID(), 'Ethan Clark', 'ethanclark@example.com', '+1876543210', '963 Oakwood Dr, Anycity', '2022-09-08'),
    (UUID(), 'Isabella Allen', 'isabellaallen@example.com', '+1789065432', '159 Pinecrest Ave, Anytown', '2023-06-22'),
    (UUID(), 'Alexander Hall', 'alexanderhall@example.com', '+1678904321', '357 Elmwood Blvd, Anyville', '2023-07-14'),
    (UUID(), 'Mia Young', 'miayoung@example.com', '+1765432109', '258 Maplewood Ln, Anycity', '2022-08-15'),
    (UUID(), 'Benjamin Hernandez', 'benjaminhernandez@example.com', '+1456789023', '456 Birchwood Rd, Anytown', '2022-07-01'),
    (UUID(), 'Charlotte Lopez', 'charlottelopez@example.com', '+1234567890', '753 Pine Rd, Anyville', '2023-08-02'),
    (UUID(), 'William Green', 'williamgreen@example.com', '+1987654321', '852 Cedar Ave, Anyplace', '2022-06-19'),
    (UUID(), 'Amelia Adams', 'ameliaadams@example.com', '+1122334455', '951 Oak St, Anycity', '2023-09-12'),
    (UUID(), 'Daniel Campbell', 'danielcampbell@example.com', '+1567890123', '357 Elm Ave, Anytown', '2022-05-25'),
    (UUID(), 'Ava Hill', 'avahill@example.com', '+1789456123', '654 Maple Rd, Anyville', '2023-10-30'),
    (UUID(), 'Logan Scott', 'loganscott@example.com', '+1654321897', '852 Birchwood Dr, Anycity', '2022-04-14'),
    (UUID(), 'Mia Bailey', 'miabailey@example.com', '+1346895702', '963 Pinecrest Blvd, Anytown', '2023-11-18'),
    (UUID(), 'Lucas Ward', 'lucasward@example.com', '+1987456321', '159 Elmwood Ave, Anyville', '2022-03-03'),
    (UUID(), 'Emma Flores', 'emmaflores@example.com', '+1876543210', '357 Cedar Ln, Anycity', '2023-12-22'),
    (UUID(), 'Jackson Rivera', 'jacksonrivera@example.com', '+1789065432', '456 Oakwood Dr, Anytown', '2022-02-08'),
    (UUID(), 'Madison Ward', 'madisonward@example.com', '+1678904321', '753 Pinecrest Rd, Anyville', '2024-01-15'),
    (UUID(), 'Aiden Flores', 'aidenflores@example.com', '+1765432109', '852 Maple Ave, Anycity', '2022-01-19'),
    (UUID(), 'Chloe Simmons', 'chloesimmons@example.com', '+1456789023', '951 Birchwood Blvd, Anytown', '2024-02-28'),
    (UUID(), 'Oliver Alexander', 'oliveralexander@example.com', '+1234567890', '258 Cedar Rd, Anyville', '2022-11-30'),
    (UUID(), 'Grace Powell', 'gracepowell@example.com', '+1987654321', '357 Oak Ave, Anyplace', '2024-03-15'),
    (UUID(), 'Lucas Myers', 'lucasmyers@example.com', '+1122334455', '456 Elm St, Anycity', '2022-10-03'),
    (UUID(), 'Ella Garcia', 'ellagarcia@example.com', '+1567890123', '753 Pine Blvd, Anytown', '2024-04-20'),
    (UUID(), 'Gabriel Martinez', 'gabrielmartinez@example.com', '+1789456123', '852 Oak Ln, Anyville', '2022-09-05'),
    (UUID(), 'Scarlett Davis', 'scarlettdavis@example.com', '+1654321897', '951 Maplewood Dr, Anycity', '2024-05-25'),
    (UUID(), 'Levi Rodriguez', 'levirodriguez@example.com', '+1346895702', '258 Birchwood Ave, Anytown', '2022-08-10'),
    (UUID(), 'Avery Carter', 'averycarter@example.com', '+1987456321', '357 Elmwood Rd, Anyville', '2024-06-30'),
    (UUID(), 'Lily Torres', 'lilytorres@example.com', '+1876543210', '456 Pinecrest Ln, Anycity', '2022-07-15'),
    (UUID(), 'Zachary Ramirez', 'zacharyramirez@example.com', '+1789065432', '753 Oakwood Blvd, Anytown', '2024-07-28'),
    (UUID(), 'Abigail Wright', 'abigailwright@example.com', '+1678904321', '852 Cedar Ave, Anyville', '2022-06-01'),
    (UUID(), 'Henry Ward', 'henryward@example.com', '+1765432109', '951 Maple Rd, Anycity', '2024-08-12'),
    (UUID(), 'Sofia Diaz', 'sofiadiaz@example.com', '+1456789023', '258 Oakwood Dr, Anytown', '2022-05-06'),
    (UUID(), 'Matthew Griffin', 'matthewgriffin@example.com', '+1234567890', '357 Elm Ave, Anyville', '2024-09-25'),
    (UUID(), 'Victoria Russell', 'victoriarussell@example.com', '+1987654321', '456 Cedar Ln, Anycity', '2022-04-08'),
    (UUID(), 'Samuel Hayes', 'samuelhayes@example.com', '+1122334455', '753 Pinecrest Ave, Anytown', '2024-10-18'),
    (UUID(), 'Aria Shaw', 'ariashaw@example.com', '+1567890123', '852 Elmwood Blvd, Anyville', '2022-03-22'),
    (UUID(), 'David Long', 'davidlong@example.com', '+1789456123', '951 Cedar Rd, Anycity', '2024-11-30'),
    (UUID(), 'Julia Foster', 'juliafoster@example.com', '+1654321897', '258 Oak Ave, Anytown', '2022-02-14'),
    (UUID(), 'Christopher Butler', 'christopherbutler@example.com', '+1346895702', '357 Maplewood Dr, Anyville', '2024-12-15'),
    (UUID(), 'Alexis Marshall', 'alexismarshall@example.com', '+1987456321', '456 Elm Rd, Anycity', '2022-01-01');

SELECT * FROM Customers;


-- Create the Rentals table
CREATE TABLE Rentals (
    RentalID CHAR(36) PRIMARY KEY,
    Title VARCHAR(255),
    Name VARCHAR(255),
    RentalDate DATE NOT NULL,
    ReturnDate DATE,
    DuePayment DECIMAL(10, 2),
    FullPayment BOOLEAN,
    FOREIGN KEY (Title) REFERENCES Movies(Title),
    FOREIGN KEY (Name) REFERENCES Customers(Name)
);

-- Ensure indexes are created for the foreign key columns
CREATE INDEX idx_title ON Movies (Title);
CREATE INDEX idx_name ON Customers (Name);
