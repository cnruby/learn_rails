# Project 'create_model'

Project 'create_model': create database model in Sqlite3

## Preparation: Create the Project

```bash
rails new create_model --database=sqlite3 && cd create_model
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
      t.string :phone
      t.string :address
      t.string :city
      t.string :region
      t.string :country
      t.string :postal_code
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

### References

- https://guides.rubyonrails.org/command_line.html
- https://guides.rubyonrails.org/command_line.html#bin-rails-generate
- https://guides.rubyonrails.org/active_record_migrations.html#running-migrations
