class AddDateColumnToSpinClasses < ActiveRecord::Migration
  def change
    add_column :spin_classes, :strict_date, :date
    add_column :spin_classes, :strict_time, :time
  end
end
