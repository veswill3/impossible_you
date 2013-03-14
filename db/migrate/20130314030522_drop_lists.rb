class DropLists < ActiveRecord::Migration
  def up
		remove_index  :goals, :list_id
		remove_column :goals, :list_id
		drop_table    :lists
  end

  def down
		create_table :lists do |t|
			t.string   :title
			t.text     :description

			t.timestamps
		end
		add_column :goals, :list_id, :integer
		add_index  :goals, :list_id
  end
end
