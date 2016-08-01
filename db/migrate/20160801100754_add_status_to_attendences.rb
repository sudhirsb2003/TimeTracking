class AddStatusToAttendences < ActiveRecord::Migration[5.0]
  def change
    add_column :attendences, :status, :string
  end
end
