class AddMonthAndDayColumnToSpinClass < ActiveRecord::Migration
  def change
    add_column :spin_classes, :month_and_day, :string
  end
end
