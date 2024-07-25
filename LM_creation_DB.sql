PRAGMA foreign_keys = ON;

-- Create client table with ID as primary key
CREATE TABLE IF NOT EXISTS Clients(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	address TEXT NOT NULL,
	amount_due REAL DEFAULT 0.0
);

-- Create services table with 
CREATE TABLE IF NOT EXISTS Services(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER NOT NULL,
	service_name TEXT NOT NULL,
	is_active BOOLEAN NOT NULL,
	price REAL NOT NULL,
	FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE

);

