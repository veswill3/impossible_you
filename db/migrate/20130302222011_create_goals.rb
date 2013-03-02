class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.string :img_url
      t.references :list

      t.timestamps
    end
    add_index :goals, :list_id
  end
end
