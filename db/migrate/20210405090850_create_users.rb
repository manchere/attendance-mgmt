class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.text :address

      t.timestamps
    end
    add_index :users, :phone_number
  end
end
