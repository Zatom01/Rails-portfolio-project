class AddViewsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer, :default=>0
    add_column :users, :name, :string
  end
end
