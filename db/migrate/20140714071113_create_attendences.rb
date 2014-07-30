class CreateAttendences < ActiveRecord::Migration
  def change
    create_table :attendences do |t|
      t.date :in_date
    	t.time :in_time
    	t.date :out_date
    	t.time :out_time
    	t.string :workhour
    	t.string :ip_in
    	t.string :ip_out
      t.boolean :status
      t.string :totalhour

      t.references :user, index:true
      t.timestamps
    end
  end
end
