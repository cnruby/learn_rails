=begin
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
