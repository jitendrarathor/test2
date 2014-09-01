class ChangeTimeField < ActiveRecord::Migration
  def change
  	change_column :statuses, :break_time, :intege
  end
end
