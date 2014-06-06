class AddColumnDeletedToContentDataType < ActiveRecord::Migration
  def change
    add_column :content_data_types, :deleted, :integer
  end
end
