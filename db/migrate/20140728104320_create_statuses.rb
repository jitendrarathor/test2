class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|

    	t.string :subject
    	t.date :date
    	t.time :in_time
    	t.time :out_time
    	t.string :project_name
    	t.string :client_name
    	t.string :co_ordinator
    	t.time :work_hour
    	t.string :break_time
    	t.string :meeting_description
    	t.string :task_description
    	t.string :resion

        t.references :user
        t.timestamps
    end
  end
end
