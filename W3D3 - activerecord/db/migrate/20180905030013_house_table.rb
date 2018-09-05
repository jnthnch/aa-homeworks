class HouseTable < ActiveRecord::Migration[5.1]
  def change
    create_table :house do |t|
      t.string :address, null: false
      t.integer :resident_id, null: false
      t.timestamps
    end
  end
end
