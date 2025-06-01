# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!


# add the follow codes for rails 8.0
FOLDER_BASE         = "#{Rails.root}/lib"
SQLITE_DATABASE     = "#{Rails.root}/storage/development.sqlite3"
