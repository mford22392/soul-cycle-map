class AddColumnLinkToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :link, :string
  end
end
