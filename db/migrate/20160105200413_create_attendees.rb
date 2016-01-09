class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :user_id
      t.integer :spin_class_id 

      t.timestamps null: false
    end
  end
end
