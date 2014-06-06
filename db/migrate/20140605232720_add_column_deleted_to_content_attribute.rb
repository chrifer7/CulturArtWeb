class AddColumnDeletedToContentAttribute < ActiveRecord::Migration
  def change
    add_column :content_attributes, :deleted, :integer
  end
end
