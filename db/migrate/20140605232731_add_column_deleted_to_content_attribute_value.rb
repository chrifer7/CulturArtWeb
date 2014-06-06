class AddColumnDeletedToContentAttributeValue < ActiveRecord::Migration
  def change
    add_column :content_attribute_values, :deleted, :integer
  end
end
