class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances, id: :uuid do |t|
      t.string :status
      t.string :datetime_of_presence
      t.boolean :present
      t.float :body_temperature
      t.uuid :user_id

      t.timestamps
    end
  end
end
