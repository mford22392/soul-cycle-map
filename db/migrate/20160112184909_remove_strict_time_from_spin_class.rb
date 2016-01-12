class RemoveStrictTimeFromSpinClass < ActiveRecord::Migration
  def change
    remove_column :spin_classes, :strict_time
  end
end
