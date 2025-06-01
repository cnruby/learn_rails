
- [Project 'model\_data'](#project-model_data)
  - [Preparation: Create the Project](#preparation-create-the-project)
  - [The Model Migrate File](#the-model-migrate-file)
    - [Step 1.1 Create Model Migrate File](#step-11-create-model-migrate-file)
    - [Step 1.2 Change Model Migrate File](#step-12-change-model-migrate-file)
  - [The Model with Sqlite3 Database](#the-model-with-sqlite3-database)
    - [Step 2.1 Add this Model to Sqlite3 Database](#step-21-add-this-model-to-sqlite3-database)
    - [Step 2.2 Show this Model in Sqlite3 Database](#step-22-show-this-model-in-sqlite3-database)
    - [SOS: Remove this Model from Sqlite3 Database](#sos-remove-this-model-from-sqlite3-database)
  - [The Model Data with Sqlite3 Database](#the-model-data-with-sqlite3-database)
    - [3.1 Change the Rails System File](#31-change-the-rails-system-file)
    - [3.2 Create the data file csv for table my\_model\_names](#32-create-the-data-file-csv-for-table-my_model_names)
    - [3.3 Create the Import Data Rake File](#33-create-the-import-data-rake-file)
    - [3.4 Import the data file csv to the Table in Sqlite3 Database](#34-import-the-data-file-csv-to-the-table-in-sqlite3-database)
    - [3.5 Check the Table Data in Sqlite3 Database](#35-check-the-table-data-in-sqlite3-database)
    - [References for Project 'model\_data'](#references-for-project-model_data)
    - [References for Project 'create\_model'](#references-for-project-create_model)

# Project 'model_data'

Project 'model_data': create database model data for database table in Sqlite3

## Preparation: Create the Project

```bash
rails new model_data --database=sqlite3 && cd model_data
```

```bash
rails server && open http://127.0.0.1:3000
```

```bash
Ctrl+C
```

## The Model Migrate File

### Step 1.1 Create Model Migrate File

```bash
rails generate model MyModelName
```

### Step 1.2 Change Model Migrate File

This is the default migrate file:

```ruby
class CreateMyModelNames < ActiveRecord::Migration[8.0]
  def change
    create_table :my_model_names do |t|
      t.timestamps
    end
  end
end
```

This is our migrate file:

```ruby
class CreateMyModelNames < ActiveRecord::Migration[8.0]
  def change
    create_table :my_model_names do |t|
      t.string :name, null: false
      t.string :email
      t.datetime :deleted_at

  t.timestamps
    end
  end
end
```

## The Model with Sqlite3 Database

### Step 2.1 Add this Model to Sqlite3 Database

```bash
rails db:version
```

```bash
rails db:migrate
```

### Step 2.2 Show this Model in Sqlite3 Database

```bash
rails dbconsole
```

```bash
sqlite> .tables
sqlite> .q
```

### SOS: Remove this Model from Sqlite3 Database

```bash
rails db:version
```

```bash
rails db:rollback
```

```bash
rails db:version
```

## The Model Data with Sqlite3 Database

### 3.1 Change the Rails System File

```bash
# ./config/environment.rb
...
# Initialize the Rails application.
Rails.application.initialize!

# add the follow codes for rails 8.0
FOLDER_BASE         = "#{Rails.root}/lib"
SQLITE_DATABASE     = "#{Rails.root}/db/development.sqlite3"
```

### 3.2 Create the data file csv for table my_model_names

This file is './lib/io_data/my_model_names.csv':

```bash
id;name;email;deleted_at;created_at;updated_at
1;Luo;luo@gmail.com;;;
2;Gu;gu@gmail.com;;;
3;Dao;dao@gmail.com;;;
```

### 3.3 Create the Import Data Rake File

```bash
# 
=begin
TESTING
bin/rails migrate_data:import_model_data
=end

namespace :migrate_data do

  desc "Run all base tasks for the project"
  task import_model_data: :environment do

    table_name = MyModelName.table_name
    import_csv_file = "#{FOLDER_BASE}/io_data/my_model_names.csv"
    `sqlite3 "#{SQLITE_DATABASE}" << EOF
.mode csv
.import --skip 1 "#{import_csv_file}" "#{table_name}"
EOF`

    begin
      db = SQLite3::Database.open SQLITE_DATABASE
    rescue SQLite3::Exception => e
      puts e
    ensure
      db.close unless db&.nil?
    end

  end
end
```

### 3.4 Import the data file csv to the Table in Sqlite3 Database

```bash
bin/rails migrate_data:import_model_data
```

### 3.5 Check the Table Data in Sqlite3 Database

```bash
rails dbconsole
```

```bash
sqlite> .tables
sqlite> SELECT * FROM my_model_names;
sqlite> .q
```

### References for Project 'model_data'

- https://stackoverflow.com/questions/37592774/run-all-rake-tasks-inside-a-shared-namespace-in-rails
- https://zetcode.com/db/sqliteruby/connect/

### References for Project 'create_model'

- https://guides.rubyonrails.org/command_line.html
- https://guides.rubyonrails.org/command_line.html#bin-rails-generate
- https://guides.rubyonrails.org/active_record_migrations.html#running-migrations
