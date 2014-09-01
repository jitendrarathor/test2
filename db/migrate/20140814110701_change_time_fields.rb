class ChangeTimeFields < ActiveRecord::Migration
  def change
  	change_column :statuses, :break_time, :integer
  end
end
