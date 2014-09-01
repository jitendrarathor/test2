class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.string :proj_name
      t.string :client_name
      t.string :co_ordinator
      t.string :about_project_work
      t.date :started_date
      t.timestamps
    end
  end
end
