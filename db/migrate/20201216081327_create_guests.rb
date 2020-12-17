class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_numbers, default: [], array: true

      t.timestamps null: false
    end
  end
end
