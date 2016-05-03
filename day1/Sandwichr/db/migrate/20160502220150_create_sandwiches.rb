class CreateSandwiches < ActiveRecord::Migration
  def change
    create_table :sandwiches do |t|
      t.string :name
      t.string :bread_type
      t.integer :total_calories

      t.timestamps null: false
    end
  end
end
