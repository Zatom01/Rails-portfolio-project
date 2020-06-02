class AddViewToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :view, :integer, :default=>0
  end
end
