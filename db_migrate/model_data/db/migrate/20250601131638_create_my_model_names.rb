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
