CREATE TABLE foods (
    	id INTEGER PRIMARY KEY AUTOINCREMENT,
    	name TEXT NOT NULL UNIQUE
);

CREATE TABLE nutrients (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL UNIQUE,
	unit TEXT NOT NULL

CREATE TABLE food_nutrients (
    	food_id INTEGER NOT NULL,
	nutrient_id INTEGER NOT NULL,
	value REAL NOT NULL CHECK (value >= 0),

	PRIMARY KEY (food_id, nutrient_id),

	FOREIGN KEY (food_id) REFERENCES foods(id) ON DELETE CASCADE,
	FOREIGN KEY (nutrient_id) REFERENCES nutrients(id) ON DELETE CASCADE
);

CREATE TABLE recipe (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL UNIQUE,
	description TEXT
);

CREATE TABLE recipe_items (
    	recipe_id INTEGER NOT NULL,
	food_id INTEGER NOT NULL,
	amount_g REAL NOT NULL,

	PRIMARY KEY (food_id, recipe_id)

	FOREIGN KEY (recipe_id) REFERENCES recipe(id) ON DELETE CASCADE,
	FOREIGN KEY (food_id) REFERENCES food(id)
);
