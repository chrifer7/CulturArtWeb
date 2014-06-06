class CreateContentDataTypes < ActiveRecord::Migration
  def change
    create_table :content_data_types do |t|
      t.string :name
      t.string :ptype

      t.timestamps
    end
  end
end
