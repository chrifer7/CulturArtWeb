class AddColumnDeletedToContentHeritage < ActiveRecord::Migration
  def change
    add_column :content_heritages, :deleted, :integer
  end
end
