class CreateSpinClasses < ActiveRecord::Migration
  def change
    create_table :spin_classes do |t|
      t.integer :studio_id
      t.string :time
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
