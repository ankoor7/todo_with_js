class CreateItems < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.text :comment
      t.boolean :done
      t.string :tags

      t.timestamps
    end

    create_table :items do |t|
      t.belongs_to :list
      t.string :name
      t.date :due_date
      t.text :comment
      t.integer :position
      t.boolean :done

      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :twitter

      t.timestamps
    end

    create_table :lists_users do |t|
      t.belongs_to :list
      t.belongs_to :user
    end
  end
end
