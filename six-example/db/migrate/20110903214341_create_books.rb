class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :body
      t.string :title
      t.boolean :public

      t.timestamps
    end
  end
end
