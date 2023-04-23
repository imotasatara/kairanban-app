class AddStartTimeToInformation < ActiveRecord::Migration[6.0]
  def change
    add_column :information, :start_time, :datetime
  end
end
