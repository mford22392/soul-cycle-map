class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :name

      t.timestamps null: false
    end
  end
end
