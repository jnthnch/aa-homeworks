class PeopleTable < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      validates :name, presence: true
      validates :house_id, presence: true
      t.string :name, null: false
      t.integer :house_id, null: false
      t.timestamps
    end
  end
end

class AddIndexToPeople <ApplicationRecord
  def change 
    add_index :people, :name, :house_id   #class, column
  end
end
