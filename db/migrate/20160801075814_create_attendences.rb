class CreateAttendences < ActiveRecord::Migration[5.0]
  def change
    create_table :attendences do |t|
      t.integer :employee_id
      t.column :in_time, 'timestamp with time zone' 
      t.timestamps
    end
  end
end
