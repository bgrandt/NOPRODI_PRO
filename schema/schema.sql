CREATE TABLE foods (
    	id INTEGER PRIMARY KEY AUTOINCREMENT,
    	name TEXT NOT NULL UNIQUE,
	source TEXT NOT NULL DEFAULT 'manual',
	external_id TEXT
);

CREATE TABLE nutrients (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL UNIQUE,
	unit TEXT NOT NULL
);

-- nutritional values per 100 g of food
CREATE TABLE food_nutrients (
    	food_id INTEGER NOT NULL,
	nutrient_id INTEGER NOT NULL,
	value REAL NOT NULL CHECK (value >= 0),

	PRIMARY KEY (food_id, nutrient_id),

	FOREIGN KEY (food_id) REFERENCES foods(id) ON DELETE CASCADE,
	FOREIGN KEY (nutrient_id) REFERENCES nutrients(id) ON DELETE CASCADE
);

CREATE TABLE recipes (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL UNIQUE,
	description TEXT
);

CREATE TABLE recipe_items (
    	id INTEGER PRIMARY KEY AUTOINCREMENT,
	recipe_id INTEGER NOT NULL,
	food_id INTEGER NOT NULL,
	amount_g REAL NOT NULL,

	FOREIGN KEY (recipe_id) REFERENCES recipe(id) ON DELETE CASCADE,
	FOREIGN KEY (food_id) REFERENCES foods(id) ON DELETE RESTRICT
);

CREATE TABLE portion_sizes (
	food_id INTEGER NOT NULL,
	serving TEXT NOT NULL,
	amount REAL NOT NULL,
	unit TEXT NOT NULL CHECK (unit IN('g', 'ml', 'piece')),

	PRIMARY KEY (food_id, serving)

	FOREIGN KEY (food_id) REFERENCES foods(id)
);
