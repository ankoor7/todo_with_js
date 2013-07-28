class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.text :comment
      t.boolean :done
      t.string :tags

      t.timestamps
    end
  end
end
