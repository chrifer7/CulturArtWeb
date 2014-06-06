class AddColumnDeletedToContentAttributeType < ActiveRecord::Migration
  def change
    add_column :content_attribute_types, :deleted, :integer
  end
end
