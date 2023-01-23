class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :fee
      t.string :address
      t.text :introduction

      t.timestamps
    end
  end
end
