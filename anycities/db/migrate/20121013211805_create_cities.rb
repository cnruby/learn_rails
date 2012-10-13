class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :zip_code
      t.string :name

      t.timestamps
    end
  end
end
