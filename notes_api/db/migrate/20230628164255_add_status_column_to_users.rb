class AddStatusColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status, :integer, null: false, default: 0
  end
end
