class ChangeDateTimeColumnDatatype < ActiveRecord::Migration[6.1]
  def change
    change_column :attendances, :datetime_of_presence, 'timestamptz USING CAST(datetime_of_presence AS timestamptz)'
  end
end
