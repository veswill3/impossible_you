class RemoveFirstAndLast < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    remove_column :users, :first
    remove_column :users, :last
  end

  def down
    remove_column :users, :name
    add_column :users, :first, :string
    add_column :users, :last, :string
  end
end
