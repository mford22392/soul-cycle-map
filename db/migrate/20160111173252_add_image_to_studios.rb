class AddImageToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :image, :string
  end
end
