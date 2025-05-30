# Project creat_model

## the commands

### Create the Project

  rails new create_model --database=sqlite3
  cd create_model
  rails server
  open http://127.0.0.1:3000
  Ctrl+C

### Create Model Migrate File

  rails generate model MyModelName

### Change Model Migrate File

This is the default migrate file:

  class CreateMyModelNames < ActiveRecord::Migration[8.0]
    def change
      create_table :my_model_names do |t|
        t.timestamps
      end
    end
  end

This is our migrate file:

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

### Add this Model to Sqlite3 Database

  rails db:version
  rails db:migrate

### Show this Model in Sqlite3 Database

  rails dbconsole

  sqlite> .tables
  sqlite> .q

### Remove this Model from Sqlite3 Database

  rails db:version
  rails db:rollback
  rails db:version

### References

- https://guides.rubyonrails.org/command_line.html
- https://guides.rubyonrails.org/command_line.html#bin-rails-generate
- https://guides.rubyonrails.org/active_record_migrations.html#running-migrations